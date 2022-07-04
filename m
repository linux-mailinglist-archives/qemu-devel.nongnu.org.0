Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28753565837
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:04:48 +0200 (CEST)
Received: from localhost ([::1]:52670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Mgx-0006AV-85
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Lzq-0003hX-UH
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:20:20 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:40926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Lzp-0002Xf-AW
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:20:14 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-317a66d62dfso81967707b3.7
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cy5PWkJsHsCkS/LVxxodmzOuZhACosp9b7woXLOchZ8=;
 b=u7QA/ExmmX0WkUdDX0bOxUwWNd76SRUjFqUrykiScz/9YmgU4UFYLTMIGwmgBgeICR
 RSmVG2gFEVrwLHrgzBiYb9p/pWIwY8wGB98A3+2ZJ77rzPgUw+m3tKeXH+h39k6Cs1aI
 x4NPKU7SEiAy/eK56i5nsAHVH3ttL43iqxC9E+gu6q9xXhXAvPuTNLFw5BHeOX8z13aD
 TDUx2V/772+yxPgplsWGVsTOQKEJS8FE+8K8ut7zkCzOQyYOKTMffJP4vJAn5+mcOhoD
 nVh0mZWSDaIpMwRFFBNP5512OOg88lF2RKcAecNpi6uxzKYg0ii/ODgw+zx8s2j0mzPG
 DCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cy5PWkJsHsCkS/LVxxodmzOuZhACosp9b7woXLOchZ8=;
 b=cKjFJcbjQUgBhR9fXoevxG3z8hSx+JvDXfdbzYJkvmodyP9EKbLJGEkWty59mIX6Lf
 Oy7f3ei2kiVJMXqvrFUj+Qd8xbenzh02KAq7gyVtJCsZ754vsuKEZE0Z53P2DI1x8A4g
 gybe0mLAs4JgWh7hiBeZGv8tlrbtVrI+7ZeCZ2uCCLnfCJNbvcqMjnmPE2at6YZgETWb
 RSEVXzZrpK/ValudtEFrJj0veu6bXPgLint0TCbD95LKDFFZNOm0A+q1CoAozVZHPI4E
 bj0gwdvmBXxpurIxyXPrrgxwxKu5YUI23j65M2pcQVc4y3Z7GN3cgRiGB8KMC1ILuPC5
 C7Pg==
X-Gm-Message-State: AJIora8ty0Mvl5SYRCtLpR2kXsW0v5rvUJ/HvI5cJadjnsstcPhP6juu
 BVd8DZUpLgPSqP1zD4C6wdYEtf/s3EeZJWjFjjkknQ==
X-Google-Smtp-Source: AGRyM1s+Qsv7Mkm9XZEeLuo7Ku1YjWa8Joa3J20Pt/ak+B8AeTMQrmzSAvrT7D378S5upYCN45zRHoegJC/aVTtcTdQ=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr33810124ywb.257.1656940811387; Mon, 04
 Jul 2022 06:20:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-11-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-11-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:20:00 +0100
Message-ID: <CAFEAcA959NvUgEqXHyhmY=VYgURzoHz-e6Tsaz7Bq5rai0mGNg@mail.gmail.com>
Subject: Re: [PATCH 10/40] pl050: don't use legacy ps2_kbd_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Instantiate the PS2 keyboard device within PL050KbdState using
> object_initialize_child() in pl050_kbd_init() and realize it in
> pl050_kbd_realize() accordingly.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

