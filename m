Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 706A8332EA9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:03:10 +0100 (CET)
Received: from localhost ([::1]:53782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhdM-0000Dl-U3
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:03:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJfkn-0002le-UV
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:02:42 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJfkk-0000ZT-Jk
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:02:41 -0500
Received: by mail-wr1-x435.google.com with SMTP id h98so17031629wrh.11
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 09:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=N02Bj7U1JgWmZRoDkjfU9IGhvGGwnaIy/8JcUDf0Sls=;
 b=OhkIxbxqTmidM3WQh88+qrVIO6DRI3qlpmBEzP6BbfPShXhriZInmPsmKp9rfWPocj
 sL6hPpm1CjUnWBHHFYBgQka+rCTYaVq+hSiwga70Dtc4w3S9R/VKtE9xsgEYFXFRPPFd
 cyFf82Pa4RYMruICm35Ic/89FunvkeGxw6CtwAT6UNeaeQlB7+qIvJ5pHzih4RdjseP8
 tGdYEmXugVUIYphRM20pfUupwwrVg8AYassObvyts3sXWhbATtOff8dR7sKp7pDm5sQ1
 tdqJTVueOn57W72yAi42fkj85r+rL7Ou2t2IwVyQrGBL0miGN4bys5JgeEvHgoauO7sP
 /VGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=N02Bj7U1JgWmZRoDkjfU9IGhvGGwnaIy/8JcUDf0Sls=;
 b=EdgAaY3glOw6H03HeC0SqRU4qFKCGFyzysjqKft32rlJ1db0XYzcXA5u4ib5FmrwPO
 SCe7zgb877EZ2TSFpTt8lvRLDBM2QfqHaX2aSzMVgjma8RLDRh5jdq46P4pCWKEDK0Xp
 yjlmiRxIZKj9KqpZn7YFOSVk2cqgLWsShJJpVYsOsH4EKNPXa5DqJI6cl6it+rqGia7J
 7FPdFDRvuMTcaBURfaNrgCXo65khg6F4+p/ErRCDrmKHNRrPBQ+rwTPEDgVHk5+D2qmw
 zhdZ0zf5LYeTFpkwo3LHGJkvJr/nn5YgY3tlOfGpdTwNtXNgWXzAAiuaBKInSuakz8EX
 B4eQ==
X-Gm-Message-State: AOAM5319nhO/g6KN8CgXOUr2RIC4xKf1kfdigFT8dnXLSIdp2UwSIO0H
 1BTz3IwgW0BqUdL2CjsZXSGLcQ==
X-Google-Smtp-Source: ABdhPJwkJiHEzOg3YPRfjSUvNHvCGq+el+uUJ0S1MNVWAQhX2PkMr6xAZCZExwH7twJ9dMw3mfeDCQ==
X-Received: by 2002:adf:f4c1:: with SMTP id h1mr29695466wrp.71.1615309354533; 
 Tue, 09 Mar 2021 09:02:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v18sm5705050wru.85.2021.03.09.09.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 09:02:33 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C1AE31FF7E;
 Tue,  9 Mar 2021 17:02:32 +0000 (GMT)
References: <20210309141727.12522-1-alex.bennee@linaro.org>
 <20210309141727.12522-4-alex.bennee@linaro.org>
 <CAFEAcA_zFYAWc=03iSdsj-Sy+MN5-DWih4QKzddZJsrRjrzhOw@mail.gmail.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 3/4] semihosting/arm-compat-semi: deref parameter
 register for SYS_HEAPINFO
Date: Tue, 09 Mar 2021 17:01:28 +0000
In-reply-to: <CAFEAcA_zFYAWc=03iSdsj-Sy+MN5-DWih4QKzddZJsrRjrzhOw@mail.gmail.com>
Message-ID: <87r1ko8dlj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Keith Packard <keithp@keithp.com>, Bug 1915925 <1915925@bugs.launchpad.net>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 9 Mar 2021 at 14:23, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> As per the spec:
>>
>>   the PARAMETER REGISTER contains the address of a pointer to a
>>   four-field data block.
>>
>> So we need to follow the pointer and place the results of SYS_HEAPINFO
>> there.
>>
>> Bug: https://bugs.launchpad.net/bugs/1915925
>> Cc: Bug 1915925 <1915925@bugs.launchpad.net>
>> Cc: Keith Packard <keithp@keithp.com>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  semihosting/arm-compat-semi.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi=
.c
>> index 733eea1e2d..2ac9226d29 100644
>> --- a/semihosting/arm-compat-semi.c
>> +++ b/semihosting/arm-compat-semi.c
>> @@ -1210,6 +1210,8 @@ target_ulong do_common_semihosting(CPUState *cs)
>>              retvals[2] =3D rambase + limit; /* Stack base */
>>              retvals[3] =3D rambase; /* Stack limit.  */
>>  #endif
>> +            /* The result array is pointed to by arg0 */
>> +            args =3D arg0;
>>
>>              for (i =3D 0; i < ARRAY_SIZE(retvals); i++) {
>>                  bool fail;
>> --
>
> No, 'args' is the argument array. That's not the same thing
> as the data block we're writing, and we shouldn't reassign
> that variable here.
>
> What was wrong with the old arm-semi.c code, which just did
> appropriate loads and stores here, and worked fine and was
> not buggy ?

I was just trying avoid repeating too much verbiage. But OK I've
reverted to the original code with the new helper:

            for (i =3D 0; i < ARRAY_SIZE(retvals); i++) {
                bool fail;

                if (is_64bit_semihosting(env)) {
                    fail =3D put_user_u64(retvals[i], arg0 + i * 8);
                } else {
                    fail =3D put_user_u32(retvals[i], arg0 + i * 4);
                }

                if (fail) {
                    /* Couldn't write back to argument block */
                    errno =3D EFAULT;
                    return set_swi_errno(cs, -1);
                }
            }
            return 0;


>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

