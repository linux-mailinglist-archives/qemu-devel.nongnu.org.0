Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF11C35E72F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 21:40:08 +0200 (CEST)
Received: from localhost ([::1]:47896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWOtL-0005Jp-BV
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 15:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lWOsX-0004se-Hd
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 15:39:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lWOsV-0002mR-7v
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 15:39:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618342753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UDehn1qNL6/y6XJ8qrtd8i30Q2lrtk2jGTXHSArdyOI=;
 b=iQcVGGrbuioEGIpO2FfLHPQErftKF0oLl28ntEy77BoJEh1YwI/Po425uLKiprORlJfDp3
 QTkGL833rr9XJjzT5QVcMxJ+MmaAnOGJUib01tcbT5rqFpyYdzIQDsEgVUKegL/tptMN21
 3DCPMu95PpGR2s76W9x7+ZqoipHjY6k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-z3TSK8FUMSKLSKQGJX1OQQ-1; Tue, 13 Apr 2021 15:39:11 -0400
X-MC-Unique: z3TSK8FUMSKLSKQGJX1OQQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 065D28030BB;
 Tue, 13 Apr 2021 19:39:11 +0000 (UTC)
Received: from localhost (ovpn-117-179.rdu2.redhat.com [10.10.117.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98C2419C46;
 Tue, 13 Apr 2021 19:39:10 +0000 (UTC)
Date: Tue, 13 Apr 2021 15:39:10 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH] target/i386: Add CPU model versions supporting 'xsaves'
Message-ID: <20210413193910.72bvoyhbw2ma5nf3@habkost.net>
References: <20210412073952.860944-1-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210412073952.860944-1-vkuznets@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wen Pu <puwen@hygon.cn>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 12, 2021 at 09:39:52AM +0200, Vitaly Kuznetsov wrote:
> Hyper-V 2016 refuses to boot on Skylake+ CPU models because they lack
> 'xsaves'/'vmx-xsaves' features and this diverges from real hardware. The
> same issue emerges with AMD "EPYC" CPU model prior to version 3 which got
> 'xsaves' added. EPYC-Rome/EPYC-Milan CPU models have 'xsaves' enabled from
> the very beginning so the comment blaming KVM to explain why other CPUs
> lack 'xsaves' is likely outdated.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>

I'm queueing this for 6.1.  Thanks!

-- 
Eduardo


