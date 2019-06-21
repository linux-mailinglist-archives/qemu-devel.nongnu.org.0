Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D454E84D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 14:52:43 +0200 (CEST)
Received: from localhost ([::1]:33822 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heJ22-0004zK-Ib
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 08:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41475)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <liran.alon@oracle.com>) id 1heIyU-0002wK-MX
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 08:49:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liran.alon@oracle.com>) id 1heIyR-0007jY-KO
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 08:49:02 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:57916)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <liran.alon@oracle.com>)
 id 1heIyR-0007i6-C6
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 08:48:59 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5LCXqLe137558;
 Fri, 21 Jun 2019 12:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2018-07-02; bh=oqGtCtLYjIarYEbvaJ72s3deSwfCDijZlfPuSDKZ5FM=;
 b=vmBaT9DU3TV7ljKOvGj9YhS+Nsxeq5Y4NDPT4MarAJQaNg2SmMARqV5F9yOGEUfRvxVZ
 p+TCUqxkk2h6i8uWCWDvGvJyn5p1o8GN8AGxiZE+Xyn/iLDoTPk7ALvot3CrhsEa+yaI
 R/EvYaD9+WaVcCBS7aytf8jC4AO9VsixTumqyjvcdKirR23+5SXVTc9MVG0UcG+srefo
 NRDVkPqh/nWzkciFM3vn1SFOC8IB1kSXDV0CbjOUmYYuniL+dDpvdBCBWo4AhQD/lLGW
 7ZjnEruj5UNwxjmE1ZSxUR3Q/Dx2knNWlavxU+OMbuOJbqjjS6xcEBmUSSSFPqjHlTQ3 Kw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2t7809pc6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jun 2019 12:48:57 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5LCljm5139510;
 Fri, 21 Jun 2019 12:48:57 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 2t77yp6eba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jun 2019 12:48:56 +0000
Received: from abhmp0022.oracle.com (abhmp0022.oracle.com [141.146.116.28])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5LCmtQK000688;
 Fri, 21 Jun 2019 12:48:55 GMT
Received: from [192.168.14.112] (/109.64.216.174)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 21 Jun 2019 05:48:55 -0700
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.1 \(3445.4.7\))
From: Liran Alon <liran.alon@oracle.com>
In-Reply-To: <3b4d778c-8c41-b8f2-7e1c-b7328072c3d5@redhat.com>
Date: Fri, 21 Jun 2019 15:48:53 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <96B0BE25-AA15-4FAA-9228-A68C0845E110@oracle.com>
References: <1561116620-22245-1-git-send-email-pbonzini@redhat.com>
 <1561116620-22245-21-git-send-email-pbonzini@redhat.com>
 <C67C73E9-F0FA-4711-98F1-BB5CD782E473@oracle.com>
 <3b4d778c-8c41-b8f2-7e1c-b7328072c3d5@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
X-Mailer: Apple Mail (2.3445.4.7)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9294
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906210106
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9294
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906210106
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 156.151.31.86
Subject: Re: [Qemu-devel] [PULL 20/25] target/i386: kvm: Add support for
 save and restore nested state
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



> On 21 Jun 2019, at 15:45, Paolo Bonzini <pbonzini@redhat.com> wrote:
>=20
> On 21/06/19 14:29, Liran Alon wrote:
>>> +    max_nested_state_len =3D kvm_max_nested_state_length();
>>> +    if (max_nested_state_len > 0) {
>>> +        assert(max_nested_state_len >=3D offsetof(struct =
kvm_nested_state, data));
>>> +        env->nested_state =3D g_malloc0(max_nested_state_len);
>>> +
>>> +        env->nested_state->size =3D max_nested_state_len;
>>> +
>>> +        if (IS_INTEL_CPU(env)) {
>> I think it=E2=80=99s better to change this to: =E2=80=9Cif =
(cpu_has_vmx(env))=E2=80=9D {
>>=20
>>> +            struct kvm_vmx_nested_state_hdr *vmx_hdr =3D
>>> +                &env->nested_state->hdr.vmx;
>>> +
>>> +            env->nested_state->format =3D =
KVM_STATE_NESTED_FORMAT_VMX;
>>> +            vmx_hdr->vmxon_pa =3D -1ull;
>>> +            vmx_hdr->vmcs12_pa =3D -1ull;
>>> +        }
>>> +    }
>> I think we should add here:
>> } else if (cpu_has_svm(env)) {
>>    env->nested_state->format =3D KVM_STATE_NESTED_FORMAT_SVM;
>> }
>=20
> Or even force max_nested_state_len to 0 for AMD hosts, so that
> kvm_get/put_nested_state are dropped completely.
>=20
> Paolo
>=20

On AMD hosts, KVM returns 0 for KVM_CAP_NESTED_STATE because
Kvm-and.ko have kvm_x86_ops->get_nested_state set to NULL.
See kvm_vm_ioctl_check_extension().

I just thought it will be nicer to add what I proposed above as when =
kernel adds support
for nested state on AMD host, QEMU would maybe just work.
(Because maybe all state required for AMD nSVM is just flags in =
env->nested_state->flags).

-Liran


