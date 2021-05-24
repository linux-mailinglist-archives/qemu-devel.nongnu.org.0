Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1131138F163
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 18:21:58 +0200 (CEST)
Received: from localhost ([::1]:54500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llDL0-0007vd-Fp
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 12:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llDIl-0006fp-7x
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:19:35 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:39864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llDIe-0005Ly-S1
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:19:34 -0400
Received: by mail-ej1-x631.google.com with SMTP id l1so42686222ejb.6
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4P2N433ux4DzJVB+wBRX3ObiQYOJR1BrRY+gMDmtSjg=;
 b=caj+QNcq8IpjRlMNjFLoq//zFaLB5AvfTjmiGD4CILRI1LCbp/HowCoz6I6xso4T4x
 OdkJu2riQ8GNfm+q09v2H1+YsxrVnMsKfOyc7ZekvvfTzJy62GpkzfQAzbmwylua/ypC
 ggklIwQ1nf7yimlitbk5313ovpT19fJSKzD3tT7xKVCxOWzOM4DuufVrSbZ+R8Imf/Rd
 5Vo0XiziBwY3ojGlBXG7UTeEZiUUhEx7z05Gv5VPHIFWvgmaDJVshie5GQ4CwzD6lv84
 vVRSUGZAPiT9Iarvan+e6nfmaLrp8X90q7QPNTFHHVJv6wgN2EOzb96+ixms/urXFXNZ
 /ryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4P2N433ux4DzJVB+wBRX3ObiQYOJR1BrRY+gMDmtSjg=;
 b=XlvVu3gaQ7ieg7F5cXfR1HKttDaDwkx27DYimZdJMpn2sSZulPH7DsHJm7Eh7tmsoz
 5KCEQ4SsSVGhIq/8c4X+dU8ZPQO1ctSOT4RCgv+3JpjH7Gc0w4XydF32gJZG4Ys/lJeR
 xJV1rcYTrQ0o22ClKsUTxw8lKr5MbNUSlq1AQhLN1b9h8sI5RRLAbeMI6DeQpJZkb/cz
 fvCiK9uGaPX//xKNbR/LFo24QKLgAZ8NupE3Xro/TB4m5fNrUh3b06bR76Z0ozzu2qgC
 RzNWCD2PHLVj1Icii7CcMFAQLKyCfXcJLmNFSGEXszv8keSDBUXDKMDI++uNE0XdftNi
 xM2A==
X-Gm-Message-State: AOAM532uXWdEUBjt5pXXRPdJ4+L8VLhi9B6JPDaqueJmQ8FKEODIq/y7
 uQTdWGPEkpAz+veDEqMgJk0VPGt8y8SuE6a89EvOKA==
X-Google-Smtp-Source: ABdhPJyLh16TM6rTIjze6P+3PBKGgQHbjbk6reKqDqzxL3b8z00u6StzwyGnDywYEBmKvfBNtNlKEA1+EkqI9trr/fI=
X-Received: by 2002:a17:906:9bd6:: with SMTP id
 de22mr23721342ejc.382.1621873167196; 
 Mon, 24 May 2021 09:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210510150016.24910-1-peter.maydell@linaro.org>
 <87fsyc3yhl.fsf@linaro.org>
In-Reply-To: <87fsyc3yhl.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 May 2021 17:19:04 +0100
Message-ID: <CAFEAcA-SupJcEc0c70_XU-mAcPZsJk4V05L17x+KRC-3_ViGHw@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3_cpuif: Fix EOIR write access check logic
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Chan Kim <ckim@etri.re.kr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 24 May 2021 at 17:09, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > In icc_eoir_write() we assume that we can identify the group of the
> > IRQ being completed based purely on which register is being written
> > to and the current CPU state, and that "CPU state matches group
> > indicated by register" is the only necessary access check.
> >
> > This isn't correct: if the CPU is not in Secure state then EOIR1 will
> > only complete Group 1 NS IRQs, but if the CPU is in EL3 it can
> > complete both Group 1 S and Group 1 NS IRQs.  (The pseudocode
> > ICC_EOIR1_EL1 makes this clear.) We were also missing the logic to
> > prevent EOIR0 writes completing G0 IRQs when they should not.
> >
> > Rearrange the logic to first identify the group of the current
> > highest priority interrupt and then look at whether we should
> > complete it or ignore the access based on which register was accessed
> > and the state of the CPU.  The resulting behavioural change is:
> >  * EL3 can now complete G1NS interrupts
> >  * G0 interrupt completion is now ignored if the GIC
> >    and the CPU have the security extension enabled and
> >    the CPU is not secure
> >
> > Reported-by: Chan Kim <ckim@etri.re.kr>
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  hw/intc/arm_gicv3_cpuif.c | 48 ++++++++++++++++++++++++++-------------
> >  1 file changed, 32 insertions(+), 16 deletions(-)
> >
> > diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> > index 43ef1d7a840..81f94c7f4ad 100644
> > --- a/hw/intc/arm_gicv3_cpuif.c
> > +++ b/hw/intc/arm_gicv3_cpuif.c
> > @@ -1307,27 +1307,16 @@ static void icc_eoir_write(CPUARMState *env, co=
nst ARMCPRegInfo *ri,
> >      GICv3CPUState *cs =3D icc_cs_from_env(env);
> >      int irq =3D value & 0xffffff;
>
> Un-related but the docs do say that:
>
>   This field has either 16 or 24 bits implemented. The number of
>   implemented bits can be found in ICC_CTLR_EL1.IDbits and
>   ICC_CTLR_EL3.IDbits. If only 16 bits are implemented, bits [23:16] of
>   this register are RES0

Yeah, this is one of those implementation-choice areas: you can
implement either 16 or 24 bits. QEMU chooses 24 bits and
correspondingly we set the ICC_CTLR_ELx.IDbits field to 1
in icc_reset().

> From my reading of the spec it looks OK to me:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

thanks
-- PMM

