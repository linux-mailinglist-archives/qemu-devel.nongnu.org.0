Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C15020AF61
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 12:04:29 +0200 (CEST)
Received: from localhost ([::1]:33072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jolDg-00066o-4Z
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 06:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jolCe-0005dv-CR
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 06:03:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44891
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jolCc-0004gg-Ni
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 06:03:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593165801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ooqtieOB+GfgpWYDOCEk6heDOq9I5DTOJBh1Zhj0SyI=;
 b=K47v1R0djonBA+GNNklNJospoIgrFvTDybEbeUsORRsa2FNYhp3nc5HOgfsYYB6ZjvMQbz
 I2rO0J/8U5mTKQD7W6DR4NvLYvuDpjd4lg4wMKz34uHTdrmtIOFowFJcFvljg90wyCAuxH
 Qyqh3No+P6FIVSzjMtms23zRPRGVlWg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-6lqQGMn3PpisrpcxJCq5UA-1; Fri, 26 Jun 2020 06:03:20 -0400
X-MC-Unique: 6lqQGMn3PpisrpcxJCq5UA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69AC118A8221;
 Fri, 26 Jun 2020 10:03:18 +0000 (UTC)
Received: from gondolin (ovpn-112-215.ams2.redhat.com [10.36.112.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C50F1974A;
 Fri, 26 Jun 2020 10:03:10 +0000 (UTC)
Date: Fri, 26 Jun 2020 12:03:08 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Collin Walling <walling@linux.ibm.com>
Subject: Re: [PATCH v4 8/8] s390: guest support for diagnose 0x318
Message-ID: <20200626120308.7aae13ec.cohuck@redhat.com>
In-Reply-To: <20200624202312.28349-9-walling@linux.ibm.com>
References: <20200624202312.28349-1-walling@linux.ibm.com>
 <20200624202312.28349-9-walling@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=cohuck@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, mst@redhat.com, david@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, svens@linux.ibm.com, pbonzini@redhat.com,
 mihajlov@linux.ibm.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Jun 2020 16:23:12 -0400
Collin Walling <walling@linux.ibm.com> wrote:

> DIAGNOSE 0x318 (diag318) is an s390 instruction that allows the storage
> of diagnostic information that is collected by the firmware in the case
> of hardware/firmware service events.
> 
> QEMU handles the instruction by storing the info in the CPU state. A
> subsequent register sync will communicate the data to the hypervisor.
> 
> QEMU handles the migration via a VM State Description.
> 
> This feature depends on the Extended-Length SCCB (els) feature. If
> els is not present, then a warning will be printed and the SCLP bit
> that allows the Linux kernel to execute the instruction will not be
> set.
> 
> Availability of this instruction is determined by byte 134 (aka fac134)
> bit 0 of the SCLP Read Info block. This coincidentally expands into the
> space used for CPU entries, which means VMs running with the diag318
> capability may not be able to read information regarding all CPUs
> unless the guest kernel supports an extended-length SCCB.
> 
> This feature is not supported in protected virtualization mode.
> 
> Signed-off-by: Collin Walling <walling@linux.ibm.com>
> Acked-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  hw/s390x/sclp.c                     |  5 +++++
>  include/hw/s390x/sclp.h             |  3 +++
>  target/s390x/cpu.h                  |  2 ++
>  target/s390x/cpu_features.h         |  1 +
>  target/s390x/cpu_features_def.inc.h |  3 +++
>  target/s390x/cpu_models.c           |  1 +
>  target/s390x/gen-features.c         |  1 +
>  target/s390x/kvm.c                  | 31 +++++++++++++++++++++++++++++
>  target/s390x/machine.c              | 17 ++++++++++++++++
>  9 files changed, 64 insertions(+)

Acked-by: Cornelia Huck <cohuck@redhat.com>


