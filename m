Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ACD6FDD6
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 12:31:58 +0200 (CEST)
Received: from localhost ([::1]:60308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpVbp-00031m-Kz
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 06:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34940)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <liran.alon@oracle.com>) id 1hpVbZ-0002cE-PL
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 06:31:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liran.alon@oracle.com>) id 1hpVbY-0003Hb-Sg
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 06:31:41 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:46610)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <liran.alon@oracle.com>)
 id 1hpVbY-0003GS-J1
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 06:31:40 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6MATGGR032144;
 Mon, 22 Jul 2019 10:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2018-07-02; bh=U2yjompJ8SmXwns3i0xdnrZjYogyt2rhrg8PHSgopAA=;
 b=qqpx9H5lhGvTrhm/8d2uygTu9hY+Xn5VSCza62MzDWfJlVpyqwZG4wSWQHf4sCBiilht
 MprLK7d+0Y4w99/9X5tdS89oc+w1D1zJu4ReOoY2MLkqxpwtjVLDCG7JJDxYTaJ5oyUr
 QfRqT0RSfyt3+cBneCVy5s9N1LnKgqw4fmP4/L7MOeflH1IbvnRW/h0wXonMGBzvjqbx
 YwtYRbKeDQauZvii5D1iUX26oOkgTzNWLB0WaNMwaXNQ8hCYWI6TXTdeU1KOacAhD/ji
 mpiNssUzfw5pK9+E4hIbuJvBf75DF1IE/CfmVvQKyA/PF5Uqmi/h4XuasWzDwA3Afxut Kw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2tutct5tse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Jul 2019 10:31:38 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6MARskB159480;
 Mon, 22 Jul 2019 10:31:38 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2tur2trau1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Jul 2019 10:31:38 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x6MAVbnl031103;
 Mon, 22 Jul 2019 10:31:37 GMT
Received: from [10.30.3.6] (/213.57.127.2)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 22 Jul 2019 03:31:37 -0700
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.1 \(3445.4.7\))
From: Liran Alon <liran.alon@oracle.com>
In-Reply-To: <0972ccd9-386d-b618-f055-e8ae0181b64e@siemens.com>
Date: Mon, 22 Jul 2019 13:31:34 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <AD612128-FB18-4E98-954D-BCF77954666B@oracle.com>
References: <bdd53f40-4e60-f3ae-7ec6-162198214953@siemens.com>
 <A9036EC6-848A-4D42-95AF-42E2302EEC0B@oracle.com>
 <0972ccd9-386d-b618-f055-e8ae0181b64e@siemens.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
X-Mailer: Apple Mail (2.3445.4.7)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9325
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907220124
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9325
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907220125
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 156.151.31.86
Subject: Re: [Qemu-devel] [PATCH] i386/kvm: Do not sync nested state during
 runtime
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 22 Jul 2019, at 13:20, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>=20
> On 22.07.19 11:44, Liran Alon wrote:
>>=20
>>=20
>>> On 22 Jul 2019, at 7:00, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>=20
>>> Writing the nested state e.g. after a vmport access can invalidate
>>> important parts of the kernel-internal state, and it is not needed =
as
>>> well. So leave this out from KVM_PUT_RUNTIME_STATE.
>>>=20
>>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>=20
>> As QEMU never modifies vCPU nested-state in userspace besides in =
vmload and vCPU creation,
>> shouldn=E2=80=99t this be under KVM_PUT_FULL_STATE? Same as the call =
to kvm_arch_set_tsc_khz().
>=20
> Reset is a relevant modification as well. If we do not write back a =
state that
> is disabling virtualization, we break.
>=20
> Jan

Currently QEMU writes to userspace maintained nested-state only at =
kvm_arch_init_vcpu() and
when loading vmstate_nested_state vmstate subsection.
kvm_arch_reset_vcpu() do not modify userspace maintained nested-state.

I would expect KVM internal nested-state to be reset as part of KVM=E2=80=99=
s vmx_vcpu_reset().
Are we missing a call to vmx_leave_nested() there?=20

-Liran=

