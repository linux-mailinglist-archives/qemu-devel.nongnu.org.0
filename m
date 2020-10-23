Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A0D2971F3
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 17:08:58 +0200 (CEST)
Received: from localhost ([::1]:37384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVygb-0003O4-BB
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 11:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1kVyc6-0000nC-SB; Fri, 23 Oct 2020 11:04:19 -0400
Received: from nylar.uni-paderborn.de ([2001:638:502:c003::18]:58322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1kVyc2-0006Yy-AX; Fri, 23 Oct 2020 11:04:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9GPSaTdOaQSSNugLLXIHZmdo7eSAbYWd69+h8xZWBgQ=; b=N5vQRgQd1jQ8kJnBXxljfw333T
 nn5ID66RssELKrA9u6rnUxFDJeuQmiwZzvpjCiWWZhi5EDyle/z4+UnTPBHspx9Bhr0FiFd4cs5Tb
 P1DrJ+Gyw/Rxo1rkVuON6Z3J/xgr3yFsRVaqwn7w69Ym+ncLvTXDUM99IsNV2YaWRVo4=;
Date: Fri, 23 Oct 2020 17:04:06 +0200
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Chetan Pant <chetan4windows@gmail.com>
Subject: Re: [PATCH 13/30] tricore tcg cpus: Fix Lesser GPL version number
Message-ID: <20201023150406.225urj4k4ttirsae@schnipp-desktop>
References: <20201014134248.14146-1-chetan4windows@gmail.com>
 <20201023122157.19321-1-chetan4windows@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201023122157.19321-1-chetan4windows@gmail.com>
X-IMT-Spam-Score: 0.0 ()
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=19102831, da=91074512,
 mc=375, sc=3, hc=372, sp=0, fso=19102831, re=0, sd=0, hd=0
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2020.10.23.145717, AntiVirus-Engine: 5.77.0,
 AntiVirus-Data: 2020.10.20.5770002
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::18;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=nylar.uni-paderborn.de
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 23, 2020 at 12:21:57PM +0000, Chetan Pant wrote:
> There is no "version 2" of the "Lesser" General Public License.
> It is either "GPL version 2.0" or "Lesser GPL version 2.1".
> This patch replaces all occurrences of "Lesser GPL version 2" with
> "Lesser GPL version 2.1" in comment section.
> 
> Signed-off-by: Chetan Pant <chetan4windows@gmail.com>
> ---

Acked-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Cheers,
Bastian

