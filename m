Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779A02DACC3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 13:13:33 +0100 (CET)
Received: from localhost ([::1]:42052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp9Cu-0000OJ-Ca
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 07:13:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kp9BR-0008GT-0x
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 07:12:01 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:35365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kp9BM-0000P8-8X
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 07:12:00 -0500
Received: by mail-ej1-x644.google.com with SMTP id q22so9598549eja.2
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 04:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T3wmvyqJWlarP3ZvbflhYdwwiPtd1k0f5gRDmYIDKwY=;
 b=YcNsKqjz19f9PrRsRSliusEHNTP7cNS7J+LCxjuN4SS7We2h7gaXw9yqMIaLlOKajA
 uYxXyOckPUf1leQBZrn+DMo4RoWgjjnsHsWggx1Qzi0ub9J7gkU7Il0FAS+v8tasWkxD
 Auansd7B8PSZ3QOA5LWkIFJmC1Czi2JhWbgsZiBIbRTvTCe0x2RfbaGpXLsrWj7MYBU2
 t31c6XkgyPu1RSS9j8jOnQzb9KpAlziDQXu4dO67OWW9N/s5qcxILv1I3bFUve9N+b4E
 J4SLaz8QBpPtWZrj/xBUKfdmBEidoQPTVm8nWUJ3+1K6RH3hj4kAOrE+P0btDWcsNvXp
 gq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T3wmvyqJWlarP3ZvbflhYdwwiPtd1k0f5gRDmYIDKwY=;
 b=DbDBEqRbmKFZPDAZXd1vTr97A40qUwv4Q4v4pnL+A01ZjpHFjHkKYuyVh5Wjidh0yY
 k6od0P+S8pOYi9nnRjlXV3CbMBaB92m3RyOlXYdsBBOgNW5SdaZ3QHxusmHIUyVXYLpP
 jo/ELm1IPif9cpKsUCMsOKDBQzmAWgr0Iw56JpRIZtP5am48V/8+GN2ItrhSR/Aktvzc
 vtZkLZXJQF6Zi2XaBxEvV0PAIuXCEBolnJnOZPSg20FpKBtyx6Hh8Kl26NveQKjouF5M
 fn8E89bfloIBPmOQsGpz9r0vdrfGnqe+3aZcD+imsR68DgWI5NwBplwsbE7p6WCvlWcI
 UPBw==
X-Gm-Message-State: AOAM532gIBVsOrt1zCNHNkv+1ORAkOyYYUtuvaaJD5wS1nP3qwSgkTp/
 iEjdpeLikQYt75+QxA8BmRuE0iRBaBln+kEg0ExPcg==
X-Google-Smtp-Source: ABdhPJzRP7aGhGcew9jgaIl40y85MWgqZ7b6/JLpFudtAhyD9Gei08965GeRMUc3vzTtEeuKEPkk4WDDkGwQobYrQZI=
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr26871369ejb.56.1608034314742; 
 Tue, 15 Dec 2020 04:11:54 -0800 (PST)
MIME-Version: 1.0
References: <20201215114828.18076-1-leif@nuviainc.com>
In-Reply-To: <20201215114828.18076-1-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Dec 2020 12:11:43 +0000
Message-ID: <CAFEAcA8i6vAaOFPFRPPYjQgj6gnvS_GutH1HBq=trvrz-Ud-2g@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] target/arm: various changes to cpu.h
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Dec 2020 at 11:48, Leif Lindholm <leif@nuviainc.com> wrote:
>
> First, fix a typo in ID_AA64PFR1 (SBSS -> SSBS).
>
> Second, turn clidr in the ARMCPU struct 64-bit, to support all fields defined
> by the ARM ARM.
>
> Third, add field definitions for CLIDR (excepting the Ttype<n> fields, since
> I was unsure of prefererred naming - Ttype7-Ttype1?).
>
> Fourth add all ID_AA64 registers/fields present in ARM DDI 0487F.c,
>
> Lastly, add all ID_ (aarch32) registers/fields.
>
> Some of the ID_AA64 fields will be used by some patches Rebecca Cran will be
> submitting shortly, and some of those features also exist for aarch32.
>
> v1->v2:
> - Correct CCSIDR_EL1 field sizes in 3/5.
> - Rebase to current master.


What happened to the various Reviewed-by:s that people gave you for
patches in the v1 series ?

thanks
-- PMM

