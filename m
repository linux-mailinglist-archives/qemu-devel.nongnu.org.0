Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9C6203732
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 14:49:19 +0200 (CEST)
Received: from localhost ([::1]:52052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnLt0-00071A-R2
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 08:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jnLrm-0005qE-T3
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 08:48:02 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:51300
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jnLrl-0004G6-67
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 08:48:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592830079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s0ZPOfoPHVpQEHMDzpyMK1YzLcvWcDZ/3xuGpHq/8dc=;
 b=cpUlCFmb8DvW485/gbPDyaYfgn6baQ7oragNJYYhfe4aBdqsQe7k5UjVeCa8le24t+Zu89
 WaRV/k+RF905xnrgXSer9dlVlOqnjpULE4UlxuABwVQ3trUUuij4RBuFcuo+TBVOhbLBr+
 4tgx1ilgraaMLxoiWKERukHcDz8c9sY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-VAk09nz7M4S7C4yQX1T22w-1; Mon, 22 Jun 2020 08:47:56 -0400
X-MC-Unique: VAk09nz7M4S7C4yQX1T22w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1582E8014D4;
 Mon, 22 Jun 2020 12:47:55 +0000 (UTC)
Received: from localhost (unknown [10.40.208.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D59D05C1BD;
 Mon, 22 Jun 2020 12:47:42 +0000 (UTC)
Date: Mon, 22 Jun 2020 14:47:41 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v6 3/3] docs/specs/tpm: ACPI boot now supported for TPM/ARM
Message-ID: <20200622144741.7c5e788a@redhat.com>
In-Reply-To: <20200619141851.16272-4-eric.auger@redhat.com>
References: <20200619141851.16272-1-eric.auger@redhat.com>
 <20200619141851.16272-4-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 03:17:49
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, drjones@redhat.com,
 mst@redhat.com, lersek@redhat.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, marcandre.lureau@redhat.com,
 eric.auger.pro@gmail.com, philmd@redhat.com, ardb@kernel.org,
 stefanb@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Jun 2020 16:18:51 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> ACPI boot now is supported. Let's remove the comment
> saying it is not.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  docs/specs/tpm.rst | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
> index 5e61238bc5..eeeb93730a 100644
> --- a/docs/specs/tpm.rst
> +++ b/docs/specs/tpm.rst
> @@ -346,8 +346,6 @@ In case an Arm virt machine is emulated, use the following command line:
>      -drive if=pflash,format=raw,file=flash0.img,readonly \
>      -drive if=pflash,format=raw,file=flash1.img
>  
> -  On Arm, ACPI boot with TPM is not yet supported.
> -
>  In case SeaBIOS is used as firmware, it should show the TPM menu item
>  after entering the menu with 'ESC'.
>  


