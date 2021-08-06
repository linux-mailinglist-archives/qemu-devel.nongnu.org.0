Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D62263E21C7
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 04:44:47 +0200 (CEST)
Received: from localhost ([::1]:41858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBpqo-0003Pe-TF
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 22:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBppW-0002he-Kq
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 22:43:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBppV-0002o0-AW
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 22:43:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628217804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F6P7QREKtVH1+bRJbbE8QoP7o6pA4Ps9xZwGYbb0a3I=;
 b=hWEZqAIum040DY48ZIZdgssmapRgORrx3hfDKYKPTPfLhBaMcAYvD2gu7oTqevrLPuUQgz
 POMsE3RCpTCSM+kdgMOcgHgd7It4pHCvoMsZ3SHYDgw29lVH8wkqEBhSs6+lhG4/bYe751
 cjtEovK7z7oMR5lpU2C1Ke5qv/AaJvg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-oUDCHSDgPAS6QpSItzDqsg-1; Thu, 05 Aug 2021 22:43:21 -0400
X-MC-Unique: oUDCHSDgPAS6QpSItzDqsg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C875180FCBB;
 Fri,  6 Aug 2021 02:43:20 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D168E60BF4;
 Fri,  6 Aug 2021 02:43:09 +0000 (UTC)
Date: Thu, 5 Aug 2021 22:43:09 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH for-6.2 4/6] s390-sclp-events-bus: Use
 OBJECT_DECLARE_SIMPLE_TYPE
Message-ID: <20210806024309.wo45klp35qeq4v5e@habkost.net>
References: <20210805193431.307761-1-ehabkost@redhat.com>
 <20210805193431.307761-5-ehabkost@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210805193431.307761-5-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 05, 2021 at 03:34:29PM -0400, Eduardo Habkost wrote:
> We have a SCLPEventsBus struct type defined, but no QOM type
> checkers are declared for the type.
> 
> Use OBJECT_DECLARE_SIMPLE_TYPE to declare the struct type and
> have a SCLP_EVENT_BUS typecast wrapper defined.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: qemu-s390x@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  hw/s390x/event-facility.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/s390x/event-facility.c b/hw/s390x/event-facility.c
> index 0a65e16cdd9..9f7883d6e20 100644
> --- a/hw/s390x/event-facility.c
> +++ b/hw/s390x/event-facility.c
> @@ -328,6 +328,7 @@ static void write_event_mask(SCLPEventFacility *ef, SCCB *sccb)
>  /* qemu object creation and initialization functions */
>  
>  #define TYPE_SCLP_EVENTS_BUS "s390-sclp-events-bus"
> +OBJECT_DECLARE_SIMPLE_TYPE(SCLPEventsBus, SCLP_EVENT_BUS)

Oops, a typo (should be SCLP_EVENTS_BUS instead).  I will submit
v2 later as a standalone patch.

-- 
Eduardo


