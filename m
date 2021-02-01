Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5313630A6AC
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 12:38:26 +0100 (CET)
Received: from localhost ([::1]:44812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6XXF-0006oA-E5
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 06:38:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l6XQ1-0008QW-NV
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:30:58 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:57381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l6XPz-0000f6-43
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:30:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=CKEYH0/Y6ZGPl+ag4ahXYmUrUHvvTWmbMOqVuyIr5Ms=; b=KREhTlvbnYd37GEhTa4SXbDV1D
 xQYiEQ+4ayUGkwV/62i8bzA8Zz7LkKB0ysdtgfHjH67Au8p5PedEiRVWjDDpXUE0sAaG/ThRV/uGc
 TqdFe2cyul3Et8Z2PMEoKS1e5AeKqZC6AfK8qiDwyce3D8uRRAmSbdnDw/G6KIEdEE3BghSqrqrdk
 zYjmQK439DWNpin3Nep0QTQxNe6J7WZn/WqTX5HSV8NEFUDCccT81s96MfsuL7jQGfgFu9CUxrTKm
 htuifyid73Xe/unK3rCchDJxMqGgMaDjsva35egPzKDpkJuERZQye+76kHBedpleZpY04pN6hkQcd
 tHUgWcK9CUX0yVrgkxRvzPOJdpGW3ljbZ5hDDV2vrbWy5QshJaDzj6iN/P76blXlaK5Oc2CSK8lpP
 ymK8A5fDocFGJZbV06y6loLi+gRJetKwaiIWJIhQGyeRe3dj0dsHuu1FpCn5Zgd+iqZCfQR9mk958
 4ToX3mW60LnqaDTJLClOPojRLznEeftpQoz5OHKZcNeVEBU6AAWCr5QKGmfKBwYmofItdULDlkROA
 gz7R90Wv7KyZxyGoK+tquMmN5beTjoV2fgtS296H2Ty743bLHXs4O0E5zjNALQPfETv8e5KJdSR18
 8b8LDVe6WDoWUwXi6jpoQ+QigMTcRW1/F6TmKKr5M=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Subject: Re: 9pfs developers docs
Date: Mon, 01 Feb 2021 12:30:52 +0100
Message-ID: <3962897.vStEPALNoS@silver>
In-Reply-To: <20210201102426.3a3623c7@bahia.lan>
References: <3475760.T70ipHyFzN@silver> <20210201102426.3a3623c7@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 1. Februar 2021 10:24:26 CET Greg Kurz wrote:
> On Sun, 31 Jan 2021 19:23:52 +0100
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > Hi,
> 
> Hi Christian,
> 
> > I started setting up some developer documentation for 9pfs:
> > 	https://wiki.qemu.org/Documentation/9p
> > 
> > Still quite a bunch that should be added (e.g. there should be a section
> > about threads and coroutines), but at least it's a start ...
> 
> I agree that a bunch of other things should be documented, but that's
> definitely a great start. Thanks for doing this !
> 
> Just one remark on the topology diagram:
> 
> https://wiki.qemu.org/File:9pfs_topology.png
> 
> It gives the impression that the 9p transport and server can
> handle multiple guests, which they certainly don't : each
> 9p server lives in exactly one device which is exposed to
> exactly one guest.

Right, I haven't considered that the diagram might be interpreted that way. My 
primary intention was to show the 3 main components of 9pfs from design 
perspective and secondary showing that multiple guests can share storage.

So what would be better: a) duplicating the server side in the diagram (then 
the image might become a bit large in height), b) dropping the multiple 
guests, c) making the issue with server instances clear in the text?

If there are other things that you might think should be outlined by 
additional diagram(s) let me know, then I can add that in one rush.

--

BTW I'm no longer able to run the 'local' 9p tests, --slow doesn't work for 
me. If you don't have an idea what I might be missing, then I have to look why 
the CLI parameter is not interpreted.

Best regards,
Christian Schoenebeck



