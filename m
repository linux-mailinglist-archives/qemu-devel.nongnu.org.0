Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B26993E2A03
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 13:47:27 +0200 (CEST)
Received: from localhost ([::1]:40062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mByJy-0005pq-QE
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 07:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mByIf-0004kF-Qq
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 07:46:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mById-0003lM-UW
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 07:46:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628250362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KD0NZuox0YXblJr8WD2aVzOSa7QBz1Y27/u/1bgpfTI=;
 b=f5hbdsK5LrlRYxzMwARvoHDnSJupHrQqcEusO/RW9s+I7N7mps4JcSYXO4VGn9f45jouXD
 OINL1NV3Slfz+HBnROho3oDA1K8Eub9NvVBZrVB7RtQpjSt524IETZZLtI2G0nww7YDXwo
 77IsS3tLkEvALEB4AP6lVH5vsmmKixo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-5H5HR9N_MD22B_jrab2Mbg-1; Fri, 06 Aug 2021 07:46:01 -0400
X-MC-Unique: 5H5HR9N_MD22B_jrab2Mbg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DF3C1007381;
 Fri,  6 Aug 2021 11:46:00 +0000 (UTC)
Received: from localhost (unknown [10.39.192.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D69060CC9;
 Fri,  6 Aug 2021 11:45:55 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH for-6.2 v2] s390-sclp-events-bus: Use
 OBJECT_DECLARE_SIMPLE_TYPE
In-Reply-To: <20210806024636.446074-1-ehabkost@redhat.com>
Organization: Red Hat GmbH
References: <20210805193431.307761-5-ehabkost@redhat.com>
 <20210806024636.446074-1-ehabkost@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 06 Aug 2021 13:45:54 +0200
Message-ID: <87wnoyyex9.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 05 2021, Eduardo Habkost <ehabkost@redhat.com> wrote:

> We have a SCLPEventsBus struct type defined, but no QOM type
> checkers are declared for the type.
>
> Use OBJECT_DECLARE_SIMPLE_TYPE to declare the struct type and
> have a SCLP_EVENT_BUS typecast wrapper defined.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes v1 -> v2:
> * v1 was previously submitted as part of series:
>   [PATCH for-6.2 0/6] qom: Fix broken OBJECT_CHECK usage
>   at https://lore.kernel.org/qemu-devel/20210805193431.307761-5-ehabkost@redhat.com
> * Fix typo (s/SCLP_EVENT_BUS/SCLP_EVENTS_BUS/)
>
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

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


