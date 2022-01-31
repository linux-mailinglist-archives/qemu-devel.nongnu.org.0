Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 405EC4A4DC4
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 19:11:39 +0100 (CET)
Received: from localhost ([::1]:59302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEb9N-0001Ms-U4
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 13:11:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEb4x-0008Kl-1q
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 13:07:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEb4v-0000e2-5x
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 13:07:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643652420;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=el1oz8JyGWZPg9SufF6Fo02PQVvaz9UNaDjL58T5h1I=;
 b=Y2anmtHeSgc718c9Sb52haHz9AH5Q7rJC6HCGt+EXmoyge257tKdFiTjeZwOjceniILZt3
 VTxpxfpbPQvMhA4ax20dUI/hTyrXiFmkfmUkGya5yLM/QJjw3ejM34kCzWnkGGCOvbrPzP
 kTN99Q9j8Jz7BOCO0kM2DjsVNbW3ZT8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-ds_MB5qJMcGoM5PgynJaww-1; Mon, 31 Jan 2022 13:06:53 -0500
X-MC-Unique: ds_MB5qJMcGoM5PgynJaww-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9066885EE64;
 Mon, 31 Jan 2022 18:06:52 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 97B6C7DE23;
 Mon, 31 Jan 2022 18:06:51 +0000 (UTC)
Date: Mon, 31 Jan 2022 18:06:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Edmondson <david.edmondson@oracle.com>
Subject: Re: [RFC PATCH 1/1] i386: Remove features from Epyc-Milan cpu
Message-ID: <YfglOKxhkn2nTtCN@redhat.com>
References: <20220129102336.387460-1-leobras@redhat.com>
 <cunee4orwbh.fsf@oracle.com>
MIME-Version: 1.0
In-Reply-To: <cunee4orwbh.fsf@oracle.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 11:14:42AM +0000, David Edmondson wrote:
> On Saturday, 2022-01-29 at 07:23:37 -03, Leonardo Bras wrote:
> 
> > While trying to bring a VM with EPYC-Milan cpu on a host with
> > EPYC-Milan cpu (EPYC 7313), the following warning can be seen:
> >
> > qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.07H:EBX.erms [bit 9]
> > qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.07H:EDX.fsrm [bit 4]
> >
> > Even with this warning, the host goes up.
> >
> > Then, grep'ing cpuid output on both guest and host, outputs:
> >
> > extended feature flags (7):
> >       enhanced REP MOVSB/STOSB                 = false
> >       fast short REP MOV                       = false
> >       (simple synth)  = AMD EPYC (3rd Gen) (Milan B1) [Zen 3], 7nm
> >    brand = "AMD EPYC 7313 16-Core Processor               "
> >
> > This means that for the same -cpu model (EPYC-Milan), the vcpu may or may
> > not have the above feature bits set, which is usually not a good idea for
> > live migration:
> > Migrating from a host with these features to a host without them can
> > be troublesome for the guest.
> >
> > Remove the "optional" features (erms, fsrm) from Epyc-Milan, in order to
> > avoid possible after-migration guest issues.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >
> > Does this make sense? Or maybe I am missing something here.
> 
> We have encountered some Milan CPUs (7J13) that did not initially
> declare support for either ERMS or FSRM.
> 
> A firmware update caused these features to appear, which definitely
> causes potential problems with migration of VMs from hosts with updated
> firmware to those without.
> 
> It would be interesting to know if there is any expectation that the
> features might be enabled on the 7313 CPUs that you have with a future
> firmware update.
> 
> I *think* that the expectation is that Milan CPUs will have the
> features, and if that is correct then they should remain present in the
> EPYC-Milan definition on QEMU.

Agreed, if this is just a case of outdated firmware, then I think it
is a non-issue for our CPU model definition.  Libvirt will ensure
migration compatibility by launching the target QEMU with a -cpu
arg that results in a model that matches the source QEMU exactly.

It is merely a slight annoyance if someone launches a VM on a host
with new firmware and tries to migrate to a host with old firmware.
In that case though the answer is really to upgrade the firmware.

> > Having a kvm guest running with a feature bit, while the host
> > does not support it seems to cause a possible break the guest.
> 
> As Daniel said, this should not happen in this case.
> 
> >  target/i386/cpu.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index aa9e636800..a4bbd38ed0 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -4160,12 +4160,9 @@ static const X86CPUDefinition builtin_x86_defs[] = {
> >              CPUID_7_0_EBX_FSGSBASE | CPUID_7_0_EBX_BMI1 | CPUID_7_0_EBX_AVX2 |
> >              CPUID_7_0_EBX_SMEP | CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_RDSEED |
> >              CPUID_7_0_EBX_ADX | CPUID_7_0_EBX_SMAP | CPUID_7_0_EBX_CLFLUSHOPT |
> > -            CPUID_7_0_EBX_SHA_NI | CPUID_7_0_EBX_CLWB | CPUID_7_0_EBX_ERMS |
> > -            CPUID_7_0_EBX_INVPCID,
> > +            CPUID_7_0_EBX_SHA_NI | CPUID_7_0_EBX_CLWB | CPUID_7_0_EBX_INVPCID,
> >          .features[FEAT_7_0_ECX] =
> >              CPUID_7_0_ECX_UMIP | CPUID_7_0_ECX_RDPID | CPUID_7_0_ECX_PKU,
> > -        .features[FEAT_7_0_EDX] =
> > -            CPUID_7_0_EDX_FSRM,
> >          .features[FEAT_XSAVE] =
> >              CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
> >              CPUID_XSAVE_XGETBV1 | CPUID_XSAVE_XSAVES,
> 
> dme.
> -- 
> I don't care 'bout your other girls, just be good to me.
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


