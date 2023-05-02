Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5086F4642
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 16:40:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptrAs-0003lm-Su; Tue, 02 May 2023 10:40:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1ptrAk-0003l0-Oa; Tue, 02 May 2023 10:40:07 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1ptrAi-0000XF-Ss; Tue, 02 May 2023 10:40:06 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-64115e652eeso35151869b3a.0; 
 Tue, 02 May 2023 07:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683038403; x=1685630403;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zrJjipQIFalPM1K2Fwlb+PTSDU459X7wDPDB86lCw8c=;
 b=ny9sIdqxDVu07dFv6uykHF020baieuez17o+CvgntdKYtyO7keMqSjE2Va8DPxiRxo
 m1PilBjmvNtA20xFYQVh/Q8ZW2HkXzisEa29k2+CsyZAgymU/XbDEqGg3YsbmkhPEKJ1
 G7s7FuX6sx0UBOba1I5/5vOU4h639pq40YYGKSOAig4GKbQtS/nLHzfVK6Fe1x6xOFzC
 FipUuu9UdhXoMbLoeoTI6dV9Di3kmp0PVjw/YZgzimnZMYdqkFL0bm4JIs0tfUKlwRwi
 RRuejUC3obxLXhN+Oyd55BCVjy2vj5seIM5LT1rLU3lqwEcG8l+Ex5sg0l2l1RX4Zs/W
 yfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683038403; x=1685630403;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zrJjipQIFalPM1K2Fwlb+PTSDU459X7wDPDB86lCw8c=;
 b=TeUQnk6Ui0y9BvE8ChNAaUQ3GkJfGIFAZrinApigIZG2wOowaCnNSwGz4t8z+zkbyh
 xMwWybrzcvfqjPFvbNgtcQcPfPtPt8RTaKKWCqo/bKxy0KvF2dP9YI8mWP1BynPRHDwt
 M+w3Ct1hcggZZSATrV3CmRpTzL4f4+NndDs6gtXIgwiCsPuWu31ma12+qC1BmsJx/6eE
 JMYgAfHmwguEQd6VfdHuJ1Byl5iernv4McNvU/1wU7SmsDwRnkBwG4FDZIr7ZXFUF60v
 KDk4MY4dAaRrzdKh120MCGJt8OjlLq6+r2VP/fBGN7G6/a/+xYrZYqEsoUv1evjlI8u/
 Noeg==
X-Gm-Message-State: AC+VfDxf+FKW9NosQArVHTSXvLsUzdgyEo7xyGvQQXgOpXdZVc+jjXoI
 R6CaC55eIDdiSz+cDIRhr7zcaKzTRtvyLQ==
X-Google-Smtp-Source: ACHHUZ6xWB+RiAJhZSIYU2h80rmU+Wlm+eLj35DXy0oVOAd6FKmj1+UFMB7USoWxBaACj6ia5XMtTA==
X-Received: by 2002:a05:6a00:c8e:b0:63b:8da4:352e with SMTP id
 a14-20020a056a000c8e00b0063b8da4352emr32294692pfv.1.1683038402747; 
 Tue, 02 May 2023 07:40:02 -0700 (PDT)
Received: from localhost (118-208-214-188.tpgi.com.au. [118.208.214.188])
 by smtp.gmail.com with ESMTPSA id
 o70-20020a62cd49000000b0062dcf5c01f9sm21877812pfg.36.2023.05.02.07.39.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 07:40:02 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 May 2023 00:39:57 +1000
Message-Id: <CSBVBHXUFNTB.V3R66Q201OGP@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Harsh Prateek Bora" <harshpb@linux.ibm.com>, <qemu-ppc@nongnu.org>
Cc: <qemu-devel@nongnu.org>, <farosas@suse.de>, <danielhb413@gmail.com>
Subject: Re: [PATCH v2 1/4] ppc: spapr: cleanup cr get/store in
 [h_enter|spapr_exit]_nested with helpers.
X-Mailer: aerc 0.14.0
References: <20230424144712.1985425-1-harshpb@linux.ibm.com>
 <20230424144712.1985425-2-harshpb@linux.ibm.com>
 <CSBII1VGPEQB.3Q8OP9FELWTC3@wheely>
 <f4810103-78ce-eb5b-4d43-b9268b9aa745@linux.ibm.com>
In-Reply-To: <f4810103-78ce-eb5b-4d43-b9268b9aa745@linux.ibm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue May 2, 2023 at 3:00 PM AEST, Harsh Prateek Bora wrote:
>
>
> On 5/2/23 10:07, Nicholas Piggin wrote:
> > On Tue Apr 25, 2023 at 12:47 AM AEST, Harsh Prateek Bora wrote:
> >> The bits in cr reg are grouped into eight 4-bit fields represented
> >> by env->crf[8] and the related calculations should be abstracted to
> >> keep the calling routines simpler to read. This is a step towards
> >> cleaning up the [h_enter|spapr_exit]_nested calls for better readabili=
ty.
> >>
> >> Signed-off-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
> >> Reviewed-by: Fabiano Rosas <farosas@suse.de>
> >> ---
> >>   hw/ppc/spapr_hcall.c | 18 ++----------------
> >=20
> > Could you either convert all callers, or do implementation and
> > conversion as separate patches. Preference for former if you can
> > be bothered.
> >=20
> > save_user_regs(), restore_user_regs(), gdb read/write register * 2,
> > kvm_arch_get/put_registers, monitor_get_ccr, at a quick glance.
>
> Sure, I can include other consumers as well in the patches.
> I usually prefer separate patches for implementation/conversion but=20
> since the implementation is a small change, I hope either approach is fin=
e.

Yeah one patch would be fine.

>
> >=20
> >>   target/ppc/cpu.c     | 17 +++++++++++++++++
> >>   target/ppc/cpu.h     |  2 ++
> >>   3 files changed, 21 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> >> index ec4def62f8..124cee5e53 100644
> >> --- a/hw/ppc/spapr_hcall.c
> >> +++ b/hw/ppc/spapr_hcall.c
> >=20
> > [snip]
> >=20
> >> diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
> >> index 1a97b41c6b..3b444e58b5 100644
> >> --- a/target/ppc/cpu.c
> >> +++ b/target/ppc/cpu.c
> >> @@ -67,6 +67,23 @@ uint32_t ppc_get_vscr(CPUPPCState *env)
> >>       return env->vscr | (sat << VSCR_SAT);
> >>   }
> >>  =20
> >> +void ppc_store_cr(CPUPPCState *env, uint64_t cr)
> >=20
> > Set is normal counterpart to get. Or load and store, but
> > I think set and get is probably better.
> >=20
> Sure, make sense.

I did say that before realising the other functions there use as
much varied and inconsistent terminology as possible, sigh.

I *think* ppc_get|set_reg() is the best naming. store is used a lot but
it means something else too, so set is better. But if you have strong
feelings another way I don't mind.

Thanks,
Nick

