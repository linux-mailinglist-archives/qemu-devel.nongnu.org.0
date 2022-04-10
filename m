Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF2E4FACF4
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Apr 2022 10:50:57 +0200 (CEST)
Received: from localhost ([::1]:38604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndTHb-0007xz-V5
	for lists+qemu-devel@lfdr.de; Sun, 10 Apr 2022 04:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndTG0-0006vi-MF
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 04:49:16 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:33140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndTFz-0000kh-3c
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 04:49:16 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2eba37104a2so136994087b3.0
 for <qemu-devel@nongnu.org>; Sun, 10 Apr 2022 01:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5HgaylN3bXv5i5n3r84vgryFTa0e6OlQHTzQOmP6jUM=;
 b=cyWbvHRpzGkGvaMnKKYfNr/Y2UluvsYv0PwIgNCsNUjNzljy8rq6e2nQkIr5pv7tyH
 +DkmkEcBCse4yyzi3p7Iy8WhuDaAPosbUgXrNuSkwb97OsdFQuH43XaVB3iHBOmFQ698
 xCIZC9CsE9fF47AgkxlBtB9+3Ai5hLnYj+40oNP7hP1mL645b6CLJrsFOQqvTsmt8dj/
 ClExYT+NWMYGaGlCf9CqoEEgrBYY+i/zwWCmQM30NaL2BYAedikegxL9rPxbaQfSDYDE
 SCet6FXZzfalVO6X4mrTmTKN/o/u2Vqbdnn7AiQKjXhvNwiIpOc+f6ctr/wheiAmRxId
 sS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5HgaylN3bXv5i5n3r84vgryFTa0e6OlQHTzQOmP6jUM=;
 b=XcKAS96TOsf8A9gI4Z1UiJQcHT16rlzYPW7wGDPGpbOBIZlsPc2gG12Amh/7MxAQDZ
 ucNUd3RfJPQ9UPnQX9NoGRZraLk5AjvsgOcRpd0xuOCN+ehONYdUxoPME737/S6+ZmK1
 nq5O10cce4dlghlhu7YsKN39GWiO6OY4xzxREteu4paP5tbecEpw7JVIGvZlTprXi53f
 y6A/U/1dtFz10+OEoF/FwgFdrDYl5EIR8huglM0/utgrlCG5ME2w0U3jUUCqIUwfcQlD
 WiCBGNKm4HvxFvOj02dkvntXRP6s82xf1HXfstaOnDk7g/J/4b7iK8cyH+F9E4oqbQ9s
 NHog==
X-Gm-Message-State: AOAM533qw5Bghcgr+mM+fNNF0muhDV6f6otI9Gh30ywua/7dZ5TmfnbN
 RweRUmoVhPbvw3mIxVVsBjG87Em8xtUW5X7yb/8SuA==
X-Google-Smtp-Source: ABdhPJx3i7CJIpvmRWbrYsfTfv6hZr3fp0Bo7Z4fPLvQKgCcmTK2rIT6G8r1spa4y5ODSgnuy87/cibKySuIVa9WTko=
X-Received: by 2002:a81:1592:0:b0:2eb:5472:c681 with SMTP id
 140-20020a811592000000b002eb5472c681mr21814153ywv.10.1649580553712; Sun, 10
 Apr 2022 01:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-26-peter.maydell@linaro.org>
 <3a9e2d33-8174-d480-50e4-4da0985bc486@linaro.org>
In-Reply-To: <3a9e2d33-8174-d480-50e4-4da0985bc486@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 10 Apr 2022 09:49:02 +0100
Message-ID: <CAFEAcA9hU+M6gYJPO+x4Kv1T9G=XPmuJkbSYGkeZq7GiQb0wZQ@mail.gmail.com>
Subject: Re: [PATCH 25/41] hw/intc/arm_gicv3_cpuif: Support vLPIs
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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
Cc: Marc Zyngier <maz@kernel.org>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 9 Apr 2022 at 20:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 4/8/22 07:15, Peter Maydell wrote:
> > @@ -2632,6 +2735,12 @@ static void gicv3_cpuif_el_change_hook(ARMCPU *cpu, void *opaque)
> >       GICv3CPUState *cs = opaque;
> >
> >       gicv3_cpuif_update(cs);
> > +    /*
> > +     * Because vLPIs are only pending in NonSecure state,
> > +     * an EL change can change the VIRQ/VFIQ status (but
> > +     * cannot affect the maintenance interrupt state)
> > +     */
> > +    gicv3_cpuif_virt_irq_fiq_update(cs);
>
> I'm a little bit surprised this is here, and not in arm_cpu_exec_interrupt (or a
> subroutine).  Is this because if a virq has highest priority, we have to find the highest
> prio physical interrupt?

It's because if we switch from Secure to NonSecure that changes
whether there's a highest-priority-virtual-LPI available (there
never is for NS). This is a change from before vLPI support:
when there are only list registers the calculation of the highest
priority virtual interrupt doesn't care about S vs NS and thus
not about the current EL. (In other words, what
gicv3_cpuif_virt_irq_fiq_update() reports on the VIRQ/VFIQ
lines now depends on S vs NS, so needs to be recalculated.)

thanks
-- PMM

