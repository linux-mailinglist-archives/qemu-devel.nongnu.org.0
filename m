Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B945BF136
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:32:57 +0200 (CEST)
Received: from localhost ([::1]:54580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamjY-0000sl-Ce
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KZsR=ZX=zx2c4.com=Jason@kernel.org>)
 id 1oalT0-00036a-Gb
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:11:46 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:34250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KZsR=ZX=zx2c4.com=Jason@kernel.org>)
 id 1oalSy-000403-Ql
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:11:46 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CAF3EB82C0A;
 Tue, 20 Sep 2022 22:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1702C433D7;
 Tue, 20 Sep 2022 22:11:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Uh2nm3wC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1663711898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rbROUAwdEacxh2xQHLSyLBvaHhRuRxg3YnnFDTKBtJo=;
 b=Uh2nm3wCkUDnYDpg5KC2ssTOYBX5x+FDGODL2MPIdLUfxdVTqXHcPS2P3Yez0rUvQhtZss
 xuN1dKUigb5wA2WPw9U5jEXdo6y7B75WADVaw1bgWLCu/yHpp86vvicRs9LXcmcKbS2Zkc
 JZ60zGYV0xx7dBvXhuMCsqnp4ZV0T1A=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b2742766
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 20 Sep 2022 22:11:38 +0000 (UTC)
Date: Wed, 21 Sep 2022 00:11:35 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Hajnoczi, Stefan" <stefanha@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH] qboot: update to latest submodule
Message-ID: <Yyo6l8hq7TzRDSBv@zx2c4.com>
References: <20220919134126.75656-1-pbonzini@redhat.com>
 <CAHmME9rkethn5PHDkB8CupEBOYWFnzfA9c_YkmB_YMt64ci3pQ@mail.gmail.com>
 <Yyooji0KGTpZxzL1@zx2c4.com>
 <CABgObfZyb6t5iTMvXu+VfKx27dXDt1_RnPuL2tvK74evL0138Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABgObfZyb6t5iTMvXu+VfKx27dXDt1_RnPuL2tvK74evL0138Q@mail.gmail.com>
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=KZsR=ZX=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Sep 20, 2022 at 11:57:09PM +0200, Paolo Bonzini wrote:
> It should have been automatic, there's mirroring set up.

Hm, something is weird. Gitlab says "This project is mirrored from
https://gitlab.com/bonzini/qboot.git. Pull mirroring updated 28 minutes
ago." yet the commit is much older than 28 minutes ago. Backend issue of
sorts?

