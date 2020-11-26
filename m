Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2246A2C51E7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 11:18:51 +0100 (CET)
Received: from localhost ([::1]:54092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiEMU-0000w4-7S
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 05:18:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiELg-0000Ru-CN
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 05:18:00 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:37370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiELe-0005hd-AO
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 05:17:59 -0500
Received: by mail-ej1-x62e.google.com with SMTP id z5so2150640ejp.4
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 02:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=noZcFbuDvMDzVWlS4J5l58/Q7GYdjsUIYznJBF/nQks=;
 b=fb+osCLJRooARVnDAuG83r8fqlQUVRSPGergXFhYuwEvEgUAjzrWfb8uQv2UkxF5bB
 WnYKtIiDfDNtvOLEtt5iia97Y9EM/M6eO7aZtevJZeHjEbm5g1nY485e+7wD/RiG717C
 tLWfjcfAImNWTjiuYDpxeGKjZrEePz5YaOGO4rpQRku3JPf2dAgEhjzkoRgjshJ+lmmJ
 gaV2NnqaNdhyS3QkugsuN9KOtWoULq0LYUntRnyWWJuHs9kwLHj9QHuzd/06p0Nd46TH
 p5HrfsxMY6AUjp18LrJRpVLCejbDkdSQ3Bhy8jDpEetqvG/P3GgcQ2E7k4ZBITGSxrCe
 pssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=noZcFbuDvMDzVWlS4J5l58/Q7GYdjsUIYznJBF/nQks=;
 b=bLehSd0qd/hTiObfH1dSp1uh2kvZYkOVzokMriJBmOUQJN0mTFVBnJhgXtajx+TzIM
 ZOTDZNE4yMGDwIR9kWN6a3aAVl4OeVlgUYycoEx6smunQ3x4p3HRz5Ptn7RMIbK1XwB6
 lv+5w6S2e1NCRcH55jbqo1v8iO36s7cXBi7kJ88bfl5nGOLr6n2IEwXgxpFeXMlyzTzd
 CrcEUei5nOyvXrgq1TsuQW+MMlV1v/38UINlS80AzEe2Olt/zUUsrhdJGalLgls01pSo
 AnHgXoLluqXeAJPNCerOPhwQy22be+cgD3aTABgGA84iQM2aMTWkhFCmIQk5GLkXXDlq
 UOjw==
X-Gm-Message-State: AOAM532NY6SB7TBBobcoXUfCWsCRiKAr3Wfp6Fo6xtoP14Phwsh9qUlc
 tbYYSdoZRoLy/97Y5UPrF2qIQFLWzz57nT/9RZvQ6w==
X-Google-Smtp-Source: ABdhPJxkp8DNoJe+WLS3+ZYrbSzyW8u18Zb0dy25rlFt6teaAYoYhaeKeIvQMCYvzWevI6oxLVqfnEPgXfJV7dmhhYo=
X-Received: by 2002:a17:906:dc4:: with SMTP id p4mr2023912eji.56.1606385875340; 
 Thu, 26 Nov 2020 02:17:55 -0800 (PST)
MIME-Version: 1.0
References: <3a664806-8aa3-feb4-fb30-303d303217a8@redhat.com>
In-Reply-To: <3a664806-8aa3-feb4-fb30-303d303217a8@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Nov 2020 10:17:44 +0000
Message-ID: <CAFEAcA_O9VoXqs+BxUr5pJYYq42dkXjVTHQ_e9Z_p90tF7bNPQ@mail.gmail.com>
Subject: Re: Proposal for a regular upstream performance testing
To: =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Charles Shih <cheshi@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 at 08:13, Luk=C3=A1=C5=A1 Doktor <ldoktor@redhat.com> w=
rote:
> The goal of this initiative is to detect system-wide performance
> regressions as well as improvements early, ideally pin-point the
> individual commits and notify people that they should fix things.
> All in upstream and ideally with least human interaction possible.

So, my general view on this is that automated testing of performance
is nice, but unless it also comes with people willing to do the
work of identifying and fixing the causes of performance regressions
there's a risk that it degrades into another automated email or set
of graphs that nobody pays much attention to (outside of the obvious
"oops this commit dropped us by 50%" mistakes). As with fuzz testing,
I'm a bit wary of setting up an automated system that just pushes
work onto humans who already have full plates. Is RedHat also
planning to set performance requirements and assign engineers to
keep us from falling below them ?

thanks
-- PMM

