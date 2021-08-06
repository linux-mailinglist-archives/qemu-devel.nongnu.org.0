Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FBD3E29FF
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 13:46:17 +0200 (CEST)
Received: from localhost ([::1]:37834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mByIp-0004DG-Hm
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 07:46:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mByH2-0003Po-9p
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 07:44:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mByGz-0002Gr-UB
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 07:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628250261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x7IznZdPtLQehslMIPseWllYM+afeftcoiHTbyFdCcw=;
 b=jQcUhxFONjkOY16m//+BFqI3O2vutQ+fBUijApOwE1t00AEUsgy3xY2HdgAWmggu8LahN6
 srWvIuFg4M7ecyDftThwznFFXGHm+HubHpkRbBfijZCF/JphlJSThP6PX2/jLoVJ7Lp0Bt
 cdfR0alYLrwpL4TCLHgwLmss7GIMpk8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-Wf6jaBABMh6MpnOTzogY7g-1; Fri, 06 Aug 2021 07:44:20 -0400
X-MC-Unique: Wf6jaBABMh6MpnOTzogY7g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09540107BEF7;
 Fri,  6 Aug 2021 11:44:19 +0000 (UTC)
Received: from localhost (unknown [10.39.192.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0CA610190AA;
 Fri,  6 Aug 2021 11:44:14 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH for-6.2 3/6] s390-sclp-events-bus: Set instance_size
In-Reply-To: <20210805193431.307761-4-ehabkost@redhat.com>
Organization: Red Hat GmbH
References: <20210805193431.307761-1-ehabkost@redhat.com>
 <20210805193431.307761-4-ehabkost@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 06 Aug 2021 13:44:13 +0200
Message-ID: <87zgtuyf02.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
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

> We have a SCLPEventsBus struct defined, but the struct is not
> used at the TypeInfo definition.  This works today but will break
> silently if anybody adds a new field to SCLPEventsBus.
>
> Set instance_size properly to avoid problems in the future.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: qemu-s390x@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  hw/s390x/event-facility.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

(I assume that you'll queue the whole series yourself? Or should we pick
the s390x parts separately?)


