Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972C233BA5D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 15:10:44 +0100 (CET)
Received: from localhost ([::1]:38988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLnvf-0001wJ-Jq
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 10:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lLnsH-0006qW-4m
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:07:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lLnsD-0002VN-GO
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:07:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615817228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jAK1087zHhuLD7zb3qtaL7/ZGnseM94jqZswAb1bkYQ=;
 b=dXy0rw8/uiM1vn+wZ9DZhC4KZ4++TjhccPXBNnXLesmJs05rR0XUp6NMu32wnK/w5K26aj
 B+M3gAZDVllVU/cXSl0sb3ge64XnQUGDXfjkXlVdOt2HkHrcNlnpuPjUOOk5SE16SVwitu
 4CWYSXpR9Ws6WFqVArr7+VWhXTnTugo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-n4w73xfdMtmPrRjC8B2afg-1; Mon, 15 Mar 2021 10:07:04 -0400
X-MC-Unique: n4w73xfdMtmPrRjC8B2afg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47DFD10866A5;
 Mon, 15 Mar 2021 14:07:03 +0000 (UTC)
Received: from localhost (unknown [10.40.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C738F620DE;
 Mon, 15 Mar 2021 14:06:53 +0000 (UTC)
Date: Mon, 15 Mar 2021 15:06:52 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 0/4] acpi: Set proper maximum size for
 "etc/table-loader" blob
Message-ID: <20210315150652.086f4e27@redhat.com>
In-Reply-To: <20210304105554.121674-1-david@redhat.com>
References: <20210304105554.121674-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  4 Mar 2021 11:55:50 +0100
David Hildenbrand <david@redhat.com> wrote:

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

Reviewed-by: Igor Mammedov <imammedo@redhat.com>


