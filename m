Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E17346E75EB
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 11:02:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp3gy-00070u-Tg; Wed, 19 Apr 2023 05:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pp3gq-0006vN-Un
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 05:01:27 -0400
Received: from zuban.uni-paderborn.de ([2001:638:502:c003::17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pp3go-0005VC-Bw
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 05:01:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F0ScWjnr5xIu3gm2snohdqq+idSOC+YHKHCcwLdnb7c=; b=DLD2yyFUQxKjdGRzc8GieLee6G
 IoePcez1UUgpPslCNw8fM4e9GpGtdblS2AGORIF/o4YCF4cnsgxdVsrWjnCYq7bw+y9WhzFypUAPQ
 h+GOFySsssil2nVHbGcswfYD0JKIzqEwDStMd+XMlFBXYM8NkE7Gra95eDWs6pBElJNY=;
Date: Wed, 19 Apr 2023 11:01:14 +0200
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: _ * <billow.fun@gmail.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [Capstone] TriCore support in Capstone
Message-ID: <xvth67djad5y33d7yh2knjqq54ep6p5vhtogsckaumiyq6j4cp@uokkglljkbge>
References: <CAPLqH_6R_mtZr1aWT9PqfBAMesxkNuPYEZMR_RcXKQ0G_S0zag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPLqH_6R_mtZr1aWT9PqfBAMesxkNuPYEZMR_RcXKQ0G_S0zag@mail.gmail.com>
X-IMT-Source: Extern
X-IMT-Spam-Score: 0.0 ()
X-IMT-rspamd-score: 24
X-IMT-rspamd-bar: ++
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.4.19.85117, AntiVirus-Engine: 5.98.0,
 AntiVirus-Data: 2023.4.6.5980001
X-Sophos-SenderHistory: ip=84.184.52.177, fs=481318, da=169503940, mc=3, sc=0,
 hc=3, sp=0, fso=481318, re=0, sd=0, hd=0
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::17;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=zuban.uni-paderborn.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi billow,

On Mon, Mar 13, 2023 at 02:02:10PM +0800, _ * wrote:
> Hi!
> 
> My name is billow, I currently work on TriCore support in Capstone.
> Maybe later on it could be used in QEMU
> as a disassembly engine for that architecture?
> 
> It's in an early stage, but some feedback would be welcome.
> Any suggestions or improvements would be greatly appreciated!
> 
> The draft PR: https://github.com/capstone-engine/capstone/pull/1973

Looks really impressive. Thanks, for doing the work. I'd be happy to use it in QEMU.

Cheers,
Bastian

