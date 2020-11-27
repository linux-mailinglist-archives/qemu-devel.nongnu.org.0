Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9F62C6982
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 17:39:58 +0100 (CET)
Received: from localhost ([::1]:45368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kigmr-00081q-J5
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 11:39:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiglV-0007aX-Tg
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 11:38:33 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:41523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiglT-0003eT-Qb
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 11:38:33 -0500
Received: by mail-ej1-x643.google.com with SMTP id gj5so8393095ejb.8
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 08:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mec+EpP8dZ2HYaKjkv/33Lf7ok9Y+EdneErZfgItds4=;
 b=TR7siPuTTzgaOqqQZoz0skj3X4gpzNUIGEzz6YTUFpOwWEuC/txky1daHO4B3sZw+0
 yoI2+c9lSBfj2lvNri3d9DIxkvzHI3njSBn7NammA0MIDH6qoBy6o0fdPWGMtxiGT12R
 Ah9eoH6GEQ82wq+W2FoVTCBgd0uA1bEkQTr1RR0GrlrzCH4jAgMmyQwpnrGdWr3T0HD8
 HDyToeLi2JkCEWZ31K2YtUr1ZMhNySaR49+1CtUHDPnQcAcsEiMkL/DMRCSSFO+y69ta
 /cToAmwBK0OTePDOEXJNZL4pNDKwRpJwxNFuJom/mBBL8RgSUp+DhQadscnnu0RyoJOW
 SAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mec+EpP8dZ2HYaKjkv/33Lf7ok9Y+EdneErZfgItds4=;
 b=czLDclgHW8ved6z3wAXCiuSuIst4fLHYgUwRXM0uEmCTT91qCSBYx1GAb2t7Uc/fTZ
 +QYt7G7ZWtl1U/M60xC9Y9/6HfC8A2j13a29VpSHCPpammT8uFiodgVBY9xFaXtZKNAc
 RKUTLbm5bSzqPLNHimDcZyzTjdZqDqf7OT+YH3IX8IS15HpQrjHF/uwpEH0J9h0/RY6L
 tbFyLv1ieAbikDCHXUTYBeRBZyavIxGsurzIa+nKI9nriORenf49j80RmUE0ukNxjmjw
 BYMbrLw2tDcDHRbs/YWVkw7Ife5/2ahGRXh31Bf2A91YdpT3wJKtvfAfWC1/cYO2aD/X
 Pu5g==
X-Gm-Message-State: AOAM533kltZLiyKU5AI0FGt4p8fzai95xAiitBEb/9hFq3rYxS2LRtjx
 jRAmwwhTxFd5KDL3gn+fj9LpG7ZODxbU9M+imfFAVA==
X-Google-Smtp-Source: ABdhPJzpw17Z5jVcFK7PJLgNACRJDA0MiUqLUEF+tXIO2Zhn1O5rsfjWSpMbVNr5zYgp63OWPvtO2FrTBz2vP2iD0aA=
X-Received: by 2002:a17:906:d8a9:: with SMTP id
 qc9mr8590198ejb.482.1606495109814; 
 Fri, 27 Nov 2020 08:38:29 -0800 (PST)
MIME-Version: 1.0
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-9-agraf@csgraf.de>
 <20201126221405.GT2271382@habkost.net>
 <CAFEAcA_Nc0Jp-3PPigt1YdqHfNhGToovCOO16DOPPC9Bt663qg@mail.gmail.com>
 <20201127162633.GY2271382@habkost.net>
In-Reply-To: <20201127162633.GY2271382@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Nov 2020 16:38:18 +0000
Message-ID: <CAFEAcA-NvSUUJ1GpYP2tCgjD-RNL5rO7P2H63xHmGS7x6ggDBQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] hw/arm/virt: Disable highmem when on
 hypervisor.framework
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 Nov 2020 at 16:26, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> On Thu, Nov 26, 2020 at 10:29:01PM +0000, Peter Maydell wrote:
> > On Thu, 26 Nov 2020 at 22:14, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > > Direct checks for *_enabled() are a pain to clean up later when
> > > we add support to new accelerators.  Can't this be implemented as
> > > (e.g.) a AccelClass::max_physical_address_bits field?
> >
> > It's a property of the CPU (eg our emulated TCG CPUs may have
> > varying supported numbers of physical address bits). So the
> > virt board ought to look at the CPU, and the CPU should be
> > set up with the right information for all of KVM, TCG, HVF
> > (either a specific max_phys_addr_bits value or just ensure
> > its ID_AA64MMFR0_EL1.PARange is right, not sure which would
> > be easier/nicer).
>
> Agreed.
>
> My suggestion would still apply to the CPU code that will pick
> the address size; ideally, accel-specific behaviour should be
> represented as meaningful fields in AccelClass (either data or
> virtual methods) instead of direct *_enabled() checks.

Having looked a bit more closely at some of the relevant target/arm
code, I think the best approach is going to be that in virt.c
we just check the PARange ID register field (probably via
a convenience function that does the conversion of that to
a nice number-of-bits return value; we might even have one
already). KVM and TCG both already set that ID register field
in the CPU struct correctly in their existing
implicitly-accelerator-specific code; HVF needs to do the same.

thanks
-- PMM

