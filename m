Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A77F170ED7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 04:10:56 +0100 (CET)
Received: from localhost ([::1]:53282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j79Zf-0003gp-6D
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 22:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49750)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alxndr@bu.edu>) id 1j79Yo-0002sK-R7
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 22:10:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alxndr@bu.edu>) id 1j79Yn-0003lH-02
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 22:10:02 -0500
Received: from relay64.bu.edu ([128.197.228.104]:44528)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alxndr@bu.edu>) id 1j79Ym-0003hZ-Sp
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 22:10:00 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 01R39dtR012755
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 26 Feb 2020 22:09:40 -0500
Date: Wed, 26 Feb 2020 22:09:39 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 1/2] fuzz: fix typos in linker-script comments
Message-ID: <20200227030939.lk2ponyffzvstxhq@mozz.bu.edu>
References: <20200227024856.23777-1-alxndr@bu.edu>
 <20200227024856.23777-2-alxndr@bu.edu>
 <3476395c-3aba-6246-d11c-f108e33edfcd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3476395c-3aba-6246-d11c-f108e33edfcd@redhat.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 128.197.228.104
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Bandan Das <bsd@redhat.com>, stefanha@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 200226 2055, Eric Blake wrote:
> On 2/26/20 8:48 PM, Alexander Bulekov wrote:
> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > ---
> >   tests/qtest/fuzz/fork_fuzz.ld | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tests/qtest/fuzz/fork_fuzz.ld b/tests/qtest/fuzz/fork_fuzz.ld
> > index b23a59f194..b5aad06f20 100644
> > --- a/tests/qtest/fuzz/fork_fuzz.ld
> > +++ b/tests/qtest/fuzz/fork_fuzz.ld
> > @@ -1,5 +1,5 @@
> >   /* We adjust linker script modification to place all of the stuff that needs to
> > - * persist across fuzzing runs into a contiguous seciton of memory. Then, it is
> > + * persist across fuzzing runs into a contiguous section of memory. Then, it is
> >    * easy to re-map the counter-related memory as shared.
> >   */
> > @@ -32,6 +32,6 @@ SECTIONS
> >         __FUZZ_COUNTERS_END = .;
> >     }
> >   }
> > -/* Dont overwrite the SECTIONS in the default linker script. Instead insert the
> > +/* Don't overwrite the SECTIONS in the default linker script. Instead insert the
> >    * above into the default script */
> 
> As long as you're touching these two comments, checkpatch is going to
> complain that they don't follow the usual style of:
> 
> /*
>  * Text starts here...
>  * through here.
>  */
> 
> If you fix that as well for these two comments,
> Reviewed-by: Eric Blake <eblake@redhat.com> 

Must have missed it since the file has a .ld extension.
Thanks!
-Alex

> -- 
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3226
> Virtualization:  qemu.org | libvirt.org
> 

