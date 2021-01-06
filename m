Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7022EBE57
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 14:15:02 +0100 (CET)
Received: from localhost ([::1]:52460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx8eT-0002Cw-9u
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 08:15:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kx8cp-0001ek-6X
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 08:13:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kx8cl-00086Q-2d
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 08:13:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609938790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tTUC25xmnmmK665cgUnSETVnV3UdJHG1fJLSGxOj7d8=;
 b=GgZwYF/YyabAfgGLgeXLR4Apz085tjTNtEn4uhi/k+951Ydpnz5tr+Yg0gslRtZTVYyRc8
 DDh4BtFtCX16bOgtdKOy4e/RD812OrcUjyB9zt4REzVzZewPDiT3p/u2RXv9bylfid0k3S
 sjtQn1aiTWwrRPCapTVisNQEb+FbmNU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-g3926R2AN6yV5XLpIYHpYQ-1; Wed, 06 Jan 2021 08:13:09 -0500
X-MC-Unique: g3926R2AN6yV5XLpIYHpYQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B41D800D53
 for <qemu-devel@nongnu.org>; Wed,  6 Jan 2021 13:13:08 +0000 (UTC)
Received: from localhost (unknown [10.40.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EBFF5C1C4;
 Wed,  6 Jan 2021 13:13:06 +0000 (UTC)
Date: Wed, 6 Jan 2021 14:13:03 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH 5/5] i386: provide simple 'hyperv=on' option to x86
 machine types
Message-ID: <20210106141303.145790f7@redhat.com>
In-Reply-To: <87a6tnibv4.fsf@vitty.brq.redhat.com>
References: <20201119103221.1665171-1-vkuznets@redhat.com>
 <20201119103221.1665171-6-vkuznets@redhat.com>
 <20201216205202.GJ3140057@habkost.net>
 <20201218181340.5e398280@redhat.com>
 <87r1n0j20n.fsf@vitty.brq.redhat.com>
 <20210105000435.1cf4c6f6@redhat.com>
 <87lfd7iowi.fsf@vitty.brq.redhat.com>
 <20210105170312.32cf0e12@redhat.com>
 <87a6tnibv4.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 05 Jan 2021 17:31:43 +0100
Vitaly Kuznetsov <vkuznets@redhat.com> wrote:

> Igor Mammedov <imammedo@redhat.com> writes:
> 
> > On Tue, 05 Jan 2021 12:50:05 +0100
> >
> > I think there is a misunderstanding, idea was:
> >
> > cpu_initfn() {
> >     //current set
> >     cpu->default_hyperv_cpu_features = ACD
> > }
> >
> > compat_props_5.1 {
> >    cpu.default_hyperv_cpu_features = AB
> > }
> >
> > compat_props_5.2 {
> >    cpu.default_hyperv_cpu_features = ABC
> > }
> >  
> 
> ...
> 
> > I was talking about CPU features/properties only, it doesn't apply to other devices.
> > It makes sense for machine to have a knob to create onboard hyperv specific
> > devices if there is any (do we have any?).
> >
> > If there aren't any currently, I wouldn't bother with machine knob
> > and just use -cpu foo,hv_default=on or -device cpu,hv_default=on
> > like any other cpu feature.
> >  
> 
> We don't currently have any devices which are not 'CPU features' (in
> QEMU terminology), however, we already have Vmbus and I can easily
> imagine us implementing e.g. hartbeat/kvp/vss/... devices on top. We
> *may* want to enable these 'automatically' and that's what make
> '-machine' option preferable. It is, however, not a *must* right now and
> we can indeed wait until these devices appear and be happy with
> 'hv_default' -cpu option for now. We will, however, need to teach upper
> layers about the change when/if it happens.

which makes me think we are trying to bite something that we shouldn't.
Do we really need this patch (QEMU knob) to magically enable subset of
features and/or devices for a specific OS flavor?

It's job of upper layers to abstract low level QEMU details in to coarse
grained knobs (libvirt/virt-install/virt-manager/...).
For example virt-install may know that it installing a specific Windows
version, and can build a tailored for that OS configuration including
needed hyperv CPU features and hyperv specific devices.
(if I'm not mistaken libosinfo is used to get metadata for preferred
configuration, so perhaps this should become a patch for that library
and its direct users).

What we actually lack is a documentation for preferred configuration
in docs/hyperv.txt, currently it just enumerates possible features.
We can just document a recommended 'best practices' there without
putting it in QEMU code and let upper layers to do their job in
the stack.


