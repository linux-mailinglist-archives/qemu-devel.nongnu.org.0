Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7456C25FE54
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 18:13:26 +0200 (CEST)
Received: from localhost ([::1]:42792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFJll-0001rZ-ER
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 12:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kFJkl-0000Mj-Ua
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 12:12:23 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:32783
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kFJkk-0004ng-1q
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 12:12:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599495141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y95f8IdO+kTxtEfcvv17+nbKKkKOoj7h65/sT40wtUk=;
 b=XAPoMU4tJ1B+Pl6sOs2emLW4M98Lu27uTSjwBa1tBdlXj7JLT+Mf7V/6QjNPUwszhVr/C/
 3JBRttXZjjAkVvgcG02HXG9h/iHIQp5rGMHRQo/r2eEYrTW0gtuGNkMO2LrZTDJvVRfmec
 KDb59FRlFmnZzdeWtEsZgb/1nzDbLMc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-6rEYeJwrMIqr5NKL7TRrHQ-1; Mon, 07 Sep 2020 12:12:19 -0400
X-MC-Unique: 6rEYeJwrMIqr5NKL7TRrHQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55EFB802B69;
 Mon,  7 Sep 2020 16:12:18 +0000 (UTC)
Received: from gondolin (ovpn-112-249.ams2.redhat.com [10.36.112.249])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4D2B5C1BB;
 Mon,  7 Sep 2020 16:12:10 +0000 (UTC)
Date: Mon, 7 Sep 2020 18:12:08 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 2/2] virtio-iommu-pci: force virtio version 1
Message-ID: <20200907181208.145d2f6e.cohuck@redhat.com>
In-Reply-To: <20200902131152.1219-3-eric.auger@redhat.com>
References: <20200902131152.1219-1-eric.auger@redhat.com>
 <20200902131152.1219-3-eric.auger@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 03:05:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jean-philippe@linaro.org, thuth@redhat.com, mst@redhat.com,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed,  2 Sep 2020 15:11:52 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Commit 9b3a35ec82 ("virtio: verify that legacy support is not
> accidentally on") added a safety check that requires to set
> 'disable-legacy=on' on virtio-iommu-pci:
> 
> qemu-system-aarch64: -device virtio-iommu-pci: device is modern-only,
> use disable-legacy=on
> 
> virtio-iommu was introduced after the release of VIRTIO 1.0
> specifications, so it should be 'modern-only'.
> 
> This patch forces virtio version 1 and removes the 'transitional_name'
> property removing the need to specify 'disable-legacy=on' on
> virtio-iommu-pci device.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/virtio/virtio-iommu-pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


