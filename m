Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAD0669FB0
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:16:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGN8y-0002ac-Mf; Fri, 13 Jan 2023 11:43:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <foo00@h08.hostsharing.net>)
 id 1pGLqz-0001Ep-Lp
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:20:34 -0500
Received: from bmailout1.hostsharing.net ([2a01:37:1000::53df:5f64:0])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <foo00@h08.hostsharing.net>)
 id 1pGLqt-0000Dw-5I
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:20:25 -0500
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net",
 Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id 67C0330000D2F;
 Fri, 13 Jan 2023 16:12:17 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id EB800233EB0; Fri, 13 Jan 2023 16:12:06 +0100 (CET)
Date: Fri, 13 Jan 2023 16:12:06 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Gregory Price <gregory.price@memverge.com>, qemu-devel@nongnu.org,
 Michael Tsirkin <mst@redhat.com>,
 Ben Widawsky <bwidawsk@kernel.org>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, Ira Weiny <ira.weiny@intel.com>,
 Gregory Price <gourry.memverge@gmail.com>
Subject: Re: [PATCH 0/8] hw/cxl: CXL emulation cleanups and minor fixes for
 upstream
Message-ID: <20230113151206.GA20583@wunner.de>
References: <20230111142440.24771-1-Jonathan.Cameron@huawei.com>
 <Y8AppXP+eP9cEz+i@memverge.com>
 <20230112172130.0000391b@Huawei.com>
 <Y8CNw/fZT5fZJZcK@memverge.com>
 <20230113091213.00002146@Huawei.com>
 <Y8Foj/12QNl0C96o@memverge.com>
 <20230113144026.000001fb@Huawei.com>
 <20230113144511.00001207@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113144511.00001207@Huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: none client-ip=2a01:37:1000::53df:5f64:0;
 envelope-from=foo00@h08.hostsharing.net; helo=bmailout1.hostsharing.net
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 13 Jan 2023 11:43:02 -0500
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

On Fri, Jan 13, 2023 at 02:45:11PM +0000, Jonathan Cameron wrote:
> On Fri, 13 Jan 2023 14:40:26 +0000 Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:
> > On Fri, 13 Jan 2023 09:19:59 -0500 Gregory Price <gregory.price@memverge.com> wrote:
> > > On Fri, Jan 13, 2023 at 09:12:13AM +0000, Jonathan Cameron wrote:  
> > > > Just to check, are these different from the on stack problem you reported
> > > > previously?  Doesn't look like the fix for that has made it upstream yet.
> > > > 
> > > > What kernel are you running?
> > > 
> > > The prior issue I saw was related to the CXL Fixed Memory Window having
> > > an e820 region registered during machine initialization.  That fix is
> > > upstream.
> > > 
> > > On 2023-1-11 branch it is commit 2486dd045794d65598fbca9fd1224c27b9732dce
> > > 
> > > This one appears when registering any kind of type-3 device, during
> > > boot.  
> > 
> > I meant this one
> > 
> > https://lore.kernel.org/all/20221118000524.1477383-1-ira.weiny@intel.com/
> > 
> > Sorry, should have dug out a link in earlier reply and save a round trip.
> 
> Ah I'd forgotten we were going round the houses somewhat on the right fix...
> https://lore.kernel.org/all/20221128040338.1936529-3-ira.weiny@intel.com/
> was another proposal and Lukas had yet another.
> https://lore.kernel.org/all/cover.1669608950.git.lukas@wunner.de/

I'll respin those fixes shortly, together with the other DOE patches
I've accumulated on my development branch for DOE+SPDM:

https://github.com/l1k/linux/commits/doe

Ira kindly tested them this week and reports that they don't regress
CDAT retrieval for him.

Thanks,

Lukas

