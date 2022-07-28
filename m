Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 053B8584290
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 17:09:34 +0200 (CEST)
Received: from localhost ([::1]:37952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH58m-0008E9-Lh
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 11:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH4zE-0000Yc-Mb
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 10:59:42 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:35565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH4z7-0002XY-66
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 10:59:40 -0400
Received: by mail-yb1-xb32.google.com with SMTP id n8so3703204yba.2
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 07:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lnf+TMUXbt/kQAgMdjh+++TtQJ+1pRGY9fD05kQD3to=;
 b=j7DnhQbFs1O0d+7Wq0j4LIKrHMAYISEL9TX3ChQ2WLydSnw3jVL3gVGq2nVu8NQPuU
 J1jXCzQKXN41CnMcU1hL/JJUO/FjgYyxL1ff1C7x5JXRdyUxr5Jgd78FZsbDpT2ofPYB
 /wAwcTwx1NaBpQ3HFpu5LJQEM+hSYecFs49WYg6dHP3dVH+VhIlA5fCLpobM5hRFKz9/
 nL76RY5XvoeYkOw/nynwciBe0IyQuRs5uyA1o89yNW2UWGuRgPJf/H91dH5N8oeZmRLB
 nWUn9VdgAVJNmiD6RSF4SIjsyw9fhwwPnbwC6q0Xz5TxIJnqfVSb6iz6sEbj+Qpgygln
 2N2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lnf+TMUXbt/kQAgMdjh+++TtQJ+1pRGY9fD05kQD3to=;
 b=hsnCScVbUk3r228Amx13UO4KQYpHN0ZHHIn4HxXhW5xcurzSGo5rf9V675J3LpCpMK
 AQ0cfGyxlhBD3OcMns6icb2DUTyq6uAsk3DleUxXAFLYTro53gVVpeiUSQhgGqQIOMkg
 Ns6Cltj+kqEGW+BDzay2QKVA9xL979fVQ4zHLfzDwsPl6WEiaDzuJ7U1fcx6XcfUZixD
 Fq3+C1KVEEGjozjbW143DrE5bVcGKU5EjQIBXf7EHkPpEP2Ye49ErzdgWYadJ6YYUUK3
 JkQy4CT7gGi/mITv4Jgg1ucsKQm1JkWBiHOYODfZisqFI1o1aBC+69C6C77Brwd0EYem
 Wvgg==
X-Gm-Message-State: AJIora/5KNOigIaywdpH8+pKOs2hmGKAsbe/k65Iny4igGHj5YN94Lm7
 Ch1ErGHgHnGaVvnUbdKYopTADyUH5W48s5bAvqwQpQ==
X-Google-Smtp-Source: AGRyM1v1Smx6GeN3wkZQDANSGTvC06hegtxpvQr2d153N8J+3vjPNrdYsjeUGYZ1ofCq04C+NSAUMw0Vh5xNv/ST08w=
X-Received: by 2002:a25:cf47:0:b0:671:8224:75c6 with SMTP id
 f68-20020a25cf47000000b00671822475c6mr6284216ybg.288.1659020371965; Thu, 28
 Jul 2022 07:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220714182836.89602-1-wuhaotsh@google.com>
 <20220714182836.89602-6-wuhaotsh@google.com>
 <87ilnuda33.fsf@pond.sub.org> <YuGMFRDj3tLOIJK7@redhat.com>
 <CAFEAcA-_TkDW4tPxvmwEt-Rr6VAr_7aWNX2++CE+1G5cBPtiBg@mail.gmail.com>
 <YuKPVi9UjmZVqw5a@redhat.com> <878rodxpeq.fsf@pond.sub.org>
In-Reply-To: <878rodxpeq.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jul 2022 15:58:51 +0100
Message-ID: <CAFEAcA_=PPJO5K8r5QFKJRhX4j9jwPPSceAUPjhK0z_bmLdyrA@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] blockdev: Add a new IF type IF_OTHER
To: Markus Armbruster <armbru@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 richard.henderson@linaro.org, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com, 
 f4bug@amsat.org, bin.meng@windriver.com, qemu-block@nongnu.org, 
 thuth@redhat.com, Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jul 2022 at 15:50, Markus Armbruster <armbru@redhat.com> wrote:
> Kevin Wolf <kwolf@redhat.com> writes:
> >
> > But if you have more than one device, it becomes hard to predict which
> > device gets which backend - it depends on the initialisation order in
> > the code then,
>
> Really?  Board code should use IF_OTHER devices just like it uses the
> other interface types, namely connecting each frontend device to a
> backend device with a well-known and fixed interface type and index (or
> bus and unit instead, where appropriate).

I think part of the problem is that unlike the typical disk
interface, where there is some idea of bus-and-unit-number or
index number that it makes sense to expose to users, these
"miscellaneous storage" devices don't have any particular index
concept -- in the real hardware there are just a random set of
devices that are connected in various places. So you're requiring
users to look up the documentation for "index 0 is this eeprom,
index 1 is that other eeprom, index 2 is ...".

thanks
-- PMM

