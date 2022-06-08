Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40C2543049
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 14:29:29 +0200 (CEST)
Received: from localhost ([::1]:49628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyuoS-00060x-B2
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 08:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nyuZo-0006Bb-S4
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 08:14:22 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nyuZj-0002UJ-AK
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 08:14:19 -0400
Received: from fraeml706-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LJ5dz4Rlhz67jfG;
 Wed,  8 Jun 2022 20:10:31 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml706-chm.china.huawei.com (10.206.15.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Wed, 8 Jun 2022 14:14:03 +0200
Received: from localhost (10.122.247.231) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.24; Wed, 8 Jun
 2022 13:14:03 +0100
Date: Wed, 8 Jun 2022 13:14:01 +0100
To: Davidlohr Bueso <dave@stgolabs.net>
CC: Paolo Bonzini <pbonzini@redhat.com>, <qemu-devel@nongnu.org>, "Michael S .
 Tsirkin" <mst@redhat.com>, <linux-cxl@vger.kernel.org>,
 <linuxarm@huawei.com>, <alex.bennee@linaro.org>, Marcel Apfelbaum
 <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, "Adam
 Manzanares" <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>,
 "Ben Widawsky" <ben.widawsky@intel.com>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>, Sean Christopherson
 <sean.j.christopherson@intel.com>, Yang Zhong <yang.zhong@intel.com>
Subject: Re: [PATCH v2 1/8] hw/cxl: Make the CXL fixed memory window setup a
 machine parameter.
Message-ID: <20220608131401.00004364@huawei.com>
In-Reply-To: <20220607223702.lpq34pq6wqnvr7ej@offworld>
References: <20220601164235.2117-1-Jonathan.Cameron@huawei.com>
 <20220601164235.2117-2-Jonathan.Cameron@huawei.com>
 <20220607223702.lpq34pq6wqnvr7ej@offworld>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml703-chm.china.huawei.com (10.201.108.52) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Tue, 7 Jun 2022 15:37:02 -0700
Davidlohr Bueso <dave@stgolabs.net> wrote:

> On Wed, 01 Jun 2022, Jonathan Cameron wrote:
> 
> >Paolo Bonzini requested this change to simplify the ongoing
> >effort to allow machine setup entirely via RPC.
> >
> >Includes shortening the command line form cxl-fixed-memory-window
> >to cxl-fmw as the command lines are extremely long even with this
> >change.
> >
> >The json change is needed to ensure that there is
> >a CXLFixedMemoryWindowOptionsList even though the actual
> >element in the json is never used. Similar to existing
> >SgxEpcProperties.
> >
> >Update cxl-test and bios-tables-test to reflect new parameters.
> >
> >Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>  
> 
> Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>

Thanks.

> 
> One thing missing however is updating qemu-options.hx - maybe fold
> in the below?

Excellent point. 

The original patch set has been rolling so long I'd forgotten we had
documentation in qemu-options.hx.

One comment inline though...
> 
> Thanks!
> 
> ----8<-------
> o
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 60cf188da429..3bcf1247b88a 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -127,10 +127,43 @@ SRST
>   ERST
>   
>   DEF("M", HAS_ARG, QEMU_OPTION_M,
> +    "                cxl-fmw.0.targets.0=firsttarget,cxl-fmw.0.targets.1=secondtarget,cxl-fmw.0.size=size[,cxl-fmw.0.interleave-granularity=granularity]\n"

This _M entry is odd, given it's just short hand for _machine.  So I'm thinking
it makes more sense to document this lot in the "machine" block further up the doc.
That particular entry has a different style to this one, so I'll modify this inline
with existing entries there.

Possibly someone should move the sgx entry over to machine as well.
+Cc Sean Chistopherson and Yan Zhong as that sgx-epc entry is from their patch set.
A quick glance through discussion of that patch didn't throw up a
reason for doing it as a separate entry, but I haven't dug deep.



>       "                sgx-epc.0.memdev=memid,sgx-epc.0.node=numaid\n",
>       QEMU_ARCH_ALL)
>   
>   SRST
> +``cxl-fmw.0.targets.0=firsttarget,cxl-fmw.0.targets.1=secondtarget,cxl-fmw.0.size=size[,cxl-fmw.0.interleave-granularity=granularity]``
> +    Define a CXL Fixed Memory Window (CFMW).
> +
> +    Described in the CXL 2.0 ECN: CEDT CFMWS & QTG _DSM.
> +
> +    They are regions of Host Physical Addresses (HPA) on a system which
> +    may be interleaved across one or more CXL host bridges.  The system
> +    software will assign particular devices into these windows and
> +    configure the downstream Host-managed Device Memory (HDM) decoders
> +    in root ports, switch ports and devices appropriately to meet the
> +    interleave requirements before enabling the memory devices.
> +
> +    ``targets.X=firsttarget`` provides the mapping to CXL host bridges
> +    which may be identified by the id provied in the -device entry.
> +    Multiple entries are needed to specify all the targets when
> +    the fixed memory window represents interleaved memory. X is the
> +    target index from 0.
> +
> +    ``size=size`` sets the size of the CFMW. This must be a multiple of
> +    256MiB. The region will be aligned to 256MiB but the location is
> +    platform and configuration dependent.
> +
> +    ``interleave-granularity=granularity`` sets the granularity of
> +    interleave. Default 256KiB. Only 256KiB, 512KiB, 1024KiB, 2048KiB
> +    4096KiB, 8192KiB and 16384KiB granularities supported.
> +
> +    Example:
> +
> +    ::
> +
> +	-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=128G,cxl-fmw.0.interleave-granularity=512k
> +
>   ``sgx-epc.0.memdev=@var{memid},sgx-epc.0.node=@var{numaid}``
>       Define an SGX EPC section.
>   ERST
> @@ -467,44 +500,6 @@ SRST
>           -numa hmat-cache,node-id=1,size=10K,level=1,associativity=direct,policy=write-back,line=8
>   ERST
>   
> -DEF("cxl-fixed-memory-window", HAS_ARG, QEMU_OPTION_cxl_fixed_memory_window,
> -    "-cxl-fixed-memory-window targets.0=firsttarget,targets.1=secondtarget,size=size[,interleave-granularity=granularity]\n",
> -    QEMU_ARCH_ALL)
> -SRST
> -``-cxl-fixed-memory-window targets.0=firsttarget,targets.1=secondtarget,size=size[,interleave-granularity=granularity]``
> -    Define a CXL Fixed Memory Window (CFMW).
> -
> -    Described in the CXL 2.0 ECN: CEDT CFMWS & QTG _DSM.
> -
> -    They are regions of Host Physical Addresses (HPA) on a system which
> -    may be interleaved across one or more CXL host bridges.  The system
> -    software will assign particular devices into these windows and
> -    configure the downstream Host-managed Device Memory (HDM) decoders
> -    in root ports, switch ports and devices appropriately to meet the
> -    interleave requirements before enabling the memory devices.
> -
> -    ``targets.X=firsttarget`` provides the mapping to CXL host bridges
> -    which may be identified by the id provied in the -device entry.
> -    Multiple entries are needed to specify all the targets when
> -    the fixed memory window represents interleaved memory. X is the
> -    target index from 0.
> -
> -    ``size=size`` sets the size of the CFMW. This must be a multiple of
> -    256MiB. The region will be aligned to 256MiB but the location is
> -    platform and configuration dependent.
> -
> -    ``interleave-granularity=granularity`` sets the granularity of
> -    interleave. Default 256KiB. Only 256KiB, 512KiB, 1024KiB, 2048KiB
> -    4096KiB, 8192KiB and 16384KiB granularities supported.
> -
> -    Example:
> -
> -    ::
> -
> -        -cxl-fixed-memory-window targets.0=cxl.0,targets.1=cxl.1,size=128G,interleave-granularity=512k
> -
> -ERST
> -
>   DEF("add-fd", HAS_ARG, QEMU_OPTION_add_fd,
>       "-add-fd fd=fd,set=set[,opaque=opaque]\n"
>       "                Add 'fd' to fd 'set'\n", QEMU_ARCH_ALL)


