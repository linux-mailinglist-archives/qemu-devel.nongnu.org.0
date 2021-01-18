Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE712FA345
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 15:40:49 +0100 (CET)
Received: from localhost ([::1]:47952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Vi4-0002rr-PE
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 09:40:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l1Vgi-0002Lt-4D
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 09:39:24 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:40690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l1Vge-0000Ww-4G
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 09:39:23 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10IEYkHk031563;
 Mon, 18 Jan 2021 14:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=vhInFzBqtdErFnsHmLRrqaJpGlema0SMIinwgrT5QY8=;
 b=vCuCBMcIzVDQM0tCc8+lxPXw3cQP+UfybJA3i7gU3VsnVvASYx4Jv48prjisMd0WroeR
 K9pi9lQ0Uz89iWXqGF1BCEuz96+xNuamOuLNeU1rCv+GRnbbnyPxvxrNT3V/2Rte6IUh
 1zLXOYsS2Gru5nwIHYcrXwz+62Gm1XXgt08UwPcQeO7bFn2o6y7PsgQM28119YEyaFhM
 WherczMIIk00SGzJgmbBUpSxY+LJnYjgkBLP2gfMENiXZeOlvmz81RywORFTYuDPTJ/X
 GJeEPa4sVi3pqUA/laByxCX68W8fxufUytNmhwwVbp8OOq0dvxuhI+T3KWH9tJZJhhm7 /w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 363nnadjfh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Jan 2021 14:38:14 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10IEZ9sc159244;
 Mon, 18 Jan 2021 14:36:13 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 3649wq426s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Jan 2021 14:36:13 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10IEaClF005033;
 Mon, 18 Jan 2021 14:36:13 GMT
Received: from [10.175.60.120] (/10.175.60.120)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 18 Jan 2021 06:36:12 -0800
Subject: Re: [PATCH 3/4] pvpanic : update pvpanic spec document
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <1610735646-13313-1-git-send-email-mihai.carabas@oracle.com>
 <1610735646-13313-4-git-send-email-mihai.carabas@oracle.com>
 <605edf10-933f-db84-714b-b1a7ec9336a3@redhat.com>
From: Mihai Carabas <mihai.carabas@oracle.com>
Message-ID: <01b19769-a89e-eff9-58fa-6f51771441cd@oracle.com>
Date: Mon, 18 Jan 2021 16:36:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <605edf10-933f-db84-714b-b1a7ec9336a3@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: ro
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9867
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 bulkscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101180089
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9867
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 spamscore=0
 mlxlogscore=999 clxscore=1011 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101180089
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=mihai.carabas@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

La 18.01.2021 12:32, Philippe Mathieu-Daudé a scris:
> On 1/15/21 7:34 PM, Mihai Carabas wrote:
>> Add pvpanic PCI device support details in docs/specs/pvpanic.txt.
>>
>> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
>> ---
>>   docs/specs/pvpanic.txt | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/docs/specs/pvpanic.txt b/docs/specs/pvpanic.txt
>> index a90fbca..974aafd 100644
>> --- a/docs/specs/pvpanic.txt
>> +++ b/docs/specs/pvpanic.txt
>> @@ -1,7 +1,7 @@
>>   PVPANIC DEVICE
>>   ==============
>>   
>> -pvpanic device is a simulated ISA device, through which a guest panic
>> +pvpanic device is a simulated device, through which a guest panic
>>   event is sent to qemu, and a QMP event is generated. This allows
>>   management apps (e.g. libvirt) to be notified and respond to the event.
>>   
>> @@ -9,6 +9,9 @@ The management app has the option of waiting for GUEST_PANICKED events,
>>   and/or polling for guest-panicked RunState, to learn when the pvpanic
>>   device has fired a panic event.
>>   
>> +The pvpanic device can be implemented as an ISA device (using IOPORT) or as a
>> +PCI device.
>> +
>>   ISA Interface
>>   -------------
>>   
>> @@ -24,6 +27,14 @@ bit 1: a guest panic has happened and will be handled by the guest;
>>          the host should record it or report it, but should not affect
>>          the execution of the guest.
>>   
>> +PCI Interface
>> +-------------
>> +
>> +The PCI interface is similar to the ISA interface except that it uses an MMIO
>> +address space provided by its BAR0, 1 byte long. Any machine with a PCI device
> 
> "device" -> "bus"?

You are right. I will update. Thanks!

> 
>> +can enable a pvpanic device by adding '-device pvpanic-pci' to the command
>> +line.
>> +
>>   ACPI Interface
>>   --------------
>>   
>>
> 


