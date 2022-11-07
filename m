Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A179620258
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 23:36:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAhe-0002Ip-HS; Mon, 07 Nov 2022 17:34:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alison.schofield@intel.com>)
 id 1osAhc-0002Ih-Ir
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:34:48 -0500
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alison.schofield@intel.com>)
 id 1osAha-0002xR-20
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:34:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667860486; x=1699396486;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tHr4J8z3pEPEgvZgRQBKNsHQLZGpXYp89ckMk8enDho=;
 b=B9y+VAmiLZdhRvBfFpGdbjCwgjr0+T794+HDg7Ei8NCelPvQe9kqlZdL
 s7lDKO//wXKxyRR0ejktHs6kTeZvl0oJzH2R2tHgks8Yvlh2i0pUhilym
 1c/3GviYlgMuoD50rNX2OTFN+lLIIB6aKAHoSSJ3FIvhVDYGVO698Hc06
 +GMMavfWa0uu6QLgNdGQ4BpjZsoX/1ApqibijyINT9AXLHTXLmny6PsPL
 q30+FO2IepWm3ie90easRkGljoCMGt/1h5XT3s9FzeBJCqVY1Y04b5E9u
 OK/HoeSvXe2wtWr8kjPBojhci8gnF6MX5CX1q1z8QzDTkUl4ObbDAYbUi Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="310542457"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="310542457"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 14:34:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="699666180"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="699666180"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2)
 ([10.209.100.77])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 14:34:40 -0800
Date: Mon, 7 Nov 2022 14:34:38 -0800
From: Alison Schofield <alison.schofield@intel.com>
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: jonathan.cameron@huawei.com, mst@redhat.com, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org
Subject: Re: [PATCH] docs/cxl: Fix some typos
Message-ID: <Y2mH/jyY90uZv3cz@aschofie-mobl2>
References: <20221107180923.27072-1-dave@stgolabs.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107180923.27072-1-dave@stgolabs.net>
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=alison.schofield@intel.com; helo=mga14.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Nov 07, 2022 at 10:09:23AM -0800, Davidlohr Bueso wrote:
> Found while reading the doc.
> 
> Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
> ---
>  docs/system/devices/cxl.rst | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/system/devices/cxl.rst b/docs/system/devices/cxl.rst
> index abf7c1f24305..891bbd65d9d8 100644
> --- a/docs/system/devices/cxl.rst
> +++ b/docs/system/devices/cxl.rst
> @@ -83,7 +83,7 @@ CXL Fixed Memory Windows (CFMW)
>  A CFMW consists of a particular range of Host Physical Address space
>  which is routed to particular CXL Host Bridges.  At time of generic
to 'a' particular

>  software initialization it will have a particularly interleaving
s/particularly/particular or just remove usage of the entire word
here and above. Not sure that 'particular'  is particularly helpful
here ;)

> -configuration and associated Quality of Serice Throtling Group (QTG).
> +configuration and associated Quality of Service Throttling Group (QTG).
>  This information is available to system software, when making
>  decisions about how to configure interleave across available CXL
>  memory devices.  It is provide as CFMW Structures (CFMWS) in

s/provide/provided


> @@ -98,7 +98,7 @@ specification defined register interface called CXL Host Bridge
>  Component Registers (CHBCR). The location of this CHBCR MMIO
>  space is described to system software via a CXL Host Bridge
>  Structure (CHBS) in the CEDT ACPI table.  The actual interfaces
> -are identical to those used for other parts of the CXL heirarchy
> +are identical to those used for other parts of the CXL hierarchy
>  as CXL Component Registers in PCI BARs.
>  
>  Interfaces provided include:
> @@ -111,7 +111,7 @@ Interfaces provided include:
>  
>  CXL Root Ports (CXL RP)
>  ~~~~~~~~~~~~~~~~~~~~~~~
> -A CXL Root Port servers te same purpose as a PCIe Root Port.
> +A CXL Root Port servers the same purpose as a PCIe Root Port.

s/servers/serves

>  There are a number of CXL specific Designated Vendor Specific
>  Extended Capabilities (DVSEC) in PCIe Configuration Space
>  and associated component register access via PCI bars.
> @@ -143,7 +143,7 @@ CXL Memory Devices - Type 3
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  CXL type 3 devices use a PCI class code and are intended to be supported
>  by a generic operating system driver. They have HDM decoders
> -though in these EP devices, the decoder is reponsible not for
> +though in these EP devices, the decoder is responsible not for

s/"responsible not"/"not responsible"

>  routing but for translation of the incoming host physical address (HPA)
>  into a Device Physical Address (DPA).
>  
> @@ -209,7 +209,7 @@ Notes:
>      ranges of the system physical address map.  Each CFMW has
>      particular interleave setup across the CXL Host Bridges (HB)
>      CFMW0 provides uninterleaved access to HB0, CFW2 provides
> -    uninterleaved acess to HB1. CFW1 provides interleaved memory access
> +    uninterleaved access to HB1. CFW1 provides interleaved memory access
>      across HB0 and HB1.

s/CFW1/CFMW1  s/CFW2/CFMW2

>  
>  (2) **Two CXL Host Bridges**. Each of these has 2 CXL Root Ports and
> @@ -282,7 +282,7 @@ Example topology involving a switch::
>              ---------------------------------------------------
>             |    Switch 0  USP as PCI 0d:00.0                   |
>             |    USP has HDM decoder which direct traffic to    |
> -           |    appropiate downstream port                     |
> +           |    appropriate downstream port                    |

to 'the' or to 'an' approp...

>             |    Switch BUS appears as 0e                       |
>             |x__________________________________________________|
>              |                  |               |              |

OK - after picking at this a bit, and only picking at the pieces
I see in this diff, I'll suggest a check back through this section
entirely, rather than the piecemeal spelling corrections.

Alison



> -- 
> 2.38.0
> 

