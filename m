Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A2EB0D1E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 12:43:44 +0200 (CEST)
Received: from localhost ([::1]:60638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8MZj-0001gO-7o
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 06:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57709)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i8MYb-00016v-5B
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 06:42:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i8MYa-0001DZ-5N
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 06:42:33 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:34112)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i8MYZ-0001DF-VV
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 06:42:32 -0400
Received: by mail-wr1-x441.google.com with SMTP id a11so18125756wrx.1
 for <qemu-devel@nongnu.org>; Thu, 12 Sep 2019 03:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=P9Xmcmy7UtGqCTcnInHcT0pmBSqsBGcowzws5YNuY78=;
 b=Q9qjVxN0LKVFGiYf5+Fg1joxKv7OlZaDobxYxWGsvM8Z+cfGDyAai6meP/Kvw4f6H9
 a2klNChOOTuiGy4NPcjxLidX9WQSClIISUDuD7Iu2Q4qktI0rr12WU78QtdFwCjfVxhv
 Xx5g/Hb41J9b5SVOXbauf3fdz839gpsmWBuLoptZ/SgBV+0dpL9UX8w/iymwTaQ3Gc7r
 lUlV/1nM3HQ18jc/2koAR5/DQbx3sZtS1LTqFBuVmCE9FFMT5WDxb5Dcb9tLwTVp0MPX
 6CqIIBoqZY1xZ9HxMSSLhKA5OTmfhRzQRXBaAevkkxcA9Fv7LXexqKH03+RFL3+UFvqr
 di2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=P9Xmcmy7UtGqCTcnInHcT0pmBSqsBGcowzws5YNuY78=;
 b=pztxdqVdCXzHQHR9lmPXEiz2gePzIMh8epMr72yCGTD/ohwD6oB/+T9U+1T6TDq85b
 uv5lWoTO8/mJ+0Aabf8I3HINWx0r9qmuTIPkup6tesxMNCL2wBDFiWZhT1nCxPrgYL+x
 Sl1A9EmJY0vmyn3djw1r2IVsS6ROCXaiNvKEEy6RUSQG7C34/vFtGZpvRDcE3sQNHP7o
 igwx58mKRsw5MaQmi7c+UtBvEiHOKNU8onJo8vDelt05ojZSMIZRibB/lCD+cLNjXHr2
 oYjvXJEbQD9+qo8Yx6dcU9IMWZJKRZNDXtUIDlyUHhbLcuJtBjHSJ+y2plsAIltoOfgU
 2PKQ==
X-Gm-Message-State: APjAAAXuKg62nadLIPnUPqx8+XctN1Wj2l6RX/jlTnWyOAyYg47ifwnT
 7ByVAcDWGft6W++MD4iD7wnJ7Q==
X-Google-Smtp-Source: APXvYqyOC9vYaGEGY9VEErRCJU8+N9mDfp/I7GC7halp/umZq5Liame1m8d0aF/8gM5i27rLL0AA2Q==
X-Received: by 2002:a05:6000:12:: with SMTP id
 h18mr33261944wrx.156.1568284950509; 
 Thu, 12 Sep 2019 03:42:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p19sm5347203wmg.31.2019.09.12.03.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2019 03:42:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0B8891FF87;
 Thu, 12 Sep 2019 11:42:29 +0100 (BST)
References: <20190910144428.32597-1-peter.maydell@linaro.org>
 <20190910144428.32597-3-peter.maydell@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
In-reply-to: <20190910144428.32597-3-peter.maydell@linaro.org>
Date: Thu, 12 Sep 2019 11:42:29 +0100
Message-ID: <87r24lztgq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 02/13] target/arm/arm-semi:
 Always set some kind of errno for failed calls
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


Peter Maydell <peter.maydell@linaro.org> writes:

> If we fail a semihosting call we should always set the
> semihosting errno to something; we were failing to do
> this for some of the "check inputs for sanity" cases.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

although:

> ---
>  target/arm/arm-semi.c | 45 ++++++++++++++++++++++++++-----------------
>  1 file changed, 27 insertions(+), 18 deletions(-)
>
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index 03e60105c05..51b55816faf 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -232,11 +232,13 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gd=
b_syscall_complete_cb cb,
>  #define GET_ARG(n) do {                                 \
>      if (is_a64(env)) {                                  \
>          if (get_user_u64(arg ## n, args + (n) * 8)) {   \
> -            return -1;                                  \
> +            errno =3D EFAULT;                             \
> +            return set_swi_errno(ts, -1);               \

This looks a little queasy given ts is NULL for the softmmu version. I
wonder (depending on your approach to -smp for 1/13) if we should just
pass the ARMCPU down to the helper?

--
Alex Benn=C3=A9e

