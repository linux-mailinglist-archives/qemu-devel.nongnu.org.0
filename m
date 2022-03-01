Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782284C905B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 17:31:10 +0100 (CET)
Received: from localhost ([::1]:52494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP5P3-0000vb-Fd
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 11:31:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=HlCd=TM=zx2c4.com=Jason@kernel.org>)
 id 1nP5N1-0007w5-Hz
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 11:29:03 -0500
Received: from [2604:1380:4601:e00::1] (port=35294 helo=ams.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=HlCd=TM=zx2c4.com=Jason@kernel.org>)
 id 1nP5Mz-0003TM-K9
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 11:29:03 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 95470B8185A;
 Tue,  1 Mar 2022 16:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C10FC340EE;
 Tue,  1 Mar 2022 16:28:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="D7UrjJ4m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1646152134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=azUn2ki7Mj00I4cZyGYyVEVMYgwAwBTMCuqvy/VXMbE=;
 b=D7UrjJ4maBEi4nEme98+YCPJVmJo8lVsaJoNewrcfQObk6P6YpRz+3CgWVQ+gGINDw/ivF
 ES5me9CToU/6hwtUO3skAMWGsSGQWTzhLNI/0Mc6pEtAN2qew//z0nGtg2BwltGPhDDtcM
 V4zLgBtAlAw4iOeKha7WaVAvWwGJTkA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6fec32bc
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 1 Mar 2022 16:28:53 +0000 (UTC)
Date: Tue, 1 Mar 2022 17:28:48 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: propagating vmgenid outward and upward
Message-ID: <Yh5JwK6toc/zBNL7@zx2c4.com>
References: <Yh4+9+UpanJWAIyZ@zx2c4.com>
 <223f858c-34c5-3ccd-b9e8-7585a976364d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <223f858c-34c5-3ccd-b9e8-7585a976364d@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2604:1380:4601:e00::1
 (failed)
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=HlCd=TM=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: len.brown@intel.com, linux-hyperv@vger.kernel.org, colmmacc@amazon.com,
 berrange@redhat.com, adrian@parity.io, kvm@vger.kernel.org, jannh@google.com,
 gregkh@linuxfoundation.org, linux-pm@vger.kernel.org, mst@redhat.com,
 linux-kernel@vger.kernel.org, linux@dominikbrodowski.net,
 qemu-devel@nongnu.org, graf@amazon.com, linux-crypto@vger.kernel.org,
 pavel@ucw.cz, rafael@kernel.org, tytso@mit.edu, mikelley@microsoft.com,
 arnd@arndb.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laszlo,

On Tue, Mar 01, 2022 at 05:15:21PM +0100, Laszlo Ersek wrote:
> > If we had a "pull" model, rather than just expose a 16-byte unique
> > identifier, the vmgenid virtual hardware would _also_ expose a
> > word-sized generation counter, which would be incremented every time the
> > unique ID changed. Then, every time we would touch the RNG, we'd simply
> > do an inexpensive check of this memremap()'d integer, and reinitialize
> > with the unique ID if the integer changed.
> 
> Does the vmgenid spec (as-is) preclude the use of the 16-byte identifier
> like this?
> 
> After all, once you locate the identifier via the ADDR object, you could
> perhaps consult it every time you were about to touch the RNG.

No, you could in fact do this, and there'd be nothing wrong with that
from a spec perspective. You could even vDSO it all the way through
onward to userspace. However, doing a 16-byte atomic memcmp on
each-and-every packet is really a non-starter. For that kind of "check
it in the hot path" thing to be viable, you really want it to be a
counter that is word-sized. The "pull"-model involves pulling on every
single packet in order to be better than the "push"-model. Anyway, even
with a word-sized counter, it's unclear whether the costs of checking on
every packet would be worth it to everyone, but at least it's more
tenable than a 16-byte whammy.

Jason

