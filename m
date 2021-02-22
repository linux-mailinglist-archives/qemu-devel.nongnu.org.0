Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB56C3214D7
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 12:12:11 +0100 (CET)
Received: from localhost ([::1]:39152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE98M-0003vf-FM
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 06:12:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lE97W-0003TT-Bw
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 06:11:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lE97T-0005RK-Ae
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 06:11:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613992274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fE7mnnw7gi55B/Yq2NJBK3OBE4RZmlk/I+uFKGEBExs=;
 b=E8zZIJ4sSx1EVqfFGuN+HhNAw/NetGtfcm8byIZGo++LIc1RPqMfwZYNjXfsTEnRElLH3f
 1VF9ABF0ht4VoBWn/iRFqKwXMMUJmENvzXek3kx+5zpvL2PqSjOiAhbkdU9je228Mb0bUJ
 tFps6u7gaz8w7ad8laJVLGnArkxPSUQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-7lXZRTIoNd6Te0ikCcPbaA-1; Mon, 22 Feb 2021 06:11:12 -0500
X-MC-Unique: 7lXZRTIoNd6Te0ikCcPbaA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1D9E835E23;
 Mon, 22 Feb 2021 11:11:10 +0000 (UTC)
Received: from gondolin (ovpn-113-115.ams2.redhat.com [10.36.113.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F024E5D9CC;
 Mon, 22 Feb 2021 11:11:05 +0000 (UTC)
Date: Mon, 22 Feb 2021 12:11:03 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v2 0/1] css: SCHIB measurement block origin must be aligned
Message-ID: <20210222121103.6801c004.cohuck@redhat.com>
In-Reply-To: <1613741973-3711-1-git-send-email-pmorel@linux.ibm.com>
References: <1613741973-3711-1-git-send-email-pmorel@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: thuth@redhat.com, david@redhat.com, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Feb 2021 14:39:32 +0100
Pierre Morel <pmorel@linux.ibm.com> wrote:

> Hi,
> 
> By testing Measurement with KVM unit tests I fall on this:
> we forgot to test the alignment of the MBO for measurement format 1.
> 
> The last 6 bits of the MBO must be null, i.e. an aligned on 64 bytes
> of the MBO, otherwise an operand exception is recognized when issuing
> a msch instruction.
> 
> Regards,
> Pierre
> 
> 
> Pierre Morel (1):
>   css: SCHIB measurement block origin must be aligned
> 
>  target/s390x/ioinst.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Thanks, applied.


