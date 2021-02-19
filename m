Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA4931F6D3
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 10:55:00 +0100 (CET)
Received: from localhost ([::1]:48144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD2V1-0001Zr-1q
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 04:54:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lD2T6-0000Y7-95
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 04:53:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lD2T1-0002UR-9x
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 04:52:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613728373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KM07xwfnFsNdj4DhgsdzZyKu4D10/3U87C+DF89Z7to=;
 b=O0ZjY9P58yUoDwu7CWuMmdAbuRxPXAKWIh05jAPHCKR+CKh793r+npAskhaoiT9x9zYCl7
 AkciPQBpSLRPbGNPgeGpuYPGZ0zUfiMDquDzcVTvEH+YxHETcbIAh38BO/5FPzR1kKeJfV
 I2Gp8v5+ZsuUdt4jWysHD6pkmNSpros=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-D7iP5eFAOVqzmoacZabqcw-1; Fri, 19 Feb 2021 04:52:51 -0500
X-MC-Unique: D7iP5eFAOVqzmoacZabqcw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A68A6D517;
 Fri, 19 Feb 2021 09:52:50 +0000 (UTC)
Received: from gondolin (ovpn-113-92.ams2.redhat.com [10.36.113.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B03419D80;
 Fri, 19 Feb 2021 09:52:45 +0000 (UTC)
Date: Fri, 19 Feb 2021 10:52:42 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH] s390x/pci: restore missing Query PCI Function CLP data
Message-ID: <20210219105242.3f011b51.cohuck@redhat.com>
In-Reply-To: <1613681609-9349-1-git-send-email-mjrosato@linux.ibm.com>
References: <1613681609-9349-1-git-send-email-mjrosato@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Feb 2021 15:53:29 -0500
Matthew Rosato <mjrosato@linux.ibm.com> wrote:

> Some CLP response data was accidentally dropped when fixing endianness
> issues with the Query PCI Function CLP response.  All of these values are
> sent as 0s to the guest for emulated devices, so the impact is only
> observed on passthrough devices.
> 
> Fixes: a4e2fff1b104 ("s390x/pci: fix endianness issues")
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>  hw/s390x/s390-pci-inst.c | 5 +++++
>  1 file changed, 5 insertions(+)

Whoops.

Thanks, applied.


