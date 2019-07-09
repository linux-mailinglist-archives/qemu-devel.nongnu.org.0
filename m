Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E475D63A28
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 19:27:43 +0200 (CEST)
Received: from localhost ([::1]:52320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hktu3-00009X-50
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 13:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56033)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <maran.wilson@oracle.com>) id 1hktoC-0004x0-7w
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 13:21:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maran.wilson@oracle.com>) id 1hktoB-0001GG-6z
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 13:21:40 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:59942)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <maran.wilson@oracle.com>)
 id 1hkto7-0000vP-93
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 13:21:37 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x69HItej094709;
 Tue, 9 Jul 2019 17:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=MjEJhBt7sS82dhXCnwYDQHj5u/g/AGE0b3Hpz5Cr1NA=;
 b=u6NPtatca4FUH8oCXACu7G7vB7R+mVFJZ/mVqTa3nry33wQW20DellT1B4vypv4K0gnz
 fJKQr6/pWaqNaiLnvD0d0l/idlyjBKs7PIZvOAj9y8pfrNb/Lwwt6n3T7eqzcSc8M4nj
 aWdB67nmpcK+Wtf4wNAZuZvQlTgMhKf61Zo6LhOydVTHVpXxybiIjbXGL5MvCGArgcA3
 dhnS64369LjXp24gWTF9NIgUjauWyhXwtAROe5WbLjwyy1eDH2fcCvHGsog6TTs9f8WX
 P6AYm2mzGpphWiFlass+mQzaEcyrC+5oyjQFMP657OWTSX8vgQWP2/p2npkD6ANDUxFZ 4w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2tjk2tnqx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Jul 2019 17:21:26 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x69HI1Wx160262;
 Tue, 9 Jul 2019 17:21:26 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2tjgru7ufk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Jul 2019 17:21:25 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x69HLOe1023541;
 Tue, 9 Jul 2019 17:21:24 GMT
Received: from [10.159.233.89] (/10.159.233.89)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 09 Jul 2019 10:21:24 -0700
To: Liran Alon <liran.alon@oracle.com>, qemu-devel@nongnu.org
References: <20190705210636.3095-1-liran.alon@oracle.com>
 <20190705210636.3095-3-liran.alon@oracle.com>
From: Maran Wilson <maran.wilson@oracle.com>
Organization: Oracle Corporation
Message-ID: <0608e757-148b-4125-6d0a-9b3700f1cc4a@oracle.com>
Date: Tue, 9 Jul 2019 10:21:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190705210636.3095-3-liran.alon@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9313
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907090204
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9313
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907090204
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 156.151.31.86
Subject: Re: [Qemu-devel] [PATCH 2/4] target/i386: kvm: Init nested-state
 for vCPU exposed with SVM
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
Cc: pbonzini@redhat.com, Joao Martins <joao.m.martins@oracle.com>,
 ehabkost@redhat.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/2019 2:06 PM, Liran Alon wrote:
> Reviewed-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: Liran Alon <liran.alon@oracle.com>
> ---
>   target/i386/cpu.h | 5 +++++
>   target/i386/kvm.c | 2 ++
>   2 files changed, 7 insertions(+)
>
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 93345792f4cb..cdb0e43676a9 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1867,6 +1867,11 @@ static inline bool cpu_has_vmx(CPUX86State *env)
>       return env->features[FEAT_1_ECX] & CPUID_EXT_VMX;
>   }
>   
> +static inline bool cpu_has_svm(CPUX86State *env)
> +{
> +    return env->features[FEAT_8000_0001_ECX] & CPUID_EXT3_SVM;
> +}
> +
>   /* fpu_helper.c */
>   void update_fp_status(CPUX86State *env);
>   void update_mxcsr_status(CPUX86State *env);
> diff --git a/target/i386/kvm.c b/target/i386/kvm.c
> index b57f873ec9e8..4e2c8652168f 100644
> --- a/target/i386/kvm.c
> +++ b/target/i386/kvm.c
> @@ -1721,6 +1721,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
>               env->nested_state->format = KVM_STATE_NESTED_FORMAT_VMX;
>               vmx_hdr->vmxon_pa = -1ull;
>               vmx_hdr->vmcs12_pa = -1ull;
> +        } else if (cpu_has_svm(env)) {
> +            env->nested_state->format = KVM_STATE_NESTED_FORMAT_SVM;
>           }
>       }
>   

Reviewed-by: Maran Wilson <maran.wilson@oracle.com>

Thanks,
-Maran

