Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1D5582878
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 16:21:28 +0200 (CEST)
Received: from localhost ([::1]:37564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGhuh-0008Nd-Dy
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 10:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oGhkt-0000ar-UW
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 10:11:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oGhkr-0001PQ-2g
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 10:11:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658931076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/wNQfdMIEwccRcFyDR5tF9vG3wcecftNVcfLB84yfKU=;
 b=GiBNVmNI+lbjNTQ6BKCP40Brqu2VIEvdLDzt3DoRL3I61pvqZdxKDqp/sqoBt/JxzDKEqL
 07rHDYGDFYlR1lEla+Uqajw30ASEW25mtM+1vr+Tg9nAnRyhqa8At7TQLe5zbWjBWIz8sq
 qJaJm+dA3H8q7E6YsuwCkJuyqEVurpw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-SGaF8cX_M2-m_raCDOFsDw-1; Wed, 27 Jul 2022 10:11:12 -0400
X-MC-Unique: SGaF8cX_M2-m_raCDOFsDw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82F258037B3;
 Wed, 27 Jul 2022 14:11:11 +0000 (UTC)
Received: from localhost (unknown [10.39.193.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3529090A11;
 Wed, 27 Jul 2022 14:11:11 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Huth
 <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 Janosch Frank <frankja@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v2] s390x/cpumodel: add stfl197
 processor-activity-instrumentation extension 1
In-Reply-To: <20220727135120.12784-1-borntraeger@linux.ibm.com>
Organization: Red Hat GmbH
References: <20220727135120.12784-1-borntraeger@linux.ibm.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Wed, 27 Jul 2022 16:11:09 +0200
Message-ID: <87a68umyrm.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, Jul 27 2022, Christian Borntraeger <borntraeger@linux.ibm.com> wrote:

> Add stfle 197 (processor-activity-instrumentation extension 1) to the
> gen16 default model and fence it off for 7.1 and older.
>
> Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> ---
> v1->v2:
> - this is on top of "hw: Add compat machines for 7.2" from Cornelia Huck
> (please queue afterwards)
> - move fencing to 7.1
>
>  hw/s390x/s390-virtio-ccw.c          | 1 +
>  target/s390x/cpu_features_def.h.inc | 1 +
>  target/s390x/gen-features.c         | 2 ++
>  3 files changed, 4 insertions(+)

Acked-by: Cornelia Huck <cohuck@redhat.com>


