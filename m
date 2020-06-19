Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF91200A2A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 15:31:33 +0200 (CEST)
Received: from localhost ([::1]:36790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmH7E-00035g-5f
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 09:31:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1jmH4E-0008Ll-Pe
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 09:28:26 -0400
Received: from nylar.uni-paderborn.de ([2001:638:502:c003::18]:49966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1jmH4C-0004ss-5a
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 09:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uZv4noQSj0xfDjr21tbwhsC3ToybmXI/nv2HYipuC1Y=; b=he5F1TXC9w6ade45MStKcdRKu
 sx+OZIiJZTEGfuMDskAAjg7t5bNNfl4RtjWX+wX3P69uAIxh6NhviWrb3lQmR7k6Hm8L87u8NIqhc
 maROXIdFrpGz2kaMGD4YZQ/lfcl8XlGjJ8UpwRAAoA0BlDxxUbKy3y4zrUaSi4eSEjO3E=;
Date: Fri, 19 Jun 2020 15:28:16 +0200
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: "Konopik, Andreas (EFS-GH2)" <andreas.konopik@efs-auto.de>
Subject: Re: [PATCH v2 1/1] tricore: added triboard with tc27x_soc
Message-ID: <20200619132816.ir53gqafnmrfjyb3@schnipp-desktop>
References: <20200609152553.4376-1-david.brenken@efs-auto.org>
 <20200609152553.4376-2-david.brenken@efs-auto.org>
 <20200610084818.yrzxqm6466w2wpiz@schnipp-desktop>
 <69A9BBE82CEA98469F7BA51850C5B89CF2FEA8F8@AUDIINSX0364.audi.vwg>
 <F5B10EA5F04CF44F81B685A0E281578724EB1D39@AUDIINSX0385.audi.vwg>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F5B10EA5F04CF44F81B685A0E281578724EB1D39@AUDIINSX0385.audi.vwg>
X-IMT-Spam-Score: 0.0 ()
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=8210681, da=80182362,
 mc=201, sc=3, hc=198, sp=1, fso=8210681, re=0, sd=0, hd=0
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2020.6.19.132116, AntiVirus-Engine: 5.74.0,
 AntiVirus-Data: 2020.6.19.5740001
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::18;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=nylar.uni-paderborn.de
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: "Brenken, David \(EFS-GH5\)" <david.brenken@efs-auto.de>, "Hofstetter,
 Georg \(EFS-GH2\)" <Georg.Hofstetter@efs-auto.de>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Andreas,

On Fri, Jun 19, 2020 at 11:57:03AM +0000, Konopik, Andreas (EFS-GH2) wrote:
> Hello Bastian,
> 
> I assume that your review comments, which Georg has answered, are solved. I will implement the remaining suggestions in a new version of the patch.

yes. After the suggestions are implemented it should be good to go.

Cheers,
Bastian

