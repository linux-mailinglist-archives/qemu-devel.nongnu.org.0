Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB1D6E0DD0
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 14:54:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmwQv-0006Lh-RJ; Thu, 13 Apr 2023 08:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmwQq-0006LF-T8
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 08:52:10 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmwQa-0004ch-T9
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 08:52:08 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50489c109f4so4067356a12.2
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 05:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681390310; x=1683982310;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=C6jw66opoOyLQKmMYotT5dBco10RsxrjSZmWM3c1HqM=;
 b=BxXUTJzIZzSJHu+itdvi8qwH3i162OapudBE/f74HGNPSdPPWOdg9G8TYKJ/5CYej9
 rXWYzLFFla4SGL/xsQyOfOCGazKU6PkBBLQO1i8RCeF1gDNs535tal95zkmzohGZ3rW2
 uL/ZBOqgoGCxjxtdTEaZw9M+2dGDKcaofPciuTtBxvSu2ZVAB8NkN4KojWnkNJKKdcn0
 XRp2tVhpphWIq9bspl6FIBfF4CCOqMwRX14w+JaIDFn46lQlGjDKEaHwtfKigSQvgxYG
 8Q73MqFbw2sghrM3SiXvE5blvl8HvKcF+Z4YxWPW15BPr3Ktu117KAKHUtJ8Mqex/8LB
 iZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681390310; x=1683982310;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C6jw66opoOyLQKmMYotT5dBco10RsxrjSZmWM3c1HqM=;
 b=Z3UEYhVAa6G35qpExYZYjvS2ZGwLwwq5DXS0aGnK6oGbbqs6BVtFGsGM3sBCETGUEd
 mPiS8hU7oWkQ9zNdWfudYbT7gn7t1hpfCcowBGCJ0CpKqu5E3+UxQlv/Rj7V/fO3t9z4
 TgIFsPQCQPvhSuyFgnu5oMz2+eHN25t1Jfdg4fUcdr815t1/WQWdIYiYwsl+7igvpzNA
 nyv8B4XYFpvhqOqK38M61A3GtYveObdb0YV+52UAsm5bpTMoS2cvdlpjkxRq7HzzLXcZ
 3KcK9aOXJ0A2NrZIpgRxHOIvEeez6jTSZFsqsW8/2sKsKh6FDKpPEW047SibRhZyrDTC
 EVVg==
X-Gm-Message-State: AAQBX9cSL40LqqLImgxTS0AtJlcK0GA4ZHzIT5V7IIgcdFW/48sfj9Ia
 8C56u4KR9uw2Zz5BsADlMWlwdlcxB73QDL9wpQ7DlQ==
X-Google-Smtp-Source: AKy350b9yU2bbZXbiA9UcGR4uMeB7sSz3ueWkGLUkLlv1LuY0txi78FbmUzDm1GPioN8zTTU9MWqlLaxsLwPiTaab3A=
X-Received: by 2002:a50:9ec5:0:b0:504:8731:4eef with SMTP id
 a63-20020a509ec5000000b0050487314eefmr1145798edf.6.1681390310426; Thu, 13 Apr
 2023 05:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230406002447.4046378-1-komlodi@google.com>
In-Reply-To: <20230406002447.4046378-1-komlodi@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Apr 2023 13:51:39 +0100
Message-ID: <CAFEAcA-2_gwOUgapmgSSFGVNiOk9Grse_E3TVo=pQTf-OgW2vg@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/arm/npcm7xx_gpio: Add some pin state QOM
To: Joe Komlodi <komlodi@google.com>
Cc: qemu-devel@nongnu.org, wuhaotsh@google.com, kfting@nuvoton.com, 
 qemu-arm@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 6 Apr 2023 at 01:25, Joe Komlodi <komlodi@google.com> wrote:
>
> Hi all,
>
> This series adds a couple QOM properties for retrieving and setting pin
> state via qom-get and qom-get.
>
> We ran into a situation in multi-SoC simulation where the BMC would need
> to update its input pin state based on behavior from the other SoC. It
> made the most sense to expose this over QMP, so this adds properties to
> allow people to do so.

This does leave the simulation in an odd situation if
the input GPIO was connected to some other device -- the
other device thinks it's put the GPIO line low, but then something
external has reached in and set it to 1, so the two ends of
what is conceptually a single signal line now disagree about
what voltage it's at...

It looks like the hw/gpio/aspeed_gpio device has been here before
you, only that device chose to use one bool property per GPIO
line. It would be nice to be consistent -- if we want to allow
QOM to set/get the GPIO line values, it should be the same
interface regardless of GPIO controller.

-- PMM

