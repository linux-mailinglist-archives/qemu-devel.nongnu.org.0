Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 901753832F6
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 16:55:10 +0200 (CEST)
Received: from localhost ([::1]:49076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lieeD-0000WU-IB
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 10:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1lieHA-0008VL-QO
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:31:22 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:65016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1lieH4-0000X5-Ek
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:31:20 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14HEEcCU130348; Mon, 17 May 2021 10:31:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=DioK5CglEqtaz614rXDSjF5QPcK8WVcfaaQlgByDt9o=;
 b=Da0tmfBJS9OsfEUNfhL+PWDKP7Q44hvltn7Hgm9j53LjEoDT1w+FxwnXO4S1ZKW6WDFq
 D7ZNex2HLbaa5001mKtOAQvVlw78ppFCe/d9QCzFGvsgymCsWBJKAQAcpNLTuSKfk/5r
 ahE41ak0NQjXxaaNh5/8zAFK9z9BoNVKWOtSQ61/mTTShEy3SFe+dhjz0r5+qFaHAxS1
 y2AqphDX2NSAn3uaZpHoQxkv9c8xkTRUudQFMjnwRK0b3nC6l14VH4GX8/DUSHqb9ft9
 OQcc9GhJl0pN7Kk7RHP3Maf95s63DI4nLAhvbrSuh1UW2iyUe6WqNigsKeB1zsA3MeOm SQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38kt2tgh6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 May 2021 10:31:10 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14HEEvwh131190;
 Mon, 17 May 2021 10:31:09 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38kt2tgh03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 May 2021 10:31:09 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14HEUvfh018457;
 Mon, 17 May 2021 14:30:57 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 38j5x88fhn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 May 2021 14:30:57 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14HEUsoB32113108
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 May 2021 14:30:55 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4CC842045;
 Mon, 17 May 2021 14:30:53 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78A9A42057;
 Mon, 17 May 2021 14:30:53 +0000 (GMT)
Received: from sig-9-145-39-144.uk.ibm.com (unknown [9.145.39.144])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 May 2021 14:30:53 +0000 (GMT)
Message-ID: <8ee2f22c07fe733897a85ce7526f692617686661.camel@linux.ibm.com>
Subject: Re: [PATCH 2/2] tests/tcg/x86_64: add vsyscall smoke test
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Date: Mon, 17 May 2021 16:30:53 +0200
In-Reply-To: <20210517145205.20359f18.cohuck@redhat.com>
References: <20210512040250.203953-1-iii@linux.ibm.com>
 <20210512040250.203953-3-iii@linux.ibm.com>
 <20210517145205.20359f18.cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: glz0PXpb3NWtGVu5sqo3ZIGpczrv2Hyz
X-Proofpoint-ORIG-GUID: 8z7XeavdgHAJB1qYbbWTDubiG0PYx7el
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-17_05:2021-05-17,
 2021-05-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105170100
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2021-05-17 at 14:52 +0200, Cornelia Huck wrote:
> On Wed, 12 May 2021 06:02:50 +0200
> Ilya Leoshkevich <iii@linux.ibm.com> wrote:
> 
> > Having a small test will prevent trivial regressions in the future.
> > 
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > ---
> >  tests/tcg/x86_64/Makefile.target |  6 +++++-
> >  tests/tcg/x86_64/vsyscall.c      | 11 +++++++++++
> >  2 files changed, 16 insertions(+), 1 deletion(-)
> >  create mode 100644 tests/tcg/x86_64/vsyscall.c
> 
> > diff --git a/tests/tcg/x86_64/vsyscall.c
> > b/tests/tcg/x86_64/vsyscall.c
> > new file mode 100644
> > index 0000000000..b9b7f87459
> > --- /dev/null
> > +++ b/tests/tcg/x86_64/vsyscall.c
> > @@ -0,0 +1,11 @@
> > +#include <stdio.h>
> > +#include <time.h>
> > +
> > +#define VSYSCALL_PAGE 0xffffffffff600000
> > +#define TIME_OFFSET 0x400
> > +typedef time_t (*time_func)(time_t *);
> > +
> > +int main(void)
> > +{
> > +    printf("%ld\n", ((time_func)(VSYSCALL_PAGE +
> > TIME_OFFSET))(NULL));
> > +}
> 
> Fails in https://gitlab.com/cohuck/qemu/-/jobs/1267727559 ("error:
> control reaches end of non-void function").

I always thought that omitting return in main() is allowed, but
turns out this is a C99-only thing. I should have probably used `make
docker-all-tests` instead of just `make check` to catch this.

I will send a v2.


