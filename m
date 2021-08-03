Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EE43DE4DE
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:02:14 +0200 (CEST)
Received: from localhost ([::1]:41706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAld7-0000FQ-CP
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mAlbG-0007r2-Er
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:00:18 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:36502
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1mAlbD-0006RM-Bn
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:00:17 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3Ax/TBfKsx0XAvYV+EuVjIV3ZN7skDStV00zEX?=
 =?us-ascii?q?/kB9WHVpm62j5qSTdZEguCMc5wx+ZJheo7q90cW7IE80lqQFhLX5X43SPzUO0V?=
 =?us-ascii?q?HARO5fBODZsl/d8kPFltJ15ONJdqhSLJnKB0FmsMCS2mKFOudl7N6Z0K3Av4vj?=
 =?us-ascii?q?80s=3D?=
X-IronPort-AV: E=Sophos;i="5.84,290,1620662400"; d="scan'208";a="112315157"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 03 Aug 2021 12:00:08 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 9204F4D0D4B1;
 Tue,  3 Aug 2021 12:00:03 +0800 (CST)
Received: from G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Tue, 3 Aug 2021 12:00:02 +0800
Received: from [192.168.122.212] (10.167.226.45) by
 G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.23 via Frontend Transport; Tue, 3 Aug 2021 12:00:02 +0800
Subject: Re: [PATCH] nvdimm: release the correct device list
To: Igor Mammedov <imammedo@redhat.com>, <mst@redhat.com>,
 <xiaoguangrong.eric@gmail.com>
References: <20210624110415.187164-1-lizhijian@cn.fujitsu.com>
 <20210629160534.208b56ad@redhat.com>
From: =?UTF-8?B?TGksIFpoaWppYW4v5p2OIOaZuuWdmg==?= <lizhijian@cn.fujitsu.com>
Message-ID: <224e4f45-14c7-4eec-f553-6fa25b4ffb6b@cn.fujitsu.com>
Date: Tue, 3 Aug 2021 12:00:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210629160534.208b56ad@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-yoursite-MailScanner-ID: 9204F4D0D4B1.ACF48
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lizhijian@fujitsu.com
Received-SPF: neutral client-ip=183.91.158.132;
 envelope-from=lizhijian@fujitsu.com; helo=heian.cn.fujitsu.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=ham autolearn_force=no
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

ping

Any body could help to review/queue this patch ?



On 2021/6/29 22:05, Igor Mammedov wrote:
> On Thu, 24 Jun 2021 19:04:15 +0800
> Li Zhijian <lizhijian@cn.fujitsu.com> wrote:
>
>> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>
>> ---
>>   hw/acpi/nvdimm.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
>> index e3d5fe19392..ff317263e85 100644
>> --- a/hw/acpi/nvdimm.c
>> +++ b/hw/acpi/nvdimm.c
>> @@ -355,10 +355,10 @@ nvdimm_build_structure_caps(GArray *structures, uint32_t capabilities)
>>   
>>   static GArray *nvdimm_build_device_structure(NVDIMMState *state)
>>   {
>> -    GSList *device_list = nvdimm_get_device_list();
>> +    GSList *device_list, *list = nvdimm_get_device_list();
>>       GArray *structures = g_array_new(false, true /* clear */, 1);
>>   
>> -    for (; device_list; device_list = device_list->next) {
>> +    for (device_list = list; device_list; device_list = device_list->next) {
>>           DeviceState *dev = device_list->data;
>>   
>>           /* build System Physical Address Range Structure. */
>> @@ -373,7 +373,7 @@ static GArray *nvdimm_build_device_structure(NVDIMMState *state)
>>           /* build NVDIMM Control Region Structure. */
>>           nvdimm_build_structure_dcr(structures, dev);
>>       }
>> -    g_slist_free(device_list);
>> +    g_slist_free(list);
>>   
>>       if (state->persistence) {
>>           nvdimm_build_structure_caps(structures, state->persistence);
>> @@ -1339,9 +1339,9 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
>>   
>>   void nvdimm_build_srat(GArray *table_data)
>>   {
>> -    GSList *device_list = nvdimm_get_device_list();
>> +    GSList *device_list, *list = nvdimm_get_device_list();
>>   
>> -    for (; device_list; device_list = device_list->next) {
>> +    for (device_list = list; device_list; device_list = device_list->next) {
>>           AcpiSratMemoryAffinity *numamem = NULL;
>>           DeviceState *dev = device_list->data;
>>           Object *obj = OBJECT(dev);
>> @@ -1356,7 +1356,7 @@ void nvdimm_build_srat(GArray *table_data)
>>           build_srat_memory(numamem, addr, size, node,
>>                             MEM_AFFINITY_ENABLED | MEM_AFFINITY_NON_VOLATILE);
>>       }
>> -    g_slist_free(device_list);
>> +    g_slist_free(list);
>>   }
>>   
>>   void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
>
>



