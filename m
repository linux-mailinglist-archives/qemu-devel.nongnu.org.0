Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC7338B836
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 22:18:26 +0200 (CEST)
Received: from localhost ([::1]:56184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljp7h-0004wE-CI
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 16:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ljp5t-0003Uq-5c
 for qemu-devel@nongnu.org; Thu, 20 May 2021 16:16:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ljp5r-0007Ol-JX
 for qemu-devel@nongnu.org; Thu, 20 May 2021 16:16:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621541790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P6l+6GC0LgvbBsnc1hlStKMXjECUinxVAPUr+NG8V4w=;
 b=H2h043qwyA2UTdK5iJr0zJAVZrwKRO6ZIPoomI9iDSQ15R4qxd9+BaqrOlYwiGyzCsJCkk
 TUUzjQQhbl/4eFKmkUQNiA8n3m5spz7rJkvSzlERe8qniZGluO/3+emsEOlDLynC8zvxjM
 me4SyNyg/zT2J7i16ZjmFzIQyPgWDrI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-n3O2AcmwOhW1UKMEv-bkxw-1; Thu, 20 May 2021 16:16:29 -0400
X-MC-Unique: n3O2AcmwOhW1UKMEv-bkxw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF2FC8015F5
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 20:16:28 +0000 (UTC)
Received: from localhost (ovpn-115-27.rdu2.redhat.com [10.10.115.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BE3660C04;
 Thu, 20 May 2021 20:16:26 +0000 (UTC)
Date: Thu, 20 May 2021 16:16:26 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v6 08/19] i386: introduce hv_cpuid_cache
Message-ID: <20210520201626.kdx2rla7s5rfcveo@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-9-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210422161130.652779-9-vkuznets@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

On Thu, Apr 22, 2021 at 06:11:19PM +0200, Vitaly Kuznetsov wrote:
> Just like with cpuid_cache, it makes no sense to call
> KVM_GET_SUPPORTED_HV_CPUID more than once and instead of (ab)using
> env->features[] and/or trying to keep all the code in one place, it is
> better to introduce persistent hv_cpuid_cache and hv_cpuid_get_host()
> accessor to it.
> 
> Note, hv_cpuid_get_fw() is converted to using hv_cpuid_get_host()
> just to be removed later with Hyper-V specific feature words.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo


