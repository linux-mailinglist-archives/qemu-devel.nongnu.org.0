Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FFD3DDD32
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 18:08:01 +0200 (CEST)
Received: from localhost ([::1]:57840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAaTv-0004wU-Ku
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 12:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1mAaTA-0004GU-Lt
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 12:07:12 -0400
Received: from nylar.uni-paderborn.de ([2001:638:502:c003::18]:54068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1mAaT8-0000V3-Bp
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 12:07:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=erzgkTw4UhSPiVvwdPj2MFzpyEEy4p1nfS0Kh7bttgo=; b=IOX0tY/TB/viSi2cPwVKG8ehqd
 dXW2aGf+27RNoGzyciGiqF7aKWEFSxM1lEG20ZfEiLS9DLOqPqFwoz6T51h9m3Q4jjieoQ79arbzR
 ALP44w5Uzfc/fiLOw7k8R+P15E3aDWb0rwFbmTx09l02yCY1AeVUM+RLU46uj7DnLqmU=;
Date: Mon, 2 Aug 2021 18:07:00 +0200
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v1 25/29] hw/tricore: fix inclusion of tricore_testboard
Message-ID: <20210802160700.ys63t4co6y6zyam4@schnipp-desktop>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
 <20210720232703.10650-26-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210720232703.10650-26-alex.bennee@linaro.org>
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2021.8.2.155715, AntiVirus-Engine: 5.84.0,
 AntiVirus-Data: 2021.7.20.5840001
X-Sophos-SenderHistory: ip=84.184.59.97, fs=1297722, da=115529487, mc=3, sc=0,
 hc=3, sp=0, fso=1297722, re=0, sd=0, hd=0
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 21, 2021 at 12:26:59AM +0100, Alex Bennée wrote:
> We inadvertently added a symbol clash causing the build not to include
> the testboard needed for check-tcg.
> 
> Fixes: f4063f9c31 ("meson: Introduce target-specific Kconfig")
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20210720114057.32053-2-alex.bennee@linaro.org>
> ---
>  configs/devices/tricore-softmmu/default.mak | 1 +
>  hw/tricore/Kconfig                          | 3 +--
>  hw/tricore/meson.build                      | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Cheers,
Bastian

