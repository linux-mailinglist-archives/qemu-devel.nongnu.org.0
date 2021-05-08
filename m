Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3AC37706A
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 09:31:52 +0200 (CEST)
Received: from localhost ([::1]:59444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfHRH-0008MV-Gk
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 03:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1lfHQ5-0007XD-9K
 for qemu-devel@nongnu.org; Sat, 08 May 2021 03:30:37 -0400
Received: from mga06.intel.com ([134.134.136.31]:32897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1lfHQ2-0002Hi-H2
 for qemu-devel@nongnu.org; Sat, 08 May 2021 03:30:37 -0400
IronPort-SDR: r6bmj8vOvo0YO0aOGxN7/NGXqnL10x4BaqWiCDe3bT5N6FjgQwlIy92QU1S17NknvVf4gtHtiC
 HksRZTPJEG9g==
X-IronPort-AV: E=McAfee;i="6200,9189,9977"; a="260152529"
X-IronPort-AV: E=Sophos;i="5.82,283,1613462400"; d="scan'208";a="260152529"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2021 00:30:26 -0700
IronPort-SDR: zX07f/IfuXY/dXlF1A/8zRl04pRid89jM+ttEw1oEH6AUamFDERgixxu+2wdCgNaBcS5gT9shp
 yEysW0fPJ9zw==
X-IronPort-AV: E=Sophos;i="5.82,283,1613462400"; d="scan'208";a="435270279"
Received: from jingqili-mobl.ccr.corp.intel.com (HELO [10.254.209.233])
 ([10.254.209.233])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2021 00:30:24 -0700
Subject: Re: Adjustments of NVDIMM devices and future data safety
To: Milan Zamazal <mzamazal@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <87y2d0gjw6.fsf@redhat.com>
From: "Liu, Jingqi" <jingqi.liu@intel.com>
Message-ID: <be4c2ff5-9de9-1843-fd1f-1295e64fd68a@intel.com>
Date: Sat, 8 May 2021 15:30:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87y2d0gjw6.fsf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=jingqi.liu@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Lai, Paul C" <paul.c.lai@intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Williams, Dan J" <dan.j.williams@intel.com>, Amnon Ilan <ailan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Milan,

On 4/30/2021 8:18 PM, Milan Zamazal wrote:
> Hi,
>
> I work on NVDIMM support in oVirt/RHV, I think other virtualization
> management software built on top of QEMU may have similar concerns.
>
> When a virtual NVDIMM device size is specified, it's not necessarily the
> eventual NVDIMM device size visible to the guest OS.  As seen in
> https://github.com/qemu/qemu/blob/v6.0.0/hw/mem/nvdimm.c#L117, QEMU
> makes some adjustments (other adjustments are performed by libvirt but
> that's a topic for a different forum):
>
> - NVDIMM label size is subtracted from the NVDIMM size.
>
> - NVDIMM label is pointed to a certain memory region.
>
> - The remaining NVDIMM size is aligned down.
>
> There are some related potential problems:
>
> - If the alignment rules change in a future QEMU version, it may result
>    in a different device size visible to the guest (even if the requested
>    size remains the same) and cause trouble there up to data loss.
>
> - If the layout on the backing device changes, e.g. a label placement,
>    then the stored data may become corrupt or inaccessible.
>
> - I'm not sure about the current QEMU version, but at least in previous
>    QEMU versions, the resulting size is important for memory hot plug.
>    The NVDIMM alignment size is smaller than the required regular memory
>    DIMM placement alignment.  If a VM contains an NVDIMM with the
>    resulting size not matching the DIMM placement requirements and a
>    memory hot plug is attempted then the hot plug fails because the DIMM
>    is mapped next to the end of the NVDIMM region, which is not
>    DIMM-aligned.

Can you explain the details and give an example of how to reproduce this 
issue ?

Thanks,

Jingqi


