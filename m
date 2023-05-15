Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CAE702723
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:26:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyTXE-0002bd-Gf; Mon, 15 May 2023 04:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyTX4-0002bB-Bl; Mon, 15 May 2023 04:26:15 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyTX2-0006v1-Qa; Mon, 15 May 2023 04:26:14 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6439e6f5a33so7621593b3a.2; 
 Mon, 15 May 2023 01:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684139171; x=1686731171;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y7zcxw65unRR1Q681YEQOSCPwbejeFZEpIl+gW42XI0=;
 b=Clz3IzdS8zygvBQxIDS8e7msn8ljQXKFzFmgXr2e8IzyLK1wF1B82CE/Dx09aoMZ3s
 /QwKAd9NiV8UPuG3utZFISjFR7sQzXEfQW69ru5f+ZK/KX5jBuz2/Uhl+lJXOWVcikmu
 2icHfr0PhnAs9cvvhn5GYJ4UFHUwYr1pDNWbtoBQgMLAYCjrcI/Oaxpz6vxL9Nr0iVzZ
 r7m6Q2N918bs5rzF69gj+2qPwAe3APjumujl9MSJGv0fntRlb/nR1o9ImpZLkDZ0C1+q
 niKC8V1dY35M5VROP++fU2I6PyiiwsFkmP3lSlH55dHcQuhU+Dtp45vBna5k6tBwgo6b
 lZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684139171; x=1686731171;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Y7zcxw65unRR1Q681YEQOSCPwbejeFZEpIl+gW42XI0=;
 b=h6Da5mAUdsbTX+vVKpbqsHddPjBTHPQiMNCeL5OT8cg1ge5w44J+sJ165XcnIH8NSv
 mDGCWQdtVZRnHWbjT/rBdyABWF/FFkyKJnkYYXRkG7Rmyq0TbqBNKfmtxKehs47blPFZ
 tbMM/MhJSS5oG9cSpnTWr8i9hGCSVSZYoFvpJ1N+Fqovt/Ekfv3P1T6vCVqvDe88Vy6/
 uUXGI4+trmXKbjeUTWD2oOJGr72fwXx4v6Zmy3n4A+FJAC9d9UabJiK+zY8Meey6v0FK
 QSk5kHp/b9hF/2ddXYHbP1vBv8bb01sWL6c6Cg97bEKAlAs2ZDFFKDyrJN3JzncjauqG
 wQAQ==
X-Gm-Message-State: AC+VfDy2yURcM9WdigFXIdx3S7RAndhopX0ytWiEeZ770adP35rps62Z
 mYyRjuSBYzfWD1ZGW0FpQeo=
X-Google-Smtp-Source: ACHHUZ65rDHeNGgtxmITsovBRqkBajz3HEzi4yW1Bv80v8VnO8OLXGJxahpXDd+evFueqaWQExdt6A==
X-Received: by 2002:a05:6a00:248d:b0:63a:8f4c:8be1 with SMTP id
 c13-20020a056a00248d00b0063a8f4c8be1mr48830925pfv.10.1684139170802; 
 Mon, 15 May 2023 01:26:10 -0700 (PDT)
Received: from localhost ([202.168.30.146]) by smtp.gmail.com with ESMTPSA id
 e12-20020a62aa0c000000b006439b7f755bsm11585795pff.98.2023.05.15.01.26.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 01:26:09 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 May 2023 18:26:00 +1000
Message-Id: <CSMPI9KZ5TT5.GAWG3D1ZUQ3H@wheely>
Cc: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH 6/6] target/ppc: Implement HEIR SPR
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Harsh Prateek Bora" <harshpb@linux.ibm.com>
X-Mailer: aerc 0.14.0
References: <20230323022237.1807512-1-npiggin@gmail.com>
 <20230323022237.1807512-6-npiggin@gmail.com>
 <ZFoXjN/PUyDhMDG1@li-1901474c-32f3-11b2-a85c-fc5ff2c001f3.ibm.com>
In-Reply-To: <ZFoXjN/PUyDhMDG1@li-1901474c-32f3-11b2-a85c-fc5ff2c001f3.ibm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x430.google.com
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

On Tue May 9, 2023 at 7:51 PM AEST, Harsh Prateek Bora wrote:
> On Thu, Mar 23, 2023 at 12:22:37PM +1000, Nicholas Piggin wrote:
> > The hypervisor emulation assistance interrupt modifies HEIR to
> > contain the value of the instruction which caused the exception.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >  target/ppc/cpu.h         |  1 +
> >  target/ppc/cpu_init.c    | 23 +++++++++++++++++++++++
> >  target/ppc/excp_helper.c | 12 +++++++++++-
> >  3 files changed, 35 insertions(+), 1 deletion(-)
> >=20
>
> <snip>
>
> > diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> > index 2e0321ab69..d206903562 100644
> > --- a/target/ppc/excp_helper.c
> > +++ b/target/ppc/excp_helper.c
> > @@ -1614,13 +1614,23 @@ static void powerpc_excp_books(PowerPCCPU *cpu,=
 int excp)
> >      case POWERPC_EXCP_HDECR:     /* Hypervisor decrementer exception  =
       */
> >      case POWERPC_EXCP_HDSI:      /* Hypervisor data storage exception =
       */
> >      case POWERPC_EXCP_SDOOR_HV:  /* Hypervisor Doorbell interrupt     =
       */
> > -    case POWERPC_EXCP_HV_EMU:
> >      case POWERPC_EXCP_HVIRT:     /* Hypervisor virtualization         =
       */
> >          srr0 =3D SPR_HSRR0;
> >          srr1 =3D SPR_HSRR1;
> >          new_msr |=3D (target_ulong)MSR_HVB;
> >          new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> >          break;
> > +    case POWERPC_EXCP_HV_EMU:
> > +        env->spr[SPR_HEIR] =3D insn;
> > +        if (is_prefix_excp(env, insn)) {
> > +            uint32_t insn2 =3D ppc_ldl_code(env, env->nip + 4);
> > +            env->spr[SPR_HEIR] |=3D (uint64_t)insn2 << 32;
> > +        }
> > +        srr0 =3D SPR_HSRR0;
> > +        srr1 =3D SPR_HSRR1;
> > +        new_msr |=3D (target_ulong)MSR_HVB;
> > +        new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> > +        break;
>
> Since there is a common code, this could be better written like:
>     case POWERPC_EXCP_HV_EMU:
>         env->spr[SPR_HEIR] =3D insn;
>         if (is_prefix_excp(env, insn)) {
>             uint32_t insn2 =3D ppc_ldl_code(env, env->nip + 4);
>             env->spr[SPR_HEIR] |=3D (uint64_t)insn2 << 32;
>         }
> 	/* fall through below common code for EXCP_HVIRT */
>     case POWERPC_EXCP_HVIRT:     /* Hypervisor virtualization            =
    */
>         srr0 =3D SPR_HSRR0;
>         srr1 =3D SPR_HSRR1;
>         new_msr |=3D (target_ulong)MSR_HVB;
>         new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
>         break;

That would be wrong for the other HSRR fallthroughs above it.

Thanks,
Nick

