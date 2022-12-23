Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B76565502B
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 13:11:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8gsV-0005g6-6G; Fri, 23 Dec 2022 07:10:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p8gsO-0005eE-LI
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 07:10:13 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p8gsJ-00025G-SL
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 07:10:10 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BNBfnH6024483; Fri, 23 Dec 2022 12:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=iVWSUT01PAJw0ZmQVUxf34woEBfiy69misAv0tdbre4=;
 b=CXLIEDAuvKXbcO88rk6oJwRyH2QWYPXknALpMMVEUbbEhT/xkCev5addH7KUfZDkeR2A
 ETplS3pw+fTHNCAE8U5LiDwBRP0x/d01XGI7MqSlYu3UBWTTqqXMvqsFCnzAI3JObuBj
 4/asxgnpDPJa/3lPAigOuis6gy8MOiEvS2rZKRdx9IWT3RdG75b1DNV9/LB5ximdLznB
 MvwD7XQshLultiCdZ2HF/PvzoGBw+5OKV6L4BzyIV84YtP+pLB5Cri1aFvurhXmOdUkI
 RWk/6XfAPjkVwg97f9Z83cR89x6BKl4EmzHg2w6t2WG6BUOrJZP4zLVldu78bKVrTbp8 pw== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mnbparvrk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Dec 2022 12:10:05 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BMLuKpk010369;
 Fri, 23 Dec 2022 12:10:02 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3mh6yve23w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Dec 2022 12:10:02 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BNCA0p548824730
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Dec 2022 12:10:00 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C45420043;
 Fri, 23 Dec 2022 12:10:00 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E421320040;
 Fri, 23 Dec 2022 12:09:59 +0000 (GMT)
Received: from [9.171.46.120] (unknown [9.171.46.120])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 23 Dec 2022 12:09:59 +0000 (GMT)
Message-ID: <02e6368c68ab45dfb7527c414890fa9c251f9547.camel@linux.ibm.com>
Subject: Re: [PATCH] tests/tcg/multiarch: add vma-pthread.c
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Date: Fri, 23 Dec 2022 13:09:59 +0100
In-Reply-To: <20221223120252.513319-1-iii@linux.ibm.com>
References: <20221223115348.tgfwdlektsulebxk@heavy>
 <20221223120252.513319-1-iii@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -8yFRsgEXMfnlfrf8UV2hagk7fmnxwc5
X-Proofpoint-GUID: -8yFRsgEXMfnlfrf8UV2hagk7fmnxwc5
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-23_05,2022-12-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212230104
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 2022-12-23 at 13:02 +0100, Ilya Leoshkevich wrote:
> Add a test that locklessly changes and exercises page protection bits
> from various threads. This helps catch race conditions in the VMA
> handling.
>=20
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
> =C2=A0tests/tcg/multiarch/Makefile.target=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0tests/tcg/multiarch/munmap-pthread.c |=C2=A0 16 +--
> =C2=A0tests/tcg/multiarch/nop_func.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 25 ++++
> =C2=A0tests/tcg/multiarch/vma-pthread.c=C2=A0=C2=A0=C2=A0 | 185
> +++++++++++++++++++++++++++
> =C2=A04 files changed, 214 insertions(+), 15 deletions(-)
> =C2=A0create mode 100644 tests/tcg/multiarch/nop_func.h
> =C2=A0create mode 100644 tests/tcg/multiarch/vma-pthread.c

This was meant to be a reply to the bug report for [1], but apparently
I forgot to Cc: the mailing list. Copying the original message here:

---
Hi,

Wasmtime testsuite started failing randomly, complaining that
clock_gettime() returns -EFAULT. Bisect points to this commit.

I could not see anything obviously wrong here with the manual review,
and the failure was not reproducible when running individual testcases
or using strace. So I wrote a stress test (which I will post shortly),
which runs fine on the host, but reproduces the issue with qemu-user.

When run with -strace, it also triggers an assertion:

    qemu-x86_64: ../accel/tcg/tb-maint.c:595:
tb_invalidate_phys_page_unwind: Assertion `pc !=3D 0' failed.
    qemu-x86_64: /home/iii/qemu/include/qemu/rcu.h:102:
rcu_read_unlock: Assertion `p_rcu_reader->depth !=3D 0' failed.

I haven't tried analyzing what is causing all this yet, but at least
now the reproducer is small (~200LOC) and fails faster than 1s.

Best regards,
Ilya
---

[1] https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg03615.html

