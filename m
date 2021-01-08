Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 003F62EF66E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 18:27:20 +0100 (CET)
Received: from localhost ([::1]:41418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxvXk-00012d-0u
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 12:27:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxvWF-0008S7-1P
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 12:25:47 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:36860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxvWC-0002Lb-P4
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 12:25:46 -0500
Received: by mail-ed1-x530.google.com with SMTP id b2so11989776edm.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 09:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rRVUqHeVwF1ls4j6jn8CBOFBWHy7BrHkKWqdwKtEXCg=;
 b=qK7Dru1vwFmMV2gW22b2EXw2gWJZ6evsT7FMKoWouuxUg/R8PXGGpghtnp7dRdfEUS
 Vfz0XdUX+InTjnhccSu0YQBNIdf3jqSGL2hlvJEu2DsOAPROzXLX12v10dKO1xx/j7pU
 SdvR5gU57Lev5Pln9NKvU1LGbx48eOgrwfaUySEIYRYzaJKqE6IXxgnEUz0kGpxr+z5Q
 LtpvRECjAbrhmZO/uP9lVL7OrHAJKbwDR+NIZr1OYIU1HvvULpTrxV5hCiBIgRXIe0H+
 kpxPZOJfBXUOFzn0zFT7w0sStW6Dene9WCjqsL8uZqVeI0aN2vA85Xmy6K58rLS5S1D0
 YY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rRVUqHeVwF1ls4j6jn8CBOFBWHy7BrHkKWqdwKtEXCg=;
 b=Qz6meuMuPAx4/mDHyXgPFGQ4Y5Eg2B3u5lVIlr/kkfE7kgaAyIO5EGC9AMDYzYIKEO
 Cq9C4MLkKt3RmN6+BEW/6tYfDLXB2dQ+glVk15UfqoglhMCLd7/t4Z3yH6WGKDrCQSLw
 KM4N63hnOHMwLFg1jIYuSonk0h20sS4IlpV8vCWS3pOvk0KaSKim6qEKw55t1cJRLyAH
 NA37xTw+577gs5d/a9l1gsKb8tU1TThb0hee4qVM+iq3I/6PijudPstbqtdjRwko7tbB
 mnoy8TBMKnrIQGbMnRFDkbWZDokcs7Xxu/re4HB+nAEgyjjzPt+iz5boicam5MeV0UIZ
 3Z7w==
X-Gm-Message-State: AOAM533W/CVd6lkxtm78+rI5o8IaVI3m02WwGbY0l1LuGLs8eeiA/RkO
 sbuEM0H5RBoSjftAT6xEKqy+IczesV+F76ndSpLs6GhRM2s=
X-Google-Smtp-Source: ABdhPJzJXmJU5vqMd2+KWT1gfAdmmko2qUJMSV0AQRDkTjSBTCER7a2CxZkicK93KQmeOXtOoJ0yqRCcswZPSxsDlVU=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr5921441edw.52.1610126743227;
 Fri, 08 Jan 2021 09:25:43 -0800 (PST)
MIME-Version: 1.0
References: <aa0a0bcc-bd00-37dd-1012-cd71d32f1f9b@roeck-us.net>
 <2f710d2a-ab7b-de6c-4ada-8fb7300556da@amsat.org>
 <142ead0d-db31-3e3b-15bc-4614658ef251@roeck-us.net>
In-Reply-To: <142ead0d-db31-3e3b-15bc-4614658ef251@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 17:25:32 +0000
Message-ID: <CAFEAcA819jnU99nQdFZw1dd_x7YZ4SqQHouOw5w+iC2uEY76aA@mail.gmail.com>
Subject: Re: pxa crashes with qemu v5.2 when executing xscale operations
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Dec 2020 at 16:01, Guenter Roeck <linux@roeck-us.net> wrote:
> Something like the following should do.
>
> qemu-system-arm -M z2 -kernel arch/arm/boot/zImage -no-reboot \
>     -initrd rootfs-armv5.cpio \
>     --append "rdinit=/sbin/init console=ttyS0" \
>     -nographic -monitor null -serial stdio
>
> where the kernel is built with pxa_defconfig.
> Machine name can be any of the pxa machines (akita, borzoi, spitz,
> tosa, terrier, z2, or mainstone). The initrd is from:
> https://github.com/groeck/linux-build-test/blob/master/rootfs/arm/rootfs-armv5.cpio.gz

Do you have a zImage that exhibits this so I don't have to build
my own, please?

thanks
-- PMM

