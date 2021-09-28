Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C3B41ABC0
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 11:26:22 +0200 (CEST)
Received: from localhost ([::1]:43510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV9NV-0002Sa-00
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 05:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mV9Ic-0007Jm-UH
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 05:21:18 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mV9Ia-0003Hk-AT
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 05:21:17 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t8so56916649wri.1
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 02:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r722AGBwSLzBCEUD+xAwVIZfxxIwuunXYPbgI0VJdcM=;
 b=PV9Yb2dtNC4DL992O46Q8DvG431JWzyRyky5s2iwxBFGmerwtMv7IsyjAEcDQrQ5jX
 Nu7IfSdCXvlISuLxX7wDgpDNvkqEmr/GoDP888+YrPu4sPfWc82mXTWOn0NmaaYOtGjy
 epDBz3GD8tqhSMgOt3utXj4j71oNliXajsfQM01z/kR7Rb+onHZsZDLrkahlH1tmRw+k
 p4aEveY/05s7E9JUDBKZGLKtwkX/wmaRaJ2LnRXWQQhaGSEaQg8s9VWUMPa3auMFvUOG
 Fe+a0z4j190Y6zrNQQRWg7Q9eOkWCJ7SS8uHosi3sPywUxYb2scluAtb4pBoLDvH8COX
 HMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r722AGBwSLzBCEUD+xAwVIZfxxIwuunXYPbgI0VJdcM=;
 b=LXE2Ct1U06Yzxic4ea814b+i1yejj1KEYgejCUU5Xkj7UjH8hHHsh8PKIHVoCQK7Rt
 Nn/ik6H7vE/iWFsbeSZqpl6maWXbG8EjnabthwUHGozzsV5NAKIcGFVBy8TyDaL88Yxj
 g/v+wk4v4eGuSHzwHTNRU3r8mcFP7U56UvZI2gj/21V1Dv4AxDzD6YctzQ6U/WN81LgZ
 wRYoqg5UnbzNL8U3dRArf/l02B6I1MBo7QcMjWRH6ESp29ugJKoAiRVeCNq+PdjbIuF6
 miZajgjUU2uh7cMGWPRFVwmdX4lC5LmzG/ThRkqlXejYRdJo8RIBi1BTOylQZ8Qr8dPR
 zfpw==
X-Gm-Message-State: AOAM5331Lgqgq4HP0ZvAEZjyrL2tkSOgucFOv7N5HRheBDWI9kxwhjNJ
 y6+a4aftw8PZfxET44hSAAhJVomxjG33XlQbGo2BIQ==
X-Google-Smtp-Source: ABdhPJyMBHJ7hynVQTCsqNdIDd213WpGbRzHfqEMNrGwkMT3UdZYEkEw/gkU1kxdQTAFYsm4OtCrNXISITGJs/O/Y1g=
X-Received: by 2002:adf:f185:: with SMTP id h5mr5313069wro.302.1632820874429; 
 Tue, 28 Sep 2021 02:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210926183410.256484-1-sjg@chromium.org>
 <CAFEAcA8S2=7rOKxeqcW+kw0BVPO3PUJGSUH-ioN7=c=U7zQxvg@mail.gmail.com>
 <CAPnjgZ2NCRVxKULWR1JjZU+D9saJ7fbZ=yHmWTSr3ufHxLYg-g@mail.gmail.com>
 <CAFEAcA9n+2JDFv8BezeEMA4e2Zhr0ENAvzLjBS6YXRoW9P-JXQ@mail.gmail.com>
 <CAPnjgZ1AO8575LYbwmuouNR5=dgNam6EFDC1_bai=8xAHdw7-Q@mail.gmail.com>
 <CAFEAcA8FsPcBELEZxiRMuFbKtmKTFgDHABePQ33hdxYRq0C0ig@mail.gmail.com>
 <CAPnjgZ2S7SXxHYd_bkcf+GcmmgEew3vpJkw+DRPqrpb44eLgcA@mail.gmail.com>
 <CAFEAcA-bk6PF_P3JOxQSCXo7Fh2K5AVygB9WwDUiK2fV9Fx5jw@mail.gmail.com>
 <CAPnjgZ26gQVpzL6fYsGzDf=c+z4aG5SPkBf7yoDC9+ynxQi_9Q@mail.gmail.com>
In-Reply-To: <CAPnjgZ26gQVpzL6fYsGzDf=c+z4aG5SPkBf7yoDC9+ynxQi_9Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Sep 2021 10:20:20 +0100
Message-ID: <CAFEAcA_QNcAHtdxUPLpmyzMYgb9YzhcE0-zyh=N8rqm4vOcGZA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Allow additions to the generated device tree
To: Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 27 Sept 2021 at 21:12, Simon Glass <sjg@chromium.org> wrote:
> I think you are misunderstanding my patch and that may be the problem here.
>
> Where QEMU is provided with a dtb (-dtb) it uses that and passes it
> on. This is absolutely fine and I have tested that this works well
> with U-Boot. No issues.
>
> Where QEMU creates its own dtb on the fly the -dtb parameter is
> actually ignored and there is no way to adjust what QEMU passes on,
> without recompiling QEMU. It is quite inflexible, actually. Even just
> creating a new device for development purposes is not possible. That
> is the problem I am trying to solve.
>
> There is certainly no intent to combine two bits of dtb with my patch.
> We could easily do that externally to QEMU.

So what *is* this patch doing? The subject says "Allow additions to
the generated device tree", and the patch adds an option to
"Merge a device tree binary (dtb) file into the generated device tree".
That sounds exactly like "combine two bits of dtb" -- the one the
user provides to the -dtbi option and the one QEMU generates
internally.

> The only current working option is to just pass the U-Boot dtb through
> and not use QEMU's on-the-fly-generated dtb at all. But I am assuming
> there is a reason why QEMU generates that dtb, so that would not be
> desirable?

QEMU generates the dtb to tell the guest what hardware is
present and where it is. We don't guarantee that that hardware
arrangement is necessarily stable between QEMU versions (in
practice there are generally additions and not deletions or
moves, but in theory there might be). All the guest is supposed
to assume is the location of RAM and flash; everything else it
must look in the dtb to determine.

> One more question...other than dtb, does QEMU typically add support
> for data structures needed by particular projects or groups of
> projects? It looks like dtb was supported for ARM Linux originally? I
> am looking at supporting bloblist as a way of communicating
> information between firmware (basically a simple way of packaging
> multiple blobs).

The answer here is essentially "no, as far as possible". We
ideally would not have special case support for any particular
guest code. We do have special handling for "directly boot the
Linux kernel" for a combination of historical reasons (we've
always supported it) and it being a massive use case. But even
that is painful to maintain (it starts off seeming easy but
gradually requires more weird tweaks and handling as CPU
architectures evolve). I really strongly don't want to add
additional categories of guests that QEMU has special case
support for, which is the main driver behind why I'm so negative
about this patchset.

Guest software running on the "virt" board needs to know it is
running on the "virt" board and deal with the interface and
information that QEMU provides. (For instance, Arm Trusted
Firmware and UEFI both have done this.)

-- PMM

