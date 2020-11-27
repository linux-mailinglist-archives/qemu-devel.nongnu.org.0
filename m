Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63092C6A42
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 17:55:52 +0100 (CET)
Received: from localhost ([::1]:35890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kih2F-0008Mj-Ld
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 11:55:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kigxD-0004Kf-Ks
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 11:50:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kigx7-0005VI-R0
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 11:50:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606495832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AL69B+mDeAO6m58s2Opgcvqh9DBnxqRt/CwK6uD9aP4=;
 b=GfB1tMd3pZ/lQv9vkwGYDR5kH4nEKbcEEk4sNhM1uS4IBfJMjAXlULx27y8Fj99iTLI1Yi
 p88+iDudIx0pts50tmM2nSevNbafx7eAu1RXo1N0I8TWJIpVfs9SK6NHKB87NvQwI+4Di0
 6jGKft7n/0i4AcMSHJ8iHBjWElUbxTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-8PtLC--pOrq3s4bqxplomQ-1; Fri, 27 Nov 2020 11:50:30 -0500
X-MC-Unique: 8PtLC--pOrq3s4bqxplomQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73EBF107ACF7;
 Fri, 27 Nov 2020 16:50:29 +0000 (UTC)
Received: from gondolin (ovpn-113-65.ams2.redhat.com [10.36.113.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 980A1189B4;
 Fri, 27 Nov 2020 16:50:24 +0000 (UTC)
Date: Fri, 27 Nov 2020 17:50:21 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2] tests/acceptance: add a test for devices on s390x
Message-ID: <20201127175021.38a24e83.cohuck@redhat.com>
In-Reply-To: <20201126130158.1471985-1-cohuck@redhat.com>
References: <20201126130158.1471985-1-cohuck@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 14:01:58 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> This adds a very basic test for checking that we present devices
> in a way that Linux can consume: boot with both virtio-net-ccw and
> virtio-net-pci attached and then verify that Linux is able to see
> and detect these devices.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> RFC->v2:
>  - use a newer kernel that uses the uid in zpci address generation
>  - add a zpci device to specify a uid
>  - increase timeout
>  - tweak naming
>  - add a MAINTAINERS entry
> ---
>  MAINTAINERS                                 |  1 +
>  tests/acceptance/machine_s390_ccw_virtio.py | 70 +++++++++++++++++++++
>  2 files changed, 71 insertions(+)
>  create mode 100644 tests/acceptance/machine_s390_ccw_virtio.py

Queued to s390-next.

I plan to add some more stuff on top (like checking the mac address, or
adding more devices), but that will have to wait until next week.


