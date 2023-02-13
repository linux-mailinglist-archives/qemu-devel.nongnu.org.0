Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C3369466B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 13:57:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRYOX-0000Ra-Tz; Mon, 13 Feb 2023 07:57:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pRYOW-0000RQ-E8
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 07:57:20 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pRYOU-0000rB-BR
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 07:57:20 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DBriVd011106; Mon, 13 Feb 2023 12:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=eRMKfht9BqFABPFYfbh1ZkiFBq4Wx1vy9kXQh/BhCb8=;
 b=nlcNuEv6CAO24nWQttWp5UwWL57Rc+a9Z16m5hWZPoj2xhwBuKR3Hm2WlwkVMWaa9HNZ
 jKqbeNsEW8Z1yJnMFeWRXhbnYKWgcWrXam4QG9dBSF5yLSi/kYE9/SA9cLreR042gy2T
 L2OWJ0v1zky5i2duAJcNLbbO7ACwcspYxpwE3S1AmH5uYBlVP5IbBTOhjqd4YBLc4eqC
 ulNBD9b2IyxW/vfaND4hicQzdqIEbZZRO/wKqHlVpo4W21gEvBO9QvdFX1B2l+yBHbMU
 N+pV0GbFPHm/4CFoZvQfk3fGc4b97KBiKVNVIuvKWC9Tw4YbdpdbD5ku5ZnQYKywx+H2 xA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqmr01je8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 12:57:15 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31CJ2Na5017578;
 Mon, 13 Feb 2023 12:57:13 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3np2n6jn7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 12:57:13 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31DCvBB652691432
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 12:57:11 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 176AB2004B;
 Mon, 13 Feb 2023 12:57:11 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F89520040;
 Mon, 13 Feb 2023 12:57:10 +0000 (GMT)
Received: from [9.171.19.58] (unknown [9.171.19.58])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 13 Feb 2023 12:57:09 +0000 (GMT)
Message-ID: <a878e7a4764b0c49f0b7e996cb9ca6b77a8ff793.camel@linux.ibm.com>
Subject: PING: [PATCH RFC v2 0/1] tests: add wasmtime testsuite
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Date: Mon, 13 Feb 2023 13:57:09 +0100
In-Reply-To: <20221221190544.311471-1-iii@linux.ibm.com>
References: <20221221190544.311471-1-iii@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8u6du69QCRKCFBqtUkBd3isAFa2su8BT
X-Proofpoint-GUID: 8u6du69QCRKCFBqtUkBd3isAFa2su8BT
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_07,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxlogscore=997 phishscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302130112
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 2022-12-21 at 20:05 +0100, Ilya Leoshkevich wrote:
> Hi,
>=20
> I made some updates based on the feedback from Alex.
>=20
> At the moment it mostly works for me on top of 6394578984da: aarch64,
> riscv64 and s390x are clean, but there are some failures on x86_64.
> With qemu-user vma rework it unfortunately fails in more places;
> I haven't analyzed these failures yet.
>=20
> v1:
> https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg00657.html
> =C2=A0=C2=A0=C2=A0
> https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg02612.html
>=20
> v1 -> v2:
> * Drop gitlab jobs.
> * Move to tests/third-party/.
> * Use avocado. To be honest, I'm not sure how much value it brings
> =C2=A0 here; I hoped that TAPRunner would at least print the number of
> =C2=A0 passed tests, but it only checks whether at least one test failed).
> * Add various check-* Makefile targets.
> * Add json -> TAP 14 conversion.
> * Add documentation.
> * Move test binaries to the host system.
> =C2=A0 This prevents unnecessary full rebuilds of the Docker image.
> * Add riscv64; bump Rust and Wasmtime versions.
> * Do not use docker.py; unfortunately this leads to reimplementing
> some
> =C2=A0 of its features: docker command detection based on $(ENGINE) and
> =C2=A0 injecting the current user into the image.
> * Disable core dumps.
>=20
> Best regards,
> Ilya
>=20
> Ilya Leoshkevich (1):
> =C2=A0 tests: add wasmtime testsuite
>=20
> =C2=A0Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 +
> =C2=A0docs/devel/testing.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 9 +++
> =C2=A0tests/Makefile.include=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 6 ++
> =C2=A0tests/third-party/Makefile.include=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 50 ++++++++++++
> =C2=A0tests/third-party/wasmtime/Dockerfile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 32 ++++++++
> =C2=A0tests/third-party/wasmtime/Makefile.include=C2=A0 | 49 ++++++++++++
> =C2=A0tests/third-party/wasmtime/avocado-wrapper=C2=A0=C2=A0 | 38 +++++++=
++
> =C2=A0tests/third-party/wasmtime/avocado.cfg=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 3 +
> =C2=A0tests/third-party/wasmtime/json2tap=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 77 ++++++++++++++++++
> =C2=A0tests/third-party/wasmtime/run-tests-wrapper | 82
> ++++++++++++++++++++
> =C2=A0tests/third-party/wasmtime/test=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 48 ++++++++++++
> =C2=A011 files changed, 395 insertions(+)
> =C2=A0create mode 100644 tests/third-party/Makefile.include
> =C2=A0create mode 100644 tests/third-party/wasmtime/Dockerfile
> =C2=A0create mode 100644 tests/third-party/wasmtime/Makefile.include
> =C2=A0create mode 100755 tests/third-party/wasmtime/avocado-wrapper
> =C2=A0create mode 100644 tests/third-party/wasmtime/avocado.cfg
> =C2=A0create mode 100755 tests/third-party/wasmtime/json2tap
> =C2=A0create mode 100755 tests/third-party/wasmtime/run-tests-wrapper
> =C2=A0create mode 100755 tests/third-party/wasmtime/test
>=20

Hi,

I would like to ping this patch
(https://patchew.org/QEMU/20221221190544.311471-1-iii@linux.ibm.com/)

Best regards,
Ilya

