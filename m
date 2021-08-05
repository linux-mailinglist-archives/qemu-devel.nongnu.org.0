Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 338873E1350
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 12:57:30 +0200 (CEST)
Received: from localhost ([::1]:43532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBb45-0007PT-8y
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 06:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1mBb38-00069c-Nn
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 06:56:30 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:22762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1mBb36-0002wV-1v
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 06:56:30 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 175AXT5h047317; Thu, 5 Aug 2021 06:56:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=kzDaugfXQXbcgGsVBR6DX9OkA1bndBSeXymjMI3BkHU=;
 b=jljRb6gFR0jDXH6NJS3TdIXJiIGT8xKStkQ/Jy4OhGv6Jpr5wQPGs+BAVemzmPaWbwM+
 P5a1n7Z7i//S7i5VmGg72w0acgP+fOf6xXlMS6Q9eSm7a12snHiDrjI+Jqf0swp00TyW
 vNz8rsWSA/LSg9DxOMTqq0OQoVCwuyapf+EqF+M5XbqwEpeHL2xBP12knPyhvSsdz+3y
 n48auNqlwPhUFB4qboypB+Bk/0VI71fYvPtabzik32maBhvokkWizqfoh5PbSrXEjYIK
 ALBIucwg/sZJZkBebJi7cwbJS3oUL3Yvgp1BQ6qDmfcipQWwj88XzvcRVKTOC/nZkGMA aQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a7b795ptw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 06:56:25 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 175AYaFu050635;
 Thu, 5 Aug 2021 06:56:25 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a7b795pte-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 06:56:25 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 175AqNde029878;
 Thu, 5 Aug 2021 10:56:23 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3a8dcqg3dk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 10:56:23 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 175AuKPU49938928
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 10:56:20 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D3B7AE09E;
 Thu,  5 Aug 2021 10:56:20 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A77EAE0A8;
 Thu,  5 Aug 2021 10:56:19 +0000 (GMT)
Received: from sig-9-145-77-113.uk.ibm.com (unknown [9.145.77.113])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Aug 2021 10:56:19 +0000 (GMT)
Message-ID: <8481e2b62d5bf3295ffb309ce54fbdaf42fcef0b.camel@linux.ibm.com>
Subject: Re: [PATCH RFC 1/1] accel/tcg: Clear PAGE_WRITE before translation
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>
Date: Thu, 05 Aug 2021 12:56:19 +0200
In-Reply-To: <507a0eae-6dcf-68c0-ee5f-40499788e2b4@linaro.org>
References: <20210804224633.154083-1-iii@linux.ibm.com>
 <20210804224633.154083-2-iii@linux.ibm.com>
 <507a0eae-6dcf-68c0-ee5f-40499788e2b4@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zx4ftk535_j7QxgoQFqhqn6U0y9Ghpsm
X-Proofpoint-ORIG-GUID: T3LA8tqRV0SpbTgao6H3PEcwXgtaLZ39
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-05_03:2021-08-05,
 2021-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108050063
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2021-08-04 at 14:30 -1000, Richard Henderson wrote:
> On 8/4/21 12:46 PM, Ilya Leoshkevich wrote:
> > translate_insn() implementations fetch instruction bytes piecemeal,
> > which can cause qemu-user to generate inconsistent translations if
> > another thread modifies them concurrently [1].
> > 
> > Fix by marking translation block pages non-writable earlier.
> > 
> > [1] 
> > https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg00644.html
> > 
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > ---
> >   accel/tcg/translate-all.c    | 59 +++++++++++++++++++++----------
> > -----
> >   accel/tcg/translator.c       | 26 ++++++++++++++--
> >   include/exec/translate-all.h |  1 +
> >   3 files changed, 59 insertions(+), 27 deletions(-)
> > 
> > diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> > index bbfcfb698c..fb9ebfad9e 100644
> > --- a/accel/tcg/translate-all.c
> > +++ b/accel/tcg/translate-all.c
> > @@ -1297,31 +1297,8 @@ static inline void tb_page_add(PageDesc *p,
> > TranslationBlock *tb,
> >       invalidate_page_bitmap(p);
> >   
> >   #if defined(CONFIG_USER_ONLY)
> > -    if (p->flags & PAGE_WRITE) {
> > -        target_ulong addr;
> > -        PageDesc *p2;
> > -        int prot;
> > -
> > -        /* force the host page as non writable (writes will have a
> > -           page fault + mprotect overhead) */
> > -        page_addr &= qemu_host_page_mask;
> > -        prot = 0;
> > -        for (addr = page_addr; addr < page_addr +
> > qemu_host_page_size;
> > -            addr += TARGET_PAGE_SIZE) {
> > -
> > -            p2 = page_find(addr >> TARGET_PAGE_BITS);
> > -            if (!p2) {
> > -                continue;
> > -            }
> > -            prot |= p2->flags;
> > -            p2->flags &= ~PAGE_WRITE;
> > -          }
> > -        mprotect(g2h_untagged(page_addr), qemu_host_page_size,
> > -                 (prot & PAGE_BITS) & ~PAGE_WRITE);
> > -        if (DEBUG_TB_INVALIDATE_GATE) {
> > -            printf("protecting code page: 0x" TB_PAGE_ADDR_FMT
> > "\n", page_addr);
> > -        }
> > -    }
> > +    /* translator_loop() must have made all TB pages non-writable
> > */
> > +    assert(!(p->flags & PAGE_WRITE));
> >   #else
> >       /* if some code is already present, then the pages are
> > already
> >          protected. So we handle the case where only the first TB
> > is
> > @@ -2394,6 +2371,38 @@ int page_check_range(target_ulong start,
> > target_ulong len, int flags)
> >       return 0;
> >   }
> >   
> > +void page_protect(tb_page_addr_t page_addr)
> > +{
> > +    target_ulong addr;
> > +    PageDesc *p;
> > +    int prot;
> > +
> > +    p = page_find(page_addr >> TARGET_PAGE_BITS);
> > +    if (p && (p->flags & PAGE_WRITE)) {
> > +        /*
> > +         * Force the host page as non writable (writes will have a
> > page fault +
> > +         * mprotect overhead).
> > +         */
> > +        page_addr &= qemu_host_page_mask;
> > +        prot = 0;
> > +        for (addr = page_addr; addr < page_addr +
> > qemu_host_page_size;
> > +             addr += TARGET_PAGE_SIZE) {
> > +
> > +            p = page_find(addr >> TARGET_PAGE_BITS);
> > +            if (!p) {
> > +                continue;
> > +            }
> > +            prot |= p->flags;
> > +            p->flags &= ~PAGE_WRITE;
> > +        }
> > +        mprotect(g2h_untagged(page_addr), qemu_host_page_size,
> > +                 (prot & PAGE_BITS) & ~PAGE_WRITE);
> > +        if (DEBUG_TB_INVALIDATE_GATE) {
> > +            printf("protecting code page: 0x" TB_PAGE_ADDR_FMT
> > "\n", page_addr);
> > +        }
> > +    }
> > +}
> > +
> >   /* called from signal handler: invalidate the code and unprotect
> > the
> >    * page. Return 0 if the fault was not handled, 1 if it was
> > handled,
> >    * and 2 if it was handled but the caller must cause the TB to be
> > diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
> > index c53a7f8e44..bfbe7d7ccf 100644
> > --- a/accel/tcg/translator.c
> > +++ b/accel/tcg/translator.c
> > @@ -14,6 +14,7 @@
> >   #include "exec/exec-all.h"
> >   #include "exec/gen-icount.h"
> >   #include "exec/log.h"
> > +#include "exec/translate-all.h"
> >   #include "exec/translator.h"
> >   #include "exec/plugin-gen.h"
> >   #include "sysemu/replay.h"
> > @@ -47,6 +48,10 @@ void translator_loop(const TranslatorOps *ops,
> > DisasContextBase *db,
> >   {
> >       uint32_t cflags = tb_cflags(tb);
> >       bool plugin_enabled;
> > +    bool stop = false;
> > +#ifdef CONFIG_USER_ONLY
> > +    target_ulong page_addr = -1;
> > +#endif
> >   
> >       /* Initialize DisasContext */
> >       db->tb = tb;
> > @@ -71,6 +76,21 @@ void translator_loop(const TranslatorOps *ops,
> > DisasContextBase *db,
> >       plugin_enabled = plugin_gen_tb_start(cpu, tb, cflags &
> > CF_MEMI_ONLY);
> >   
> >       while (true) {
> > +#ifdef CONFIG_USER_ONLY
> > +        /*
> > +         * Make the page containing the next instruction non-
> > writable in order
> > +         * to get a consistent translation if another thread is
> > modifying the
> > +         * code while translate_insn() fetches the instruction
> > bytes piecemeal.
> > +         * Writer threads will wait for mmap_lock() in
> > page_unprotect().
> > +         */
> > +        if ((db->pc_next & TARGET_PAGE_MASK) != page_addr) {
> > +            page_addr = db->pc_next & TARGET_PAGE_MASK;
> > +            page_protect(page_addr);
> > +        }
> > +#endif
> > +        if (stop) {
> > +            break;
> > +        }

Thanks, moving protection to just before instruction byte loads makes
perfect sense. I have just one question.

> So... I think this isn't quite right.
> 
> (1) If we stop exactly at the page break, this protects the *next*
> page unnecessarily.
> 
> (2) This only protects the page of the start of the insn.  If the
> instruction crosses the 
> page boundary, then the latter part of the insn is still victim to
> the race we're trying 
> to fix.
> 
> I think a protect needs to happen in translator_ld*_swap, before
> reading the data.
> 
> I think that the translator_ld*_swap functions should be moved out of
> include/exec/translator.h into accel/tcg/translator.c.

Do we really need this? In the end, the added code is not that large.

> I think that the translator_ld* functions should add a
> DisasContextBase argument, which 
> should then contain the cache for the protection.  This will be a
> moderately large change, 
> but it should be mostly mechanical.
> 
> I think that we should initialize the protection cache before
> translating the first insn, 
> outside of that loop.  This will mean that you need not check for two
> pages 
> simultaneously, when a single read crosses the page boundary.  You'll
> know that (at 
> minimum) the first byte of the first read is already covered, and
> only need to check the 
> last byte of each subsequent read.  I think the value you use for
> your cache should be the 
> end of the page for which protection is known to apply, so that the
> check reduces to
> 
>    end = pc + len - 1;
>    if (end > dcbase->page_protect_end) {
>      dcbase->page_protect_end = end | ~TARGET_PAGE_MASK;
>      page_protect(end);
>    }
> 
> 
> r~


