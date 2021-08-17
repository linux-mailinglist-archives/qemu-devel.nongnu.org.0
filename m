Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 005C33EE64D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 07:41:18 +0200 (CEST)
Received: from localhost ([::1]:44536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFrqe-0005jz-2M
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 01:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1mFrpM-0004uQ-Aq
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 01:39:58 -0400
Received: from mga01.intel.com ([192.55.52.88]:5732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1mFrpH-0001zd-W6
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 01:39:55 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="238076886"
X-IronPort-AV: E=Sophos;i="5.84,328,1620716400"; d="scan'208";a="238076886"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 22:39:45 -0700
X-IronPort-AV: E=Sophos;i="5.84,328,1620716400"; d="scan'208";a="530879474"
Received: from jingqili-mobl.ccr.corp.intel.com (HELO [10.238.6.254])
 ([10.238.6.254])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 22:39:39 -0700
Subject: Re: [PATCH v2] hw/i386/acpi-build: Get NUMA information from struct
 NumaState
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 imammedo@redhat.com, mst@redhat.com, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, ehabkost@redhat.com, richard.henderson@linaro.org
References: <20210806031904.9687-1-jingqi.liu@intel.com>
 <447c802d-956d-5cf6-2008-467555590215@redhat.com>
From: "Liu, Jingqi" <jingqi.liu@intel.com>
Message-ID: <bcc78ee9-3f63-3a58-5f95-9df837dbda38@intel.com>
Date: Tue, 17 Aug 2021 13:39:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <447c802d-956d-5cf6-2008-467555590215@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.88; envelope-from=jingqi.liu@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.71,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/16/2021 6:05 PM, Philippe Mathieu-Daudé wrote:
> On 8/6/21 5:19 AM, Jingqi Liu wrote:
> 
> Maybe prepend with:
> 
> Since commits aa57020774b ("numa: move numa global variable
> nb_numa_nodes into MachineState") and 7e721e7b10e ("numa: move
> numa global variable numa_info into MachineState"), we can ...
> 
Seems this description is clearer.
I'll add it in next version.

Thanks,
Jingqi
>> We can get NUMA information completely from MachineState::numa_state.
>> Remove PCMachineState::numa_nodes and PCMachineState::node_mem,
>> since they are just copied from MachineState::numa_state.
>>
>> Signed-off-by: Jingqi Liu <jingqi.liu@intel.com>
>> ---
>>   hw/i386/acpi-build.c | 12 +++++++-----
>>   hw/i386/pc.c         |  9 ---------
>>   include/hw/i386/pc.h |  4 ----
>>   3 files changed, 7 insertions(+), 18 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 

