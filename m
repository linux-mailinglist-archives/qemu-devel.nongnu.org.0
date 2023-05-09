Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5076FC1E7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 10:46:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwIyg-0003AT-V8; Tue, 09 May 2023 04:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwIyV-00039x-9E
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:45:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwIyT-0000u2-9a
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:45:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683621931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fYaqksX1TvsI6pE3ge2K745LEY1idxnVBDE0clmmKOA=;
 b=dj909KjbsHknJJX8NK8nTospCKbpHXwUOhX8TJcJG4Rtf/sW9jn8WJoJ2JomGq/kgIu6va
 PIm6QJ9c3+unay/bKJx96RfjVIuAqR4qs3sfXNe8kMqr9OFza0phl2FGjKS5HI9a49fg+V
 TLmbBpsgrhbaGvOh/uYm2SCClg1hedk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-85PpIixCNMat3uypboE9pg-1; Tue, 09 May 2023 04:45:28 -0400
X-MC-Unique: 85PpIixCNMat3uypboE9pg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C271B100F64F;
 Tue,  9 May 2023 08:45:27 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F2AAF1121314;
 Tue,  9 May 2023 08:45:26 +0000 (UTC)
Date: Tue, 9 May 2023 10:45:25 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: Your clang TSA patches
Message-ID: <ZFoIJRIqpwZAVlDY@redhat.com>
References: <CAJSP0QUccstoX1EBBB=snA+g7xTc4Wr4Hf+-x-k9dbbd2iahnA@mail.gmail.com>
 <CAJ+F1CJXaE+1O_93QuAiZ8Zddhc9hRp2X3Umc1whSqrPDXxEyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CJXaE+1O_93QuAiZ8Zddhc9hRp2X3Umc1whSqrPDXxEyg@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 09.05.2023 um 09:00 hat Marc-André Lureau geschrieben:
> Hi Stefan
> 
> On Mon, May 8, 2023 at 6:54 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
> 
> > Hi Marc-André,
> > clang's Thread Safety Analysis is being used more in the QEMU block
> > layer and a few limitations have been hit:
> > 1. Mutexes that are struct fields are not supported (only global mutexes
> > work).
> > 2. Analysis does not extend across function pointers. See
> > GRAPH_RDLOCK_PTR for a workaround that is currently used.
> >
> > (There was a third limitation that I don't remember. Maybe Kevin
> > remembers.)
> >
> > I heard you had clang or LLVM patches in that past that improve TSA.
> > Did your patches address these things? Any idea how hard it is to fix
> > these limitations?
> 
> I don't remember much about that work, I didn't spend that much time on it,
> and it was 5y ago already!
> 
> My WIP branch is still available:
> https://github.com/elmarco/clang/commits/qemu-ta
> 
> it seems I was trying to modify clang to support TSA annotations on
> typedef and function pointers, and warn on unmatching. I have no idea
> if this is still relevant. I remember dropping the effort at that time
> because of lack of interest or help in both projects.

TSA support for functions pointers would be very helpful for the work
we're currently doing in the context of multiqueue support. Function
pointers are essentially where the compiler checks break down for us and
we have to cover these parts manually during review. And we have
function pointers in almost every call path (mostly those in BlockDriver
these days, but also some callbacks passed to functions, like BHs).

Does "unmatching" mean that it checks that the TSA annotations in
prototypes and the actual function declaration agree? If so, that would
be nice, too. For now, I've settled on annotating only the header file
for public functions, which works, but it's harder to read.

The third limitation Stefan couldn't remember is lack of support for
__attribute__((cleanup)), which is used by the lock guard macros. This
one is pretty annoying and means that I'm using the guards less than I
would like.

Stefan's first point, not supporting mutexes in struct fields, is a
major limitation of TSA with C, too, but it doesn't actually affect the
current work in QEMU where we're dealing with a single global lock. Of
course, if it were supported, we would certainly have uses for that,
too.

Kevin


