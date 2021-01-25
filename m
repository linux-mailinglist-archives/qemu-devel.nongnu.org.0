Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7269730277B
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 17:09:07 +0100 (CET)
Received: from localhost ([::1]:57048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l44QM-0005wt-Cl
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 11:09:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l44OG-000503-05
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:06:56 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:35644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l44OC-0004WB-Ea
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:06:55 -0500
Received: by mail-ej1-x629.google.com with SMTP id ox12so18861214ejb.2
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 08:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n/TOhHdo6/Zgtnx+xiIOxK04RI0pFWudQqC+i2Zk+2Y=;
 b=s/VSB2zKy56d4jUp43vreaEz6+Pjzj+vz4LGr06uHS1IzoMA5ZofwmFIQK/BLfIstU
 FXPriS5bN70KGeWhJOmoEQPv21USDQew19t5CNzHkdng/dufgczk2dN1Iq+saWC48izG
 b2OfZV1hiECHIGaGn6UlN1PDa4uFjtrWNLiS4uVTV+pR3WgScB1554y4c9pLgstbSU0e
 tTSzgjZoAU6NLzlwJyps+dwoFd0VcdMYK0g/NN8xvGgHQd/jzqQTh5FTl92d6DRVF+b8
 CA+2ADQ8if3DTGymY68OSgG6zOljnRisYMec00AQ3Bwf12wU3rzVDA9BwtQymjwboLWW
 E28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n/TOhHdo6/Zgtnx+xiIOxK04RI0pFWudQqC+i2Zk+2Y=;
 b=XRUlyIbtvHXFEvbmIFl/1mquGMEJvPVQlVxAecaAWSVGGjcQlGNR8mISLB4cLgTo/t
 3I7E7BoTkgLEOiDmBoueo2BBU9x9CZMSxaCSHEMgmHpazHLETHMmVs88aVIitaQnSoek
 jte1pZQ+Bbsw4P2CpVfAQ9XKkOvfEJkeTlodiH1T0QylFv15LfRtdMHrNMWB12bBqXRx
 jqwfPjy05TELGuN/1gZCZR2/uyMk4qHfDi2of3T48jb04wa4zKxHbbzoB5EgKMl4XFf1
 sqyFd5NhOBi7Kb2UMTYJG8S6woucqnC6WtRCtDaHt8Pd+nNMlXf/pbR/ROLpBhWSlv/w
 AiIg==
X-Gm-Message-State: AOAM530NPQ7WXr1sgi/X3gkVa+dN5Nmi9X3+NmRnw7tt6nZecw+GKgNa
 zbHsddVkZrZcfqj7VZlNDbz5qnhNVfXr09HMXdJKPQ==
X-Google-Smtp-Source: ABdhPJxYaWc2dGJSuih1l4G/3Tb1Gau1DXurGceKlydD2p4Nx1bM+/DP0L1emXbeofbhbDimdbWGSa4Ij+4ap6ryWAc=
X-Received: by 2002:a17:907:3d92:: with SMTP id
 he18mr832165ejc.85.1611590810555; 
 Mon, 25 Jan 2021 08:06:50 -0800 (PST)
MIME-Version: 1.0
References: <1ccc5e60-65fa-21aa-713d-d5bb575b2594@redhat.com>
 <20210125154316.GC7107@merkur.fritz.box>
 <c53e6ff2-b09a-ee1e-110d-b64f23e7b609@redhat.com>
In-Reply-To: <c53e6ff2-b09a-ee1e-110d-b64f23e7b609@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jan 2021 16:06:39 +0000
Message-ID: <CAFEAcA9i+Z5iZxmdfemfHk1EZj5v66kokOu0T9on8XVe92xGrQ@mail.gmail.com>
Subject: Re: How to check when "raw" format driver uses a "regular" file?
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 25 Jan 2021 at 16:03, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> The problem is when emulating devices such NOR Flash (parallel mapping
> or SD cards) we expect the block driver being a plain file (either "raw"
> format or another) but a "regular" file. When an user passes something
> else like a block device, odd things happen.
>
> Well, I guess I self-restricted my question to device emulation. So
> in the cases mentioned I would like to add a check in sd_realize()/
> pflash_cfi0?_realize() for regular file when a block drive is provided.
>
> Description of problematic user case:
>
> * -pflash /dev/sda
> * -sd /dev/mmcblk0
>
> User runs emulation on top of hardware (maybe like passthru?), and
> expect underlying block to be in correct state out of QEMU.

It would certainly be nice if these cases worked (AIUI they do for
IDE/SCSI disk emulation, right?). So what goes wrong in the SD card
emulation case?

thanks
-- PMM

