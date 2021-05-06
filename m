Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796A137558D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 16:23:32 +0200 (CEST)
Received: from localhost ([::1]:58374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leeuZ-0005D3-HU
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 10:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1leesx-0004Co-Vc
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:21:52 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:33307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1leesu-0000Y4-Ro
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:21:51 -0400
Received: by mail-ed1-x534.google.com with SMTP id b17so6423918ede.0
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 07:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t9MSfhz8wMF3tZG8WRBgyPgiyyJAnX7W/qxJ671xWoM=;
 b=LJH5mMZ20Y3AoXxKlQcHTIOe3bl+a98UGZvriU2PurXQoR5ybz77ph2NiTazegoXLA
 nyjkA5pok7/z3aJB+S+2O2Lpu3nT4+7HOMAP1PBnN/zrVpNrWJFGWIFZrgkqxNBIZZAr
 mb6f4pMlcxCn4JFlmIGUsm0tsXHkC2HDUXAbutYq2TleB5X993GacMW6+hRPUtb1g+11
 FvtE/BILoHZZ4Z1NaxYqCzj7QtzEa/n3YTzyiwVee6IOY6Lx+2CEvnnGiDG0wqAZH6Uq
 qSW52Q5SXdF9q0450wEzc1C93p1irlfG8GjcE69D4v5iuQy+xo6XtrdI9C+u392tFvaS
 IgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t9MSfhz8wMF3tZG8WRBgyPgiyyJAnX7W/qxJ671xWoM=;
 b=QaE1u2lZtiiFR/RavMUkm1npcHsFlHuDBp/AZJ64hUCiSSAXsHNXH5vGrRxPduPFc5
 RlFEHo+XGWKUN0US98zmE9iErh8LgygmFvg659gWH1dDvInKOD6yPPN70iBrqdBqmoBo
 vjQQVlbHubFFDYR+FxG2iWWKyRyN8WEJXHVfTwlrd6cUYqeT/LAuWgK0muxjOi8dl1ah
 YfUmjO/QxtIgf1ifaDZ9XjoVRsNps+9XUAgEd3Atdw04fTlLbJs3NnJgb8rXlIFzm2fw
 cw0p/4AMIpKvWOFPUNIwMlhQUyzROccVpj6QvIrrqnPKNa98uL8N/gUOdryYO10xDRm2
 oLEQ==
X-Gm-Message-State: AOAM531zVjmQd0+69uNSr4upPaQt8NXy6YMFkdAvZodajvmer04vJIoH
 dZbgF9Z7D04pjGKb7Okb0OYWrz/MROiD83s8352Msg==
X-Google-Smtp-Source: ABdhPJxEQwnMoy7/2nuHnosZZdus1Q7o1rbwnC4Wcg8eh66gIgE6jve/dRr62bTKsnfjoStgWL/uN3drhQuQsko3WUo=
X-Received: by 2002:a05:6402:1d8f:: with SMTP id
 dk15mr2695462edb.146.1620310905518; 
 Thu, 06 May 2021 07:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210506133758.1749233-1-philmd@redhat.com>
 <20210506133758.1749233-5-philmd@redhat.com>
 <CANCZdfoJWEbPFvZ0605riUfnpVRAeC6Feem5_ahC7FUfO71-AA@mail.gmail.com>
In-Reply-To: <CANCZdfoJWEbPFvZ0605riUfnpVRAeC6Feem5_ahC7FUfO71-AA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 May 2021 15:20:37 +0100
Message-ID: <CAFEAcA9VL_h8DdVwWWmOxs=mNWj-DEHQu-U4L6vb_H4cGMZpPA@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] bsd-user/syscall: Replace alloca() by g_new()
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kvm-devel <kvm@vger.kernel.org>, Kyle Evans <kevans@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 6 May 2021 at 15:17, Warner Losh <imp@bsdimp.com> wrote:
>
>
>
> On Thu, May 6, 2021, 7:38 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>>
>> The ALLOCA(3) man-page mentions its "use is discouraged".
>>
>> Replace it by a g_new() call.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>  bsd-user/syscall.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
>> index 4abff796c76..dbee0385ceb 100644
>> --- a/bsd-user/syscall.c
>> +++ b/bsd-user/syscall.c
>> @@ -355,9 +355,8 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, =
abi_long arg1,
>>      case TARGET_FREEBSD_NR_writev:
>>          {
>>              int count =3D arg3;
>> -            struct iovec *vec;
>> +            g_autofree struct iovec *vec =3D g_new(struct iovec, count)=
;
>
>
> Where is this freed?

g_autofree, so it gets freed when it goes out of scope.
https://developer.gnome.org/glib/stable/glib-Miscellaneous-Macros.html#g-au=
tofree

> Also, alloca just moves a stack pointer, where malloc has complex interac=
tions. Are you sure that's a safe change here?

alloca()ing something with size determined by the guest is
definitely not safe :-) malloc as part of "handle this syscall"
is pretty common, at least in linux-user.

thanks
-- PMM

