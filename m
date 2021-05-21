Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E2E38C52A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 12:44:22 +0200 (CEST)
Received: from localhost ([::1]:35492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk2dh-0006kQ-Fr
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 06:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lk2cP-00061V-EV; Fri, 21 May 2021 06:43:01 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:16970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lk2cN-0005Ms-CN; Fri, 21 May 2021 06:43:01 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14LAYNxu099982; Fri, 21 May 2021 06:42:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=3UKamKsWZJnrpeweH/xV/JaOraiimYUsgmzrbBK5Fa8=;
 b=tjZyZ1uTK7/qyf413V30F/NjgnObcRtXpqe2+WBg9xwuAzbqemEbxw1AlI1b6NpLzvJA
 MPuzF7l620Xrw9MrQWx7xlcrL47a3d1v0u+LeoE1SS26Y0wHTkkVADn2PAC30iHNkabO
 OTxbG0EKJkigR1XoMxFIsXdcc69Caxq/JdmAq/PB5F1gNfHVOAaINSV4Z9mGxKZaWCnK
 9rvG9whwXSePL3j9Ob5Pp5fAbx7GeavvfUNYKiKETN7MGi5FkSSoZ8ql+W7SY7DHl+37
 MkM8zOnhQSV778L/h0pTtJrcgx4LgdziBPeBu+1lrtLRGyOAz7WEfYEgsHzR7DqZDQjs ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38p9puauw7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 06:42:56 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14LAYrW4101928;
 Fri, 21 May 2021 06:42:56 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38p9puauvb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 06:42:56 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14LAgrRS010571;
 Fri, 21 May 2021 10:42:53 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 38m19ss3tb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 10:42:53 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 14LAgLcC34406680
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 10:42:21 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34C40AE059;
 Fri, 21 May 2021 10:42:50 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D029EAE053;
 Fri, 21 May 2021 10:42:49 +0000 (GMT)
Received: from sig-9-145-39-144.uk.ibm.com (unknown [9.145.39.144])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 10:42:49 +0000 (GMT)
Message-ID: <cc4379ffbf73eb10ee29d91e28384b0bd2dd088b.camel@linux.ibm.com>
Subject: Re: [PATCH 2/2] tests/tcg/s390x: Test SIGILL handling
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Laurent Vivier <laurent@vivier.eu>
Date: Fri, 21 May 2021 12:42:49 +0200
In-Reply-To: <6470e715-60d5-992c-e5db-1b54d61ef92e@redhat.com>
References: <20210521030146.2831663-1-iii@linux.ibm.com>
 <20210521030146.2831663-3-iii@linux.ibm.com>
 <6470e715-60d5-992c-e5db-1b54d61ef92e@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: umF9jOJVleWoNNhEpz-wSw56T05qXyc0
X-Proofpoint-GUID: ZqebDukxkNEIfi4sIyzy9U1_6JGbxTUV
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_04:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxscore=0 impostorscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105210065
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2021-05-21 at 09:54 +0200, David Hildenbrand wrote:
> On 21.05.21 05:01, Ilya Leoshkevich wrote:
> > Verify that s390x-specific uc_mcontext.psw.addr is reported
> > correctly.
> > 
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > ---
> >   tests/tcg/s390x/Makefile.target |  1 +
> >   tests/tcg/s390x/sigill.c        | 41
> > +++++++++++++++++++++++++++++++++
> >   2 files changed, 42 insertions(+)
> >   create mode 100644 tests/tcg/s390x/sigill.c
> > 
> > diff --git a/tests/tcg/s390x/Makefile.target
> > b/tests/tcg/s390x/Makefile.target
> > index 241ef28f61..8699d829a5 100644
> > --- a/tests/tcg/s390x/Makefile.target
> > +++ b/tests/tcg/s390x/Makefile.target
> > @@ -8,3 +8,4 @@ TESTS+=exrl-trtr
> >   TESTS+=pack
> >   TESTS+=mvo
> >   TESTS+=mvc
> > +TESTS+=sigill
> > diff --git a/tests/tcg/s390x/sigill.c b/tests/tcg/s390x/sigill.c
> > new file mode 100644
> > index 0000000000..f8021dc6af
> > --- /dev/null
> > +++ b/tests/tcg/s390x/sigill.c
> > @@ -0,0 +1,41 @@
> > +#include <assert.h>
> > +#include <signal.h>
> > +#include <string.h>
> > +#include <ucontext.h>
> > +#include <unistd.h>
> > +
> > +extern char expected_si_addr[];
> > +extern char expected_psw_addr[];
> 
> Why "extern" ? For the magic inline asm below to work?

Yes - it cannot be static, because AFAIK there is no such thing as
static variable declaration (one can only define static variables).

> > +
> > +static void handle_signal(int sig, siginfo_t *info, void
> > *ucontext)
> > +{
> > +    if (sig != SIGILL) {
> > +        _exit(1);
> > +    }
> > +
> > +    if (info->si_addr != expected_si_addr) {
> > +        _exit(2);
> > +    }
> > +
> > +    if (((ucontext_t *)ucontext)->uc_mcontext.psw.addr !=
> > +            (unsigned long)expected_psw_addr) {
> > +        _exit(3);
> > +    }
> > +}
> > +
> > +int main(void)
> > +{
> > +    struct sigaction act;
> > +
> > +    memset(&act, 0, sizeof(act));
> > +    act.sa_sigaction = handle_signal;
> > +    act.sa_flags = SA_SIGINFO;
> > +
> > +    int ret = sigaction(SIGILL, &act, NULL);
> 
> Mixing code and declaration.

Ouch, will fix.

> > +    assert(ret == 0);
> > +
> > +    asm volatile("expected_si_addr:\t.byte\t0x00,0x00\n"
> > +                 "expected_psw_addr:");
> 
> At least I am confused how the right values actually end up in 
> expected_si_addr and expected_psw_addr.
> 
> Can we maybe add a comment? This looks quite hacky ;)

This whole construction is roughly the same as having sigill.s file
with:

.globl expected_si_addr
expected_si_addr: .byte 0,0
.globl expected_psw_addr
expected_psw_addr: br 14

and sigill.h file with:

void expected_si_addr(void);
extern char expected_psw_addr[];

Doing it this way would complicate the build, so I thought it would be
better to just put everything into a single file.


