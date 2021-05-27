Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E7E393073
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:09:00 +0200 (CEST)
Received: from localhost ([::1]:47034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmGh1-0005oh-IC
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lmGaT-0008JJ-AI
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:02:13 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:34000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lmGaM-0007Ip-NW
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:02:11 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-8iQXq8zHOzqMWhGzBj8frA-1; Thu, 27 May 2021 10:01:58 -0400
X-MC-Unique: 8iQXq8zHOzqMWhGzBj8frA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F4DC50213;
 Thu, 27 May 2021 14:01:56 +0000 (UTC)
Received: from bahia.lan (ovpn-112-46.ams2.redhat.com [10.36.112.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE9615B684;
 Thu, 27 May 2021 14:01:53 +0000 (UTC)
Date: Thu, 27 May 2021 16:01:52 +0200
From: Greg Kurz <groug@kaod.org>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH 2/5] target/ppc: remove ppc_cpu_dump_statistics
Message-ID: <20210527160152.625ca372@bahia.lan>
In-Reply-To: <d952f573-6a12-27c7-98e4-a29e2a955ec5@eldorado.org.br>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-3-bruno.larsen@eldorado.org.br>
 <YK7zwfSC7NGssEN5@yekko> <YK8hjhgPNK8yVfgm@yekko>
 <d952f573-6a12-27c7-98e4-a29e2a955ec5@eldorado.org.br>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 May 2021 10:22:50 -0300
Bruno Piazera Larsen <bruno.larsen@eldorado.org.br> wrote:

>=20
> On 27/05/2021 01:35, David Gibson wrote:
> > On Thu, May 27, 2021 at 11:20:01AM +1000, David Gibson wrote:
> >> On Wed, May 26, 2021 at 05:21:01PM -0300, Bruno Larsen (billionai) wro=
te:
> >>> This function requires surce code modification to be useful, which me=
ans
> >>> it probably is not used often, and the move to using decodetree means
> >>> the statistics won't even be collected anymore.
> >>>
> >>> Also removed setting dump_statistics in ppc_cpu_realize, since it was
> >>> only useful when in conjunction with ppc_cpu_dump_statistics.
> >>>
> >>> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> >>> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br=
>
> >>> ---
> >>>   target/ppc/cpu.h       |  1 -
> >>>   target/ppc/cpu_init.c  |  3 ---
> >>>   target/ppc/translate.c | 51 ---------------------------------------=
---
> >>>   3 files changed, 55 deletions(-)
> >>>
> >>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> >>> index 203f07e48e..c3d1b492e4 100644
> >>> --- a/target/ppc/cpu.h
> >>> +++ b/target/ppc/cpu.h
> >>> @@ -1256,7 +1256,6 @@ DECLARE_OBJ_CHECKERS(PPCVirtualHypervisor, PPCV=
irtualHypervisorClass,
> >>>   void ppc_cpu_do_interrupt(CPUState *cpu);
> >>>   bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
> >>>   void ppc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
> >>> -void ppc_cpu_dump_statistics(CPUState *cpu, int flags);
> >>>   hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
> >>>   int ppc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int r=
eg);
> >>>   int ppc_cpu_gdb_read_register_apple(CPUState *cpu, GByteArray *buf,=
 int reg);
> >>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> >>> index f5ae2f150d..bd05f53fa4 100644
> >>> --- a/target/ppc/cpu_init.c
> >>> +++ b/target/ppc/cpu_init.c
> >>> @@ -9250,9 +9250,6 @@ static void ppc_cpu_class_init(ObjectClass *oc,=
 void *data)
> >>>       cc->class_by_name =3D ppc_cpu_class_by_name;
> >>>       cc->has_work =3D ppc_cpu_has_work;
> >>>       cc->dump_state =3D ppc_cpu_dump_state;
> >>> -#ifdef CONFIG_TCG
> >>> -    cc->dump_statistics =3D ppc_cpu_dump_statistics;
> >>> -#endif
> >> This confuses me.  The ifdefs you're removing aren't present in my
> >> tree, and AFAICT they never existed since your own patch created
> >> cpu_init.c.
> >>
> >> So.. please rebase and check that.
> > Duh, sorry, I looked at this set out of order with your latest !tcg
> > patches.  Now that I've applied those, I've applied those one as well.
> Let me just check, where do you keep your most updated tree? I'm=20
> rebasing on your github tree, but ppc-for-6.1 there seems quite outdated=
=20
> (still the same as main)

Try here:

https://gitlab.com/dgibson/qemu/-/commits/ppc-for-6.1/

Cheers,

--
Greg


