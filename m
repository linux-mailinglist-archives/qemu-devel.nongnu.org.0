Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3DF376833
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 17:40:47 +0200 (CEST)
Received: from localhost ([::1]:46972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf2as-00081x-Le
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 11:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lf2ZX-0007Ur-8Q
 for qemu-devel@nongnu.org; Fri, 07 May 2021 11:39:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lf2ZU-0001jr-J7
 for qemu-devel@nongnu.org; Fri, 07 May 2021 11:39:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620401959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yTn8WI91kQfCCwWrWiGThTqQTNfVlrJ6Imwh9/LhfX4=;
 b=SkUKxj8ZvRuZ+hWXfNBw2oGmDp7GmvgSVjB8ht86IKaTIjLR2tfd9M1i0lNw5tC/c7XCPY
 Ycrs258iLh6J6Ip9j9I2C1Ui333ILCxDNHa6nwKsCHpVbQK1lfkLHDJDTVUHzk9OPbe1t2
 /OlIDokGScUP9oH4TuHlcim0S6aF9T8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-xSkLaYzCP7miaY3BNX4TfA-1; Fri, 07 May 2021 11:39:12 -0400
X-MC-Unique: xSkLaYzCP7miaY3BNX4TfA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69CC5107ACC7;
 Fri,  7 May 2021 15:39:11 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-35.ams2.redhat.com
 [10.36.114.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D31210016F4;
 Fri,  7 May 2021 15:39:09 +0000 (UTC)
Subject: Re: [PATCH] qemu-iotests: fix pylint 2.8 consider-using-with error
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210506084813.12007-1-eesposit@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <9c80031b-83ad-dd59-6d77-254fee7e7a82@redhat.com>
Date: Fri, 7 May 2021 17:39:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210506084813.12007-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.05.21 10:48, Emanuele Giuseppe Esposito wrote:
> pylint 2.8 introduces consider-using-with error, suggesting
> to use the 'with' block statement when possible.
> http://pylint.pycqa.org/en/latest/whatsnew/2.8.html
> 
> Modify all subprocess.Popen calls to use the 'with' statement,
> except one in __init__ of QemuIoInteractive class, since
> the return value is assigned to a class field and used in other methods.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   tests/qemu-iotests/iotests.py    | 63 ++++++++++++++++----------------
>   tests/qemu-iotests/testrunner.py | 22 +++++------
>   2 files changed, 42 insertions(+), 43 deletions(-)

Thanks, looks good, functionally.  But I just can’t keep myself from 
nagging about indentation (I wouldn’t have, but flake8 says I may be 
justified):

> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 5af0182895..e1117e8ae8 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -113,15 +113,14 @@ def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
>       Run a tool and return both its output and its exit code
>       """
>       stderr = subprocess.STDOUT if connect_stderr else None
> -    subp = subprocess.Popen(args,
> -                            stdout=subprocess.PIPE,
> -                            stderr=stderr,
> -                            universal_newlines=True)
> -    output = subp.communicate()[0]
> -    if subp.returncode < 0:
> -        cmd = ' '.join(args)
> -        sys.stderr.write(f'{tool} received signal {-subp.returncode}: {cmd}\n')
> -    return (output, subp.returncode)
> +    with subprocess.Popen(args, stdout=subprocess.PIPE,
> +                        stderr=stderr, universal_newlines=True) as subp:

The second line’s indentation is not aligned to the opening parenthesis 
of the Popen call.  I’d like it better if it were.

> +        output = subp.communicate()[0]
> +        if subp.returncode < 0:
> +            cmd = ' '.join(args)
> +            sys.stderr.write(f'{tool} received signal \
> +                               {-subp.returncode}: {cmd}\n')
> +        return (output, subp.returncode)
>   
>   def qemu_img_pipe_and_status(*args: str) -> Tuple[str, int]:
>       """
> @@ -237,6 +236,7 @@ def qemu_io_silent_check(*args):
>   class QemuIoInteractive:
>       def __init__(self, *args):
>           self.args = qemu_io_args_no_fmt + list(args)
> +        # pylint: disable=consider-using-with

I think I would have added an additional comment why we need this 
statement (because we need to keep the Popen object around), but then 
again, I suppose it really is obvious.

(Wouldn’t have commented on this bit if I hadn’t replied because of the 
indentation.  So if you think it’s obvious, no need to add a comment.)

>           self._p = subprocess.Popen(self.args, stdin=subprocess.PIPE,
>                                      stdout=subprocess.PIPE,
>                                      stderr=subprocess.STDOUT,

[...]

> diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
> index 1fc61fcaa3..729fe9ee3b 100644
> --- a/tests/qemu-iotests/testrunner.py
> +++ b/tests/qemu-iotests/testrunner.py
> @@ -258,17 +258,17 @@ def do_run_test(self, test: str) -> TestResult:
>   
>           t0 = time.time()
>           with f_bad.open('w', encoding="utf-8") as f:
> -            proc = subprocess.Popen(args, cwd=str(f_test.parent), env=env,
> -                                    stdout=f, stderr=subprocess.STDOUT)
> -            try:
> -                proc.wait()
> -            except KeyboardInterrupt:
> -                proc.terminate()
> -                proc.wait()
> -                return TestResult(status='not run',
> -                                  description='Interrupted by user',
> -                                  interrupted=True)
> -            ret = proc.returncode
> +            with subprocess.Popen(args, cwd=str(f_test.parent), env=env,
> +                                stdout=f, stderr=subprocess.STDOUT) as proc:

As above, the second line is (no longer) aligned to the opening parenthesis.

> +                try:
> +                    proc.wait()
> +                except KeyboardInterrupt:
> +                    proc.terminate()
> +                    proc.wait()
> +                    return TestResult(status='not run',
> +                                    description='Interrupted by user',
> +                                    interrupted=True)

And here, too.

Max

> +                ret = proc.returncode
>   
>           elapsed = round(time.time() - t0, 1)
>   
> 


