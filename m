Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB9B2F35F5
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 17:44:15 +0100 (CET)
Received: from localhost ([::1]:34504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzMmE-0007Bg-4t
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 11:44:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kzMkS-0005qI-AC
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:42:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kzMkP-0001Z0-EZ
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:42:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610469739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=addhR9FObQZy3geFxDabP+ILLK/TNnkUxGdXWduAUgQ=;
 b=aqcjN95KvX8NJ5NYNlXoJN6v8jnDlD/bA6AIqzdMAbD6dVUOZDz+Qde2HquyL69EzNhHwq
 ZpZqZoQvuYqGK8rQmz+folcWXHxmOSjCoRw5R9PoaXOZjsbDsNeY8pjfol/eYhgSiD2TY/
 AMTnZZkGg+zLz7nVslPcvEB2sJ8dcjs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-ZSBJ1WlwP6WqPw1pGgjHNQ-1; Tue, 12 Jan 2021 11:42:15 -0500
X-MC-Unique: ZSBJ1WlwP6WqPw1pGgjHNQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2441801ADD;
 Tue, 12 Jan 2021 16:42:14 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-194.ams2.redhat.com [10.36.115.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA5E75C1B4;
 Tue, 12 Jan 2021 16:42:12 +0000 (UTC)
Date: Tue, 12 Jan 2021 17:42:11 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6 07/11] iotests: add findtests.py
Message-ID: <20210112164211.GB6075@merkur.fritz.box>
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
 <20210109122631.167314-8-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210109122631.167314-8-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.01.2021 um 13:26 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Add python script with new logic of searching for tests:
> 
> Current ./check behavior:
>  - tests are named [0-9][0-9][0-9]
>  - tests must be registered in group file (even if test doesn't belong
>    to any group, like 142)
> 
> Behavior of findtests.py:
>  - group file is dropped
>  - tests are all files in tests/ subdirectory (except for .out files),
>    so it's not needed more to "register the test", just create it with
>    appropriate name in tests/ subdirectory. Old names like
>    [0-9][0-9][0-9] (in root iotests directory) are supported too, but
>    not recommended for new tests
>  - groups are parsed from '# group: ' line inside test files
>  - optional file group.local may be used to define some additional
>    groups for downstreams
>  - 'disabled' group is used to temporary disable tests. So instead of
>    commenting tests in old 'group' file you now can add them to
>    disabled group with help of 'group.local' file
>  - selecting test ranges like 5-15 are not supported more
>    (to support restarting failed ./check command from the middle of the
>     process, new argument is added: --start-from)
> 
> Benefits:
>  - no rebase conflicts in group file on patch porting from branch to
>    branch
>  - no conflicts in upstream, when different series want to occupy same
>    test number
>  - meaningful names for test files
>    For example, with digital number, when some person wants to add some
>    test about block-stream, he most probably will just create a new
>    test. But if there would be test-block-stream test already, he will
>    at first look at it and may be just add a test-case into it.
>    And anyway meaningful names are better.
> 
> This commit don't update check behavior (which will be don in further
> commit), still, the documentation changed like new behavior is already
> here.  Let's live with this small inconsistency for the following few
> commits, until final change.
> 
> The file findtests.py is self-executable and may be used for debugging
> purposes.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  docs/devel/testing.rst          |  50 ++++++-
>  tests/qemu-iotests/findtests.py | 229 ++++++++++++++++++++++++++++++++

I extended 297 so that it also checks the newly added Python file, and
pylint and mypy report some errors:

+************* Module findtests
+findtests.py:127:19: W0621: Redefining name 'tests' from outer scope (line 226) (redefined-outer-name)
+findtests.py:224:8: R1722: Consider using sys.exit() (consider-using-sys-exit)
+findtests.py:32: error: Missing type parameters for generic type "Iterator"
+findtests.py:87: error: Function is missing a return type annotation
+findtests.py:206: error: Function is missing a type annotation for one or more arguments

I would suggest including a final patch in this series that adds all new
Python files to the checking in 297.

> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 0aa7a13bba..bfb6b65edc 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -111,7 +111,7 @@ check-block
>  -----------
>  
>  ``make check-block`` runs a subset of the block layer iotests (the tests that
> -are in the "auto" group in ``tests/qemu-iotests/group``).
> +are in the "auto" group).
>  See the "QEMU iotests" section below for more information.
>  
>  GCC gcov support
> @@ -224,6 +224,54 @@ another application on the host may have locked the file, possibly leading to a
>  test failure.  If using such devices are explicitly desired, consider adding
>  ``locking=off`` option to disable image locking.
>  
> +Test case groups
> +----------------
> +
> +Test may belong to some groups, you may define it in the comment inside the
> +test.

Maybe: "Tests may belong to one or more test groups, which are defined
in the form of a comment in the test source file."

>         By convention, test groups are listed in the second line of the test
> +file, after "#!/..." line, like this:

"after the "#!/..." line"

> +
> +.. code::
> +
> +  #!/usr/bin/env python3
> +  # group: auto quick
> +  #
> +  ...
> +
> +Additional way of defining groups is creating tests/qemu-iotests/group.local

"An additional" or "Another".
"creating the ... file"

> +file. This should be used only for downstream (this file should never appear
> +in upstream). This file may be used for defining some downstream test groups
> +or for temporary disable tests, like this:

"disabling"

> +
> +.. code::
> +
> +  # groups for some company downstream process
> +  #
> +  # ci - tests to run on build
> +  # down - our downstream tests, not for upstream
> +  #
> +  # Format of each line is:
> +  # TEST_NAME TEST_GROUP [TEST_GROUP ]...
> +
> +  013 ci
> +  210 disabled
> +  215 disabled
> +  our-ugly-workaround-test down ci
> +
> +The (not exhaustive) list of groups:

Maybe just something like this?

"Note that the following group names have a special meaning:"

> +
> +- quick : Tests in this group should finish within some few seconds.
> +
> +- auto : Tests in this group are used during "make check" and should be
> +  runnable in any case. That means they should run with every QEMU binary
> +  (also non-x86), with every QEMU configuration (i.e. must not fail if
> +  an optional feature is not compiled in - but reporting a "skip" is ok),
> +  work at least with the qcow2 file format, work with all kind of host
> +  filesystems and users (e.g. "nobody" or "root") and must not take too
> +  much memory and disk space (since CI pipelines tend to fail otherwise).
> +
> +- disabled : Tests in this group are disabled and ignored by check.
> +
>  .. _docker-ref:
>  
>  Docker based tests
> diff --git a/tests/qemu-iotests/findtests.py b/tests/qemu-iotests/findtests.py
> new file mode 100755
> index 0000000000..b053db48e8
> --- /dev/null
> +++ b/tests/qemu-iotests/findtests.py
> @@ -0,0 +1,229 @@
> +#!/usr/bin/env python3
> +#
> +# Parse command line options to define set of tests to run.
> +#
> +# Copyright (c) 2020 Virtuozzo International GmbH
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> +#
> +
> +import os
> +import sys
> +import glob
> +import argparse
> +import re
> +from collections import defaultdict
> +from contextlib import contextmanager
> +from typing import Optional, List, Tuple, Iterator, Set
> +
> +
> +@contextmanager
> +def chdir(path: Optional[str] = None) -> Iterator:

As indicated by mypy, this should be Interator[None].

> +    if path is None:
> +        yield
> +        return
> +
> +    saved_dir = os.getcwd()
> +    os.chdir(path)
> +    try:
> +        yield
> +    finally:
> +        os.chdir(saved_dir)
> +
> +
> +class TestFinder:
> +    _argparser = None
> +    @classmethod
> +    def get_argparser(cls) -> argparse.ArgumentParser:
> +        if cls._argparser is not None:
> +            return cls._argparser
> +
> +        p = argparse.ArgumentParser(description="= test selecting options =",
> +                                    add_help=False, usage=argparse.SUPPRESS)
> +
> +        p.add_argument('-g', '--groups', metavar='group1,...',
> +                       help='include tests from these groups')
> +        p.add_argument('-x', '--exclude-groups', metavar='group1,...',
> +                       help='exclude tests from these groups')
> +        p.add_argument('--start-from', metavar='TEST',
> +                       help='Start from specified test: make sorted sequence '
> +                       'of tests as usual and then drop tests from the first '
> +                       'one to TEST (not inclusive). This may be used to '
> +                       'rerun failed ./check command, starting from the '
> +                       'middle of the process.')
> +        p.add_argument('tests', metavar='TEST_FILES', nargs='*',
> +                       help='tests to run')
> +
> +        cls._argparser = p
> +        return p
> +
> +    def __init__(self, test_dir: Optional[str] = None) -> None:
> +        self.groups = defaultdict(set)
> +
> +        with chdir(test_dir):
> +            self.all_tests = glob.glob('[0-9][0-9][0-9]')
> +            self.all_tests += [f for f in glob.iglob('tests/*')
> +                               if not f.endswith('.out') and
> +                               os.path.isfile(f + '.out')]
> +
> +            for t in self.all_tests:
> +                with open(t) as f:
> +                    for line in f:
> +                        if line.startswith('# group: '):
> +                            for g in line.split()[2:]:
> +                                self.groups[g].add(t)

Do we need to allow more than one group comment in a test or could we
return early here, avoiding to read the whole file?

> +
> +    def add_group_file(self, fname: str):
> +        with open(fname) as f:
> +            for line in f:
> +                line = line.strip()
> +
> +                if (not line) or line[0] == '#':
> +                    continue
> +
> +                words = line.split()
> +                test_file = words[0]
> +                groups = words[1:]
> +
> +                if test_file not in self.all_tests:
> +                    print(f'Warning: {fname}: "{test_file}" test is not found.'
> +                          ' Skip.')
> +                    continue

Should test_file be passed through parse_test_name()? I noticed that I
have to explicitly specify a tests/ prefix in group.local, whereas
prefixing this on the command line seems to be forbidden.

> +                for g in groups:
> +                    self.groups[g].add(test_file)
> +
> +    def parse_test_name(self, name: str) -> str:
> +        if '/' in name:
> +            raise ValueError('Paths are unsupported for test selecting, '
> +                             f'requiring "{name}" is wrong')
> +
> +        if re.fullmatch(r'\d+', name):
> +            # Numbered tests are old naming convetion. We should convert them
> +            # to three-digit-length, like 1 --> 001.
> +            name = f'{int(name):03}'
> +        else:
> +            # Named tests all should be in tests/ subdirectory
> +            name = os.path.join('tests', name)
> +
> +        if name not in self.all_tests:
> +            raise ValueError(f'Test "{name}" is not found')
> +
> +        return name

check should probably catch these ValueError exceptions. Currently, you
get a stack trace, which does include the exception message, but it
doesn't look very nice.

> +    def find_tests(self, groups: Optional[List[str]] = None,
> +                   exclude_groups: Optional[List[str]] = None,
> +                   tests: Optional[List[str]] = None,

group and tests seem to be read-only, so this can be simplified to
'groups: Sequence[str] = ()' etc. without the explicit handling of None
below.

Maybe exclude_groups should then be treated the same for consistency.
This would mean creating a new list instead of calling .append().

> +                   start_from: Optional[str] = None) -> List[str]:
> +        """Find tests
> +
> +        Algorithm:
> +
> +        1. a. if some @groups specified
> +             a.1 Take all tests from @groups
> +             a.2 Drop tests, which are in at least one of @exclude_groups or in
> +                 'disabled' group (if 'disabled' is not listed in @groups)
> +             a.3 Add tests from @tests (don't exclude anything from them)
> +
> +           b. else, if some @tests specified:
> +             b.1 exclude_groups must be not specified, so just take @tests
> +
> +           c. else (only @exclude_groups list is non-empty):
> +             c.1 Take all tests
> +             c.2 Drop tests, which are in at least one of @exclude_groups or in
> +                 'disabled' group
> +
> +        2. sort
> +
> +        3. If start_from specified, drop tests from first one to @start_from
> +           (not inclusive)
> +        """
> +        if groups is None:
> +            groups = []
> +        if exclude_groups is None:
> +            exclude_groups = []
> +        if tests is None:
> +            tests = []
> +
> +        res: Set[str] = set()
> +        if groups:
> +            # Some groups specified. exclude_groups supported, additionally
> +            # selecting some individual tests supported as well.
> +            res.update(*(self.groups[g] for g in groups))
> +        elif tests:
> +            # Some individual tests specified, but no groups. In this case
> +            # we don't support exclude_groups.
> +            if exclude_groups:
> +                raise ValueError("Can't exclude from individually specified "
> +                                 "tests.")
> +        else:
> +            # No tests no groups: start from all tests, exclude_groups
> +            # supported.
> +            res.update(self.all_tests)
> +
> +        if 'disabled' not in groups and 'disabled' not in exclude_groups:
> +            exclude_groups.append('disabled')
> +
> +        res = res.difference(*(self.groups[g] for g in exclude_groups))
> +
> +        # We want to add @tests. But for compatibility with old test names,
> +        # we should convert any number < 100 to number padded by
> +        # leading zeroes, like 1 -> 001 and 23 -> 023.
> +        for t in tests:
> +            res.add(self.parse_test_name(t))
> +
> +        sequence = sorted(res)
> +
> +        if start_from is not None:
> +            del sequence[:sequence.index(self.parse_test_name(start_from))]
> +
> +        return sequence
> +
> +    def find_tests_argv(self, argv: List[str]) -> Tuple[List[str], List[str]]:
> +        """Returns tuple of tests list and remaining arguments list"""
> +        args, remaining = self.get_argparser().parse_known_args(argv)
> +
> +        if args.groups is not None:
> +            args.groups = args.groups.split(',')
> +
> +        if args.exclude_groups is not None:
> +            args.exclude_groups = args.exclude_groups.split(',')
> +
> +        return self.find_tests(**vars(args)), remaining
> +
> +
> +def find_tests(argv, test_dir: Optional[str] = None) -> Tuple[List[str],
> +                                                              List[str]]:
> +    """Returns tuple of tests list and remaining arguments list"""
> +    tf = TestFinder(test_dir)
> +
> +    if test_dir is None:
> +        group_local = 'group.local'
> +    else:
> +        group_local = os.path.join(test_dir, 'group.local')
> +    if os.path.isfile(group_local):
> +        tf.add_group_file(group_local)
> +
> +    return tf.find_tests_argv(argv)
> +
> +
> +if __name__ == '__main__':
> +    if len(sys.argv) == 2 and sys.argv[1] in ['-h', '--help']:
> +        TestFinder.get_argparser().print_help()
> +        exit()
> +
> +    tests, remaining_argv = find_tests(sys.argv[1:])
> +    print('\n'.join(tests))
> +    if remaining_argv:
> +        print('\nUnhandled options: ', remaining_argv)

Kevin


