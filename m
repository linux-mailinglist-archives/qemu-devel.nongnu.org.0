Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A62A757B5FF
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 13:56:52 +0200 (CEST)
Received: from localhost ([::1]:44818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE8Js-0007w2-8g
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 07:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=WeL6=XZ=zx2c4.com=Jason@kernel.org>)
 id 1oE7ks-0005mV-W5
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:20:39 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:46584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=WeL6=XZ=zx2c4.com=Jason@kernel.org>)
 id 1oE7kq-0000Xg-RX
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:20:38 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D742161CBC;
 Wed, 20 Jul 2022 11:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4C4C3411E;
 Wed, 20 Jul 2022 11:20:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="HITuw2co"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658316029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bY2sbXqkTAxGmtP+VKRMovotdPf2gdUOili5QCQ54QE=;
 b=HITuw2coiiEYxOeUSFKXXFMSHkVHDQUZCzNQ58fxF50VcD9YgIFTHZUzcuaJlkyTBT4eQB
 70lPOfD5VhHQFjQCNNHz6H2n7p3ot63tRQt4fG+wS6BL3W/zsgC78O/tsoVnSiVOaxw6gY
 wQn6MB3LQDjRB4HkOQSYy4nKjI+xn9c=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2f4462a8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 20 Jul 2022 11:20:29 +0000 (UTC)
Date: Wed, 20 Jul 2022 13:20:26 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [PULL 0/3] Misc patches for QEMU 7.1 freeze
Message-ID: <Ytfk+jNgPtTH3vl4@zx2c4.com>
References: <20220719093439.528810-1-pbonzini@redhat.com>
 <YtalBPp+QKS0wKWs@zx2c4.com>
 <b768df3d-4c36-549e-8e33-a3ec50ab95e2@redhat.com>
 <CAHmME9qvWjdSVCLWyTrXDS34zbJ=NZ6QBsFb-DpNO3deJ6xEYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHmME9qvWjdSVCLWyTrXDS34zbJ=NZ6QBsFb-DpNO3deJ6xEYQ@mail.gmail.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=WeL6=XZ=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hey again,

On Tue, Jul 19, 2022 at 08:15:54PM +0200, Jason A. Donenfeld wrote:
> Hi Paolo,
> 
> On Tue, Jul 19, 2022 at 8:15 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > On 7/19/22 14:35, Jason A. Donenfeld wrote:
> > >>   6 files changed, 19 insertions(+), 6 deletions(-)
> > > Considering the subject line, I'm quite distressed that the i386
> > > setup_data rng seed patch did not make it in. I just resent it to the
> > > mailing list [1] in case you missed it before. Do you think you could
> > > queue this up ASAP?
> >
> > Sure, no problem.  Unfortunately I was on vacation around the time you
> > sent it first.
> 
> Excellent, thanks so much!

Just wondering one thing: which tree did you put the patch in? I didn't
see it on your gitlab, but it seems like QEMU development happens in
many different places at once.

Jason

