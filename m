Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 800B22ADF12
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 20:06:32 +0100 (CET)
Received: from localhost ([::1]:36026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcYyN-0006Bb-4i
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 14:06:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krish.sadhukhan@oracle.com>)
 id 1kcYwU-0004XX-9l
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:04:34 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:54540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krish.sadhukhan@oracle.com>)
 id 1kcYwS-0005EE-0E
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:04:33 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AAIjFnZ114122;
 Tue, 10 Nov 2020 19:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=7m1c5pTIV0kI3e9zBRZ6UNdUmG/Rs2VB0KWAI4LOjKo=;
 b=Cz7GY7ESK4QYh6eDfZnRuBNXqm0WYS/ZWcOVFV7L2teJT+HPS5sy2azSPV3Ej8Tk/sRh
 OPA/MUUqg5ozP2k6qaGc4Ns7dpj6nYl3kczdZxhsW/aq2/pdFvFMn5A89rn0YzQaeFUx
 GC2jzt2neQ6L5wZxlIK+GoiM08sq95e5509jtQ5+LuFtSs6Epcod/LvArF6c+fODWj7k
 U6ooerCVG5EReNDD8PFs/acTx619NJoufRAYCF3KzdEWdmz+WJ+WQaqT5ZqPpd3ltWJp
 mGm1I46Qou4HwC/qjYBdPPHoJDZJhAQ43bSd5BD8ZfIY9rg6ZMNYNT+Tk4EEyPE0LEwL IA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 34p72ekhwc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 Nov 2020 19:04:25 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AAIk9AU158125;
 Tue, 10 Nov 2020 19:02:25 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 34p5gxckn3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Nov 2020 19:02:25 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AAJ2M5B025306;
 Tue, 10 Nov 2020 19:02:23 GMT
Received: from localhost.localdomain (/10.159.238.6)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 10 Nov 2020 11:02:22 -0800
Subject: Re: [PATCH 4/5 v4] KVM: VMX: Fill in conforming vmx_x86_ops via macro
To: Like Xu <like.xu@linux.intel.com>, kvm@vger.kernel.org
References: <20201110012312.20820-1-krish.sadhukhan@oracle.com>
 <20201110012312.20820-5-krish.sadhukhan@oracle.com>
 <0ef40499-77b8-587a-138d-9b612ae9ae8c@linux.intel.com>
From: Krish Sadhukhan <krish.sadhukhan@oracle.com>
Message-ID: <e9819b87-c4e0-d15b-80b8-637ecb74f1c3@oracle.com>
Date: Tue, 10 Nov 2020 11:02:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <0ef40499-77b8-587a-138d-9b612ae9ae8c@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9801
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 mlxscore=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 suspectscore=2
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011100129
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9801
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 mlxscore=0
 malwarescore=0 suspectscore=2 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011100129
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=krish.sadhukhan@oracle.com; helo=userp2120.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 14:04:30
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, vkuznets@redhat.com, qemu-devel@nongnu.org,
 sean.j.christopherson@intel.com, jmattson@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/9/20 5:49 PM, Like Xu wrote:
> Hi Krish,
>
> On 2020/11/10 9:23, Krish Sadhukhan wrote:
>> @@ -1192,7 +1192,7 @@ void vmx_set_host_fs_gs(struct vmcs_host_state 
>> *host, u16 fs_sel, u16 gs_sel,
>>       }
>>   }
>>   -void vmx_prepare_switch_to_guest(struct kvm_vcpu *vcpu)
>> +void vmx_prepare_guest_switch(struct kvm_vcpu *vcpu)
>
> What do you think of renaming it to
>
>     void vmx_prepare_switch_for_guest(struct kvm_vcpu *vcpu)；


In my opinion, it sounds a bit odd as we usually say, "switch to 
something". :-)

 From that perspective, {svm|vmx}_prepare_switch_to_guest is probably 
the best name to keep.


>
> ?
>
> Thanks,
> Like Xu
>
>>   {
>>       struct vcpu_vmx *vmx = to_vmx(vcpu);
>>       struct vmcs_host_state *host_state;
>>
>> @@ -311,7 +311,7 @@ void vmx_vcpu_load_vmcs(struct kvm_vcpu *vcpu, 
>> int cpu,
>>   int allocate_vpid(void);
>>   void free_vpid(int vpid);
>>   void vmx_set_constant_host_state(struct vcpu_vmx *vmx);
>> -void vmx_prepare_switch_to_guest(struct kvm_vcpu *vcpu);
>> +void vmx_prepare_guest_switch(struct kvm_vcpu *vcpu);
>>   void vmx_set_host_fs_gs(struct vmcs_host_state *host, u16 fs_sel, 
>> u16 gs_sel,
>>               unsigned long fs_base, unsigned long gs_base);
>>   int vmx_get_cpl(struct kvm_vcpu *vcpu);
>

