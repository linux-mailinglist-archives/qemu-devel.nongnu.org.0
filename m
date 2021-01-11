Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A31192F129F
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 13:56:02 +0100 (CET)
Received: from localhost ([::1]:41996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kywjp-0006mr-No
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 07:56:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kywUb-0006PG-Mv
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 07:40:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kywUZ-0007n0-Bd
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 07:40:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610368813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eMzV1hsHwk8OFT6eiOFZ4vSkD34sSA8LMV2ySFhiKRA=;
 b=RllfRnWgaSk68MuARzxTXPITyM6/J7HllXETIjcjnqb+fRKiqpF2po5lR2RR/VTYkB5CEY
 qeWMqckoYZKryxf71aKz2jvxxGlZr7yYtEhRlDfzjcfdVhG2JWJzonS21HSlUJbV+6a4Tm
 BqWHrMD30OyVKvaCQKi/3m/TE1AjAvw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-a7etc-TsOF6loPxhqnjixw-1; Mon, 11 Jan 2021 07:40:11 -0500
X-MC-Unique: a7etc-TsOF6loPxhqnjixw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1BD3107ACF7;
 Mon, 11 Jan 2021 12:40:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D950936807;
 Mon, 11 Jan 2021 12:40:10 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id CEA604BB7B;
 Mon, 11 Jan 2021 12:40:10 +0000 (UTC)
Date: Mon, 11 Jan 2021 07:40:10 -0500 (EST)
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Message-ID: <1663575515.32388441.1610368810789.JavaMail.zimbra@redhat.com>
In-Reply-To: <4a1d82cd-6e18-8a68-ada7-c5f7b66d94d7@redhat.com>
References: <cover.1610364304.git.mrezanin@redhat.com>
 <96033fbea8ab38a769c0ac9c23a217b4b5d32864.1610364304.git.mrezanin@redhat.com>
 <4a1d82cd-6e18-8a68-ada7-c5f7b66d94d7@redhat.com>
Subject: Re: [RHEL7 qemu-kvm PATCH 3/3] Fix tcg_out_op argument mismatch
 warning
MIME-Version: 1.0
X-Originating-IP: [10.40.192.93, 10.4.195.9]
Thread-Topic: Fix tcg_out_op argument mismatch warning
Thread-Index: MrKQ4MnvxaSC7s0w3flT+D2HX28chA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

----- Original Message -----
> From: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
> To: mrezanin@redhat.com, qemu-devel@nongnu.org
> Cc: "Richard Henderson" <richard.henderson@linaro.org>, "Eric Blake" <ebl=
ake@redhat.com>
> Sent: Monday, January 11, 2021 1:15:04 PM
> Subject: Re: [RHEL7 qemu-kvm PATCH 3/3] Fix tcg_out_op argument mismatch =
warning
>=20
> On 1/11/21 12:30 PM, mrezanin@redhat.com wrote:
> > From: Miroslav Rezanina <mrezanin@redhat.com>
> >=20
> > There's prototype mismatch between tcg/tcg.c and
> > tcg/aarch/tcg-target.c.inc:
> >=20
> > tcg.c:
> >=20
> >     static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg
> >     *args,
> >                            const int *const_args);
> >=20
> > tcg-target.c.inc:
> >=20
> >     static void tcg_out_op(TCGContext *s, TCGOpcode opc,
> >                            const TCGArg args[TCG_MAX_OP_ARGS],
> >                            const int const_args[TCG_MAX_OP_ARGS])
> >=20
> > This missmatch cause warnings on GCC 11:
> >=20
> >     tcg/aarch64/tcg-target.c.inc:1855:37: error: argument 3 of type 'co=
nst
> >     TCGArg[16]' {aka 'const long unsigned int[16]'} with mismatched bou=
nd
> >     [-Werror=3Darray-parameter=3D]
> >     tcg/aarch64/tcg-target.c.inc:1856:34: error: argument 4 of type 'co=
nst
> >     int[16]' with mismatched bound [-Werror=3Darray-parameter=3D]
>=20
> TIL. Interesting, compilers are getting smarter :)
>=20
> > Only architectures with this definition are aarch and sparc. Fixing bot=
h
> > archs to use
> > proper argument type.
> > ---
> >  tcg/aarch64/tcg-target.c.inc | 3 +--
> >  tcg/sparc/tcg-target.c.inc   | 3 +--
> >  2 files changed, 2 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.in=
c
> > index 26f71cb599..fe6bdbf721 100644
> > --- a/tcg/aarch64/tcg-target.c.inc
> > +++ b/tcg/aarch64/tcg-target.c.inc
> > @@ -1852,8 +1852,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg
> > data_reg, TCGReg addr_reg,
> >  static tcg_insn_unit *tb_ret_addr;
> > =20
> >  static void tcg_out_op(TCGContext *s, TCGOpcode opc,
> > -                       const TCGArg args[TCG_MAX_OP_ARGS],
> > -                       const int const_args[TCG_MAX_OP_ARGS])
> > +                       const TCGArg *args, const int *const_args)
>=20
> Doing this way we loose information (that the array pointed has
> TCG_MAX_OP_ARGS elements). What about letting this prototype and
> fix the other uses?

I'm not author of the code so I went with smaller change - forward definiti=
on
in tcg.c and most tct-target.c.inc use this form. I would need someone more
familiar with this part to clarify whether it's ok to go with opposite chan=
ge.

Mirek

>=20
> >  {
> >      /* 99% of the time, we can signal the use of extension registers
> >         by looking to see if the opcode handles 64-bit data.  */
> > diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
> > index 6775bd30fc..976f0f05af 100644
> > --- a/tcg/sparc/tcg-target.c.inc
> > +++ b/tcg/sparc/tcg-target.c.inc
> > @@ -1294,8 +1294,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg
> > data, TCGReg addr,
> >  }
> > =20
> >  static void tcg_out_op(TCGContext *s, TCGOpcode opc,
> > -                       const TCGArg args[TCG_MAX_OP_ARGS],
> > -                       const int const_args[TCG_MAX_OP_ARGS])
> > +                       const TCGArg *args, const int *const_args)
> >  {
> >      TCGArg a0, a1, a2;
> >      int c, c2;
> >=20
>=20
>=20

--=20
Miroslav Rezanina
Software Engineer - Virtualization Team Maintainer


