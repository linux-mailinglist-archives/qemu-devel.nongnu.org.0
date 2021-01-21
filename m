Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 797282FF013
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 17:22:19 +0100 (CET)
Received: from localhost ([::1]:46262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ciw-0006Je-75
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 11:22:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2cfC-0005KU-IH
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 11:18:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2cfA-00059b-OD
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 11:18:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611245903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JysFO2ruYExqUsW6P9E71mjx+ju9IoWkFuTz+yyx2Zw=;
 b=HmDMzRG0zdaBVSBwRK5/PTx3j53I0hm2FFQ3imQrntPNcfPslzyXzApkoaHfmQuP3ll5p9
 bBna+RP+2f6gWi64xO59ZHHuDYQ7BE7v7EzmGSSBZGnX1Hx6Ygz779VeA7mmFy3T4qfWZr
 +r/T5M+SEkRz3ZCzdRKm+1amwPw0qOg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-DCnqi2v3P6ikBr0IGGiRKQ-1; Thu, 21 Jan 2021 11:18:15 -0500
X-MC-Unique: DCnqi2v3P6ikBr0IGGiRKQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9A191005513;
 Thu, 21 Jan 2021 16:18:13 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 460F919CB1;
 Thu, 21 Jan 2021 16:18:13 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <20210116134424.82867-8-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v7 07/11] iotests: add findtests.py
Message-ID: <3c0222d6-f8b2-be1b-efec-399ed8c0483a@redhat.com>
Date: Thu, 21 Jan 2021 10:18:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210116134424.82867-8-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/16/21 7:44 AM, Vladimir Sementsov-Ogievskiy wrote:
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
> This commit don't update check behavior (which will be done in further

doesn't

> commit), still, the documentation changed like new behavior is already
> here.  Let's live with this small inconsistency for the following few
> commits, until final change.
> 
> The file findtests.py is self-executable and may be used for debugging
> purposes.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  docs/devel/testing.rst          |  50 +++++++++-
>  tests/qemu-iotests/findtests.py | 159 ++++++++++++++++++++++++++++++++
>  2 files changed, 208 insertions(+), 1 deletion(-)
>  create mode 100644 tests/qemu-iotests/findtests.py
> 

> +++ b/tests/qemu-iotests/findtests.py

> +class TestFinder:
> +    def __init__(self, test_dir: Optional[str] = None) -> None:
> +        self.groups = defaultdict(set)
> +
> +        with chdir(test_dir):
> +            self.all_tests = glob.glob('[0-9][0-9][0-9]')
> +            self.all_tests += [f for f in glob.iglob('tests/*')
> +                               if not f.endswith('.out') and
> +                               os.path.isfile(f + '.out')]

Interesting that 'NNN' is a test even if 'NNN.out' is not present, but
'tests/NNN' is not.  Not sure if it is worth tweaking, though.


> +    def parse_test_name(self, name: str) -> str:
> +        if '/' in name:
> +            raise ValueError('Paths are unsupported for test selecting, '

selection

> +                             f'requiring "{name}" is wrong')
> +
> +        if re.fullmatch(r'\d+', name):
> +            # Numbered tests are old naming convetion. We should convert them

convention

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
> +
> +    def find_tests(self, groups: Optional[List[str]] = None,
> +                   exclude_groups: Optional[List[str]] = None,
> +                   tests: Optional[List[str]] = None,
> +                   start_from: Optional[str] = None) -> List[str]:

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


