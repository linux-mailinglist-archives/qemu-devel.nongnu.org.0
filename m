Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB3E5EFC0A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 19:33:18 +0200 (CEST)
Received: from localhost ([::1]:42586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odxPR-0008Fs-45
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 13:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hch@lst.de>) id 1odwZa-0004BA-DA
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:39:42 -0400
Received: from verein.lst.de ([213.95.11.211]:41440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hch@lst.de>) id 1odwZX-0004Up-FT
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:39:41 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
 id CA81468BFE; Thu, 29 Sep 2022 18:39:31 +0200 (CEST)
Date: Thu, 29 Sep 2022 18:39:31 +0200
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 qemu-devel@nongnu.org, kvm@vger.kernel.org, Kevin Wolf <kwolf@redhat.com>
Subject: Re: Commit 'iomap: add support for dma aligned direct-io' causes
 qemu/KVM boot failures
Message-ID: <20220929163931.GA10232@lst.de>
References: <fb869c88bd48ea9018e1cc349918aa7cdd524931.camel@redhat.com>
 <YzW+Mz12JT1BXoZA@kbusch-mbp.dhcp.thefacebook.com>
 <a2825beac032fd6a76838164d4e2753d30305897.camel@redhat.com>
 <YzXJwmP8pa3WABEG@kbusch-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzXJwmP8pa3WABEG@kbusch-mbp.dhcp.thefacebook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Received-SPF: none client-ip=213.95.11.211; envelope-from=hch@lst.de;
 helo=verein.lst.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Thu, Sep 29, 2022 at 10:37:22AM -0600, Keith Busch wrote:
> I don't think so. Memory alignment and length granularity are two completely
> different concepts. If anything, the kernel's ABI had been that the length
> requirement was also required for the memory alignment, not the other way
> around. That usage will continue working with this kernel patch.

Well, Linus does treat anything that breaks significant userspace
as a regression.  Qemu certainly is significant, but that might depend
on bit how common configurations hitting this issue are.

