Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6B44AA7A6
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 09:25:42 +0100 (CET)
Received: from localhost ([::1]:49008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGGO5-0006PS-C4
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 03:25:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nGGLb-0005hp-4B
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 03:23:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nGGLW-0003iL-8c
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 03:23:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644049380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x1D/qYaF4g8PIwHeddlmjWVGskUfVpBz/9n/c6VG3og=;
 b=W0LocXuRY6CQDv0f+BCwHmSXVwFkAXLE4jAHACpbeH6wbm2UhbanB1dFQS8/9wkjlXuAkU
 Dg2QWCJyWtPMJBBdNsBpihhPABotI+hzCjww0ozgy0mYOd5ohqpkUdvfBYDiAfzjvl07NY
 LiFpOTAdRAJ7aMVDxkGTL6+0xe5nJmY=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-Pg5SK-vYMtG8QeaqlWX9ww-1; Sat, 05 Feb 2022 03:22:59 -0500
X-MC-Unique: Pg5SK-vYMtG8QeaqlWX9ww-1
Received: by mail-lj1-f198.google.com with SMTP id
 f4-20020a05651c160400b002442a0b1344so518360ljq.3
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 00:22:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=x1D/qYaF4g8PIwHeddlmjWVGskUfVpBz/9n/c6VG3og=;
 b=l5/f4ld2aLqTXpPN4s5paalWARQ2Ssv1o2EszaSGD6PtwNp2B0/j7IPo1J5szzpgry
 gIN2RA7lzWc7H62Tf9+2gcAN50S/tOc94plcnbige6WKvSy2F8AdnTUtyr5RyoG8tXMQ
 s8Trr1hcv6C6UHQV0crdSYRzT4QF+zkuDhzjsPnapVAYqiH2AosoIvEhujenlOtywj6m
 NBtLjuDTt7nA3xaEb1a3nK0cDXDZMXnSq3qydf70JC9VTawPrpt6WHOenUZ5cAICRYku
 dftetDzsh9Ez4wdlTD9vBxgwKebhOz1napked+eFbO5FP51LjWGRNETQMRlM7qKGGboQ
 Cd+Q==
X-Gm-Message-State: AOAM532SkAtZftyjd0ohHRWzdgZEno8A2LpO1l7QwV7fGAlysxwCSchd
 DnS37mTcsfcDuNHcdIfB//Se7ob5BS3YjJPpgvf4sGCFlL7yiNlXtSuQm4KfzqQizvFP8RnXyh8
 x0BKmo0PMhCls44KwzivDa9tdPpoKR4g=
X-Received: by 2002:a05:651c:b13:: with SMTP id
 b19mr1937710ljr.162.1644049371988; 
 Sat, 05 Feb 2022 00:22:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/Q8Zf71cM0oWoJeu7Hedc/YTUI32AN3PsyCECFy7UFGB2vUG4g/cjnsqsOWx8zdCzDNGDNQzP1sHKLN9NmVQ=
X-Received: by 2002:a05:651c:b13:: with SMTP id
 b19mr1937701ljr.162.1644049371731; 
 Sat, 05 Feb 2022 00:22:51 -0800 (PST)
MIME-Version: 1.0
References: <20220129094644.385841-1-leobras@redhat.com>
 <cun8ruwrrqs.fsf@oracle.com>
 <7ae12835b7423d473ee5e6fd47254b078654e251.camel@redhat.com>
 <cun1r0lqnjt.fsf@oracle.com>
In-Reply-To: <cun1r0lqnjt.fsf@oracle.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Sat, 5 Feb 2022 05:22:40 -0300
Message-ID: <CAJ6HWG782JtbgZZ4f64t1hwb8Un6X5U=3mhx9K3tT0WX82i7Tw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] target/i386: Mask xstate_bv based on the cpu
 enabled features
To: David Edmondson <david.edmondson@oracle.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello David, thank you for the feedback.

On Wed, Feb 2, 2022 at 12:47 PM David Edmondson
<david.edmondson@oracle.com> wrote:
>
> On Tuesday, 2022-02-01 at 16:09:57 -03, Leonardo Br=C3=A1s wrote:
>
> > Hello David, thanks for this feedback!
> >
> > On Mon, 2022-01-31 at 12:53 +0000, David Edmondson wrote:
> >> On Saturday, 2022-01-29 at 06:46:45 -03, Leonardo Bras wrote:
> >>
> >> > The following steps describe a migration bug:
> >> > 1 - Bring up a VM with -cpu EPYC on a host with EPYC-Milan cpu
> >> > 2 - Migrate to a host with EPYC-Naples cpu
> >> >
> >> > The guest kernel crashes shortly after the migration.
> >> >
> >> > The crash happens due to a fault caused by XRSTOR:
> >> > A set bit in XSTATE_BV is not set in XCR0.
> >> > The faulting bit is FEATURE_PKRU (enabled in Milan, but not in
> >> > Naples)
> >>
> >> I'm trying to understand how this happens.
> >>
> >> If we boot on EPYC-Milan with "-cpu EPYC", the PKRU feature should
> >> not
> >> be exposed to the VM (it is not available in the EPYC CPU).
> >>
> >> Given this, how would bit 0x200 (representing PKRU) end up set in
> >> xstate_bv?
> >
> > During my debug, I noticed this bit gets set before the kernel even
> > starts.
> >
> > It's possible Seabios and/or IPXE are somehow setting 0x200 using the
> > xrstor command. I am not sure if qemu is able to stop this in KVM mode.
>
> I don't believe that this should be possible.
>
> If the CPU is set to EPYC in QEMU then .features[FEAT_7_0_ECX] does not
> include CPUID_7_0_ECX_PKU, which in turn means that when
> x86_cpu_enable_xsave_components() generates FEAT_XSAVE_COMP_LO it should
> not set XSTATE_PKRU_BIT.
>
> Given that, KVM's vcpu->arch.guest_supported_xcr0 will not include
> XSTATE_PKRU_BIT, and __kvm_set_xcr() should not allow that bit to be
> set when it intercepts the guest xsetbv instruction.

Thanks for sharing those details, it helped me on the kernel side of this b=
ug.

FWIW, i did send a patchset fixing this bug to kernel list:
https://patchwork.kernel.org/project/kvm/list/?series=3D611524&state=3D%2A&=
archive=3Dboth


Best regards,
Leo


