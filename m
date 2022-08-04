Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CA6589CA0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 15:27:56 +0200 (CEST)
Received: from localhost ([::1]:46410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJatH-0001Uu-9m
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 09:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJaml-0005Ui-JA
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:21:14 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:50814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJamg-0003Re-HP
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:21:09 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E5E5161803;
 Thu,  4 Aug 2022 13:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50747C433B5;
 Thu,  4 Aug 2022 13:21:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="DqYkPuV1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659619262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=flPlp2nO3R0tAoKkVPirDoj2VMqybtlx/HZ4r6Oj6CA=;
 b=DqYkPuV1SaNLjqYCsEzABEB+BDIC7CLRWrniLQ/rhXp0bhvjEX09bT3FPaMkDi7hZ0ihNI
 +UEnVIdxbwxA1ugbuEnbItbsAN79lBr+bTz0tZwxkBdRvQr6GtDS8CU+5zbOnbFIxONv63
 HrQLDYkDeJEtYdltBDv6ZxHIbGfay4w=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 625a79c0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 4 Aug 2022 13:21:02 +0000 (UTC)
Date: Thu, 4 Aug 2022 15:20:59 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] pc: add property for Linux setup_data seed
Message-ID: <YuvHu3NW592rGFXz@zx2c4.com>
References: <20220804131320.395015-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220804131320.395015-1-pbonzini@redhat.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org;
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

On Thu, Aug 04, 2022 at 03:13:20PM +0200, Paolo Bonzini wrote:
> Using a property makes it possible to use the normal compat property
> mechanism instead of ad hoc code; it avoids parameter proliferation
> in x86_load_linux; and allows shipping the code even if it is
> disabled by default.

Strong NACK from me here.

If this kind of thing is off by default, it's as good as useless. Indeed
it shouldn't even be a knob at all. Don't do this.

Rather, let's fix the bug. The code as-is -- going back to the 2016 DTB
addition -- is problematic and needs to be fixed. So let's fix that.
Trying to cover up the problem with a default-off knob just ensures this
stuff will never be made to work right.

Please do not commit this patch.

Rather, let's see what a few round of review can do over on the fix I
posted. We're still in rc0. No need to jump to something terrible like
this.

Jason

