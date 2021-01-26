Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEE4303AAA
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 11:47:00 +0100 (CET)
Received: from localhost ([::1]:38382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4LsB-0004fw-L4
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 05:46:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l4Log-0002rB-CG
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 05:43:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l4Loe-0004dH-VS
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 05:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611657800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SCo+2qFaCTusbU+5MB7pno9We2KeLDuMXS++BL4ZYlc=;
 b=c85JNhQoGkikReZNyopyKq8P7osVpNEcA9pQsh8oLWEPTdViRiZJphagx56X9XcF3GAXAY
 XVR0NghdSLN86VgTvsNLn2PhMx0UC1CmrUQJ0AaWKnZ/KStTxftqEsSGrDFzo+CVP6HCD5
 nrDetLPEGsn6tJV6qt6XF8HW7GeAvfQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-PDcyl5HoMUmf_2XUI7CRjg-1; Tue, 26 Jan 2021 05:43:18 -0500
X-MC-Unique: PDcyl5HoMUmf_2XUI7CRjg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 499F7190A7A3;
 Tue, 26 Jan 2021 10:43:16 +0000 (UTC)
Received: from gondolin (ovpn-113-155.ams2.redhat.com [10.36.113.155])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3D5971D61;
 Tue, 26 Jan 2021 10:43:09 +0000 (UTC)
Date: Tue, 26 Jan 2021 11:43:07 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH v3] s390x/cpu_model: disallow unpack for --only-migratable
Message-ID: <20210126114307.0360f109.cohuck@redhat.com>
In-Reply-To: <20210125135332.181324-1-borntraeger@de.ibm.com>
References: <20210125135332.181324-1-borntraeger@de.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 25 Jan 2021 14:53:32 +0100
Christian Borntraeger <borntraeger@de.ibm.com> wrote:

> Secure execution (aka protected virtualization) guests cannot be
> migrated at the moment. If the unpack facility is provided in the cpu
> model, a guest may choose to transition to secure mode, making the
> guest unmigratable at that point in time. If the machine was explicitly
> started with --only-migratable, we would get a failure only when the
> guest actually tries to transition; instead, explicitly disallow the
> unpack facility if --only-migratable was specified to avoid late
> surprises.
> 
> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/cpu_models.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Thanks, applied.


