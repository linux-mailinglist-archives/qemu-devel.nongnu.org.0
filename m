Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F5E5815E7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 17:03:49 +0200 (CEST)
Received: from localhost ([::1]:47348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGM68-00046w-3I
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 11:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGM0v-0006ON-Dj
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 10:58:25 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:43708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGM0t-0001ds-Tz
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 10:58:25 -0400
Received: by mail-yb1-xb32.google.com with SMTP id f73so25712773yba.10
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 07:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OPm0BPkHwfEjwockYFc0GAABybyewroH36qwIUhnDyY=;
 b=dRN0dwD6m/dMw5UZpCaDe0v6sFiumdEGl3S/2yEsUeByp/uQBxCQ5IuKOYJ5yx/swe
 VUkW4RhFWfh1G1DvwzVmNmFQ/LsVLIFs2ZUvqzTv231jZ8jL975M21OAN4ZB13/sPPqQ
 tJGAinpXGVQV/+uqxrhpziAgdc89s81s08TEyvPiogiEH/R3iH6Up1nS5/1U16VJV0KP
 9oLJsqY0u4MzG0LFcN/wSs5C8yTRNoHPldjkoQ2nvibzIqwwtYhT0pXttQFatDzetr+B
 8fcQIjToHYOC6LRn+Jla+okrfnD3Umz+hLbq19nJwuwxUB3nJmmqg57mOb9zHXBfkz+z
 rngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OPm0BPkHwfEjwockYFc0GAABybyewroH36qwIUhnDyY=;
 b=6O3x/56O8HycnNW5u/515j7xF3walBFr1fFZJcHXEJvgtzJv6rb7keztDcjPdgq02y
 EMVQU/GO+0WkeEGeroZ2UAzfB67gwrOvWt4Dug2J+FeDwpdVm3foEqIagUGnDGE6YvZD
 l+mHDBngARFPsIF8UMLcsRW0jcK+s1p6iB+xqC6Qs94lEB0rQXu8MEhg6WYH6ifQGkQV
 +4i2DXBIL18HMkoQLBrqh6sPak+JprbFtCym54LEcY26lqIaoluLO1JSFj/tsIoFZ00B
 9iEVLI6g8h5K0uPOvvL6ZLX0fDdxj2jorRDtJKoXKZ3czFmn7n+lVO2lYjR1TarKcUef
 uLjg==
X-Gm-Message-State: AJIora+Qp5Vk104xJ3tneDYMdHgppZmobhB9L1zrU81Jh+bVhiMXPyaB
 s3rNd1K2DhmpNzFiYAAuKdJYHAF4LL4zJ91PyruQVw==
X-Google-Smtp-Source: AGRyM1thbN3cp7UiJKAqyi2eeO5IJv7AeYDIT//yITN6nAEkFaja5pgBnGJA+bhKyXFO3tfeUX1dluP/cT04iyhRsaM=
X-Received: by 2002:a25:d617:0:b0:671:79bd:69bf with SMTP id
 n23-20020a25d617000000b0067179bd69bfmr1690869ybg.85.1658847502768; Tue, 26
 Jul 2022 07:58:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220630085219.1305519-1-armbru@redhat.com>
 <20220701043032.GA28338@raphael-debian-dev>
 <87wncx2xw4.fsf@pond.sub.org>
In-Reply-To: <87wncx2xw4.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jul 2022 15:57:42 +0100
Message-ID: <CAFEAcA993Z7ty7FvxEX7JjLZCFWrcPRuy2eMJKwoVTZJ1Z7_vQ@mail.gmail.com>
Subject: Re: [PATCH] contrib/vhost-user-blk: Clean up deallocation of
 VuVirtqElement
To: Markus Armbruster <armbru@redhat.com>
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>, 
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 1 Jul 2022 at 06:41, Markus Armbruster <armbru@redhat.com> wrote:
> Could we use a contrib/README with an explanation what "contrib" means,
> and how to build and use the stuff there?

I would rather we got rid of contrib/ entirely. Our git repo
should contain things we care about enough to really support
and believe in, in which case they should be in top level
directories matching what they are (eg tools/). If we don't
believe in these things enough to really support them, then
we should drop them, and let those who do care maintain them
as out-of-tree tools if they like.

subprojects/ is similarly vague.

thanks
-- PMM

