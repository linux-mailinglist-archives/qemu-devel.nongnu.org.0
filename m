Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F03D13AEA4A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 15:45:23 +0200 (CEST)
Received: from localhost ([::1]:39310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvKEt-0005Ln-2N
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 09:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lvKE1-0004XV-KF; Mon, 21 Jun 2021 09:44:29 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lvKDy-0006AL-O8; Mon, 21 Jun 2021 09:44:29 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15LDXdYw101902; Mon, 21 Jun 2021 09:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=usBKvbxpmYAF6D37Je66uoUsUDonkLy/yGpKXtBdQO0=;
 b=Qe7l1Yp63ycIaA065mvkfgn5cYHApDxg4dE+rWoPelJoOIFWqojFgPG29LZIewYpHl+v
 FBpLvc/ruUbXnDHC94nNWElHMsIZuQmX8K+HZQ0vxV5NDTSIQAhFgZkcjF1/cJie5MUx
 CfwqD3kVUlYX4eP5SWRdV4roh1m1pjmS2HoJw9H7kehghXAucVcyl/XEafi5gvNFr6oh
 kZQYOrE13tgTDFg6PCfCHMXFdSC1T5sziKRMViMEgZsjB64zru/3Q7S3wQl2gnEiFoxN
 1vXcayHbgNQA77zNSkI3RIiMQM68p9JrhOmBIMHXfWPfCKXi2E5b1Yrl6+dnU/zM9HPg 5A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39atsm2hep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 09:44:23 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15LDXunR102902;
 Mon, 21 Jun 2021 09:44:23 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39atsm2hdm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 09:44:22 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15LDc9pa014074;
 Mon, 21 Jun 2021 13:44:20 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3997uh8wyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 13:44:20 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15LDgxoM33685808
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Jun 2021 13:42:59 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4E63A4060;
 Mon, 21 Jun 2021 13:44:17 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38F14A4062;
 Mon, 21 Jun 2021 13:44:17 +0000 (GMT)
Received: from sig-9-145-39-144.uk.ibm.com (unknown [9.145.39.144])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 21 Jun 2021 13:44:17 +0000 (GMT)
Message-ID: <f0440e221d2f1ed887203935ff8b6fe185c6915d.camel@linux.ibm.com>
Subject: Re: [PATCH v3 0/2] target/s390x: Fix SIGILL psw.addr reporting
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: "jonathan.albrecht" <jonathan.albrecht@linux.vnet.ibm.com>
Date: Mon, 21 Jun 2021 15:44:16 +0200
In-Reply-To: <b271e6d8bc790e8d6fa3b3bdfb39150d@imap.linux.ibm.com>
References: <20210602002210.3144559-1-iii@linux.ibm.com>
 <972102fd-ac1e-f13c-7aa7-ad6c7a9be67e@redhat.com>
 <095e6342f7f93b6d157f5a3cb99980a96990c290.camel@linux.ibm.com>
 <b271e6d8bc790e8d6fa3b3bdfb39150d@imap.linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 35n_dcpE7g9iQTbaqypEWymFAwtxm82I
X-Proofpoint-ORIG-GUID: BgxOY9QyN14yXZkPt4Sge4j-1_3G4pzk
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-21_06:2021-06-21,
 2021-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=935
 impostorscore=0 clxscore=1011 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106210080
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
Cc: qemu-s390x
 <qemu-s390x-bounces+jonathan.albrecht=linux.vnet.ibm.com@nongnu.org>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2021-06-21 at 09:12 -0400, jonathan.albrecht wrote:
> On 2021-06-21 8:00 am, Ilya Leoshkevich wrote:
> > On Thu, 2021-06-10 at 11:49 +0200, David Hildenbrand wrote:
> > > On 02.06.21 02:22, Ilya Leoshkevich wrote:
> > > > qemu-s390x puts a wrong value into SIGILL's siginfo_t's
> > > > psw.addr:
> > > > it
> > > > should be a pointer to the instruction following the illegal
> > > > instruction, but at the moment it is a pointer to the illegal
> > > > instruction itself. This breaks OpenJDK, which relies on this
> > > > value.
> > > > 
> > > > Patch 1 fixes the issue, patch 2 adds a test.
> > > > 
> > > > v1:
> > > > https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06592.html
> > > > v1 -> v2: Use a better buglink (Cornelia), simplify the inline
> > > > asm
> > > >            magic in the test and add an explanation (David).
> > > > 
> > > > v2:
> > > > https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06649.html
> > > > v2 -> v3: Fix SIGSEGV handling (found when trying to run
> > > > valgrind
> > > > under
> > > >            qemu-user).
> > > > 
> > > 
> > > There might still be something wrong:
> > > 
> > > https://gitlab.com/qemu-project/qemu/-/issues/319
> > > 
> > > At least it smells like some more signal (mis)handling.
> > > 
> > > 
> > 
> > I've taken another look, and it must be compare-and-trap
> > SIGFPE/SIGILL
> > mixup. I think I will just fix it here in v4.
> 
> Yes, I've been looking at it too and found it is a compare-and-trap
> SIGFPE/SIGILL mixup. I was about to send out a patch if you want
> to wait. I should be able to send it out in an hour.
> 
> Jon

Sure, please go ahead. I'll simply rebase my v4 on top of your patch
then.

Best regards,
Ilya


