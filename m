Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FCC355111
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 12:38:54 +0200 (CEST)
Received: from localhost ([::1]:57028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTj6j-000060-Nr
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 06:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lTj4t-00085V-Ca
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 06:37:00 -0400
Received: from shirlock.uni-paderborn.de ([2001:638:502:c003::15]:47254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lTj4l-0003hF-8Y
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 06:36:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zfZNFWeNSZ789aFZw6ZFyEW7pP5Z+83bgMxoqcNHMwU=; b=MR7MgnL81CBGRBkPBul8l1oYEg
 bZDlrNajTANOXpRISyT9adSJC0fEew0XJ7EBIosYG9MePzOZ+OXML8fFXNdrYzR+aPw+zQ3TheWgU
 dzAfHmiwsJDAZn+9dDGBCFo1ZwTESq+WNN6tnpLrWqxbXtZOiGTFGh/P79DdqzVEUhlk=;
Date: Tue, 6 Apr 2021 12:36:43 +0200
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 00/15] tests/tcg: Add TriCore tests
Message-ID: <20210406103643.xutdwigf6kg446qo@schnipp-desktop>
References: <20210305170045.869437-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210305170045.869437-1-kbastian@mail.uni-paderborn.de>
X-IMT-Spam-Score: 0.0 ()
X-Sophos-SenderHistory: ip=95.222.26.40, fs=41553652, da=105314469, mc=58,
 sc=35, hc=23, sp=60, fso=41553652, re=0, sd=0, hd=0
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2021.4.6.102716, AntiVirus-Engine: 5.82.0,
 AntiVirus-Data: 2021.4.6.5820000
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::15;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=shirlock.uni-paderborn.de
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 05, 2021 at 06:00:30PM +0100, Bastian Koppelmann wrote:
> Hi Alex,
> 
> after a long while and thanks to Thomas reminder, I finally came back to this
> series. I addressed most of your comments except for the timeout --foreground
> problem (see https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg00921.html). 
> I just couldn't figure out why QEMU hangs when run from the Makefile.
> 
> You can find the full tree here:
> https://github.com/bkoppelmann/qemu/tree/tricore-tcg-tests2
> 
> Cheers,
> Bastian

ping?

Cheers,
Bastian

