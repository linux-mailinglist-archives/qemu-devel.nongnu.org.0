Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D43A38B82A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 22:14:51 +0200 (CEST)
Received: from localhost ([::1]:50534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljp4E-0000wX-7z
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 16:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ljp2z-0000Ga-8H
 for qemu-devel@nongnu.org; Thu, 20 May 2021 16:13:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ljp2w-0005VJ-DD
 for qemu-devel@nongnu.org; Thu, 20 May 2021 16:13:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621541608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qgViUnzwmAn3l2PkqOh7U0s8ouhJ2+RO5BgabplXVqA=;
 b=iIiT6b0F63Av/oypEaj2y/+0cw1zAI3tz4CyWdBqGTV9hUh4y5+rwOwGNrBWM3NSH8HBVr
 lXGnK2nfe+f5R4BM7NGU+1BjiD3M1MDajELL8oVHZJPNaOnDxieZCfsp0EdGUe5Q8LA++1
 PKiQRwlmx4JTQmE+04mHLZmo3aw436Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-MyyO7RqxPR6vDXM9TioUuw-1; Thu, 20 May 2021 16:13:26 -0400
X-MC-Unique: MyyO7RqxPR6vDXM9TioUuw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0FDA180FD66
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 20:13:25 +0000 (UTC)
Received: from localhost (ovpn-115-27.rdu2.redhat.com [10.10.115.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9F9C5D9DC;
 Thu, 20 May 2021 20:13:25 +0000 (UTC)
Date: Thu, 20 May 2021 16:13:25 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v6 07/19] i386: drop FEAT_HYPERV feature leaves
Message-ID: <20210520201325.7nvg5ggxte4kxelq@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-8-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210422161130.652779-8-vkuznets@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 22, 2021 at 06:11:18PM +0200, Vitaly Kuznetsov wrote:
> Hyper-V feature leaves are weird. We have some of them in
> feature_word_info[] array but we don't use feature_word_info
> magic to enable them. Neither do we use feature_dependencies[]
> mechanism to validate the configuration as it doesn't allign
> well with Hyper-V's many-to-many dependency chains. Some of
> the feature leaves hold not only feature bits, but also values.
> E.g. FEAT_HV_NESTED_EAX contains both features and the supported
> Enlightened VMCS range.
> 
> Hyper-V features are already represented in 'struct X86CPU' with
> uint64_t hyperv_features so duplicating them in env->features adds
> little (or zero) benefits. THe other half of Hyper-V emulation features
> is also stored with values in hyperv_vendor_id[], hyperv_limits[],...
> so env->features[] is already incomplete.
> 
> Remove Hyper-V feature leaves from env->features[] completely.
> kvm_hyperv_properties[] is converted to using raw CPUID func/reg
> pairs for features, this allows us to get rid of hv_cpuid_get_fw()
> conversion.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  target/i386/cpu.c     |  90 +----------------------------------
>  target/i386/cpu.h     |   5 --
>  target/i386/kvm/kvm.c | 108 ++++++++++++++----------------------------
>  3 files changed, 37 insertions(+), 166 deletions(-)

Nice diffstat!

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo


