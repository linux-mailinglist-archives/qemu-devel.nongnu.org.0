Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 847102ABF2A
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 15:48:51 +0100 (CET)
Received: from localhost ([::1]:49192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kc8TS-0001FH-IJ
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 09:48:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kc8Qr-0008FX-Mp
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 09:46:10 -0500
Received: from relay64.bu.edu ([128.197.228.104]:59464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kc8Qm-0006T0-LX
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 09:46:09 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 0A9EjGP2031740
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 9 Nov 2020 09:45:19 -0500
Date: Mon, 9 Nov 2020 09:45:16 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 2/2] docs/fuzz: update make and run command lines
Message-ID: <20201109144516.exl7pwtdqffujc2s@mozz.bu.edu>
References: <cover.1604920905.git.dimastep@yandex-team.ru>
 <b7ae9363e9e32d0d608eab92cd48fe6f6db8a5ce.1604920905.git.dimastep@yandex-team.ru>
 <6c8cb35d-84b4-4a8c-bff0-28446c0028d0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c8cb35d-84b4-4a8c-bff0-28446c0028d0@redhat.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 09:46:02
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: darren.kenny@oracle.com, Dima Stepanov <dimastep@yandex-team.ru>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru, stefanha@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 201109 1320, Thomas Huth wrote:
> On 09/11/2020 12.25, Dima Stepanov wrote:
> > After meson and some other build changes the qemu fuzz target should be
> > build as:
> >   make qemu-fuzz-i386
> > And also update the run path command line.
> > 
> > Signed-off-by: Dima Stepanov <dimastep@yandex-team.ru>
> > Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
> > ---
> >  docs/devel/fuzzing.txt | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/docs/devel/fuzzing.txt b/docs/devel/fuzzing.txt
> > index 03585c1..590900c 100644
> > --- a/docs/devel/fuzzing.txt
> > +++ b/docs/devel/fuzzing.txt
> > @@ -32,15 +32,15 @@ such as out-of-bounds accesses, use-after-frees, double-frees etc.
> >  
> >  Fuzz targets are built similarly to system/softmmu:
> >  
> > -    make i386-softmmu/fuzz
> > +    make qemu-fuzz-i386
> >  
> > -This builds ./i386-softmmu/qemu-fuzz-i386
> > +This builds ./build/qemu-fuzz-i386
> >  
> >  The first option to this command is: --fuzz-target=FUZZ_NAME
> >  To list all of the available fuzzers run qemu-fuzz-i386 with no arguments.
> >  
> >  For example:
> > -    ./i386-softmmu/qemu-fuzz-i386 --fuzz-target=virtio-scsi-fuzz
> > +    ./build/qemu-fuzz-i386 --fuzz-target=virtio-scsi-fuzz
> >  
> >  Internally, libfuzzer parses all arguments that do not begin with "--".
> >  Information about these is available by passing -help=1
> 
> This conflicts with Alexander's "docs/fuzz: update fuzzing documentation
> post-meson" patch ... which one should be used? One is better for people who
> do in-tree builds, the other is better for people who do out-of-tree builds

Ah my bad - I forgot that Dima also sent in fixes to these instructions.

> ... I'll go with Alexander's version for now for my next pull-request, since
> the text in this file says "/path/to/configure" which rather indicate
> out-of-tree builds, but in the long run, it would maybe be good to add some
> clarifying sentences here...
> 

Sounds good - I'll add more context/clarification to these instructions
later.

- Alex

>  Thomas
> 
> 

