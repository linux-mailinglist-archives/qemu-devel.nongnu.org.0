Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F301034204D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 15:56:51 +0100 (CET)
Received: from localhost ([::1]:53740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNGYU-0007oz-Sy
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 10:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lNGUl-00041Y-4K; Fri, 19 Mar 2021 10:53:00 -0400
Received: from relay68.bu.edu ([128.197.228.73]:53974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lNGUf-0003y7-GN; Fri, 19 Mar 2021 10:52:58 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 12JEpoj0028085
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 19 Mar 2021 10:51:53 -0400
Date: Fri, 19 Mar 2021 10:51:50 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/2] floppy: add a regression test for CVE-2020-25741
Message-ID: <20210319145150.h4zy5zhucmxjylhc@mozz.bu.edu>
References: <20200827113806.1850687-1-ppandit@redhat.com>
 <20210319050906.14875-1-alxndr@bu.edu>
 <87lfajsn7w.fsf@dusky.pond.sub.org>
 <5a572879-02d6-d525-627c-892bd3903c25@redhat.com>
 <87v99nmpsi.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v99nmpsi.fsf@dusky.pond.sub.org>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: qemu-block@nongnu.org, Li Qiang <liq3ea@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210319 1054, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
> > On 19/03/21 06:53, Markus Armbruster wrote:
> >> I guess this is a reproducer.  Please also describe actual and expected
> >> result.  Same for PATCH 2.
> >
> > Isn't it in the patch itself?
> 
> A commit message should tell me what the patch is trying to accomplish.
> 
> This commit message's title tells me it's a test for a CVE.  Okay.  The
> body additionally gives me the reproducer.  To be useful, a reproducer
> needs to come with actual and expected result.  Yes, I can find those in
> the patch.  But I could find the reproducer there, too.  If you're nice
> enough to save me the trouble of digging through the patch for the
> reproducer (thanks), please consider saving me the trouble digging for
> the information I need to make use of it (thanks again).  That's all :)
> 
> [...]
> 

Ok sounds good. I posted this in-reply-to patch [1] from August 2020,
which had a stacktrace, and I hoped that would provide enough context.
However, that depends on the email-viewer and I see how that context
would be lost if/once these reproducer patches are applied.

[1] https://lore.kernel.org/qemu-devel/20200827113806.1850687-1-ppandit@redhat.com/

(https://lists.nongnu.org/archive doesn't display this discussion
as a child of that message)

