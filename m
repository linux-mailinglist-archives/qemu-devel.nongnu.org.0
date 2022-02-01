Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B0B4A68C1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 00:48:57 +0100 (CET)
Received: from localhost ([::1]:42402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF2tM-0005w6-O9
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 18:48:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nEyXt-0008UQ-63
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:10:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nEyXU-0007fw-Dw
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:10:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643742602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9KSDvOt3qotkBws2li2Eo0kZ2EQDmfOtznvckOJr8NM=;
 b=V3RpXamHbRtCIK57VwjBjO53Q/LTRN/zC8wsqkNwahj/bGI9Yc5BUqtZPpshoASbiPxutq
 pHpGaLsbG9/vMdD4ysuHj21LmjXPAeOcgGPuFr9oiEPm5GbAilKqfU+3XbWcJ1Rz1lISW3
 KQpJ9WYLMEPlcQjch5d3HaTyphbNn9w=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-8yB6Gv9hNkasniDW4YXnMg-1; Tue, 01 Feb 2022 14:10:01 -0500
X-MC-Unique: 8yB6Gv9hNkasniDW4YXnMg-1
Received: by mail-vk1-f198.google.com with SMTP id
 140-20020a1f0292000000b0031f55d529c5so2965765vkc.2
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 11:10:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=9KSDvOt3qotkBws2li2Eo0kZ2EQDmfOtznvckOJr8NM=;
 b=PB0t5BsQsb03B3ym+YNMSCE/l4KeeuZKFC7AcI7WcJTY1vAoKl+RzTgGeRqT9V+I4g
 ugKn9/MipmN2uElrbbRWFjA7GgTpMy+rj26lvH12J5Zg6NW3jA86Q1SHnlqK0CvpGgP8
 QTEvJcRfagfiUpyu5KKZhrD7oYPgkuWO17tJwOn0jlFow/lScF0uUm/e1f3mlvQwbS/N
 8OCkZgnKqp8AxzLJtUGYuWKophBnJfcVLBi/9juWJ+FKSPcGsLOLKA3dZq6B9KyzC88h
 0h1CWoDNCigyVlKJ5pHLYC/Pbh4karMCA01q1uQXL6yu4pEN1sisb7hVE9ARJrrdC42X
 A/XQ==
X-Gm-Message-State: AOAM530XjemBpLcDHuUlImqeSdTuifMSSJMisRj90ox75W3OU6FbPDhh
 GV5n4mv7GVHOlIm69DTOndlOx2Ima+zLgtyA0d/bT5t7KE2XjXO8phxi4wPP0+HnFtk5huuwB/U
 tLFBbcNW6sJspPbE=
X-Received: by 2002:a1f:2555:: with SMTP id l82mr11290433vkl.7.1643742601119; 
 Tue, 01 Feb 2022 11:10:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzISdIZqRwpEMlGk1nO7WRqUZm1a7GKBivSjx8OtDo0pVQx5sh5yfHePTUAgCeO0pO29jXFQA==
X-Received: by 2002:a1f:2555:: with SMTP id l82mr11290423vkl.7.1643742600822; 
 Tue, 01 Feb 2022 11:10:00 -0800 (PST)
Received: from ?IPv6:2804:431:c7f1:95e9:6da1:67bd:fdc3:e12e?
 ([2804:431:c7f1:95e9:6da1:67bd:fdc3:e12e])
 by smtp.gmail.com with ESMTPSA id j17sm4437427vke.52.2022.02.01.11.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 11:10:00 -0800 (PST)
Message-ID: <7ae12835b7423d473ee5e6fd47254b078654e251.camel@redhat.com>
Subject: Re: [PATCH v1 1/1] target/i386: Mask xstate_bv based on the cpu
 enabled features
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
Date: Tue, 01 Feb 2022 16:09:57 -0300
In-Reply-To: <cun8ruwrrqs.fsf@oracle.com>
References: <20220129094644.385841-1-leobras@redhat.com>
 <cun8ruwrrqs.fsf@oracle.com>
User-Agent: Evolution 3.42.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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

Hello David, thanks for this feedback!

On Mon, 2022-01-31 at 12:53 +0000, David Edmondson wrote:
> On Saturday, 2022-01-29 at 06:46:45 -03, Leonardo Bras wrote:
> 
> > The following steps describe a migration bug:
> > 1 - Bring up a VM with -cpu EPYC on a host with EPYC-Milan cpu
> > 2 - Migrate to a host with EPYC-Naples cpu
> > 
> > The guest kernel crashes shortly after the migration.
> > 
> > The crash happens due to a fault caused by XRSTOR:
> > A set bit in XSTATE_BV is not set in XCR0.
> > The faulting bit is FEATURE_PKRU (enabled in Milan, but not in
> > Naples)
> 
> I'm trying to understand how this happens.
> 
> If we boot on EPYC-Milan with "-cpu EPYC", the PKRU feature should
> not
> be exposed to the VM (it is not available in the EPYC CPU).
> 
> Given this, how would bit 0x200 (representing PKRU) end up set in
> xstate_bv?


During my debug, I noticed this bit gets set before the kernel even
starts. 

It's possible Seabios and/or IPXE are somehow setting 0x200 using the
xrstor command. I am not sure if qemu is able to stop this in KVM mode.

If you have any info on this, please let me know.

Best regards,
Leo

> 
> > To avoid this kind of bug:
> > In kvm_get_xsave, mask-out from xstate_bv any bits that are not set
> > in
> > current vcpu's features.
> > 
> > This keeps cpu->env->xstate_bv with feature bits compatible with
> > any
> > host machine capable of running the vcpu model.
> > 
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  target/i386/xsave_helper.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/target/i386/xsave_helper.c
> > b/target/i386/xsave_helper.c
> > index ac61a96344..0628226234 100644
> > --- a/target/i386/xsave_helper.c
> > +++ b/target/i386/xsave_helper.c
> > @@ -167,7 +167,7 @@ void x86_cpu_xrstor_all_areas(X86CPU *cpu,
> > const void *buf, uint32_t buflen)
> >          env->xmm_regs[i].ZMM_Q(1) = ldq_p(xmm + 8);
> >      }
> > 
> > -    env->xstate_bv = header->xstate_bv;
> > +    env->xstate_bv = header->xstate_bv & env-
> > >features[FEAT_XSAVE_COMP_LO];
> > 
> >      e = &x86_ext_save_areas[XSTATE_YMM_BIT];
> >      if (e->size && e->offset) {
> 
> dme.


