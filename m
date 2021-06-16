Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E113A9BB6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 15:08:56 +0200 (CEST)
Received: from localhost ([::1]:59720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltVHr-0005Rz-Cd
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 09:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltVFk-0001zy-5M
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:06:44 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:40779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltVFh-00023j-Vt
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:06:43 -0400
Received: by mail-ed1-x52a.google.com with SMTP id t3so2590456edc.7
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 06:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GckLGgeIWFNctmaZ7afnrge0FKqJGaFDfwTKAbgMVu0=;
 b=ZFGwIDYpqc+2oOpKy5mEAhKky5yEW5ts/Q8Gzq5UbErYeEGOxHe30QGuf+HchTSpN3
 VaIxWzR2/z+UHX7/+gx9MSwc+AMl79iaxxo+5c6G2Q50D3iOjxHJBnS+iCZTK+dKePdA
 v9oKQtXkSOp4TPaTiSxl9UkDG0CLaklN/JKVf/8urvhVhL+iYpSWUwD/ITopym+ACWmo
 TynYhpAntz3AmPUmJbI9kDnSCicQ5H+xzK2F9LayfrPhTvRGiGMYk9+FndHLD4xcvAV/
 TTboucBh71EXkQTtohbcrSlmwFTnC8xOPF8lG+At5L1IRAyMKUfvluvzzxH6iDAOA2gf
 7tMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GckLGgeIWFNctmaZ7afnrge0FKqJGaFDfwTKAbgMVu0=;
 b=NFy/xOTg+yNGzjyW5KEs/c0D8clKSlUrsmkbQHTnqjd0wtzOTQW9uPpwEREOhbeY+M
 VJyurf2a2MHUcD75IIWIhR7CMMnPb0hlZgB+ckAY6dKReXLcejbIRHrt5g8+5/FrMBC4
 azBGjBTjGZI7jgriPyITdKqR20ChFhi59wCwFC+WWYXUuQmPdxLPoaQjDbXEs1DdU3dJ
 fCkovRG1YwTnDzQH1/1lLiXUqmF4idB3jsXnhFAlXeFdNRaWvVpcdR+wDmEHKV3Ispf+
 LOPZEiO0k+9HQUAOp1Fcp1GpojxM2DhIYBQoKSxzyNAVg3ch6SMtiMCIYwxKTuzXLYPC
 5mcw==
X-Gm-Message-State: AOAM5335YKPCnqBFblKaAfZvM9x4W+2biraF4xpOOgTHq2enNwBjuiSS
 A+bQT2JLrEXU8uMf+QlkQ2X3VSkAGM4XaGHbMreoHQ==
X-Google-Smtp-Source: ABdhPJx1jXZb7eMuUpVLtg26kVcob04ApzzJfLzRa7xhza7+YWNi5pUvrdgbmpykWDaAIILdChmKojVeeSZtHw/OoXI=
X-Received: by 2002:a05:6402:3482:: with SMTP id
 v2mr4035308edc.44.1623848799735; 
 Wed, 16 Jun 2021 06:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <BCB8773B-FC54-4C25-9B60-92C263165D38@gmail.com>
 <CAFEAcA-YuyZ9kyivh1dL_chxrtvBF=jOf3L59JuroL2U-e+Xsg@mail.gmail.com>
 <1ee4b7cf-d445-6497-705f-510009fc74f8@ilande.co.uk>
 <874ke4iqf8.fsf@linaro.org>
 <3D29C466-BB81-4BCA-96E9-A46721B1ED59@gmail.com>
 <d9109542-dd68-3e8b-4f53-a09576e16b1f@redhat.com>
 <87sg1ogsvj.fsf@linaro.org>
 <f81315ce-6cf5-c0c4-5b48-9188e3dcd71a@ilande.co.uk>
 <878s3cjyvl.fsf@linaro.org> <4006E151-B420-4925-A6C9-CD036EE559F2@gmail.com>
 <9d0b277d-415f-0f4e-3f09-03445f89848f@linaro.org>
 <e809eeed-c635-c48c-c6b6-9c2d5718b60d@ilande.co.uk>
 <874kdygedv.fsf@linaro.org>
In-Reply-To: <874kdygedv.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Jun 2021 14:06:04 +0100
Message-ID: <CAFEAcA-PafgiZWOi3TvM1VRpfKVRn+L-7bu037nLocSsXNtEzQ@mail.gmail.com>
Subject: Re: tb_flush() calls causing long Windows XP boot times
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: incoming+qemu-project-qemu-11167699-3xhw7c0pviow7og92yv73e0tr-issue-404@incoming.gitlab.com,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU devel list <qemu-devel@nongnu.org>,
 Programmingkid <programmingkidx@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Jun 2021 at 13:53, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:
> > diff --git a/exec.c b/exec.c
> > index 67e520d18e..7f4074f95e 100644
> > --- a/exec.c
> > +++ b/exec.c
> > @@ -1019,14 +1019,13 @@ void tb_invalidate_phys_addr(AddressSpace *as,
> > hwaddr addr, MemTxAttrs attrs)
> >
> >  static void breakpoint_invalidate(CPUState *cpu, target_ulong pc)
> >  {
> > -    MemTxAttrs attrs;
> > -    hwaddr phys =3D cpu_get_phys_page_attrs_debug(cpu, pc, &attrs);
> > -    int asidx =3D cpu_asidx_from_attrs(cpu, attrs);
> > -    if (phys !=3D -1) {
> > -        /* Locks grabbed by tb_invalidate_phys_addr */
> > -        tb_invalidate_phys_addr(cpu->cpu_ases[asidx].as,
> > -                                phys | (pc & ~TARGET_PAGE_MASK), attrs=
);
> > -    }
> > +    /*
> > +     * There may not be a virtual to physical translation for the pc
> > +     * right now, but there may exist cached TB for this pc.
> > +     * Flush the whole TB cache to force re-translation of such TBs.
> > +     * This is heavyweight, but we're debugging anyway.
> > +     */
> > +    tb_flush(cpu);
> >  }
> >  #endif
> >
> >
> > Unfortunately my x86-fu isn't really enough to understand what the
> > solution should be in this case.
>
> It's not really an x86 issue here but that we don't have any easy way of
> finding the subset of TranslationBlock's that might be affected. We can
> only query the QHT for a head address + flags. Meanwhile when there is
> an active mapping we go through the page tables

Could we do something where we zap the TBs here where there is an active
virtual-to-physical mapping for this PC, and also make a record of affected
PCs (or PC ranges) so that before we add a new entry to the
virtual-to-physical mapping we check the record to see if we actually need
to flush this TB? I think if you flush all the TLBs at this point then
you can do the "check before adding new entry" part in
tlb_set_page_with_attrs(),
but I'm not super familiar with the execution flow of TCG so that might be
wrong. Also there needs to be a point where we can discard entries from
our "dump this TB for this PC" records so they don't just grow indefinitely=
,
and I'm not sure what that would be.

thanks
-- PMM

