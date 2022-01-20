Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0918E4956FE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 00:32:36 +0100 (CET)
Received: from localhost ([::1]:59892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAguw-0007KG-P6
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 18:32:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAepz-0006wr-JP
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 16:19:19 -0500
Received: from [2a00:1450:4864:20::32c] (port=41903
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAepy-0008Uo-12
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 16:19:19 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so17043974wme.0
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 13:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=59NfSksLuLrDcDCIsRFXiaXywOm6VQPjtBjuo/eUjzc=;
 b=jy/CyZEZgprVsT46ULx1ytjJWRrLAye42QeAz9IwEGmpAdrHbL4IfydB/TIJzN99yo
 +rUXG61/yM1A7WRtsF/Zj/YCjNRiQ69sd2Rt+TPjCZwhaoy9G9uqAIdzr5ChGrJuyCvk
 EfbZTr7M/WV+RgNhqXKcKUiKgjqrzKDwuJtuGOV4z1OmKkjGmi8G930YHfOgnY+6HCV4
 jAQy+qtMSPET5yyqmKgimoYIkAeKEhR5GwwnMglZeCRtkmlyr8MUN6oSapEY/MTiGmEz
 cLk43YgV5HSG4VmGwzOtofc4oBplRLu4OeLJ+eJm54VDQa8FTyY1fLIEExtP1R27cbRM
 9EPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=59NfSksLuLrDcDCIsRFXiaXywOm6VQPjtBjuo/eUjzc=;
 b=x2EHN19gt8xLt8gk4A6px+D6PuMjUis76A+QykCCD/uEIZpxvxXB4osJptuTxg9ZbP
 bOYW5eop/Evhlek1VC9tjxRwZPbZmFozxjfJARoWXF6Wd7BNrW5j6fdOfhujjzgTqtik
 Xcna9nwhIc9k2moJUvowhFehJgBzHdLNWw7mb1vWBm9IJ76CAiHv0//7lcNkrnuFASMl
 JYKamcA4N7Swsy/IMGI6RikahzUOwjVCZ8VnYpzZjZU7UxgeVGZefB0DcZW7Ym1KWYeM
 YxaWKDF83s+QPiUn6yaRIRC4gf5vqVkKWAZY2uROUqDdibtRWeU64YHNYx6cK8o36k0Y
 VNyQ==
X-Gm-Message-State: AOAM532rydNc0+Kfx7wsa2uRfiIBEjWH/148gle2tjfK636JXoZ/J30w
 X8WZ19dQ26JU+IgbJD2ZXD9XHAOqmBtwzqYlRngNAL6fR6U=
X-Google-Smtp-Source: ABdhPJwbcLVguhR1WaDZA16hZJRsIAs0hOPfAXmOsJSfus/vLnm2O7dx7tgOZSd7xvEwruDSOz693IugKeCVoLY7Cx0=
X-Received: by 2002:a05:600c:4f51:: with SMTP id
 m17mr734425wmq.32.1642713556546; 
 Thu, 20 Jan 2022 13:19:16 -0800 (PST)
MIME-Version: 1.0
References: <20220120161252.452657-1-peter.maydell@linaro.org>
 <CAFEAcA8K1qhLUGR9JDuTjKxUr458n-0Mb+z0nO_hbTugqzBp9g@mail.gmail.com>
In-Reply-To: <CAFEAcA8K1qhLUGR9JDuTjKxUr458n-0Mb+z0nO_hbTugqzBp9g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jan 2022 21:19:05 +0000
Message-ID: <CAFEAcA-4WufRfmC56BGDXKyT3Y+dUY0M5RAnaHQz3e2+wAt4Hg@mail.gmail.com>
Subject: Re: [PULL v2 00/38] target-arm queue
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 Jan 2022 at 21:18, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 20 Jan 2022 at 16:12, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > v1->v2: fix up format string issues in aspeed_i3c.c
> >
> > -- PMM
> >
> > The following changes since commit b10d00d8811fa4eed4862963273d7353ce310c82:
> >
> >   Merge remote-tracking branch 'remotes/kraxel/tags/seabios-20220118-pull-request' into staging (2022-01-19 18:46:28 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220120-1
> >
> > for you to fetch changes up to b9d383ab797f54ae5fa8746117770709921dc529:
> >
> >   hw/intc/arm_gicv3: Check for !MEMTX_OK instead of MEMTX_ERROR (2022-01-20 16:04:58 +0000)
> >
> > ----------------------------------------------------------------
> > target-arm:
> >  * hw/intc/arm_gicv3_its: Fix various minor bugs
> >  * hw/arm/aspeed: Add the i3c device to the AST2600 SoC
> >  * hw/arm: kudo: add lm75s behind bus 1 switch at 75
> >  * hw/arm/virt: Fix support for running guests on hosts
> >    with restricted IPA ranges
> >  * hw/intc/arm_gic: Allow reset of the running priority
> >  * hw/intc/arm_gic: Implement read of GICC_IIDR
> >  * hw/arm/virt: Support for virtio-mem-pci
> >  * hw/arm/virt: Support CPU cluster on ARM virt machine
> >  * docs/can: convert to restructuredText
> >  * hw/net: Move MV88W8618 network device out of hw/arm/ directory
> >  * hw/arm/virt: KVM: Enable PAuth when supported by the host
> >
>
>
>
> Applied to target-arm.next, thanks.

Wrong canned reply :-)

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

