Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E900274255
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 14:45:52 +0200 (CEST)
Received: from localhost ([::1]:53940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKhg5-00075G-NR
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 08:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kKhei-0006aW-3d
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 08:44:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kKheg-0001yM-FN
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 08:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600778661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iv2NoV/ks7jj16aeZsTf0bMrngGfyoRUQ7ZLABRiom8=;
 b=VsDGrXsuKT717NCUFnh9QNZmP7IrvITDCFJbgFsS8BpbW2kiK5uD2hjLU//KhQuptI99oQ
 xL29L35L1p9PczLwdLHS7OvmVnKdgYoiuHD9C+NkF06fBYJqBPFg12dPt68JwqZz4gx/TA
 TyppMi0FuQzUxaaZRoB4vW60v0Ry5Bw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-4KNd9QWWMpetqdGl-17bWg-1; Tue, 22 Sep 2020 08:44:19 -0400
X-MC-Unique: 4KNd9QWWMpetqdGl-17bWg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 990B41008548;
 Tue, 22 Sep 2020 12:44:18 +0000 (UTC)
Received: from localhost (unknown [10.10.67.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6000D19D61;
 Tue, 22 Sep 2020 12:44:18 +0000 (UTC)
Date: Tue, 22 Sep 2020 08:44:17 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 13/24] i386: Register most CPU properties as class
 properties
Message-ID: <20200922124417.GW57321@habkost.net>
References: <20200921221045.699690-1-ehabkost@redhat.com>
 <20200921221045.699690-14-ehabkost@redhat.com>
 <20200922084149.706d8cf7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200922084149.706d8cf7@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 00:31:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 22, 2020 at 08:41:49AM +0200, Igor Mammedov wrote:
> On Mon, 21 Sep 2020 18:10:34 -0400
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > Class properties make QOM introspection simpler and easier, as
> > they don't require an object to be instantiated.
> > 
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Richard Henderson <rth@twiddle.net>
> > Cc: Eduardo Habkost <ehabkost@redhat.com>
> > Cc: qemu-devel@nongnu.org
> > ---
> >  target/i386/cpu.c | 66 ++++++++++++++++++++++++-----------------------
> >  1 file changed, 34 insertions(+), 32 deletions(-)
> > 
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index 1c58f764dcb..66792f28ba7 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -6922,44 +6922,12 @@ static void x86_cpu_initfn(Object *obj)
> >      env->nr_dies = 1;
> >      cpu_set_cpustate_pointers(cpu);
> >  
> > -    object_property_add(obj, "family", "int",
> > -                        x86_cpuid_version_get_family,
> > -                        x86_cpuid_version_set_family, NULL, NULL);
> > -    object_property_add(obj, "model", "int",
> > -                        x86_cpuid_version_get_model,
> > -                        x86_cpuid_version_set_model, NULL, NULL);
> > -    object_property_add(obj, "stepping", "int",
> > -                        x86_cpuid_version_get_stepping,
> > -                        x86_cpuid_version_set_stepping, NULL, NULL);
> > -    object_property_add_str(obj, "vendor",
> > -                            x86_cpuid_get_vendor,
> > -                            x86_cpuid_set_vendor);
> > -    object_property_add_str(obj, "model-id",
> > -                            x86_cpuid_get_model_id,
> > -                            x86_cpuid_set_model_id);
> > -    object_property_add(obj, "tsc-frequency", "int",
> > -                        x86_cpuid_get_tsc_freq,
> > -                        x86_cpuid_set_tsc_freq, NULL, NULL);
> 
> 
> >      object_property_add(obj, "feature-words", "X86CPUFeatureWordInfo",
> >                          x86_cpu_get_feature_words,
> >                          NULL, NULL, (void *)env->features);
> >      object_property_add(obj, "filtered-features", "X86CPUFeatureWordInfo",
> >                          x86_cpu_get_feature_words,
> >                          NULL, NULL, (void *)cpu->filtered_features);
> 
> I'm just curious why these weren't moved as well?

Because of the (void*) arguments that need a pointer to the
instance.

-- 
Eduardo


