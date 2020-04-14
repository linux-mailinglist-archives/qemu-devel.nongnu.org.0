Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430E01A7B97
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 15:01:04 +0200 (CEST)
Received: from localhost ([::1]:60302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOLBW-0007iH-Mq
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 09:01:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38151)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1jOLAK-00079m-He
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 08:59:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1jOLAJ-0008Nq-8o
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 08:59:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47901
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1jOLAJ-0008NM-1i
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 08:59:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586869186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EZ7/3pcoMsgtirPek6rQxPVsq7nkmiGAcKsImKAzRSA=;
 b=gMt+Ji7dcFb8zhGSFtrCi2Gue8Qd0htlAk86xq5KNm2HVZWMhphRyzMu0GKN5T29pksoH0
 cab3LoSyVKNhxxfbFFmooQnByHEDUBPP944fIT6ecwjkFOt0MCUulVcPftVkjibm15g39H
 BeUJsYLT5ekOzISNf9uVQeuHXdiP934=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-5hnlNAfnNseMw-s1Asb6lA-1; Tue, 14 Apr 2020 08:59:44 -0400
X-MC-Unique: 5hnlNAfnNseMw-s1Asb6lA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C36B8017FD;
 Tue, 14 Apr 2020 12:59:43 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.194.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E184860BE1;
 Tue, 14 Apr 2020 12:59:41 +0000 (UTC)
Date: Tue, 14 Apr 2020 14:59:38 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [for-5.0] Deprecate KVM support for AArch32
Message-ID: <20200414125938.bzyf5xlvchmx436o@kamzik.brq.redhat.com>
References: <20200414120935.12719-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20200414120935.12719-1-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 14, 2020 at 01:09:35PM +0100, Peter Maydell wrote:
> The Linux kernel has dropped support for allowing 32-bit Arm systems
> to host KVM guests (kernel commit 541ad0150ca4aa663a2, which just
> landed upstream in the 5.7 merge window).  Mark QEMU's support for
> this configuration as deprecated, so that we can delete that support
> code in 5.2.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I was reading the 5.7 merge window writeup on LWN this weekend
> and saw that the dropping of 32-bit support had gone in; just
> enough time to squeeze our deprecation warning into 5.0 so we
> can drop the code in 5.2 rather than 6.0...
>=20
>  docs/system/deprecated.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index c633fe2beff..3142fac3865 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -336,6 +336,14 @@ The ``compat`` property used to set backwards compat=
ibility modes for
>  the processor has been deprecated. The ``max-cpu-compat`` property of
>  the ``pseries`` machine type should be used instead.
> =20
> +KVM guest support on 32-bit Arm hosts (since 5.0)
> +'''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +The Linux kernel has dropped support for allowing 32-bit Arm systems
> +to host KVM guests as of the 5.7 kernel. Accordingly, QEMU is deprecatin=
g
> +its support for this configuration and will remove it in a future versio=
n.
> +Running 32-bit guests on a 64-bit Arm host remains supported.
> +
>  System emulator devices
>  -----------------------
> =20
> --=20
> 2.20.1
>=20
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


