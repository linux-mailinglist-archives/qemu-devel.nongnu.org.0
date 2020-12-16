Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7B62DC77F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 21:03:30 +0100 (CET)
Received: from localhost ([::1]:36268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpd1F-0007TO-Tp
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 15:03:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpcyj-0005Zk-ER
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 15:00:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpcye-0005pX-2e
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 15:00:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608148845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ja05YvowffvJq19lBGeCDqnf/beNGq8Yio6Yg4wrl0k=;
 b=HyqrjkbkO8i+exRFD4lsOgJYYjjm8J72NClAM6EvOpoOZzDATYymsLm6PT7v30Q6Q710bG
 agazXLFHOW35/o2M2uTRQCOuNBZ6YkNjFiNsBtaCzPhiKcGCIkzI0bjVNsQ7ZkDihGSErd
 OFOHslccUSuBT2PejhC1XbJ82n1+IM4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-W21d9qMDNfq9p6cLst-UlA-1; Wed, 16 Dec 2020 15:00:41 -0500
X-MC-Unique: W21d9qMDNfq9p6cLst-UlA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83B1E15726;
 Wed, 16 Dec 2020 20:00:40 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A2D660CD0;
 Wed, 16 Dec 2020 20:00:39 +0000 (UTC)
Date: Wed, 16 Dec 2020 15:00:30 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Cathy Zhang <cathy.zhang@intel.com>
Subject: Re: [PATCH] x86/cpu: Add AVX512_FP16 cpu feature
Message-ID: <20201216200030.GH3140057@habkost.net>
References: <20201216224002.32677-1-cathy.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201216224002.32677-1-cathy.zhang@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 17, 2020 at 06:40:02AM +0800, Cathy Zhang wrote:
> AVX512 Half-precision floating point (FP16) has better performance
> compared to FP32 if the presicion or magnitude requirements are met.
> It's defined as CPUID.(EAX=7,ECX=0):EDX[bit 23].
> 
> Refer to
> https://software.intel.com/content/www/us/en/develop/download/\
> intel-architecture-instruction-set-extensions-programming-reference.html
> 
> Signed-off-by: Cathy Zhang <cathy.zhang@intel.com>

Queued, thanks!

-- 
Eduardo


