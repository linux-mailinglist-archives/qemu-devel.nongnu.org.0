Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9260DF1CDF
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Nov 2019 18:55:07 +0100 (CET)
Received: from localhost ([::1]:33843 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSPWM-00031C-Ho
	for lists+qemu-devel@lfdr.de; Wed, 06 Nov 2019 12:55:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50662)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iSPUG-000228-RM
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 12:52:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iSPUF-0000Qc-5o
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 12:52:56 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:37460
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iSPUF-0000MM-2Z
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 12:52:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573062773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kxccAulp2H9KiGiCKasLaPzlUz0orGJjTHDfwzfUEpc=;
 b=A7Y5HVeB1vVMdLnJEKeZX+sfIWuEMgwy+vANT8KymbfBY5cKUrQqMaWok/xanrbOuvMhKT
 z8vq5VTg/kute508U10PQtMJULgscXNFpVj83qs7BU0FfQtB/o9zU9GgmItnsA8P0gz0le
 +/0ZKUIV2CmPR7HfvcJtyfwAikYxV54=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-JRI6_7IxOMG1E4HRWFxCmA-1; Wed, 06 Nov 2019 12:52:49 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1C148017E0;
 Wed,  6 Nov 2019 17:52:47 +0000 (UTC)
Received: from gondolin (dhcp-192-218.str.redhat.com [10.33.192.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B22A5D9D6;
 Wed,  6 Nov 2019 17:52:42 +0000 (UTC)
Date: Wed, 6 Nov 2019 18:52:40 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Subject: Re: [RFC v2 02/14] standard-headers: import arm_sdei.h
Message-ID: <20191106185240.3f5e2c2a.cohuck@redhat.com>
In-Reply-To: <20191105091056.9541-3-guoheyi@huawei.com>
References: <20191105091056.9541-1-guoheyi@huawei.com>
 <20191105091056.9541-3-guoheyi@huawei.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: JRI6_7IxOMG1E4HRWFxCmA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, James Morse <james.morse@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, wanghaibin.wang@huawei.com,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 Nov 2019 17:10:44 +0800
Heyi Guo <guoheyi@huawei.com> wrote:

> Import Linux header file include/uapi/linux/arm_sdei.h from kernel v5.4-r=
c5.
>=20
> This is to prepare for qemu SDEI emulation.
>=20
> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Dave Martin <Dave.Martin@arm.com>
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> ---
>=20
> Notes:
>     v2:
>     - Import arm_sdei.h by running update-linux-headers.sh
>=20
>  include/standard-headers/linux/arm_sdei.h | 73 +++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 include/standard-headers/linux/arm_sdei.h

Just a remark that I find it a bit odd that that a header that looks
arm-specific is in the generic linux/ directory (already in the kernel,
I know.) Is this for sharing between arm and arm64, maybe?


