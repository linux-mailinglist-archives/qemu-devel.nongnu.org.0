Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D46C52B5E02
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 12:10:40 +0100 (CET)
Received: from localhost ([::1]:55188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keysh-0005Sn-V6
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 06:10:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keyr8-00048U-E1
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:09:02 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:45466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keyr6-0003C3-Tt
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:09:02 -0500
Received: by mail-ed1-x541.google.com with SMTP id q3so21968830edr.12
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 03:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2IH4vI/cojJ2JGnrZTz/JsoKacG5tD4dYZfJttKUyuo=;
 b=kJc0CBNzZkqodB/4osuhe08RMTsRPJW0cLdehbOpP0hPrxTbC8CSjhoF4dTbBxhowa
 HQePcmlFBDoalfA+lOXCG/lm+L16j8ZAQCfxf6qvNa4jhXGgo3yLfufUM9pqNet/jTN2
 jd9lGSOwltNn6r5bCQP4+Q4bgdY5msKYouR95CPA1nA5ZdACIbwgfW/0SROT1NmGNlnG
 xlL97R1abIJzvIBO17gvhS5CJv1/RX56GS0cH8ZTOhfrvReLkIzI2w8Q/Qaxpq1aQ1rw
 ++EKjJ81RRdErCALolzm7mbd9IPiZbGOKmIW+wHGfLdlOdidS1MeRpZVcZILwrFoQFTW
 /G8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2IH4vI/cojJ2JGnrZTz/JsoKacG5tD4dYZfJttKUyuo=;
 b=phmoLvBltZVjxalzYGOacYysTYwyQQfEqxMhep8uKESZeq469wtU8OB/JG5K881i17
 Fcw8jcRC7906fC/Vxxf/SBawmS6jbi3X+1s0IG78AZvuY1j+YDCpKxcyMXJQREfT0qF5
 6CeWW17ekz8+ElzzeCvo0IXyW5bs9eiCy8d2D/SA1whuF+BWNPG1f/BkiJRNtrYAfD5G
 GY5r+mob2yv69oM9+nmV5lOvYzhtxGugRJ/rG62VDYjEOBfPLuVCEB/WnT61An5w8dcr
 EEg0RSkoWKxkGzldtQYkpBIMQbzYoE9seZ6Lp6Wgs4fDkvhBTejZYACVg4GEjHbs+M87
 1fMg==
X-Gm-Message-State: AOAM532Bm9nFO5DnW5pn7EHDrFC6U79kdRZ7I1sZyEJwjoKqDl4nbje5
 m8X9XOwtzg4eNQPZGoM+eeTnsrjNqcHhf7NLWURG2A==
X-Google-Smtp-Source: ABdhPJzBpBeSyMX0rxzJFws3Ph5+8RIUPv0Qg+ZwOsDMMaQZvbspJrbOySccuF0CTchI1uGtPQie/ZJz/CwtDE1GSGg=
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr20719188edb.100.1605611339133; 
 Tue, 17 Nov 2020 03:08:59 -0800 (PST)
MIME-Version: 1.0
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-14-ganqixin@huawei.com>
 <c2ca2185-4253-da71-eab4-f96b29067c96@amsat.org>
 <882df4ee-948c-7e00-d951-9b14ea40b2df@redhat.com>
 <877dqldyoh.fsf@dusky.pond.sub.org>
 <CAFEAcA-u3jZT2bU6snRL7BWXHUzXuVr9gByssOjoicGZ2-MLXQ@mail.gmail.com>
 <873618czgj.fsf@dusky.pond.sub.org>
In-Reply-To: <873618czgj.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2020 11:08:48 +0000
Message-ID: <CAFEAcA8fUnjmDy-1g0fsQyaNCHDqvEnLgE5073h-dGkCk7Rztg@mail.gmail.com>
Subject: Re: [PATCH 13/13] bcm2835_cprman: put some peripherals of bcm2835
 cprman into the 'misc' category
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Gan Qixin <ganqixin@huawei.com>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Nov 2020 at 05:41, Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > I'm really dubious of devices that directly inherit from
> > TYPE_DEVICE, because their reset method won't be automatically
> > called. In this case it looks like the TYPE_BCM2835_CPRMAN
> > device's reset method manually calls reset on these devices,
> > though, so it isn't actually buggy, just confusing.
>
> I guess this is a trap for unwary implementers, aggravated by our usual
> dearth of qdev documentation.  I can see ~100 .parent = TYPE_DEVICE
> lines.  Checking them all manually won't be fun.  Any automation ideas?
>
> The concept "bus-less device" is sane.  We used not to have it, and the
> resulting need for pseudo-busses was annoying enough to make us add
> bus-less devices.

Yeah, the problem really is that our reset handling remains a
mess. I'm not sure (a) what the right model for reset is and
(b) what would be a feasible transition plan to get from
here to there...

thanks
-- PMM

