Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F9A57B6DA
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 14:56:01 +0200 (CEST)
Received: from localhost ([::1]:60178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE9F9-0002q8-Ru
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 08:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=WeL6=XZ=zx2c4.com=Jason@kernel.org>)
 id 1oE9Bw-0008RC-Jn
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 08:52:41 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:38358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=WeL6=XZ=zx2c4.com=Jason@kernel.org>)
 id 1oE9Bu-0002gm-R0
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 08:52:40 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 784016181A;
 Wed, 20 Jul 2022 12:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D065C3411E;
 Wed, 20 Jul 2022 12:52:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="pnUd08hz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658321551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m4if/YmT5XTBhHDSh5lghAc29vUb6uH4RhkykhB5AgA=;
 b=pnUd08hzbJprkQhxXWcNGxhWCfXCSwtSJHp0BHES528LP5LQpYjvKCZ4bxZStZj1ygpIkW
 zse1+DxcoOjQI2F+2202ltdXx7Gh8Bv1ElzI9DsB62nudaQzyS1NZrBsrnrUcxnPCdaQPJ
 WQVA6oFdfekFh6VC3tSTvAxUlMI9dUk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cda7d0cf
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 20 Jul 2022 12:52:31 +0000 (UTC)
Date: Wed, 20 Jul 2022 14:52:29 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [PULL 0/3] Misc patches for QEMU 7.1 freeze
Message-ID: <Ytf6jewNKbXsaULr@zx2c4.com>
References: <20220719093439.528810-1-pbonzini@redhat.com>
 <YtalBPp+QKS0wKWs@zx2c4.com>
 <b768df3d-4c36-549e-8e33-a3ec50ab95e2@redhat.com>
 <CAHmME9qvWjdSVCLWyTrXDS34zbJ=NZ6QBsFb-DpNO3deJ6xEYQ@mail.gmail.com>
 <Ytfk+jNgPtTH3vl4@zx2c4.com>
 <3b0175f0-50ab-48b9-e05b-d9ef81433532@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3b0175f0-50ab-48b9-e05b-d9ef81433532@redhat.com>
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

Hi Paolo,

On Wed, Jul 20, 2022 at 02:47:48PM +0200, Paolo Bonzini wrote:
> On 7/20/22 13:20, Jason A. Donenfeld wrote:
> >>> Sure, no problem.  Unfortunately I was on vacation around the time you
> >>> sent it first.
> >> Excellent, thanks so much!
> > Just wondering one thing: which tree did you put the patch in? I didn't
> > see it on your gitlab, but it seems like QEMU development happens in
> > many different places at once.
> 
> Well, I still had to review it (unless I screw up, you get a reply from 
> me once a patch is queued).  I think there are some issues with 
> migration compatibility of setup_data and they snowball a bit, so I'll 
> reply there.

Hmm, okay. Looking forward greatly to your reply there...

Jason

