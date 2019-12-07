function nd = days(mo, da, leap, mdn)
    % days.m
    % created on 9/10/19
    % last modified 9/10/19 10:06
    % this funciton calculates the number of days that have passed in the
    % current year based on the date 
    % inputs:
    % mo - the number of the month (1-12)
    % da - day of the month (1-31)
    % leap - leap year: (1) or non leap year: (0)
    % outputs:
    % nd - the number of days that have passed so far in the current yrear 
    mo = input('please enter the current month numericlly: ');
    da = input('please enter the current day of the month: ');
    leap = input('Is the current year a leap year? enter 0 for no and 1 for yes: ');
    % error handlers 
    if mo < 1 || mo > 12 
      error('Invalid month entry')
    elseif da < 1 || da > 31
      error('Invalid day entry')
    else
      % leap year cases 
        if leap == 1
             mdn = [31 29 31 30 31 30 31 31 30 31 30 31]; % array of days per month
             nd = sum(mdn(1,1:(mo-1)))+da; % summation of passed months and days passed this month
        elseif leap == 0
            mdn = [31 28 31 30 31 30 31 31 30 31 30 31]; % array of days per month
            nd = sum(mdn(1,1:(mo-1)))+da; % summation of passed months and days passed this month
        else
            error('Leap year must be true(1) or false(0)') % error handler
        end
  end
end