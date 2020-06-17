Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319781FCB73
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 12:54:27 +0200 (CEST)
Received: from localhost ([::1]:56032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlVi6-00074F-90
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 06:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1jlVfx-0004BR-5s
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 06:52:16 -0400
Received: from nylar.uni-paderborn.de ([2001:638:502:c003::18]:36372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1jlVfu-0003Na-9q
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 06:52:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PTr12PgOv7VoXfr2wdzMBMdshZA7WUd63OJz16QFCc8=; b=DS4AVc2MXyedepPY4S74AbzXt9
 xIyyuja6ivRxER8fWlv7ZCe5aNwzlTMKcmho3nT4+G4xWWBhAVwYfm94vFjuLTyBsVTkP/6rFiGpV
 8Ai+ozy+XVe7GrZskjcvEgEz1XM1Iuf3vVmHv8HaUi+5+WGSJdkZWQJa5z5P5SToSBCQ=;
Date: Wed, 17 Jun 2020 12:52:04 +0200
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v2 03/15] tests/tcg: Run timeout cmds using --foreground
Message-ID: <20200617105204.73hwdt3fp64ymctg@schnipp-desktop>
References: <20200604085441.103087-1-kbastian@mail.uni-paderborn.de>
 <20200604085441.103087-4-kbastian@mail.uni-paderborn.de>
 <87blljyo8d.fsf@linaro.org>
 <20200617061313.uaru24twuzqgml5j@schnipp-desktop>
 <87sgeuxbb9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87sgeuxbb9.fsf@linaro.org>
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2020.6.17.104217, AntiVirus-Engine: 5.74.0,
 AntiVirus-Data: 2020.6.17.5740001
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=8028509, da=80000190,
 mc=198, sc=3, hc=195, sp=1, fso=8028509, re=0, sd=0, hd=0
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On Wed, Jun 17, 2020 at 10:59:22AM +0100, Alex Bennée wrote:
> 
> Bastian Koppelmann <kbastian@mail.uni-paderborn.de> writes:
> 
> > On Tue, Jun 16, 2020 at 05:22:42PM +0100, Alex Bennée wrote:
> >> 
> >> Bastian Koppelmann <kbastian@mail.uni-paderborn.de> writes:
> >> 
> >> > when trying to run successful short tests from the Makefile timeout would no
> >> > terminate. Rather it would wait until the time runs out. Excerpt from the
> >> > manpage:
> >> 
> >> Which tests hang without this change?
> >
> > The TriCore tests ;).
> 
> Hmm I wonder why? All the other tests work so is this a function of
> output from the test? The softmmu tests for example usually redirect
> their output via a chardev device. Tests which require actual input from
> the user are skipped (the semiconsole test is MANUAL only).
  
I was wondering as well. If you run the test command without --foreground on a
shell, it works. If you run it from make, it times out. Maybe this is just on my
end. I usually run bleeding edge software on my developing machines. I have
timeout 8.32 here.

Cheers,
Bastian

