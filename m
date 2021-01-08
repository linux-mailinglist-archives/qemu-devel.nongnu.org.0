Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD562EFB3F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 23:32:34 +0100 (CET)
Received: from localhost ([::1]:43584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky0J6-0000wE-Vd
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 17:32:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0I8-0000TX-CZ
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:31:32 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:36122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0I5-0003pY-Hu
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:31:32 -0500
Received: by mail-wm1-x330.google.com with SMTP id y23so9665520wmi.1
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 14:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=7X+ZfNsHyUr9TeBsganDkMD87TNwDz0VEfmJlZB1gYU=;
 b=V6XmPc54oCkNmisVFyzreV+lJr84ECR/k3Lsrv4ytdfCfbOOM4zO7NC4kRSerjxyCx
 R/73JUylaha6QXYfhjStN3PHSrF3adi7KHPSqTuiqxfKH5Ivkh1bFaCpJw0Tf2aIZCcR
 Zpo9lch8z4yGOTYT534OS4OIq0dtaj805hifnKTqFAHUKy96oOFts1AxLyCvfzvSPLe2
 LBtx4tWNvahlvQBzMWPeoltdPHDpWjnUdIq+jjhMAreG1bldIQ2UPQMEEvZDtJ5i00TJ
 K35wagxbFDD8kZdeapfHIOZ0avarRz2pG8rHqwe+Zpdyz7imANZhmz0PL0A7ZpVKsPtA
 xC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=7X+ZfNsHyUr9TeBsganDkMD87TNwDz0VEfmJlZB1gYU=;
 b=au9Tc4ZtR0HwJ9px/g1BKBgu0Y1ZVGkElFMOeIcIHmZ+tYgcuvF9h5WxY/ABGKW6lK
 UJ0hP9gN0yZCfJJCT6TKYXa/DtzG04S6xf9UVWlQN4cZ49tQ5h+/XidKhR9ILzQ7oBUa
 E7AxTu/tVi7w8KcLujTLU1Q8RJxGPCeg3sRkzcy42Ec8GTZUKTE+KR8yD39tJS0sfVRJ
 ikwHx/YBVxvvSd0U9jWuStc06NDHYvFUxhdvyKexhh9AEHWkUyAYWtflpSGWMnYN4oQz
 PSAgwI0PhCJjGYZsH4pfkUHsX+cWhVAsXm3IOUdJe3kNYD1CmkabVp/yG2LPyluoDYl6
 ZifA==
X-Gm-Message-State: AOAM533o31EPF2KrbDSRIeDcEDNK67MV00LqfJyAa0kXIafhWqPcRHuj
 7+79BMcvF91ETP95OANiVOfUGGfwcuzjNQ==
X-Google-Smtp-Source: ABdhPJx9XRyIC1obSKl/pI0zCso58pNtypfgKSglBf8CZzvxWA9uFi0HniVTdREhJJyW0is/raDysQ==
X-Received: by 2002:a05:600c:2306:: with SMTP id
 6mr4881952wmo.53.1610145086935; 
 Fri, 08 Jan 2021 14:31:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p9sm13518974wmm.17.2021.01.08.14.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 14:31:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 40E821FF7E;
 Fri,  8 Jan 2021 22:31:25 +0000 (GMT)
References: <20210108121935.640-1-alex.bennee@linaro.org>
 <20210108175431.tbf2bqizx4dx6vda@mail.bwidawsk.net>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ben Widawsky <ben@bwidawsk.net>
Subject: Re: [RFC PATCH] Makefile: add GNU global tags support
Date: Fri, 08 Jan 2021 22:30:59 +0000
In-reply-to: <20210108175431.tbf2bqizx4dx6vda@mail.bwidawsk.net>
Message-ID: <87wnwnysaq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Ben Widawsky <ben@bwidawsk.net> writes:

> On 21-01-08 12:19:35, Alex Benn=C3=A9e wrote:
>> GNU Global is another tags engine which is more like cscope in being
>> able to support finding both references and definitions. You will be
>> un-surprised to know it also integrates well with Emacs.
>>=20
>> The main benefit of integrating it into find-src-path is it takes less
>> time to rebuild the database from scratch when you have a lot of build
>> directories under your source tree.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> It might be worth mentioning that the Linux kernel has supported this for=
 a long
> time now (10+ years).
>
> Having switched to gtags about 3 years ago, I think it's summarily better=
 and
> would really like this to get merged.

So I take it that's a reviewed-by and a tested-by tag from you?

>
>> ---
>>  Makefile   | 9 ++++++++-
>>  .gitignore | 3 +++
>>  2 files changed, 11 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/Makefile b/Makefile
>> index fb9923ff22..66eec99685 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -253,6 +253,13 @@ ctags:
>>  	rm -f "$(SRC_PATH)/"tags
>>  	$(find-src-path) -exec ctags -f "$(SRC_PATH)/"tags --append {} +
>>=20=20
>> +.PHONY: gtags
>> +gtags:
>> +	rm -f "$(SRC_PATH)/"GTAGS
>> +	rm -f "$(SRC_PATH)/"GRTAGS
>> +	rm -f "$(SRC_PATH)/"GPATH
>> +	$(find-src-path) | gtags -f -
>> +
>>  .PHONY: TAGS
>>  TAGS:
>>  	rm -f "$(SRC_PATH)/"TAGS
>> @@ -279,7 +286,7 @@ help:
>>  	$(call print-help,all,Build all)
>>  	$(call print-help,dir/file.o,Build specified target only)
>>  	$(call print-help,install,Install QEMU, documentation and tools)
>> -	$(call print-help,ctags/TAGS,Generate tags file for editors)
>> +	$(call print-help,ctags/gtags/TAGS,Generate tags file for editors)
>>  	$(call print-help,cscope,Generate cscope index)
>>  	$(call print-help,sparse,Run sparse on the QEMU source)
>>  	@echo  ''
>> diff --git a/.gitignore b/.gitignore
>> index b32bca1315..75a4be0724 100644
>> --- a/.gitignore
>> +++ b/.gitignore
>> @@ -7,6 +7,9 @@
>>  cscope.*
>>  tags
>>  TAGS
>> +GPATH
>> +GRTAGS
>> +GTAGS
>>  *~
>>  *.ast_raw
>>  *.depend_raw
>> --=20
>> 2.20.1
>>=20
>>=20


--=20
Alex Benn=C3=A9e

