Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDB42FF164
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 18:09:39 +0100 (CET)
Received: from localhost ([::1]:57916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2dSk-0002OP-EK
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 12:09:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2dMR-0006wO-Ra
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:03:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2dMN-00008l-RE
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:03:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611248581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=53zLgQRS7kogAvTV2Ais3GQXp3/YuofHc66C60egyLM=;
 b=RoZ4OoZcSClyvSnkFC1anBR1oE0C7+QBtIBsOyUYylOAykUZYumaiHGT56fK6z/x3UHgQj
 HUGs6UgSLzqUew6aCb55+XqTzFqM1mKsF2+b6JKEBWM73S8uaF3DYScaX8EjHPkIHeWG+T
 weu6CD5Vw3kGkcnTl1S+jM73SLAYEf0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-BXCK2AsbOkOyJgMGDM9EeQ-1; Thu, 21 Jan 2021 12:02:59 -0500
X-MC-Unique: BXCK2AsbOkOyJgMGDM9EeQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F1F0107ACE3;
 Thu, 21 Jan 2021 17:02:58 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 623E36EF65;
 Thu, 21 Jan 2021 17:02:57 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <20210116134424.82867-10-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v7 09/11] iotests: add testrunner.py
Message-ID: <ee9c73e1-2c33-2df0-0af7-ad19a29c8139@redhat.com>
Date: Thu, 21 Jan 2021 11:02:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210116134424.82867-10-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
> Add TestRunner class, which will run tests in a new python iotests
> running framework.
> 
> There are some differences with current ./check behavior, most
> significant are:
> - Consider all tests self-executable, just run them, don't run python
>   by hand.
> - Elapsed time is cached in json file
> - Elapsed time precision increased a bit
> - use python difflib instead of "diff -w", to ignore spaces at line
>   ends strip lines by hand. Do not ignore other spaces.

Awkward wording.  Maybe:

Instead of using "diff -w" which ignores all whitespace differences,
manually strip whitespace at line end then use python difflib, which no
longer ignores spacing mid-line

> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/testrunner.py | 344 +++++++++++++++++++++++++++++++
>  1 file changed, 344 insertions(+)
>  create mode 100644 tests/qemu-iotests/testrunner.py
> 
> diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
> new file mode 100644
> index 0000000000..92722cc68b
> --- /dev/null
> +++ b/tests/qemu-iotests/testrunner.py
> @@ -0,0 +1,344 @@
> +# Class for actual tests running.

for actually running tests

again, should this file be 755 with #! python?

> +
> +def file_diff(file1: str, file2: str) -> List[str]:
> +    with open(file1) as f1, open(file2) as f2:
> +        # We want to ignore spaces at line ends. There are a lot of mess about
> +        # it in iotests.
> +        # TODO: fix all tests to not produce extra spaces, fix all .out files
> +        # and use strict diff here!
> +        seq1 = [line.rstrip() for line in f1]
> +        seq2 = [line.rstrip() for line in f2]
> +        return list(difflib.unified_diff(seq1, seq2, file1, file2))

Offhand, do you have the list of tests where (actual/expected) output
has trailing whitespace and would fail without the .rstrip()?

> +
> +
> +# We want to save current tty settings during test run,
> +# since an aborting qemu call may leave things screwed up.
> +@contextmanager
> +def savetty() -> Iterator[None]:
> +    isterm = sys.stdin.isatty()
> +    if isterm:
> +        fd = sys.stdin.fileno()
> +        attr = termios.tcgetattr(0)

Isn't fd always going to be 0?  It looks odd to hard-code zero in the
very next line; either we should s/0/fd/ here, or...

> +
> +    try:
> +        yield
> +    finally:
> +        if isterm:
> +            termios.tcsetattr(fd, termios.TCSADRAIN, attr)

... s/fd/0/ here and drop fd altogether.

> +
> +
> +class LastElapsedTime(AbstractContextManager['LastElapsedTime']):
> +    """ Cache for elapsed time for tests, to show it during new test run
> +
> +    Use get() in any time. But, if use update you should then call save(),
> +    or use update() inside with-block.

Grammar is hard, maybe:

It is safe to use get() at any time.  To use update(), you must either
use a with-block or first use save().


> +    def test_print_one_line(self, test: str, starttime: str,

> +
> +        if status == 'pass':
> +            col = '\033[32m'
> +        elif status == 'fail':
> +            col = '\033[1m\033[31m'
> +        elif status == 'not run':
> +            col = '\033[33m'

This hard-codes the use of ANSI escape sequences without first checking
that we are writing to a terminal.  Is that wise?  Should we have this
be tunable by a tri-state command-line option, similar to ls --color?
(--color=auto is default, and bases decision on istty(), --color=off
turns color off even for a terminal, --color=on uses color even when
outputting to a pipe, which can be useful depending on the other end of
the pipeline...)


> +        with f_test.open() as f:
> +            try:
> +                if f.readline() == '#!/usr/bin/env python3':
> +                    args.insert(0, self.env.python)
> +            except UnicodeDecodeError:  # binary test? for future.
> +                pass

Is pass the right action here?  Or will it silently skip a test file
with encoding errors?

Again, I'm not comfortable enough to give a full review of the python,
but it looks fairly similar to the existing shell code, and with the
series applied, things still work.  So I can offer

Tested-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


