Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD1A32DB31
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:28:16 +0100 (CET)
Received: from localhost ([::1]:37296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHuZz-00031D-Sd
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:28:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lHuUu-0006GZ-PO
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:23:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lHuUs-00084h-K3
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:23:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614889377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ctHBaiWmVMXY2dhpMNylgQi+2H3HFa+ZzDgg2Gv9ZB4=;
 b=OuqmIQOuaS6/XHMveMZGGhwf3q80ILpkZdoqueDy5aBBQpvwmHC1/LncODJ5qyj7Ap1qhI
 OUQl0ANE7RkH814yA3HvjBx9p7yheZPoSx5FhiTPoVOR2t2OrZdVkuCkBIBW8DJCMOPx2f
 obSm9RQd2dZfhPkJDCws+vvrFrjsxEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-8t23iNwUMvq2cZaRNSO7Wg-1; Thu, 04 Mar 2021 15:22:54 -0500
X-MC-Unique: 8t23iNwUMvq2cZaRNSO7Wg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0BCB1018F64;
 Thu,  4 Mar 2021 20:22:52 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-76.ams2.redhat.com
 [10.36.112.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D11260C0F;
 Thu,  4 Mar 2021 20:22:43 +0000 (UTC)
Subject: Re: [PATCH v3 0/4] acpi: Set proper maximum size for
 "etc/table-loader" blob
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210304105554.121674-1-david@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <978fd3a9-88cd-f132-4234-084667e83bcf@redhat.com>
Date: Thu, 4 Mar 2021 21:22:41 +0100
MIME-Version: 1.0
In-Reply-To: <20210304105554.121674-1-david@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/04/21 11:55, David Hildenbrand wrote:
> Fix and cleanup initializing the maximum size of mutable ACPI blobs.
> 
> v1/v2 -> v3:
> - 'acpi: Set proper maximum size for "etc/table-loader" blob'
> -- Move "etc/table-loader" change to separate patch
> -- Extend description
> -- Fixup maximum size (now really use 64k)
> - Add some patches to cleanup/refactor the code. I avoided using a new
>   enum for the different tables for now, using the table names should be
>   good enough and is simple.
> 
> David Hildenbrand (4):
>   acpi: Set proper maximum size for "etc/table-loader" blob
>   microvm: Don't open-code "etc/table-loader"
>   acpi: Move maximum size logic into acpi_add_rom_blob()
>   acpi: Set proper maximum size for "etc/acpi/rsdp" blob
> 
>  hw/acpi/utils.c             | 17 +++++++++++++++--
>  hw/arm/virt-acpi-build.c    | 12 ++++++------
>  hw/i386/acpi-build.c        |  7 +++----
>  hw/i386/acpi-microvm.c      | 16 ++++++----------
>  include/hw/acpi/aml-build.h |  3 ---
>  include/hw/acpi/utils.h     |  3 +--
>  6 files changed, 31 insertions(+), 27 deletions(-)
> 

series
Reviewed-by: Laszlo Ersek <lersek@redhat.com>


