Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D926FF6E2
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 18:15:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px8wc-0008Dk-Je; Thu, 11 May 2023 12:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1px8wY-0008BA-98
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:15:02 -0400
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1px8wV-0001OS-Hz
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:15:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683821699; x=1715357699;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9gHPvVK+7JiEuY4VrN4AAchmLi6CSfRBTIUl4SFLRSU=;
 b=ScC/zBwOAwVC1sCdfI0y1SO3SqFdA1nU+xl2fR9XtqmpSfqxmfz2lEVi
 uaCDGWJ9rOfuCfvBh/XMFXxTceImvjy4oLqeUvzTtRsrVIpZ76x8UtDlb
 fpMtNKlzUYgUkStANKx3jWYjin8GO9Ub0kQzIqdSnOUZlO7VtU+SypnIp
 unLEJ9d9QjKgMZaMgl0PGrtpAfx5jvlbuswiQtlNcmBwKNv0hvabZWB87
 AwcQGPyOGfm/bp7dm/yehZ//YA8FhwW1O0OY75+qO/lGzKdd1gWGF1Ef5
 s/SR7bjOarx8bwIzfNFbdttZNX/HyottvY8P4q3w4h8GOSb885eoHEWuC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="330905814"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="330905814"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 09:14:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="874036848"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="874036848"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO [10.212.95.11])
 ([10.212.95.11])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 09:14:54 -0700
Message-ID: <8f6c1506-9254-6390-2777-218f2d275cad@intel.com>
Date: Thu, 11 May 2023 09:14:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 0/3] QEMU ACPI generic port support
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: qemu-devel@nongnu.org, imammedo@redhat.com, ira.weiny@intel.com,
 mst@redhat.com, bwidawsk@kernel.org
References: <168185633821.899932.322047053764766056.stgit@djiang5-mobl3>
 <20230503114248.00004c51@Huawei.com>
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20230503114248.00004c51@Huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=dave.jiang@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.124, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 5/3/23 3:42 AM, Jonathan Cameron wrote:
> On Tue, 18 Apr 2023 15:21:36 -0700
> Dave Jiang <dave.jiang@intel.com> wrote:
> 
>> s small RFC patch series is really a hack on what I need from qemu rather
>> than a proper implementation. I'm hoping to get some guidance from the list on
>> how to implement this correctly for qemu upstream. Thank you!
>>
>> The patch series provides support for the ACPI Generic Port support that's
>> defined by ACPI spec 6.5 5.2.16.7 (Generic Port Affinity Structure). The
>> series also adds a genport object that allows locality data to be injected via
>> qemu commandline to the HMAT tables. The generic port support is to allow a hot
>> plugged CXL memory device to calculate the locality data from the CPU to
>> the CXL device. The generic port related data provides the locality data from
>> the CPU to the CXL host bridge (latency and bandwidth). These data in
>> addition to the PCIe link data, CDAT from device, and CXL switch CDAT if switch
>> exist, provides the locality data for the entire path.
>>
>> Patch1: Adds Generic Port Affinity Structure sub-tables to the SRAT. For
>> each CXL Host Bridge (HB) a GPAS entry is created with a unique proximity
>> domain. For example, if the system is created with 4 proximity domains (PXM) for
>> system memory, then the next GPAS will get PXM 4 and so on.
> 
> I may be going crazy but I'm not seeing an increment on the numa node. So I think
> they all get 4 at the moment. Found it increment in patch 3.

Sorry about that. There are some changes for 1/3 strayed into 3/3.

> 
>>
>> Patch2: Add the json support for generic port. Split out because
>> clang-format really clobbers the json files.
>>
>> Patch3: Add a generic port object. The intention here is to allow setup of
>> numa nodes, add hmat-lb data and node distance for the generic targets. I had to
>> add a hack in qemu_create_cli_devices() to realize the genport objects. I need
>> guidance on where and how to do this properly so the genport objects
>> realize at the correct place and time.
>>
>> Example of genport setup:
>> -object genport,id=$X -numa node,genport=genport$X,nodeid=$Y,initiator=$Z
>> -numa hmat-lb,initiator=$Z,target=$X,hierarchy=memory,data-type=access-latency,latency=$latency
>> -numa hmat-lb,initiator=$Z,target=$X,hierarchy=memory,data-type=access-bandwidth,bandwidth=$bandwidthM
> 
> I think we should be using some links to the host bridges in here.
> So I don't think there should be an explicit genport object at all.
> Instead we should be able to point at the pxb itself.  Perhaps also
> allowing other port types in future.
> 
> Something like
> 
> -device pxb-cxl,id=cxl1.1
> -numa node,genport=cxl1.1,nodeid=$X

Ok I think that makes sense. So now there's a relation between genport 
being constructed and the passed in numa node. When we are building the 
SRAT, I assume there's a way to get hold of the parsed numa nodes 
attributes and iterate through to attempt a match?

> -numa hmat-lb,initiator=$Z,target=$X,...
> -numa hmat-lb,initiator=$X,target=$Y,...
> //as generic port goes both ways.
> 
> As we are currently using bus_nr for UID (which is admittedly a somewhat dirty hack that
> just happened to be convenient) the ACPI building code can use that to fill in the SRAT
> entry at appropriate point.
> 
> I haven't tried implementing it so there may well be some ordering issues that
> require some late binding etc, but it should be possible to make it work.
> 
>> for ((i = 0; i < total_nodes; i++)); do
>>          for ((j = 0; j < cxl_hbs; j++ )); do        # 2 CXL HBs
>>                  -numa dist,src=$i,dst=$X,val=$dist
>>          done
>> done
>> Linux kernel support:
>> https://lore.kernel.org/linux-cxl/168088732996.1441063.10107817505475386072.stgit@djiang5-mobl3/T/#t
>>
>> ---
>>
>> Dave Jiang (3):
>>        hw/acpi: Add support for Generic Port Affinity Structure to SRAT
>>        genport: Add json support for generic port
>>        acpi: add generic port device object
>>
>>
>>   hw/acpi/aml-build.c         | 21 +++++++++++++
>>   hw/acpi/genport.c           | 61 +++++++++++++++++++++++++++++++++++++
>>   hw/acpi/meson.build         |  1 +
>>   hw/i386/acpi-build.c        | 45 +++++++++++++++++++++++++++
>>   include/hw/acpi/aml-build.h | 27 ++++++++++++++++
>>   qapi/machine.json           |  3 +-
>>   qapi/qom.json               | 12 ++++++++
>>   softmmu/vl.c                | 26 ++++++++++++++++
>>   8 files changed, 195 insertions(+), 1 deletion(-)
>>   create mode 100644 hw/acpi/genport.c
>>
>> --
>>
>>
> 

