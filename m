Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F94B36EBA4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 15:54:24 +0200 (CEST)
Received: from localhost ([::1]:48914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc77X-00011C-D4
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 09:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lc76k-0000Zj-8O
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 09:53:34 -0400
Received: from nylar.uni-paderborn.de ([2001:638:502:c003::18]:36936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lc76h-00012V-FY
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 09:53:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MexV3GJ/PLVU7Zfxm3UPyufD1hDm1rwPttQvcuUpflo=; b=KL2IuT6RJsETxUzsBgmiesbuxK
 0LHT+3t4Gep66enqpIVBEmZ4tQh8C1AruxIvA++WoQjePc3kEBexPrmrIvZyRyRztvjiB2M9tDAM+
 uZbHSgxHUz+5FHvel4oktDcW2LTWz/VBcgrl9xA77y/gfS0xMir9kRFRwxqkVCO6yIQY=;
Date: Thu, 29 Apr 2021 15:53:22 +0200
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v1 18/25] tests/tcg/tricore: Add clz test
Message-ID: <20210429135322.5usmsnv5ylo5g2n2@schnipp-desktop>
References: <20210419145435.14083-1-alex.bennee@linaro.org>
 <20210419145435.14083-19-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210419145435.14083-19-alex.bennee@linaro.org>
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2021.4.29.134515, AntiVirus-Engine: 5.82.0,
 AntiVirus-Data: 2021.3.29.5820001
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=35341789, da=107313470,
 mc=590, sc=4, hc=586, sp=0, fso=35341789, re=0, sd=0, hd=0
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::18;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=nylar.uni-paderborn.de
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
Cc: fam@euphon.net, berrange@redhat.com, qemu-devel@nongnu.org, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 19, 2021 at 03:54:28PM +0100, Alex Bennée wrote:
> From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> 
> Tested-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210305170045.869437-9-kbastian@mail.uni-paderborn.de>
> ---
>  tests/tcg/tricore/Makefile.softmmu-target      |  1 +
>  tests/tcg/tricore/Makefile.softmmu-target.orig | 18 ++++++++++++++++++

Whoops, that file slipped in. Can you remove that, Alex?

Cheers,
Bastian

