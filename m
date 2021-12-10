Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 514ED4703B5
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 16:20:41 +0100 (CET)
Received: from localhost ([::1]:45438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvhhQ-0003kR-Ew
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 10:20:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mvhf7-0001lJ-Na
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 10:18:17 -0500
Received: from [2607:f8b0:4864:20::535] (port=37518
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mvhf6-0001rS-8h
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 10:18:17 -0500
Received: by mail-pg1-x535.google.com with SMTP id a23so3741129pgm.4
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 07:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fdkqxrCCHDIJc0pcPeBfoqbGmV06iVD5NkQn+RBcWjI=;
 b=yyUdrWm+6yKSAsBsaSykC0thXcn2EfuQ3s3NA3yLHiUQX2UOi2ALt1YbY9u0dDT0l+
 uYWh//PFW/8h0dXEMy5yHq1/pL3+H9dOiJmmMng9rMrvUtKTwN/NeBsC30SC13bZMegm
 0aIONMOv0ODPoNCMMnuUXsVzQ6uIsa637ETLVJw/IkfKeSZ3gRnuP3tdr8/qL9Xh69fh
 dWLQT1cR8THuLBLQZ0oASVEG9E24/Jy8tnyTom+bVD8CJRKgABe1fmzmA3Mg3wkIxoxy
 vd/FuJrSGWNZfJ3idZWjUCNqQA5QRIiGrVqccs0QZD8DfAiMvJAq2txggkRMScnGKhOm
 JaJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fdkqxrCCHDIJc0pcPeBfoqbGmV06iVD5NkQn+RBcWjI=;
 b=3iKjqUX3wAp1cOJIEHCh+B+dMoCLJ+ZpUTJO26t8g9pVhLSZCI7IW0gbZF2rgjN1a7
 yQXVfW1yxCP3DGmedbCa94KOXpQTnk3nEXRPWpSAb0sBSasNqk7WfxVDyzwrHOczNZ0c
 PLvB3eFTc9FebctinOEG6n+KqN+pERZvvmFd4yYRW9aqceBWeN5SP9vN34f+T1fLiqnF
 66xpGZRY6i/uny/nmHvGyFhjvkRbGZAIjVbjjwJkTRaXXqPDfypcwP5QDddD3RiIYgRM
 qUtQ8z04u97+bCktTBlPfZ9dBgUAZ4O2PLNCV4Yk4GfNnTkpKeV2LCxe6uh09E2jLzkZ
 8eyw==
X-Gm-Message-State: AOAM5331eW3O2cAT6gHCS/R746jwNmUpTKi57XhtFdfrQ/xeb2rTuBRj
 j9ZiRiXAP2TIx6wr/azA5dRwY3K2Mlr60XFGQcM5VA==
X-Google-Smtp-Source: ABdhPJzNDRYAL5mVCrMO/hivcs3Ei4LYVaLj+O7GGSU1jfIPQfIDGE9E83xGPsvut/OJwaSvaE//m8X1fKkF1PbdESc=
X-Received: by 2002:a65:6a43:: with SMTP id o3mr39102426pgu.329.1639149492082; 
 Fri, 10 Dec 2021 07:18:12 -0800 (PST)
MIME-Version: 1.0
References: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
 <20211201154023.13931-5-francisco.iglesias@xilinx.com>
In-Reply-To: <20211201154023.13931-5-francisco.iglesias@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Dec 2021 15:17:53 +0000
Message-ID: <CAFEAcA-h5vdHRmxpN0o=huz2_XvcgUX5ot1CN5=mLDyr6grw4A@mail.gmail.com>
Subject: Re: [PATCH v4 04/11] hw/dma: Add the DMA control interface
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, qemu-devel@nongnu.org, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Dec 2021 at 15:40, Francisco Iglesias
<francisco.iglesias@xilinx.com> wrote:
>
> An option on real hardware when embedding a DMA engine into a peripheral
> is to make the peripheral control the engine through a custom DMA control
> (hardware) interface between the two. Software drivers in this scenario
> configure and trigger DMA operations through the controlling peripheral's
> register API (for example could writing a specific bit in a register
> propagate down to a transfer start signal on the DMA control interface).
> At the same time the status, results and interrupts for the transfer might
> still be intended to be read and catched through the DMA engine's register
> API (and signals).
>
> This patch adds a QEMU DMA control interface that can be used for
> modelling above scenario. Through this new interface a peripheral model
> embedding a DMA engine model will be able to directly initiate transfers
> through the DMA. At the same time the transfer state, result and
> completion signaling will be read and catched through the DMA engine
> model's register API and signaling.
>
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>

My review of the interface is against the patch 11 documentation;
please copy the typo etc fixes from there into the comments in this patch
where relevant.

thanks
-- PMM

