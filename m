Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 002EF519D47
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 12:45:56 +0200 (CEST)
Received: from localhost ([::1]:60938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmCW3-0008P8-N6
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 06:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nmBRj-0003Ar-Fx; Wed, 04 May 2022 05:37:27 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:21424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nmBRg-0005eO-HN; Wed, 04 May 2022 05:37:22 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2449UVms002191;
 Wed, 4 May 2022 09:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ii1xVSec4K/GaEYOzHokm6sSra6t4ibKxC4PJWYlCI0=;
 b=JABzNqkcXLJ+VSPh8OIO5PtVWMJ/JAgUVSDOaFhQtGRunth3nN25GxTQV09AaFuFI+xN
 1OFtiU0tRLk8ZwHZIN3Lot4lk8Vr3rn/DdfdjY5GuBppSJvdVnfXmqP2mHgYtSoUH+wE
 nNDKe7l3KiegpXd18+FBTOS3Qo7G6yhkdGg4YfRNP96pyJqujLpgSIXarjTmQ3oBExRM
 FWs7RWokn66jLVVbtaCZ9L6zW8yQdYs8IVY1a4dKvcrEGGc8ai21Q/ms2zNJWzkFpn2F
 wvN9rsChoKUb+ai75u7SvCivsiTnRH6JBPtaA3EOwtO/Nt5CX+1upvl1m3Pdpem3lQD7 cA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fupwvr3wf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 09:37:17 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2449Uusg007805;
 Wed, 4 May 2022 09:37:16 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fupwvr3vk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 09:37:16 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2449USPB018232;
 Wed, 4 May 2022 09:37:14 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 3frvr8mb7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 09:37:14 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2449b9cC28508668
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 May 2022 09:37:09 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3E07AE053;
 Wed,  4 May 2022 09:37:11 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C76EAE057;
 Wed,  4 May 2022 09:37:11 +0000 (GMT)
Received: from [9.171.50.79] (unknown [9.171.50.79])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  4 May 2022 09:37:11 +0000 (GMT)
Message-ID: <ceb3c159c495b79d313016bcd0e3f36f217dbd38.camel@linux.ibm.com>
Subject: Re: branch-relative-long fails on s390x host (was: [PATCH]
 tests/tcg/s390x: Use a different PCRel32 notation in branch-relative-long.c)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>
Date: Wed, 04 May 2022 11:37:11 +0200
In-Reply-To: <dc9b9d50-aa32-9483-551a-2054e31b36a4@redhat.com>
References: <20220502164830.1622191-1-iii@linux.ibm.com>
 <0e5c5988-c764-edd8-5f8f-f208f5cef1d0@redhat.com>
 <e71d638b-3c62-31db-1abd-02ba40042eab@redhat.com>
 <8543dc2de432c787770f9f01c448434ab1e30c63.camel@linux.ibm.com>
 <f7a77dcc-590c-96f5-8e92-5806f51ac0d4@redhat.com>
 <1c4e55e45a92250f93d7671b4f658e616fc1edce.camel@linux.ibm.com>
 <dc9b9d50-aa32-9483-551a-2054e31b36a4@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jtMsH_g8bj0gtmbiEFicempKOzR6JROI
X-Proofpoint-GUID: 411dX4_3UvE1ZJ4-rPy3WFpSfu7qTAWV
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-04_03,2022-05-02_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 mlxscore=0 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205040061
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2022-05-04 at 11:14 +0200, Thomas Huth wrote:
> On 04/05/2022 11.07, Ilya Leoshkevich wrote:
> > On Wed, 2022-05-04 at 09:01 +0200, Thomas Huth wrote:
> > > On 04/05/2022 00.46, Ilya Leoshkevich wrote:
> > > > On Tue, 2022-05-03 at 21:26 +0200, Thomas Huth wrote:
> > > > > On 03/05/2022 11.02, Thomas Huth wrote:
> > > > > > On 02/05/2022 18.48, Ilya Leoshkevich wrote:
> > > > > > > Binutils >=2.37 and Clang do not accept (. - 0x100000000)
> > > > > > > PCRel32
> > > > > > > constants. While this looks like a bug that needs fixing,
> > > > > > > use
> > > > > > > a
> > > > > > > different notation (-0x100000000) as a workaround.
> > > > > > > 
> > > > > > > Reported-by: Thomas Huth <thuth@redhat.com>
> > > > > > > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > > > > > > ---
> > > > > > >     tests/tcg/s390x/branch-relative-long.c | 4 ++--
> > > > > > >     1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/tests/tcg/s390x/branch-relative-long.c
> > > > > > > b/tests/tcg/s390x/branch-relative-long.c
> > > > > > > index 94219afcad..8ce9f1c2e5 100644
> > > > > > > --- a/tests/tcg/s390x/branch-relative-long.c
> > > > > > > +++ b/tests/tcg/s390x/branch-relative-long.c
> > > > > > > @@ -13,8 +13,8 @@
> > > > > > >             #_name "_end:\n");
> > > > > > >     DEFINE_ASM(br_r14, "br %r14");
> > > > > > > -DEFINE_ASM(brasl_r0, "brasl %r0,.-0x100000000");
> > > > > > > -DEFINE_ASM(brcl_0xf, "brcl 0xf,.-0x100000000");
> > > > > > > +DEFINE_ASM(brasl_r0, "brasl %r0,-0x100000000");
> > > > > > > +DEFINE_ASM(brcl_0xf, "brcl 0xf,-0x100000000");
> > > > > > 
> > > > > > Works for me, thanks!
> > > > > 
> > > > > Sorry, I spoke too soon - it compiles fine, and also runs
> > > > > fine
> > > > > when I
> > > > > run it
> > > > > natively, but when I run it through "qemu-s390x", it
> > > > > crashes...
> > > > > does
> > > > > that
> > > > > work for you?
> > > > 
> > > > Hi, yes, I just double-checked - it works fine for me.
> > > > Could you please share the resulting test binary?
> > > 
> > > 
> > > Sure, here it is:
> > > 
> > > https://people.redhat.com/~thuth/data/branch-relative-long
> > > 
> > >    Thomas
> > 
> > Your binary worked fine for me.
> > 
> > QEMU commit 2e3408b3cc7de4e87a9adafc8c19bfce3abec947,
> > x86_64 host,
> 
> Oh, well, now that you've mentioned it: I was running "make check-
> tcg" on a 
> s390x host. It works fine on a x86, indeed. So the new problem is
> likely in 
> the s390x TCG host backend... Richard, could you maybe have a look?
> 
>   Thomas

It worked fine on a s390x host for me as well.
Can this be related to the large mmap() that the test performs?

