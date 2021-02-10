Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2A3316674
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 13:19:51 +0100 (CET)
Received: from localhost ([::1]:52710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9oTG-0007ew-0O
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 07:19:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1l9oRn-0007EL-3w
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 07:18:22 -0500
Received: from doohan.uni-paderborn.de ([2001:638:502:c003::16]:60622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1l9oRk-00060b-SC
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 07:18:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lM9WKtcqQX7lDn6J2Rppcbuhqfj1QYVA4AlRoxdao9Q=; b=diCVeo3Wired8FsFnEyoYH8o9j
 IA6yIsbkgDofFeDj09639WHAeguskwMZScv9HgnkNQkYBA0LcnK0jXAaeWGXJwoeoUBPzFmhcW56N
 VkWw3rJwe4AutPhFy+leX0HwediDBik8CkkzdhuYMld3GGOHjebiRKObxscuPjBzNWWY=;
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
Date: Wed, 10 Feb 2021 13:18:11 +0100
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PULL 0/1] tricore queue
Message-ID: <20210210121811.dpokh232b6kteo6y@schnipp-desktop>
References: <20210210092955.124757-1-kbastian@mail.uni-paderborn.de>
 <94b43ee3-2b41-aa58-fbc9-b6cc99f766d1@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <94b43ee3-2b41-aa58-fbc9-b6cc99f766d1@amsat.org>
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2021.2.10.120919, AntiVirus-Engine: 5.80.0,
 AntiVirus-Data: 2021.2.8.5800000
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=28596876, da=100568557,
 mc=470, sc=4, hc=466, sp=0, fso=28596876, re=0, sd=0, hd=0
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::16;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=doohan.uni-paderborn.de
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
Cc: peter.maydell@linaro.org, kbastian@mail.upb.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On Wed, Feb 10, 2021 at 12:18:57PM +0100, Philippe Mathieu-Daudé wrote:
> Hi Bastian,
> 
> On 2/10/21 10:29 AM, Bastian Koppelmann wrote:
> > The following changes since commit 1214d55d1c41fbab3a9973a05085b8760647e411:
> > 
> >   Merge remote-tracking branch 'remotes/nvme/tags/nvme-next-pull-request' into staging (2021-02-09 13:24:37 +0000)
> > 
> > are available in the Git repository at:
> > 
> >   https://github.com/bkoppelmann/qemu.git tags/pull-tricore-20210210
> > 
> > for you to fetch changes up to 52be63523e80bc92b8192a1e445fe499650085ac:
> > 
> >   tricore: added triboard with tc27x_soc (2021-02-10 10:26:38 +0100)
> > 
> > ----------------------------------------------------------------
> > added triboard with tc27x_soc
> 
> What about this series?
> 
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg776774.html

The patch of this PR was in my queue for a long time so this was the first thing I did. 
I missed Philippes series and just reviewed it now. I also saw 
https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg03467.html. I'll review
that as well and then respin.

Thanks,
Bastian

