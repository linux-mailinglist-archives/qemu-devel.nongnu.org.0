Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C0017DF73
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 13:02:00 +0100 (CET)
Received: from localhost ([::1]:41776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBH6d-0002f3-Qy
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 08:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53863)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1jBH5c-0001w7-12
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 08:00:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1jBH5a-0005YH-Ud
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 08:00:55 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37864
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1jBH5a-0005Y1-RH
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 08:00:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583755254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ae/HcGopL4IKgJ0MjwGidc1zloipall9ZQoSMymFcxU=;
 b=OYyCimojlQ7TAMXnBxNKaGhXQTxjk5VpAtBdSUhGRR4zO85JKOsACW3fM3OaAz1O0yZeit
 Jz1NiEcfyUhzKdEzdRzEflefg1crJH6iqwimoLy7aX0OSkZ1pKMOarjWH46u5blMhUx6K3
 aRUBcE15KbVsiyQvwukErpKBCWp0pE0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-eg0LmcZMMIa2ACg13u3Rfw-1; Mon, 09 Mar 2020 08:00:49 -0400
X-MC-Unique: eg0LmcZMMIa2ACg13u3Rfw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A62F0107BAFA;
 Mon,  9 Mar 2020 12:00:47 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F83A9353C;
 Mon,  9 Mar 2020 12:00:14 +0000 (UTC)
Date: Mon, 9 Mar 2020 13:00:12 +0100
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [kvm-unit-tests PATCH v4 00/13] arm/arm64: Add ITS tests
Message-ID: <20200309120012.xkgmlbvd5trm6ewk@kamzik.brq.redhat.com>
References: <20200309102420.24498-1-eric.auger@redhat.com>
 <20200309115741.6stx5tpkb6s6ejzh@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309115741.6stx5tpkb6s6ejzh@kamzik.brq.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, kvm@vger.kernel.org,
 maz@kernel.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 andre.przywara@arm.com, yuzenghui@huawei.com, alexandru.elisei@arm.com,
 kvmarm@lists.cs.columbia.edu, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 09, 2020 at 12:57:51PM +0100, Andrew Jones wrote:
> This looks pretty good to me. It just needs some resquashing cleanups.
> Does Andre plan to review? I've only been reviewing with respect to
> the framework, not ITS. If no other reviews are expected, then I'll
> queue the next version.

Oops, sorry Zenghui, I forgot to ask if you'll be reviewing again as
well.

Thanks,
drew


