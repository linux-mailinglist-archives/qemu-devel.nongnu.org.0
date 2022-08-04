Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23652589E31
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 17:06:19 +0200 (CEST)
Received: from localhost ([::1]:42206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJcQT-00082E-KP
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 11:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJcMN-0004HY-Cv
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 11:02:03 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:55888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJcML-0003x8-3F
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 11:02:02 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A426560F4C;
 Thu,  4 Aug 2022 15:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25DCEC433D7;
 Thu,  4 Aug 2022 15:01:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="f6cdCkNg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659625316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z4N0IfA0iwMwTSp77GPG+Jpw9BgBwY8F3yKK3Bqlen4=;
 b=f6cdCkNgNlIw79/QZcYbar5pi9jrR2+H5HT3iDKF+xxRLzOn4yONIFTnzLfU4DHz7Co7YI
 JJZrO8lLqUqAZaRL6nc/jpW9SFIJlRTAxsjTDMw6nbnkjOd/nmLQoFfyaMZX7xcNIDDNeb
 4jbrydf3fXokg1eUQU2uKfjMOzaCpi4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 18cf9dcd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 4 Aug 2022 15:01:56 +0000 (UTC)
Date: Thu, 4 Aug 2022 17:01:53 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: bchalios@amazon.es
Cc: qemu-devel@nongnu.org, ani@anisinha.ca, mst@redhat.com,
 imammedo@redhat.com, dwmw@amazon.co.uk, graf@amazon.de,
 xmarcalx@amazon.co.uk
Subject: Re: [PATCH 0/2] vmgenid: add generation counter
Message-ID: <YuvfYZIYVVI4GBEn@zx2c4.com>
References: <20220803134147.31073-1-bchalios@amazon.es>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220803134147.31073-1-bchalios@amazon.es>
Received-SPF: pass client-ip=139.178.84.217;
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

Hi Babis,

On Wed, Aug 03, 2022 at 03:41:45PM +0200, bchalios@amazon.es wrote:
> From: Babis Chalios <bchalios@amazon.es>
> 
> VM generation ID exposes a GUID inside the VM which changes every time a
> VM restore is happening. Typically, this GUID is used by the guest
> kernel to re-seed its internal PRNG. As a result, this value cannot be
> exposed in guest user-space as a notification mechanism for VM restore
> events.
> 
> This patch set extends vmgenid to introduce a 32 bits generation counter
> whose purpose is to be used as a VM restore notification mechanism for
> the guest user-space.
> 
> It is true that such a counter could be implemented entirely by the
> guest kernel, but this would rely on the vmgenid ACPI notification to
> trigger the counter update, which is inherently racy. Exposing this
> through the monitor allows the updated value to be in-place before
> resuming the vcpus, so interested user-space code can (atomically)
> observe the update without relying on the ACPI notification.

As I wrote on LKML:
https://lore.kernel.org/lkml/Yuve4vuAnU85mdRY@zx2c4.com/
you seem to be rehashing something already discussed in earlier threads.
I don't think we should rush to adding something like this to QEMU.

Jason

