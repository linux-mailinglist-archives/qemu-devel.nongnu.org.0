Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4296737A72
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 19:03:08 +0200 (CEST)
Received: from localhost ([127.0.0.1]:35365 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYvn9-0003Wi-FP
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 13:03:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hYvl1-0002Pj-FZ
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 13:00:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hYvkw-0007Uc-20
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 13:00:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:7135)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hYvkr-00078v-Uo
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 13:00:49 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 561EE7E423;
	Thu,  6 Jun 2019 17:00:31 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 37D0C10ABD61;
	Thu,  6 Jun 2019 17:00:23 +0000 (UTC)
Date: Thu, 6 Jun 2019 19:00:19 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Tao Xu <tao3.xu@intel.com>
Message-ID: <20190606190019.510a0e35@redhat.com>
In-Reply-To: <20190508061726.27631-11-tao3.xu@intel.com>
References: <20190508061726.27631-1-tao3.xu@intel.com>
	<20190508061726.27631-11-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 06 Jun 2019 17:00:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 10/11] acpi: introduce
 build_acpi_aml_common for NFIT generalizations
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, jingqi.liu@intel.com,
	qemu-devel@nongnu.org, ehabkost@redhat.com, pbonzini@redhat.com,
	rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed,  8 May 2019 14:17:25 +0800
Tao Xu <tao3.xu@intel.com> wrote:

> The aim of this patch is to move some of the NFIT Aml-build codes into
> build_acpi_aml_common(), and then NFIT and HMAT can both use it.
too generic function name, pls name it so it would express what it's doing.

The same applies to commit message, from this one I have no idea what
and why is being done (even if it was me who suggested the change).
Commit message should describe what and why functionality is being
generalized so it would be clear to anyone.

> Reviewed-by: Liu Jingqi <jingqi.liu@intel.com>
> Signed-off-by: Tao Xu <tao3.xu@intel.com>
> ---
> 
> Changes in v4 -> v3:
>     - Split 8/8 of patch v3 into two parts, introduces NFIT
>     generalizations (build_acpi_aml_common)
> ---
>  hw/acpi/nvdimm.c        | 49 +++++++++++++++++++++++++++--------------
>  include/hw/mem/nvdimm.h |  6 +++++
>  2 files changed, 38 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> index 9fdad6dc3f..e2be79a8b7 100644
> --- a/hw/acpi/nvdimm.c
> +++ b/hw/acpi/nvdimm.c
> @@ -1140,12 +1140,11 @@ static void nvdimm_build_device_dsm(Aml *dev, uint32_t handle)
>  
>  static void nvdimm_build_fit(Aml *dev)
>  {
> -    Aml *method, *pkg, *buf, *buf_size, *offset, *call_result;
> -    Aml *whilectx, *ifcond, *ifctx, *elsectx, *fit;
> +    Aml *method, *pkg, *buf, *buf_name, *buf_size, *call_result;
>  
>      buf = aml_local(0);
>      buf_size = aml_local(1);
> -    fit = aml_local(2);
> +    buf_name = aml_local(2);
>  
>      aml_append(dev, aml_name_decl(NVDIMM_DSM_RFIT_STATUS, aml_int(0)));
>  
> @@ -1164,6 +1163,22 @@ static void nvdimm_build_fit(Aml *dev)
>                              aml_int(1) /* Revision 1 */,
>                              aml_int(0x1) /* Read FIT */,
>                              pkg, aml_int(NVDIMM_QEMU_RSVD_HANDLE_ROOT));
> +
> +    build_acpi_aml_common(method, buf, buf_size,
> +                          call_result, buf_name, dev,
> +                          "RFIT", "_FIT",
> +                          NVDIMM_DSM_RET_STATUS_SUCCESS,
> +                          NVDIMM_DSM_RET_STATUS_FIT_CHANGED);
> +}
> +
> +void build_acpi_aml_common(Aml *method, Aml *buf, Aml *buf_size,
> +                           Aml *call_result, Aml *buf_name, Aml *dev,
> +                           const char *help_function, const char *method_name,
> +                           int ret_status_success,
> +                           int ret_status_changed)
> +{
> +    Aml *offset, *whilectx, *ifcond, *ifctx, *elsectx;
> +
>      aml_append(method, aml_store(call_result, buf));
>  
>      /* handle _DSM result. */
> @@ -1174,7 +1189,7 @@ static void nvdimm_build_fit(Aml *dev)
>                                   aml_name(NVDIMM_DSM_RFIT_STATUS)));
>  
>       /* if something is wrong during _DSM. */
> -    ifcond = aml_equal(aml_int(NVDIMM_DSM_RET_STATUS_SUCCESS),
> +    ifcond = aml_equal(aml_int(ret_status_success),
>                         aml_name("STAU"));
>      ifctx = aml_if(aml_lnot(ifcond));
>      aml_append(ifctx, aml_return(aml_buffer(0, NULL)));
> @@ -1185,7 +1200,7 @@ static void nvdimm_build_fit(Aml *dev)
>                                      aml_int(4) /* the size of "STAU" */,
>                                      buf_size));
>  
> -    /* if we read the end of fit. */
> +    /* if we read the end of fit or hma. */
>      ifctx = aml_if(aml_equal(buf_size, aml_int(0)));
>      aml_append(ifctx, aml_return(aml_buffer(0, NULL)));
>      aml_append(method, ifctx);
> @@ -1196,38 +1211,38 @@ static void nvdimm_build_fit(Aml *dev)
>      aml_append(method, aml_return(aml_name("BUFF")));
>      aml_append(dev, method);
>  
> -    /* build _FIT. */
> -    method = aml_method("_FIT", 0, AML_SERIALIZED);
> +    /* build _FIT or _HMA. */
> +    method = aml_method(method_name, 0, AML_SERIALIZED);
>      offset = aml_local(3);
>  
> -    aml_append(method, aml_store(aml_buffer(0, NULL), fit));
> +    aml_append(method, aml_store(aml_buffer(0, NULL), buf_name));
>      aml_append(method, aml_store(aml_int(0), offset));
>  
>      whilectx = aml_while(aml_int(1));
> -    aml_append(whilectx, aml_store(aml_call1("RFIT", offset), buf));
> +    aml_append(whilectx, aml_store(aml_call1(help_function, offset), buf));
>      aml_append(whilectx, aml_store(aml_sizeof(buf), buf_size));
>  
>      /*
> -     * if fit buffer was changed during RFIT, read from the beginning
> -     * again.
> +     * if buffer was changed during RFIT or RHMA,
> +     * read from the beginning again.
>       */
>      ifctx = aml_if(aml_equal(aml_name(NVDIMM_DSM_RFIT_STATUS),
> -                             aml_int(NVDIMM_DSM_RET_STATUS_FIT_CHANGED)));
> -    aml_append(ifctx, aml_store(aml_buffer(0, NULL), fit));
> +                             aml_int(ret_status_changed)));
> +    aml_append(ifctx, aml_store(aml_buffer(0, NULL), buf_name));
>      aml_append(ifctx, aml_store(aml_int(0), offset));
>      aml_append(whilectx, ifctx);
>  
>      elsectx = aml_else();
>  
> -    /* finish fit read if no data is read out. */
> +    /* finish fit or hma read if no data is read out. */
>      ifctx = aml_if(aml_equal(buf_size, aml_int(0)));
> -    aml_append(ifctx, aml_return(fit));
> +    aml_append(ifctx, aml_return(buf_name));
>      aml_append(elsectx, ifctx);
>  
>      /* update the offset. */
>      aml_append(elsectx, aml_add(offset, buf_size, offset));
> -    /* append the data we read out to the fit buffer. */
> -    aml_append(elsectx, aml_concatenate(fit, buf, fit));
> +    /* append the data we read out to the fit or hma buffer. */
> +    aml_append(elsectx, aml_concatenate(buf_name, buf, buf_name));
>      aml_append(whilectx, elsectx);
>      aml_append(method, whilectx);
>  
> diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
> index 523a9b3d4a..6f04eddb40 100644
> --- a/include/hw/mem/nvdimm.h
> +++ b/include/hw/mem/nvdimm.h
> @@ -25,6 +25,7 @@
>  
>  #include "hw/mem/pc-dimm.h"
>  #include "hw/acpi/bios-linker-loader.h"
> +#include "hw/acpi/aml-build.h"
>  
>  #define NVDIMM_DEBUG 0
>  #define nvdimm_debug(fmt, ...)                                \
> @@ -150,4 +151,9 @@ void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
>                         uint32_t ram_slots);
>  void nvdimm_plug(NVDIMMState *state);
>  void nvdimm_acpi_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev);
> +void build_acpi_aml_common(Aml *method, Aml *buf, Aml *buf_size,
> +                           Aml *call_result, Aml *buf_name, Aml *dev,
> +                           const char *help_function, const char *method_name,
> +                           int ret_status_success,
> +                           int ret_status_changed);
>  #endif


