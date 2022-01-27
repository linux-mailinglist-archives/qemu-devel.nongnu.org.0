Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 888AE49E94F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 18:53:52 +0100 (CET)
Received: from localhost ([::1]:33742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD8xz-0006Yf-Lp
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 12:53:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD8ZB-0005hd-0q
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 12:28:13 -0500
Received: from [2a00:1450:4864:20::432] (port=34376
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD8Z9-0006p2-5G
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 12:28:12 -0500
Received: by mail-wr1-x432.google.com with SMTP id f17so6147986wrx.1
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 09:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+fSacHar7SZ4gGkBtvCwJ/0a9zfTpitdIpAlFvffrD0=;
 b=Lh7cSzRTLL5Sr6DMWLIXbvq3FM8PstqNJnIv4bTAmISWwxpbf+OiHlsdVGzG63o2oj
 XFdJ0deCmT7tF4weAybplxpb5CLUbv2mti1g7g5SwFwS+ruuYQ3FND47zMOBDH0sdTTU
 Ih2wTIHhtyhUkrkASKsxctA9I1aLITl2h7fUoFhAGupzOgwwH9TdI/aLS7wHkfM+fSs8
 /BiGUhqIBJaJbU3/QUIJbAnWEagD9HG7k7QyI2LEqdpUP3hi9G63nP12htc94xqyg8aa
 s7yzkeRfU7Z319hSNHkPaD86fp9VsZRMzeu8nywxU2/X0fmuDY1OymxG6/rxY05wWgrF
 Dulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+fSacHar7SZ4gGkBtvCwJ/0a9zfTpitdIpAlFvffrD0=;
 b=pYKWU1rSFqRMiXiOeFcttm8ttVN7nqsSXcjpP6kgq/rSays8bV8kPfJKQ4mLnPzEdS
 bC5bhRKQBv/8rSvokp8waWdfSj32c10dFrK3TVdbhKcGQRgBvDciGfUJlXnJYga52cYA
 Z3claApgDjYESReqnGSfVNSm67Ibr+Lydx8w4hs3jJd1uzbUdqiDzrdzq4QfomLMZYQC
 KX/yuJLeAxHBHDbKMbPJhkO34T9krAIUSgda4YZ7WQvskax7d7y0z74PK7+VzwEOU5Ig
 As7gnD3T31Zyel4qGqeffp4Ngu8n223vX4Huxfly/zvwSp/vP4ftC3CIEm353To9O7uc
 N49g==
X-Gm-Message-State: AOAM533hTnh/VAeooPWcD4EutavYMbREsFhsysZIkOSkmAUga8sx+FhI
 Sw2488x9XbeDxPAwILVG/x4xZLd/XWOpm7ed8WXEJA==
X-Google-Smtp-Source: ABdhPJxqEPlJk/y0x/V3g6XBY/1pJwIp3Cy4/8uLkBYNfhrCyQeO9ho2SBaAKOv3QcMB9qIvgSjzQcnMEMjKJ4hKteY=
X-Received: by 2002:a5d:5343:: with SMTP id t3mr3930099wrv.521.1643304486852; 
 Thu, 27 Jan 2022 09:28:06 -0800 (PST)
MIME-Version: 1.0
References: <20220121161141.14389-1-francisco.iglesias@xilinx.com>
In-Reply-To: <20220121161141.14389-1-francisco.iglesias@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Jan 2022 17:27:55 +0000
Message-ID: <CAFEAcA8xvw3rR_bKWtiYuecKhHJeqVw_Yhy7h+Lci9behw394Q@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] Xilinx Versal's PMC SLCR and OSPI support
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, luc@lmichel.fr, frasse.iglesias@gmail.com,
 alistair@alistair23.me, qemu-devel@nongnu.org, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 21 Jan 2022 at 16:11, Francisco Iglesias
<francisco.iglesias@xilinx.com> wrote:
>
> Hi,
>
> This series attempts to add support for Xilinx Versal's PMC SLCR
> (system-level control registers) and OSPI flash memory controller to
> Xilinx Versal virt machine.
>
> The series start with adding a model of Versal's PMC SLCR and connecting
> the model to the Versal virt machine. The series then adds a couple of
> headers into the xlnx_csu_dma.h needed for building and reusing it later
> with the OSPI. The series thereafter introduces a DMA control interface
> and implements the interface in the xlnx_csu_dma for being able to reuse
> and control the DMA with the OSPI controller. Thereafter a model of
> Versal's OSPI controller is added and connected to the Versal virt
> machine. The series then ends with adding initial support for the Micron
> Xccelera mt35xu01g flash and flashes of this type are connected to the
> OSPI in the Versal virt machine.


Applied to target-arm.next, thanks. (I fixed the indent issue
Luc noticed in patch 6.)

-- PMM

