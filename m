Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FAD35F0AE
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 11:21:17 +0200 (CEST)
Received: from localhost ([::1]:51502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWbhz-0004Rv-T8
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 05:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lWbgn-0003Wc-33; Wed, 14 Apr 2021 05:20:01 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lWbgk-00060k-UB; Wed, 14 Apr 2021 05:20:00 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13E9I1C2084695; Wed, 14 Apr 2021 05:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=xVnvvB3/1lBevdoKnFfl06wm9CWWz0SNVEdmD0OM270=;
 b=bmz1cxLdrkfh+dt7Y3t8/QINQLaVANxDg7Wsiql+js2TUJC5K8CBlcaeeXLLR8ZkuzrT
 9Ew7Qwyvis8McTy/9EOK2EkHiI5NzUHYM1HWtCgTHU8QlWxSHs/i5VY1NPUlRaz2nO+u
 oM6wvGkSHmR6Mc7agtVVyflo5kbe2Y18pLenq26OPR8UxsWEzI6ONVrR/h0UYKQ6MRPD
 yecSf4YLZYKg9lU7g0zfU/AsrALZoB9EUcP9dxebzcyXhNaW8giK7kqXJLeKoqRwcgGm
 b1blypHfQLRfQag++iaNhVeSKdfccIgks6gyAey7w3eeUFz/BZ5965A1REuftyrQ44cG Fg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37wwn1r0sp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 05:19:56 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13E9IFHB086343;
 Wed, 14 Apr 2021 05:19:55 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37wwn1r0sc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 05:19:55 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13E9HG5g013930;
 Wed, 14 Apr 2021 09:19:53 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 37u3n8b67b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 09:19:53 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13E9Jpev32899358
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Apr 2021 09:19:51 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF494AE057;
 Wed, 14 Apr 2021 09:19:50 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8120CAE051;
 Wed, 14 Apr 2021 09:19:50 +0000 (GMT)
Received: from sig-9-145-157-105.de.ibm.com (unknown [9.145.157.105])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Apr 2021 09:19:50 +0000 (GMT)
Message-ID: <9ffa39db0e16efa173119d3b9746bb312e214d87.camel@linux.ibm.com>
Subject: Re: [PATCH v2] target/s390x: Fix translation exception on illegal
 instruction
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Date: Wed, 14 Apr 2021 11:19:50 +0200
In-Reply-To: <20210414103813.2595508b.cohuck@redhat.com>
References: <20210413165257.21426-1-iii@linux.ibm.com>
 <20210414103813.2595508b.cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4442bsrSv1vnfc4zIMyvTTxfXjeie-oq
X-Proofpoint-ORIG-GUID: zl-qR6J7xJzb21IZxBa3j1vlY-Etymk-
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-14_06:2021-04-14,
 2021-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104140064
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2021-04-14 at 10:38 +0200, Cornelia Huck wrote:
> On Tue, 13 Apr 2021 18:52:57 +0200
> Ilya Leoshkevich <iii@linux.ibm.com> wrote:
> 
> > Hitting an uretprobe in a s390x TCG guest causes a SIGSEGV. What
> > happens is:
> > 
> > * uretprobe maps a userspace page containing an invalid
> > instruction.
> > * uretprobe replaces the target function's return address with the
> >   address of that page.
> > * When tb_gen_code() is called on that page, tb->size ends up being
> > 0
> >   (because the page starts with the invalid instruction), which
> > causes
> >   virt_page2 to point to the previous page.
> > * The previous page is not mapped, so this causes a spurious
> >   translation exception.
> > 
> > The bug is that tb->size must never be 0: even if there is an
> > illegal
> > instruction, the instruction bytes that have been looked at must
> > count
> > towards tb->size. So adjust s390x's translate_one() to act this way
> > for both illegal instructions and instructions that are known to
> > generate exceptions.
> > 
> > Also add an assertion to tb_gen_code() in order to detect such
> > situations in future.
> > 
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > ---
> > 
> > v1: 
> > https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02037.html
> > v1 -> v2: Fix target/s390x instead of trying to tolerate tb->size
> > == 0
> >           in tb_gen_code().
> > 
> >  accel/tcg/translate-all.c |  1 +
> >  target/s390x/translate.c  | 16 +++++++++++-----
> >  2 files changed, 12 insertions(+), 5 deletions(-)
> 
> I assume this bug is not usually hit during normal usage, right? It's
> probably not release critical, so I'll line it up for 6.1 instead.

Yes, I saw it only with uprobes, and then it leads only to a process
crash, not to a kernel crash. Thanks!


