Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A085A91BA
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 10:11:34 +0200 (CEST)
Received: from localhost ([::1]:43612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTfIT-0004hP-K2
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 04:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oTeMM-0002iw-KB
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:11:31 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:37574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oTeMK-0006J6-RO
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:11:30 -0400
Received: by mail-qv1-xf36.google.com with SMTP id mn13so25419qvb.4
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 00:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=JhHzG/bkhXbNukPhhmQtEtOGteABbeuiUWDV7CY9PMo=;
 b=HJMex4wcUD0Xfg/iRsLUTlG/GZuOL9McnSnRW6TM1G9pIf+LjUhZdmwN803eoRISYe
 eqTZ1puJHovEujZEQpYfM4M84cxmkyRmVy+W65oJ5Lx+1QbEaDdE8bDHAFEX5/OhEZpJ
 hTYrfiJXmU6+k8YHHfRg0wPAKLKRlr8LhpOZPfyvOV9AVcgk3P+7wYOVJ4oi+emzqGKd
 4wOT4gwvPxwhdRKdeCr/93SimFsN8WbcZsSTCralj54WwgZQ/UZv+xO7gA6Vxsu9LkNR
 8O0vVo0gv4LsZ5d+ZXm6jipsYwXat+Saiuzpof0jczM7/XHDBfLfVkLNm8pMzbQkRHo8
 mjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=JhHzG/bkhXbNukPhhmQtEtOGteABbeuiUWDV7CY9PMo=;
 b=TZuF00Mi5qQgtMQz1Wt51/ZtfCfTy/p2dTnAswIchjjpNwqbYf8X0PyigEC5Lr4rUt
 qarf3k0p4XEG1istZtugFT4LSGagfaJCyWr1pugCog4HXxmH8N8OlHswsivn9X8LcUt7
 xbgVG9rmsfB6elv9g88nozuIhJ/A38JmPofIdTutn7J0UjutLg7MGhc/KnSwqGIQvrtH
 QfCtNwpnWptBbyOWxuZnGvrxnXmSP8kFG+PLbU+/raopP9W0d4WSFn7EMpW1nFVoLSod
 Wemz8xZXqm+LtAkCos7gqLp+5En55lipHv76gWY+ZOnsrzPnm3u1R9s/BHDXXsn1NTD5
 /xHg==
X-Gm-Message-State: ACgBeo03fOXz7RmKeeDBhjXyTzjh6IZqGf1YFK5ewVAQ2cCSc+Y2KcU6
 0TKgJTmQDd56KOSdYjP1xRWtNBhOW8fPZpbwcwWU+/wIbNs=
X-Google-Smtp-Source: AA6agR4e8k5bjqsMqrtgU/vxbHPk4q85zr9NaCWKz+bJ/hLEdQ4oIDTL4pojafuI05qFJ8KkNdYhjGUnfgCrovduD1M=
X-Received: by 2002:a0c:810f:0:b0:47b:299a:56d7 with SMTP id
 15-20020a0c810f000000b0047b299a56d7mr22788613qvc.12.1662016287895; Thu, 01
 Sep 2022 00:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-5-bmeng.cn@gmail.com>
 <CAJ+F1CKj1uoa7pW1m7iRGUUcsqpDYnN2vmkfAn5xi6ogysMrQA@mail.gmail.com>
In-Reply-To: <CAJ+F1CKj1uoa7pW1m7iRGUUcsqpDYnN2vmkfAn5xi6ogysMrQA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 1 Sep 2022 15:11:17 +0800
Message-ID: <CAEUhbmVX4TtkWSm=9n_6+TP59GPszASAR6j1FVpt9dg6LxapSw@mail.gmail.com>
Subject: Re: [PATCH 04/51] semihosting/arm-compat-semi: Avoid using hardcoded
 /tmp
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 31, 2022 at 8:59 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Wed, Aug 24, 2022 at 1:54 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> Use g_get_tmp_dir() to get the directory to use for temporary files.
>>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> ---
>>
>>  semihosting/arm-compat-semi.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi=
.c
>> index e741674238..d5e66cc298 100644
>> --- a/semihosting/arm-compat-semi.c
>> +++ b/semihosting/arm-compat-semi.c
>> @@ -503,7 +503,8 @@ void do_common_semihosting(CPUState *cs)
>>          GET_ARG(0);
>>          GET_ARG(1);
>>          GET_ARG(2);
>> -        len =3D asprintf(&s, "/tmp/qemu-%x%02x", getpid(), (int)arg1 & =
0xff);
>> +        len =3D asprintf(&s, "%s/qemu-%x%02x", g_get_tmp_dir(),
>> +                       getpid(), (int)arg1 & 0xff);
>
>
> This is most likely wrong. I am not familiar with semihosting, but I beli=
eve we are implementing tmpnam(), it should return a POSIX filename.

Replacing /tmp with g_get_tmp_dir() is not wrong, correct?

I checked the semihosting spec, it does not mention the file name
should be a POSIX compliant path.
https://developer.arm.com/documentation/dui0058/d/semihosting/semihosting-s=
wis/sys-tmpnam--0x0d-

Certainly this needs a semihosting expert to take a look.

>
>>
>>          if (len < 0) {
>>              common_semi_set_ret(cs, -1);
>>              break;
>> --

Regards,
Bin

