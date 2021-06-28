Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F01F3B67E3
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 19:42:20 +0200 (CEST)
Received: from localhost ([::1]:53018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxvH1-0003zA-DO
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 13:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxvEx-0001Kp-1V
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 13:40:11 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxvEu-0002BB-SP
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 13:40:10 -0400
Received: by mail-ej1-x636.google.com with SMTP id c17so5400048ejk.13
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 10:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AimPmqRLMwOueQkfSEyiTePKvwH9fQVu0hpd5dYqN/Y=;
 b=b8Yyq1a/BGI3r5X6j9q5zfthU4pCNLWXJjTtzfY7LkLQDD2Zg8cjK/SXlDopbGvrSJ
 Gg12BzNSsddde1ai6esRk6/pmSsBKKyboaBk/mE6q62zsvCt4YMxf9C/C2wkOtoZyjBV
 2i7YbOWIY0ylpSg1WhVdwV+Obym8mTKdpz6bUepk0BOSY9Tc69EFN5NKksZB/DG4co+C
 HnwHtZpblVUrBZ5eSWNYFP11sP+iuzZw2LnVlEe+rCVmeZ2jSi4SsRzY7ePn7I6pVhWW
 FJaFL0Cf5Ngyw9+VoSTyOejhLTqGKxOdcofnlu6s8q4K0oloYxDZ6zvPmnCozPxNGbZI
 IJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AimPmqRLMwOueQkfSEyiTePKvwH9fQVu0hpd5dYqN/Y=;
 b=Kfb9UQhZv6UxV91qMcV7h9JsPfouc3DejeJ2x0QfgTaVt7HWjJ4fCnlHHPo7pTE9qV
 xyo1NXLTru6E385SFc0hWk9X5whDtTNl32TBJ1VNuiqe3vU/7SdRfrhgDWCTGWnoTDPQ
 IrumSyh0krC+fwmgtv6PqbKp3Or4lDcVifYb5Ay10nt+VtkaSZR1/Lo6FC48W+ZfJ/yV
 l3ET4MuRDYHE2QuEF3SWrH8zBSI0Njhf7ONMak1IfddthZ2evTV6YpA8rYGPOGlxedG+
 UCiaAnBwnXkG/5ZNQ2Fju9FwtDFXf6P2/KW2BbG3/j0+2BtbDpZr7BPuPCdXNFha4UHB
 s70w==
X-Gm-Message-State: AOAM533um269BXlLx1TnSPLlTjgEx2YgXWNO0zqdSelfALMchXdW0ts9
 jz7G4kReCJr+yCyuYk0Tij0148MmM70Lx0g1H3JeNg==
X-Google-Smtp-Source: ABdhPJzOOzMG62qkverBEZsd9l3vlppbb9usMfhCNmj8OyNf97cnaZE5op1VfM83wj4DQjhqMBObG6FGZ6cHMbtbPfM=
X-Received: by 2002:a17:907:a064:: with SMTP id
 ia4mr25625346ejc.482.1624902007115; 
 Mon, 28 Jun 2021 10:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210531113837.1689775-1-f4bug@amsat.org>
In-Reply-To: <20210531113837.1689775-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 18:39:30 +0100
Message-ID: <CAFEAcA8y5-Bs4+_2Fg_0bezBsdJhODrV52LFXLytP-P0-fFJuw@mail.gmail.com>
Subject: Re: [PATCH] tests: Boot and halt a Linux guest on the Raspberry Pi 2
 machine
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Nolan Leake <nolan@sigbus.net>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm <qemu-arm@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 31 May 2021 at 12:39, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Add a test booting and quickly shutdown a raspi2 machine,
> to test the power management model:
>




Applied to target-arm.next, thanks.

-- PMM

