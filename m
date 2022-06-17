Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D3054F515
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 12:14:35 +0200 (CEST)
Received: from localhost ([::1]:41470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o28zp-0007LH-IT
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 06:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o28xv-0005zF-DO
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 06:12:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o28xr-0000Hp-58
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 06:12:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655460746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eGYphXTb/VLaDeNjeDa1y7DZU7chgJRBUsO/mx4UHoA=;
 b=SFSJR2ThC1xTpxHdQRQwN/mEnH1KVqeODCOFEX3EAOyq16ndlHEonyQLYa61bt6Vfvpfv9
 lxdeieh49b+E3ks+o3b2cEULsJToXgb0rgAeK1bTQL6gHrv45cxzFiiGfuoRwl5mD9TDpu
 3x9r/fTSCXRnWpJAmcM1/dzUX44+Lo0=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-NA_n0QiWMcevLUnOTfgFww-1; Fri, 17 Jun 2022 06:12:25 -0400
X-MC-Unique: NA_n0QiWMcevLUnOTfgFww-1
Received: by mail-pj1-f71.google.com with SMTP id
 l22-20020a17090a3f1600b001eaf9daa316so1701145pjc.9
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 03:12:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eGYphXTb/VLaDeNjeDa1y7DZU7chgJRBUsO/mx4UHoA=;
 b=C7XEJm48BE9gvXT5djViTiGEuiGVv8ddgxrOAB/UvCXYmXbQBgy9tyqh53c5Ry/TMo
 nprXen43AnoY5bi0GL+4nL0aWj3UE65F4ohVBnlUW/dFflDOliCf44U+Ip3r9YJFIvX6
 l628ViShG0HfbeZZSRDy3LVVvyk3CiwidzLIj5UgRBfYWOIzAFc7s/4qoDY2QJ9EFa9l
 UvDu36xQsngvdCyWQ5LpXHzDuCvc2QAg/lS5rM+PyGPAsPr9nP9dHVGydGYu3P7CXWPW
 HIUmIVoKzmYZprqRn7A5wTdxDZN5abcppkzw8G/R1wl82t0ReBJgpAFlIOsOVVjVDzbM
 gpcw==
X-Gm-Message-State: AJIora+8GJT5AL6p6iO+KRJfjWegyqnBLvMccE8c35EO0Vh42BdyhOyz
 3P831ydfBqRgRKs2r109qG/WfYwEmprBJkCfjyrqjWxf0XOK20Pe10J0tSnPguf0lXi9r2J8fH1
 iN/9vQpqS8TPGOuJWfVy/sf3mJLimMPE=
X-Received: by 2002:a63:bf4d:0:b0:40c:4060:f6d with SMTP id
 i13-20020a63bf4d000000b0040c40600f6dmr4488539pgo.254.1655460744074; 
 Fri, 17 Jun 2022 03:12:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sVFDTV1QiADtGQvB5BGrx6mB3O4/dYx9n+t70HuTv01cLaVT8XSb6I+h3mDNsNDdwHN163TBGY5IwQ/3/6EWE=
X-Received: by 2002:a63:bf4d:0:b0:40c:4060:f6d with SMTP id
 i13-20020a63bf4d000000b0040c40600f6dmr4488513pgo.254.1655460743668; Fri, 17
 Jun 2022 03:12:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
 <20220601180537.2329566-21-alex.bennee@linaro.org>
 <c655723a-95df-82e4-2105-678cdea9e702@eldorado.org.br>
In-Reply-To: <c655723a-95df-82e4-2105-678cdea9e702@eldorado.org.br>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 17 Jun 2022 12:12:12 +0200
Message-ID: <CABgObfYEiV_TK4BDxG6+zZ1Qq06y6GtmnP1uF__eV31XDKggDA@mail.gmail.com>
Subject: Re: [PULL 20/33] configure: handle host compiler in
 probe_target_compiler
To: Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, 
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Matheus,

could you please test the tests-tcg-next branch at
https://gitlab.com/bonzini/qemu?

Thanks,

Paolo

On Thu, Jun 16, 2022 at 3:23 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br> writes:
>
> > On 01/06/2022 15:05, Alex Benn=C3=A9e wrote:
> >> From: Paolo Bonzini <pbonzini@redhat.com>
> >>
> >> In preparation for handling more binaries than just cc, handle
> >> the case of "probe_target_compiler $cpu" directly in the function,
> >> setting the target_* variables based on the ones that are used to
> >> build QEMU.  The clang check also needs to be moved after this
> >> fallback.
> >>
> >> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >> Message-Id: <20220517092616.1272238-10-pbonzini@redhat.com>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> Message-Id: <20220527153603.887929-21-alex.bennee@linaro.org>
> >
> > Hi,
> >
> > After this patch, a clean build in ppc64le hosts will not build
> > ppc64{,le}-linux-user tests with "make check-tcg"
> >
> >>
> >> diff --git a/configure b/configure
> >> index fbf6d39f96..217c8b3cac 100755
> >> --- a/configure
> >> +++ b/configure
> >> @@ -954,10 +954,6 @@ case $git_submodules_action in
> >>       ;;
> >>   esac
> >>
> >> -if eval test -z "\${cross_cc_$cpu}"; then
> >> -    eval "cross_cc_${cpu}=3D\$cc"
> >> -fi
> >> -
> >>   default_target_list=3D""
> >>   mak_wilds=3D""
> >>
> >> @@ -2008,13 +2004,6 @@ probe_target_compiler() {
> >>     if eval test -n "\"\${cross_cc_$1}\""; then
> >>       if eval has "\"\${cross_cc_$1}\""; then
> >>         eval "target_cc=3D\"\${cross_cc_$1}\""
> >> -      case $1 in
> >> -        i386|x86_64)
> >> -          if $target_cc --version | grep -qi "clang"; then
> >> -            unset target_cc
> >> -          fi
> >> -          ;;
> >> -      esac
> >>       fi
> >>     fi
> >>     if eval test -n "\"\${cross_as_$1}\""; then
> >> @@ -2027,6 +2016,20 @@ probe_target_compiler() {
> >>         eval "target_ld=3D\"\${cross_ld_$1}\""
> >>       fi
> >>     fi
> >> +  if test "$1" =3D $cpu; then > +    : ${target_cc:=3D$cc}
> >> +    : ${target_as:=3D$as}
> >> +    : ${target_ld:=3D$ld}
> >> +  fi
> >
> > $cpu is normalized[1] to ppc64 on little-endian hosts, so
> > ppc64le-linux-user will not have $target_{cc,as,ld} set, and
> > ppc64-linux-user will have them set to a toolchain that may not support
> > -mbig-endian. I suppose we have a similar problem with MIPS targets on
> > MIPS hosts.
>
> For now you can always explicitly tell configure about the host compiler
> with:
>
>  --cross-cc-ppc64le=3Dgcc
>
> but we should fix the broken detection. It seems the var cpu has an
> overloaded meaning so I wonder if we just need an explicit host_cpu
> setting when we normalize cpu?
>
> >
> > [1]
> > https://gitlab.com/qemu-project/qemu/-/blob/2ad60f6f8c12ca0acd8834fdd70=
e088361b8791f/configure#L611
>
>
> --
> Alex Benn=C3=A9e
>

On Wed, Jun 15, 2022 at 1:57 PM Matheus Kowalczuk Ferst
<matheus.ferst@eldorado.org.br> wrote:
>
> On 01/06/2022 15:05, Alex Benn=C3=A9e wrote:
> > From: Paolo Bonzini <pbonzini@redhat.com>
> >
> > In preparation for handling more binaries than just cc, handle
> > the case of "probe_target_compiler $cpu" directly in the function,
> > setting the target_* variables based on the ones that are used to
> > build QEMU.  The clang check also needs to be moved after this
> > fallback.
> >
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > Message-Id: <20220517092616.1272238-10-pbonzini@redhat.com>
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Message-Id: <20220527153603.887929-21-alex.bennee@linaro.org>
>
> Hi,
>
> After this patch, a clean build in ppc64le hosts will not build
> ppc64{,le}-linux-user tests with "make check-tcg"
>
> >
> > diff --git a/configure b/configure
> > index fbf6d39f96..217c8b3cac 100755
> > --- a/configure
> > +++ b/configure
> > @@ -954,10 +954,6 @@ case $git_submodules_action in
> >       ;;
> >   esac
> >
> > -if eval test -z "\${cross_cc_$cpu}"; then
> > -    eval "cross_cc_${cpu}=3D\$cc"
> > -fi
> > -
> >   default_target_list=3D""
> >   mak_wilds=3D""
> >
> > @@ -2008,13 +2004,6 @@ probe_target_compiler() {
> >     if eval test -n "\"\${cross_cc_$1}\""; then
> >       if eval has "\"\${cross_cc_$1}\""; then
> >         eval "target_cc=3D\"\${cross_cc_$1}\""
> > -      case $1 in
> > -        i386|x86_64)
> > -          if $target_cc --version | grep -qi "clang"; then
> > -            unset target_cc
> > -          fi
> > -          ;;
> > -      esac
> >       fi
> >     fi
> >     if eval test -n "\"\${cross_as_$1}\""; then
> > @@ -2027,6 +2016,20 @@ probe_target_compiler() {
> >         eval "target_ld=3D\"\${cross_ld_$1}\""
> >       fi
> >     fi
> > +  if test "$1" =3D $cpu; then > +    : ${target_cc:=3D$cc}
> > +    : ${target_as:=3D$as}
> > +    : ${target_ld:=3D$ld}
> > +  fi
>
> $cpu is normalized[1] to ppc64 on little-endian hosts, so
> ppc64le-linux-user will not have $target_{cc,as,ld} set, and
> ppc64-linux-user will have them set to a toolchain that may not support
> -mbig-endian. I suppose we have a similar problem with MIPS targets on
> MIPS hosts.
>
> [1]
> https://gitlab.com/qemu-project/qemu/-/blob/2ad60f6f8c12ca0acd8834fdd70e0=
88361b8791f/configure#L611
>
> --
> Matheus K. Ferst
> Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
> Analista de Software
> Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>


