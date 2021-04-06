Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A217355D98
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 23:04:09 +0200 (CEST)
Received: from localhost ([::1]:58492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTsro-0005mQ-D8
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 17:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lTscY-0003GM-1s; Tue, 06 Apr 2021 16:48:22 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lTscV-00027E-36; Tue, 06 Apr 2021 16:48:21 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 136KZ32A081560; Tue, 6 Apr 2021 16:48:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=TJgboqgz8chLXvBwlGA1gR8Qzy32p5WyVqj0kfzakKs=;
 b=sr+Oq5B0AFgTBwsQssH6U4jDzZFwgcfqHG137lErDWkAeKmNAkB9TW1SthhiKDen/YtG
 vWWFcr92se/qzT1FAqZMi8DGqxhOfZsD0ImFh5xX+4zCvnAbKljH1HhhFjJ/CH92ZfbS
 Q+lOFJ5MDWaqU2E1a/8dV3NLhQ5DSkJHz5832AKGZNMDZFmzzD/1N3PeX4p0dFtZcXob
 JM1aXSOoJPdHiylV+2NiD2yLQtFufF2/YVf+0ZNCUkexCQu4VCidWPmfgvYiKWAeUHQp
 8gtWVymjsKXVW34nyLYtISwNT364b/6WP1d+l4TKkbBoQ2uJMuGVXQXSh+RXaki6I3wm PA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvpj3t5m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 16:48:09 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 136KlAld003887;
 Tue, 6 Apr 2021 20:48:08 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 37q32mjaxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 20:48:08 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 136Km72g10027422
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Apr 2021 20:48:07 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38657C605B;
 Tue,  6 Apr 2021 20:48:07 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C1DFC605A;
 Tue,  6 Apr 2021 20:48:06 +0000 (GMT)
Received: from localhost (unknown [9.211.158.241])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue,  6 Apr 2021 20:48:06 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: RE: Discussion: Patch series that adds disable-tcg option for ppc
 targets
In-Reply-To: <CP2PR80MB4499C5000C0178C1594A5424C7769@CP2PR80MB4499.lamprd80.prod.outlook.com>
References: <CP2PR80MB4499C5000C0178C1594A5424C7769@CP2PR80MB4499.lamprd80.prod.outlook.com>
Date: Tue, 06 Apr 2021 17:48:03 -0300
Message-ID: <874kgjta0s.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CNV_JXArY0pyGUPtmslE7Xbz4tzJ5Hag
X-Proofpoint-GUID: CNV_JXArY0pyGUPtmslE7Xbz4tzJ5Hag
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-06_07:2021-04-06,
 2021-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=784
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104060140
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Andre Fernando da Silva <andre.silva@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bruno Piazera Larsen <bruno.larsen@eldorado.org.br> writes:

>> You'll probably also need changes in hw/ppc/spapr_hcall.c and maybe
>> some other parts of the spapr code: there are a number of hypercalls
>> that we implement in qemu for TCG, but which are (and must be)
>> implemented in KVM when KVM is in use.  So, I expect you'll need to
>> suppress compilation of h_enter, h_remove, h_protect, h_read and
>> h_bulk_remove at least in the !TCG case.
>
> Yeah. there are 6 files dealing with spapr that are having linking
> problems, though some might be because of the cpu_list problem... But
> I'm a bit confused on how to interface with KVM, do I use an ioctl
> explicitly, or can it handle it implicitly? wenever I google or ask on
> IRC for KVM stuff the answer is usually "KVM handles it" so I never
> know if/when to call it

Maybe a general overview would help:

KVM runs in an actual ppc machine that can execute the Power instruction
set and provide the hardware facilities the guest expects from a ppc
hypervisor. So when using KVM, QEMU only needs to provide things that
are out of the scope of KVM or that for whatever reason KVM cannot
provide.

When running a ppc guest on top of a machine that's from another
architecture or that has KVM disabled, QEMU will need to do all the
heavy-lifting and translate the guest code to the target architecture
(TCG), emulate all of the hardware facilties and so on.

The point with disabling TCG is to make sure we identify which parts of
the code are needed when running natively (KVM) and have a way to build
only those, without the parts that are only needed when running on
another arch (TCG).

So the interfacing with KVM is something that is already in place. If
you grep for ioctl in accel/kvm/kvm-all.c and target/ppc/kvm.c you'll
see how QEMU interacts with KVM to get a guest to run and behave
properly.

About hypercalls (a kind of system call that the guest uses to talk to
its hypervisor) you'll see that spapr_hcall.c contains some hypercall
implementations:

 - The ones used when running TCG (i.e. QEMU pretending we're in an
actual ppc machine), such as h_enter, h_remove, etc;

 - The ones used when running KVM (i.e. KVM says it cannot handle this
hcall and then QEMU has to do it).

If you cross-reference the hcalls from spapr_hcall.c with the
implementations in the kernel at arch/powerpc/kvm/ you'll start to see
which hypercalls are handled by QEMU because we're replacing KVM and
which are handled by QEMU because we're helping KVM.

Note that there are nuances to what I have said, so if you encounter
something that differs we can discuss further.

Hope it helps. =)



