Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 283461759B5
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 12:46:02 +0100 (CET)
Received: from localhost ([::1]:59372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8jWK-00046r-Pa
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 06:46:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37523)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j8jVM-0003T0-9W
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 06:45:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j8jVL-00056x-1m
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 06:45:00 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:36903)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j8jVK-00056h-SM
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 06:44:58 -0500
Received: by mail-ot1-x342.google.com with SMTP id b3so9379018otp.4
 for <qemu-devel@nongnu.org>; Mon, 02 Mar 2020 03:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HzUbiyFOIAhKBOLtvU0wcuoLQzSWzvKiUf4HyRWED/k=;
 b=d5nfF6EiGCLrlhk/zQoYA4Oi3l/X+sYzzgck+sTDOOhqWVFaSPkboNAI21ta9aFg7K
 brD54B+LFgeYwuOhjg1wb+yd8riCXo5ZbeheWJSXW29YPSy4ygpz6moFr0MIL9aKFx/V
 4K4J8MT7mEz0tqSTwJJAL2gz9SnCDQRGmMzqFiR/3VpimSLNvh0uhA+rlvvJUNgE5lQz
 DXQgitj+F5pyAwDsYyqBR1fWzHyOn1x+1PxI5f6msa4ng9+wi2bx36MfieA+kdX/M4jj
 BUNIi52eFBudEelw2Lwr/DRD3zlBo9Xa/vc93kXP4NIalR7d0xpSeXkRtKYJDN9PMOEX
 gtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HzUbiyFOIAhKBOLtvU0wcuoLQzSWzvKiUf4HyRWED/k=;
 b=tzsBe2Q5Ybh78VswUm6FD5wR80vCmMHOgZ9WF7JU69xqN/iOAUZ7NK4zWKQVuuHtjw
 DQ/IlHkbistw7OdjE/YLb898XzpRS1PF8TTNmSz1TMP8Lcr+8eiEz1X6iRJj93RNhjBI
 nIk9dVLGuSCmyVNlIPmv5cAxtg2QYzEmok8ktamwrmwgUL9VTOkdwMSGZ4sxoIcLwJ0C
 dZTZFSL1e37LMsLh8a642iC/xNtiqsy4OUWcFlvtDzy7lwP5MSV2HvZttvCqHnc2XsqC
 rkOVWfYArsA3DZivGdgHv2gW6x/yNVutJ/x//6yFuyGKfrQvmo73oHPN+Id1Yhzo+ajh
 KA0Q==
X-Gm-Message-State: ANhLgQ1rxRHxjoWDM7qpi+9zNanq8WYS/1HwzAvmnIHy4a8lwte2O26r
 jRhCZByAHP/wB1BAXSgGJ9neB8fvajtnaD3vQjnbhw==
X-Google-Smtp-Source: ADFU+vufiAMFrPoxGCo+uzmhllwQOL0PsOQliH8YD0TxXfqqGuH9VCP1pJc31L56fe9E9ys7lqkUuW6j2bmjwVRJyDQ=
X-Received: by 2002:a05:6830:1406:: with SMTP id
 v6mr3688045otp.232.1583149497899; 
 Mon, 02 Mar 2020 03:44:57 -0800 (PST)
MIME-Version: 1.0
References: <20200228125351.29482-1-philmd@redhat.com>
In-Reply-To: <20200228125351.29482-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Mar 2020 11:44:47 +0000
Message-ID: <CAFEAcA-AUSLBirS+1_JHCVQAH5-ZJz+YL+Qp8StALRW7b6EzJg@mail.gmail.com>
Subject: Re: [PATCH 0/5] hw/arm: Remove big-endian checks on machine code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 28 Feb 2020 at 12:53, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> We only build the little-endian softmmu configurations.
> Checking for big endian is pointless, remove the unused code.
>
> Philippe Mathieu-Daud=C3=A9 (5):
>   hw/arm/gumstix: Simplify since the machines are little-endian only
>   hw/arm/mainstone: Simplify since the machines are little-endian only
>   hw/arm/omap_sx1: Simplify since the machines are little-endian only
>   hw/arm/z2: Simplify since the machines are little-endian only
>   hw/arm/musicpal: Simplify since the machines are little-endian only
>
>  hw/arm/gumstix.c   | 16 ++--------------
>  hw/arm/mainstone.c |  8 +-------
>  hw/arm/musicpal.c  | 10 ----------
>  hw/arm/omap_sx1.c  | 11 ++---------
>  hw/arm/z2.c        |  8 +-------
>  5 files changed, 6 insertions(+), 47 deletions(-)



Applied to target-arm.next, thanks.

-- PMM

