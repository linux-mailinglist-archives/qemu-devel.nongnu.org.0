Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D30464CE15
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 14:57:03 +0200 (CEST)
Received: from localhost ([::1]:47484 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdwcf-0002DV-LH
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 08:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40455)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hdwYM-0000TH-Fl
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 08:52:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hdwS5-0000iz-E4
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 08:46:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45438)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1hdwS4-0000hu-4b; Thu, 20 Jun 2019 08:46:04 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 373463079B8F;
 Thu, 20 Jun 2019 12:45:58 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E2F65D9C6;
 Thu, 20 Jun 2019 12:45:51 +0000 (UTC)
Date: Thu, 20 Jun 2019 14:45:50 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190620144550.7cbb23ed@redhat.com>
In-Reply-To: <20190522162252.28568-3-shameerali.kolothum.thodi@huawei.com>
References: <20190522162252.28568-1-shameerali.kolothum.thodi@huawei.com>
 <20190522162252.28568-3-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 20 Jun 2019 12:45:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v5 2/8] hw/acpi: Do not create memory
 hotplug method when handler is not defined
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 shannon.zhaosl@gmail.com, qemu-devel@nongnu.org, xuwei5@hisilicon.com,
 linuxarm@huawei.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 May 2019 17:22:46 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> From: Samuel Ortiz <sameo@linux.intel.com>
> 
> With Hardware-reduced ACPI, the GED device will manage ACPI
> hotplug entirely. As a consequence, make the memory specific
> events AML generation optional. The code will only be added
> when the method name is not NULL.
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/memory_hotplug.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index c724f5f1e4..7e30e6f886 100644
> --- a/hw/acpi/memory_hotplug.c
> +++ b/hw/acpi/memory_hotplug.c
> @@ -719,10 +719,12 @@ void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
>      }
>      aml_append(table, dev_container);
>  
> -    method = aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
> -    aml_append(method,
> -        aml_call0(MEMORY_DEVICES_CONTAINER "." MEMORY_SLOT_SCAN_METHOD));
> -    aml_append(table, method);
> +    if (event_handler_method) {
> +        method = aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
> +        aml_append(method, aml_call0(MEMORY_DEVICES_CONTAINER "."
> +                                     MEMORY_SLOT_SCAN_METHOD));
> +        aml_append(table, method);
> +    }
>  
>      g_free(mhp_res_path);
>  }


