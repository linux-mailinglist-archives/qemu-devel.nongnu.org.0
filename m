Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E424A4DAE
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 19:01:39 +0100 (CET)
Received: from localhost ([::1]:47996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEazi-0002Oa-5a
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 13:01:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nEavB-0007he-LU
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 12:56:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nEav9-0007Tc-MY
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 12:56:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643651814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tPTm7b/Alwhc+I0YGj6T0b8Sms/r2LqqvZNpgtyvOLc=;
 b=H9B37DFnrkZkUyUfPuYEZgpuTzErJYYq3DYbLvfNkyQ0A5Uq2bsXXeP7Pk3JZYn3FdVMQD
 dKIDgf+ShYWH+gBNkJnTRyPPxPUp9LqoYISbfy4vLQDCHmnt0CJTvdwJBmj4rlc46q27xQ
 Hry6s0ICdElHtRu3ww2nJ5mBjpNS2gs=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-91PZrYYzMOS-nZsxtjmtKg-1; Mon, 31 Jan 2022 12:56:51 -0500
X-MC-Unique: 91PZrYYzMOS-nZsxtjmtKg-1
Received: by mail-lf1-f70.google.com with SMTP id
 d14-20020a196b0e000000b0043a9be72315so4721922lfa.22
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 09:56:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tPTm7b/Alwhc+I0YGj6T0b8Sms/r2LqqvZNpgtyvOLc=;
 b=mSrW2a4zx8WYlQJI8h3M1i0KxIBIBXFe6mHuvBD6JZa5XOIdNMBDNhmPySWj1d2HAe
 pCA6PHzGBJhTegXLnZLAiWuMu5OIVU2C1M7HTWfzuY0msbJkc9ewwWxAb7hT/afNv5rL
 MJp9FePnyCXkBkLLOu3xCMquj+/dF5WiOuFjuzn+HJg0l91hje1uPh2eGyTZBqIKgxjL
 vLr23JlL3NWsg87YkcaO7qYHfQ+AzYeVtaapD7/5rWHzorBvFiYcPwH2TrSP4LF3g935
 RGsB87WzESLo6r56tLhjbTqwIrU16jOMn8ETiqEaq++p5417+Gh5viPNZ78ESz/nuizA
 iVkQ==
X-Gm-Message-State: AOAM531ZLM48JePJoaL2rR7hQKRDuuZdfRK0TF5FjcZE9IHS2ozuTWY5
 vZUb2Qdu5Wkm8Liqw2B6pQsv2A1ZmqABbE9I/9bkIQ21GMeWBAv+yCobmrzdLM67urkFulDQsYF
 q4dsXbGFGElOAOxotLoDJMCLEspMG22Q=
X-Received: by 2002:a05:6512:3408:: with SMTP id
 i8mr15867224lfr.17.1643651809852; 
 Mon, 31 Jan 2022 09:56:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuQYt0FYczDdz7oEY/o6QX42sMEqD0h7CzeRE4k8ePEa6nModMHI+Xf/cwJrtSIyUkHEo0L8D5ULKBWbmxdvI=
X-Received: by 2002:a05:6512:3408:: with SMTP id
 i8mr15867203lfr.17.1643651809552; 
 Mon, 31 Jan 2022 09:56:49 -0800 (PST)
MIME-Version: 1.0
References: <20220129102336.387460-1-leobras@redhat.com>
 <Yfem3s94EwIxqO1a@redhat.com>
In-Reply-To: <Yfem3s94EwIxqO1a@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Mon, 31 Jan 2022 14:56:38 -0300
Message-ID: <CAJ6HWG7RvW6ofKRf7RAK2d8Kw0sOTX7UoYKBBJOy9Yw3yJhZaA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] i386: Remove features from Epyc-Milan cpu
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Babu Moger <babu.moger@amd.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Daniel,

On Mon, Jan 31, 2022 at 6:08 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> CC'ing  Babu Moger who aded the Milan CPU model.
>
> On Sat, Jan 29, 2022 at 07:23:37AM -0300, Leonardo Bras wrote:
> > While trying to bring a VM with EPYC-Milan cpu on a host with
> > EPYC-Milan cpu (EPYC 7313), the following warning can be seen:
> >
> > qemu-system-x86_64: warning: host doesn't support requested feature: CP=
UID.07H:EBX.erms [bit 9]
> > qemu-system-x86_64: warning: host doesn't support requested feature: CP=
UID.07H:EDX.fsrm [bit 4]
> >
> > Even with this warning, the host goes up.
> >
> > Then, grep'ing cpuid output on both guest and host, outputs:
> >
> > extended feature flags (7):
> >       enhanced REP MOVSB/STOSB                 =3D false
> >       fast short REP MOV                       =3D false
> >       (simple synth)  =3D AMD EPYC (3rd Gen) (Milan B1) [Zen 3], 7nm
> >    brand =3D "AMD EPYC 7313 16-Core Processor               "
> >
> > This means that for the same -cpu model (EPYC-Milan), the vcpu may or m=
ay
> > not have the above feature bits set, which is usually not a good idea f=
or
> > live migration:
> > Migrating from a host with these features to a host without them can
> > be troublesome for the guest.
> >
> > Remove the "optional" features (erms, fsrm) from Epyc-Milan, in order t=
o
> > avoid possible after-migration guest issues.
>
> Babu,  can you give some insight into availability of erms / fsrm
> features across the EPYC 3rd gen CPU line. Is this example missing
> erms/fsrm an exception, or common place ?
>
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >
> > Does this make sense? Or maybe I am missing something here.
> >
> > Having a kvm guest running with a feature bit, while the host
> > does not support it seems to cause a possible break the guest.
>
> The guest won't see the feature bit - that warning message from QEMU
> is telling you that it did't honour the request to expose
> erms / fsrm - it has dropped them from the CPUO exposed to the guest.

Exactly.
What I meant here is:
1 - Host with these feature bits start a VM with EPYC-Milan cpu (and
thus have those bits enabled)
2 - Guest is migrated to a host such as the above, which does not
support those features (bits disabled), but does support EPYC-Milan
cpus (without those features).
3 - The migration should be allowed, given the same cpu types. Then
either we have:
3a : The guest vcpu stays with the flag enabled (case I tried to
explain above), possibly crashing if the new feature is used, or
3b: The guest vcpu disables the flag due to incompatibility,  which
may make the guest confuse due to cpu change, and even end up trying
to use the new feature on the guest, even if it's disabled.



>
> >
> >
> >  target/i386/cpu.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index aa9e636800..a4bbd38ed0 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -4160,12 +4160,9 @@ static const X86CPUDefinition builtin_x86_defs[]=
 =3D {
> >              CPUID_7_0_EBX_FSGSBASE | CPUID_7_0_EBX_BMI1 | CPUID_7_0_EB=
X_AVX2 |
> >              CPUID_7_0_EBX_SMEP | CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_RD=
SEED |
> >              CPUID_7_0_EBX_ADX | CPUID_7_0_EBX_SMAP | CPUID_7_0_EBX_CLF=
LUSHOPT |
> > -            CPUID_7_0_EBX_SHA_NI | CPUID_7_0_EBX_CLWB | CPUID_7_0_EBX_=
ERMS |
> > -            CPUID_7_0_EBX_INVPCID,
> > +            CPUID_7_0_EBX_SHA_NI | CPUID_7_0_EBX_CLWB | CPUID_7_0_EBX_=
INVPCID,
> >          .features[FEAT_7_0_ECX] =3D
> >              CPUID_7_0_ECX_UMIP | CPUID_7_0_ECX_RDPID | CPUID_7_0_ECX_P=
KU,
> > -        .features[FEAT_7_0_EDX] =3D
> > -            CPUID_7_0_EDX_FSRM,
> >          .features[FEAT_XSAVE] =3D
> >              CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
> >              CPUID_XSAVE_XGETBV1 | CPUID_XSAVE_XSAVES,
> > --
> > 2.34.1
> >
> >
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


