Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C8636BD2E
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 04:14:34 +0200 (CEST)
Received: from localhost ([::1]:60798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbDFB-0006Gc-4c
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 22:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <like.xu@linux.intel.com>)
 id 1lbDDs-0005SE-6o
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 22:13:12 -0400
Received: from mga01.intel.com ([192.55.52.88]:27504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <like.xu@linux.intel.com>)
 id 1lbDDq-0007hv-7N
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 22:13:11 -0400
IronPort-SDR: ao8xOYpxA4uXAMhdv1ODvAN2kVybtppGve/9Gz+l77zaYQMAjLxVsaRSe6zRSHF1mPENfRqanr
 6F6x9o4H/ZxA==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="217138061"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="217138061"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 19:13:06 -0700
IronPort-SDR: TRxDzMUg1s41Lvs5kwlqOkVHn1xf9vmO3t53zoxfJnnKx6S80/nnjl52NhLaQparxr3g5/8MHH
 dmMQZbkW4ymA==
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="422882058"
Received: from likexu-mobl1.ccr.corp.intel.com (HELO [10.238.4.93])
 ([10.238.4.93])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 19:13:04 -0700
Subject: Re: [PATCH v2] hw/i386: Expand the range of CPU topologies between
 smp and maxcpus
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "caodongli@kingsoft.com" <caodongli@kingsoft.com>
References: <2021042610084739495617@kingsoft.com> <YIbAYqpWBG5k8yp5@redhat.com>
From: Like Xu <like.xu@linux.intel.com>
Organization: Intel OTC
Message-ID: <378da49d-2d66-0d47-90cb-441a4e6f8ac7@linux.intel.com>
Date: Tue, 27 Apr 2021 10:13:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIbAYqpWBG5k8yp5@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.88;
 envelope-from=like.xu@linux.intel.com; helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: ehabkost <ehabkost@redhat.com>, mst <mst@redhat.com>,
 "richard.henderson" <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, pbonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/4/26 21:30, Daniel P. Berrangé wrote:
> On Mon, Apr 26, 2021 at 10:08:52AM +0800, caodongli@kingsoft.com wrote:
>> Change the criteria for the initial CPU topology and maxcpus, user can
>> have more settings
> 
> Can you provide a better explanation of why this is needed. What
> valid usage scenario is blocked by the current check ?
> 
> AFAICT, it partially reverts an intentional change done in several
> years ago in :
> 
> 
>    commit bc1fb850a31468ac4976f3895f01a6d981e06d0a
>    Author: Igor Mammedov <imammedo@redhat.com>
>    Date:   Thu Sep 13 13:06:01 2018 +0200
> 
>      vl.c deprecate incorrect CPUs topology
>      
>      -smp [cpus],sockets/cores/threads[,maxcpus] should describe topology
>      so that total number of logical CPUs [sockets * cores * threads]
>      would be equal to [maxcpus], however historically we didn't have
>      such check in QEMU and it is possible to start VM with an invalid
>      topology.
>      Deprecate invalid options combination so we can make sure that
>      the topology VM started with is always correct in the future.
>      Users with an invalid sockets/cores/threads/maxcpus values should
>      fix their CLI to make sure that
>         [sockets * cores * threads] == [maxcpus]
> 
> 

Another helpful commit would be:

commit c4332cd1dcf2964c23893ab4c0bf8d774e42a3cf
Author: Igor Mammedov <imammedo@redhat.com>
Date:   Fri Sep 11 09:32:02 2020 -0400

     smp: drop support for deprecated (invalid topologies)

     it's was deprecated since 3.1

     Support for invalid topologies is removed, the user must ensure
     that topologies described with -smp include all possible cpus,
     i.e. (sockets * cores * threads) == maxcpus or QEMU will
     exit with error.


So is the following statement correct:

When we explicitly set the topology, we must ensure that the combination 
(sockets/dies/cores/threads/maxcpus) is always valid. If we need hot plug 
testing, we can only use something like "-smp 1,maxcpus = 4" since 3.1.

?


> 
>>
>> Signed-off-by: Dongli Cao <caodongli@kingsoft.com>
>> ---
>> hw/i386/pc.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 8a84b25..ef2e819 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -751,7 +751,7 @@ void pc_smp_parse(MachineState *ms, QemuOpts *opts)
>>               exit(1);
>>           }
>>
>> -        if (sockets * dies * cores * threads != ms->smp.max_cpus) {
>> +        if (sockets * dies * cores * threads > ms->smp.max_cpus) {
>>               error_report("Invalid CPU topology deprecated: "
>>                            "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
>>                            "!= maxcpus (%u)",
> 
> This is
> 
>> --
>> 1.8.3.1
>>
>>
>>
>>
>>
>>
>>
>>
>>
>> caodongli@kingsoft.com
>>
>>
> 
> Regards,
> Daniel
> 


