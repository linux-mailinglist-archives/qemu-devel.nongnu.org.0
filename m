Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6A014733
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 11:10:30 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53193 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNZdk-000181-Vz
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 05:10:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shorne@gmail.com>) id 1hNZcZ-0000Vz-1R
	for qemu-devel@nongnu.org; Mon, 06 May 2019 05:09:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shorne@gmail.com>) id 1hNZcY-0000Xz-6H
	for qemu-devel@nongnu.org; Mon, 06 May 2019 05:09:15 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:42568)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shorne@gmail.com>)
	id 1hNZcW-0000VT-3O; Mon, 06 May 2019 05:09:12 -0400
Received: by mail-pf1-x444.google.com with SMTP id 13so6108795pfw.9;
	Mon, 06 May 2019 02:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=m6dOr6tTx7EF/DH7No4YJKLaMzsUIkjTy8PbX6Bwv0o=;
	b=h1ZkhWtgEUpBPGG4jyZfn50JpkIQfslk77hqsvN3ybJWQA5CBhLUSvJnDS4+IPU2vQ
	pWfSFTOs1kxPKV0E6vhpnEkWVCr4hURD7ICt9d+po1G5TgJKwtS6+zYXdUs8Dl+n7MKH
	drtkH6FedH2nlol+eJDwRBAOsny0sSF479gwWAeukeTFvyJ2LEFQyC5ScWCEOjhu2oSW
	73VwHqweGN341I2vy3D2tICq5fcDLkFauEw4XqtFcQdgHcTctNX0NP81mCfYeLF2ZKi6
	l9fb6cXFXlxharXxwyBB/2+GKLjNvjxZ5b2YIlHcp664BQ/Or0XkFmk6WxuXhVdiOQyZ
	bj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=m6dOr6tTx7EF/DH7No4YJKLaMzsUIkjTy8PbX6Bwv0o=;
	b=WL/Thd2ubl0KLzjhK6aMMcZQ1SJD9dbUmM0rfJjoAxQQJNiTTfMTgYXpQ+wKRs6GLv
	F3EXpv8kaj5HTBEcZHCeL7GLuoQ1L2Pi3ExctEUkLjU645SyLBnjMYXCTxVQy5i1/38u
	wUUvJZrLZNpXB6DxphMseTIwAWOYaBKW0zebh65hKjdKaY1Q5PcOiY/0ZX54q7mwkWsX
	GQCAo2GqZUlg6M2J5UWo71WrCILQNqX4D9jO8rlSWWHcfm3UHAqtsYIgR9Mcn315KX9H
	LBv/Fa6Q2rnbkT7647B1TJ38XXoThXz2AGbuk93wKuj5kQ310bk6vNDz/o9pFgnYdbys
	b9bA==
X-Gm-Message-State: APjAAAWLmbsCFKjW+mwA1lIpelNaHTjfmc4mRIrhF7ac9G5lnN+Qi8nA
	FxTMyyTER4MquFwMsqC9bH8=
X-Google-Smtp-Source: APXvYqxwq8EI1W8jbOy2bLOklDCtA5nQ+I01cw4qApM9D0V46BGiqAn1kcLYSWjAa8UwECBlbmPACg==
X-Received: by 2002:a62:e90d:: with SMTP id j13mr32990599pfh.42.1557133749281; 
	Mon, 06 May 2019 02:09:09 -0700 (PDT)
Received: from localhost (g191.61-115-60.ppp.wakwak.ne.jp. [61.115.60.191])
	by smtp.gmail.com with ESMTPSA id
	g23sm11679274pfi.119.2019.05.06.02.09.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 May 2019 02:09:08 -0700 (PDT)
Date: Mon, 6 May 2019 18:09:06 +0900
From: Stafford Horne <shorne@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20190506090906.GB11006@lianli.shorne-pla.net>
References: <1550073577-4248-1-git-send-email-thuth@redhat.com>
	<ed9e9035-2bea-bcb7-c8ca-23486021d852@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed9e9035-2bea-bcb7-c8ca-23486021d852@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-devel] [PATCH] target/openrisc: Fix LGPL information in
 the file headers
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On Mon, May 06, 2019 at 07:53:45AM +0200, Thomas Huth wrote:
> On 13/02/2019 16.59, Thomas Huth wrote:
> > It's either "GNU *Library* General Public License version 2" or "GNU
> > Lesser General Public License version *2.1*", but there was no "version
> > 2.0" of the "Lesser" license. So assume that version 2.1 is meant here.

Acked-by: Stafford Horne <shorne@gmail.com>

> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  hw/openrisc/cputimer.c               | 2 +-
> >  hw/openrisc/openrisc_sim.c           | 2 +-
> >  hw/openrisc/pic_cpu.c                | 2 +-
> >  linux-user/openrisc/target_cpu.h     | 2 +-
> >  linux-user/openrisc/target_structs.h | 2 +-
> >  target/openrisc/cpu.h                | 2 +-
> >  target/openrisc/exception.c          | 2 +-
> >  target/openrisc/exception_helper.c   | 2 +-
> >  target/openrisc/fpu_helper.c         | 2 +-
> >  target/openrisc/insns.decode         | 2 +-
> >  target/openrisc/interrupt.c          | 2 +-
> >  target/openrisc/machine.c            | 2 +-
> >  target/openrisc/mmu.c                | 2 +-
> >  13 files changed, 13 insertions(+), 13 deletions(-)
> > 
[...]
> > 
> 
> Ping?

Sorry, I must have missed this.  What is your plan for sending upstream?  I
don't really have anything in my queue right now so if you have another queue
that would be great.  If not let me know and I can queue it.

-Stafford

