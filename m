Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BBB6F3F61
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 10:41:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptlYK-0005jR-RV; Tue, 02 May 2023 04:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1ptlYI-0005jA-4B; Tue, 02 May 2023 04:40:02 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1ptlYF-0003XO-UJ; Tue, 02 May 2023 04:40:01 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-63b733fd00bso2667107b3a.0; 
 Tue, 02 May 2023 01:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683016798; x=1685608798;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hRTWODXyaH0HVKE05ApMJ2/oX4Bm53c4YepCCg4tmdI=;
 b=puRrJpWRgprl12YDb4JrX+bP2p2NTLfWd3S+0lOw9xv2bDdZ66kF7V/rWlJmjhkZ2O
 mH0MGcFDjjCm2rJamrU++4uxCxa4tkWck2K8Y0I3PJgzdQQkYSpDy87jD5Q9AGHnWUnX
 374CsWJKhY55Pa+R4EQhDzR/FZyonkVU0uE0ml7lv5tb3VZW4hsBy5nwxzGTNew92PTv
 SZaVtywgmjlP7LyzUppTiOeSN6e2HOief7bHtUqHtkPJSUbzdtJzSW3UHnK36dbEjCGq
 Zr3qiIBlLYL8MP1CjzdU19xjeLFLyg649Q2AOOpMrdZLbcQs0B4wRdQJpNDle8LVRLq4
 1Ekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683016798; x=1685608798;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hRTWODXyaH0HVKE05ApMJ2/oX4Bm53c4YepCCg4tmdI=;
 b=JUDNn45R88M4doDVT3lbvcBWrbhjMcsR/+BuDJlNpnfrxSxu+f5MqPIVA5fN9NDWyc
 MIUlpYXcD2BM0VsImgxz0mfPS5QG8TOuzEwbh3raeUSXfj++93P7DPmdg7vyTOcJFr/Z
 s2dXDzaVhF5sGZBSFtz+cX1W0FlQbj9BAH6/40TACTJkP3VdkM68+tC8DCA+IgF+b2cg
 H7+CT3qU38ggfwEgW5cbFFRADiQwhu5Q2UjVVd1ISfX+aiDoY5VXjAHxdfaOhGsvfdSl
 lJbmGG1y5/F/iDeglb5lzyJEW5EHpLISvduFob0mvO1MIe1icQys8e8jtEiNwOfXJiNA
 A3xA==
X-Gm-Message-State: AC+VfDxU0R0FZU1Wwcl4M8fxnCQsAc1AstXlgzmO2WoMLsX8v6AVL2Ri
 7JZFHdIByh0DFVsY9wXKx/k=
X-Google-Smtp-Source: ACHHUZ4MxWFnmVAKK65ssda7C0r5/v+RqYNB/28UtyhRhqSPGn7CXaMyK2bKBBCpmGw1hr59n4iRCg==
X-Received: by 2002:a05:6a20:160e:b0:ee:f5a4:c072 with SMTP id
 l14-20020a056a20160e00b000eef5a4c072mr21559216pzj.46.1683016797728; 
 Tue, 02 May 2023 01:39:57 -0700 (PDT)
Received: from localhost (118-208-214-188.tpgi.com.au. [118.208.214.188])
 by smtp.gmail.com with ESMTPSA id
 om12-20020a17090b3a8c00b002405d3bbe42sm20733451pjb.0.2023.05.02.01.39.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 01:39:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 May 2023 18:39:51 +1000
Message-Id: <CSBNNS9GD25G.221SGT7O9KJTI@wheely>
Cc: <qemu-devel@nongnu.org>, <farosas@suse.de>, <danielhb413@gmail.com>,
 "Michael Neuling" <mikey@neuling.org>
Subject: Re: [PATCH v2 2/4] ppc: spapr: cleanup h_enter_nested() with helper
 routines.
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Harsh Prateek Bora" <harshpb@linux.ibm.com>, <qemu-ppc@nongnu.org>
X-Mailer: aerc 0.14.0
References: <20230424144712.1985425-1-harshpb@linux.ibm.com>
 <20230424144712.1985425-3-harshpb@linux.ibm.com>
 <CSBIRIKYBL78.3GGM8KZ1ERZUC@wheely>
 <a00bf0ea-94ce-e20b-f199-4ec3c776f458@linux.ibm.com>
 <CSBL4SMP6M1W.SF2HQGVUNSBA@wheely>
 <93e4ab27-d635-1e74-f20b-31a23cf4807e@linux.ibm.com>
In-Reply-To: <93e4ab27-d635-1e74-f20b-31a23cf4807e@linux.ibm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x42a.google.com
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

On Tue May 2, 2023 at 5:36 PM AEST, Harsh Prateek Bora wrote:
>
>
> On 5/2/23 12:11, Nicholas Piggin wrote:
> > On Tue May 2, 2023 at 4:13 PM AEST, Harsh Prateek Bora wrote:
> >> On 5/2/23 10:19, Nicholas Piggin wrote:
> >>> On Tue Apr 25, 2023 at 12:47 AM AEST, Harsh Prateek Bora wrote:
> >>>> @@ -1607,49 +1680,15 @@ static target_ulong h_enter_nested(PowerPCCP=
U *cpu,
> >>>>            return H_P2;
> >>>>        }
> >>>>   =20
> >>>> -    len =3D sizeof(env->gpr);
> >>>> -    assert(len =3D=3D sizeof(regs->gpr));
> >>>> -    memcpy(env->gpr, regs->gpr, len);
> >>>> -
> >>>> -    env->lr =3D regs->link;
> >>>> -    env->ctr =3D regs->ctr;
> >>>> -    cpu_write_xer(env, regs->xer);
> >>>> -    ppc_store_cr(env, regs->ccr);
> >>>> -
> >>>> -    env->msr =3D regs->msr;
> >>>> -    env->nip =3D regs->nip;
> >>>> +    /* restore L2 env from hv_state and ptregs */
> >>>> +    restore_l2_env(cpu, &hv_state, regs, now);
> >>>>   =20
> >>>>        address_space_unmap(CPU(cpu)->as, regs, len, len, false);
> >>>
> >>> I don't agree this improves readability. It also does more with the
> >>> guest address space mapped, which may not be a big deal is strictly
> >>> not an improvement.
> >>>
> >>> The comment needn't just repeat what the function says, and it does
> >>> not actually restore the l2 environment. It sets some registers to
> >>> L2 values, but it also leaves other state.
> >>>
> >>> I would like to see this in a larger series if it's going somewhere,
> >>> but at the moment I'd rather leave it as is.
> >>>
> >> While I agree the routine could be named restore_l2_hvstate_ptregs() a=
s
> >> more appropriate, I think it still makes sense to have the body of
> >> enter/exit routines with as minimum LOC as possible, with the help of
> >> minimum helper routines possible.
> >=20
> > I don't think that's a good goal. The entirity of entering and exiting
> > from a nested guest is 279 lines including comments and no more than
> > one level of control flow. It's tricky code and has worts, but not
> > because the number of lines.
> >=20
> Yes, It's a tricky code, and this patch was an attempt to simplify the=20
> tricky-ness by giving names to set of related ops with helper routines.

The H_ENTER_NESTED hcall says "here are a bunch of registers, set the
environment to that and switch to the L2 guest.

So having a long list of registers may be a bit tedious but it's at the
same level of abstraction as the call itself. Nothing really wrong with
it. And you have to put that somewhere.

It can help to read tricky logic by factoring out something, but in this
case the entire hcall just about is switching state, so

   switch_some_state();
   ... switch other state ...

Isn't *necessarily* an improvement over

   ... switch some state...
   ... switch other state...

There is no complicated logic around enter/exit, so there's really no
additional clarity you get by being able to abstract some of it. The
difficult part is how switching that state is entirely what causes the
hcall interrupt to return to the L2 guest.

> >> Giving semantics to the set of
> >> operations related to ptregs/hvstate register load/store is the first
> >> step towards it.
> >=20
> > Those structures are entirely the domain of the hcall API though, so
> > if anything belongs in the handler functions it is the handling of
> > those IMO.
> >=20
> Absolutely, ideally we would want to contain everything inside the=20
> handler, but if a logical name could be given to a set of related ops=20
> (ptregs/hvstate specific), that certainly helps the reader to look into=
=20
> bigger picture at first and then get into specific details as needed.

But those related ops don't necesarily make sense to pull out like this,
because they are tied to the API. So depending on what the bigger series
is, it might not make sense. If you are to add another hcall API for
nested HV, then I would say it's probably wrong. What you want to
abstract is the switching between L1 and L2, not moving register values
in and out of the hcall structs.

> >> As you have guessed, this is certainly a precursor to another API
> >> version that we have been working on (still a WIP), and helps isolatin=
g
> >> the code flows for backward compatibiility. Having such changes early
> >> upstream helps stablising changes which are not a really a API/design
> >> change.
> >=20
> > Right. Some more abstracting could certainly make sense here, I just
> > think at this point we need to see the bigger picture.
>
> I think I am fine holding the cleanup for enter/exit nested for now=20
> until we bring the next set of API changes upstream, as that will=20
> provide a better context to the value these changes would bring along.
>
> Meanwhile, I shall address your comments on 1/4 and post a v3.
> Thanks for all your review inputs.

Sounds good.

Thanks,
Nick

