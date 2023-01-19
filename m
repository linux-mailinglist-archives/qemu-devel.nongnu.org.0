Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50470673267
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 08:25:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIPHx-00018z-Fu; Thu, 19 Jan 2023 02:24:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pIPHt-00018h-Gq; Thu, 19 Jan 2023 02:24:41 -0500
Received: from nylar.uni-paderborn.de ([2001:638:502:c003::18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pIPHr-0003i8-NQ; Thu, 19 Jan 2023 02:24:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wm5Ja+8ie66IANd4Z+ax4nl9j6VKJeEtkVyKNhbHl9M=; b=hMgeJkzUqXKg3KHwOEGRkw4N7u
 qqv2FRum1Vhw5BiGElNnWwnv6BwBV/e5R9+Mvo+IxxUmGTa1kebUsTV3R5qTWlIH8Z5N5c9CUrd2e
 Hh6l0ItwVi9XH+JMhWc9Qp8J+cHhRc/Y89S3NyTB3RLzcj3TUSoEXV6pJS6u1mNIeqOQ=;
Date: Thu, 19 Jan 2023 08:20:12 +0100
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH v2] target/tricore: Remove unused fields from
 CPUTriCoreState
Message-ID: <20230119072012.prb7brw5gmqrewyf@schnipp.zuhause>
References: <20230118093322.49307-1-philmd@linaro.org>
 <50ed4971-3fe4-327f-932f-51c0be6acb7a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50ed4971-3fe4-327f-932f-51c0be6acb7a@linaro.org>
X-IMT-Source: Extern
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.1.19.71516, AntiVirus-Engine: 5.96.0,
 AntiVirus-Data: 2022.12.20.5960002
X-Sophos-SenderHistory: ip=84.154.186.130, fs=14514701, da=161722137, mc=71,
 sc=0, hc=71, sp=0, fso=14514701, re=0, sd=0, hd=0
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::18;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=nylar.uni-paderborn.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Jan 18, 2023 at 09:01:48AM -1000, Richard Henderson wrote:
> On 1/17/23 23:33, Philippe Mathieu-Daudé wrote:
> > Remove dead code:
> > - unused fields in CPUTriCoreState
> > - (unexisting) tricore_def_t structure
> > - forward declaration of tricore_boot_info structure
> >    (declared in "hw/tricore/tricore.h", used once in
> >     hw/tricore/tricore_testboard.c).
> > 
> > Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
> > Reviewed-by: Bastian Koppelmann<kbastian@mail.uni-paderborn.de>
> > Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> > ---
> > v2: Do not remove 'hflags' in case it used:
> >      https://lore.kernel.org/qemu-devel/20230118090319.32n4uto7ogy3gfr6@schnipp.zuhause/
> 
> No, remove it, I don't expect it would ever be used.

Agreed, patch v1 is fine.

Cheers,
Bastian

