Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD5A5F88E9
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Oct 2022 04:34:18 +0200 (CEST)
Received: from localhost ([::1]:52054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohM8v-00006B-2u
	for lists+qemu-devel@lfdr.de; Sat, 08 Oct 2022 22:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ohM6m-0006A0-OY; Sat, 08 Oct 2022 22:32:05 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:37424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ohM6k-0007AX-M1; Sat, 08 Oct 2022 22:32:04 -0400
Received: by mail-qk1-x733.google.com with SMTP id oo23so5012772qkn.4;
 Sat, 08 Oct 2022 19:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bTGoLJKpmEHEmSIAtw1CNizaDz1VjAT4NSkCv4sAylc=;
 b=mE6vGTgEo+JH61o2wW4Ek9UIoMtxlMO1SVhl9G7IJtcgnKVFnzRSt2lSFNObe4nMhh
 jwfF91U87v2N5zx0umcNSe4nRYllIeCAAOfKJc5lasqZ4KbwG8JCnB7baB9DPyxffLzE
 wuzKzd4Feh/xAPwfmZXURkYUzLhBBJCBAkQ34Lj66UOlAtnkAbgR2tbd/G1oKDRZ8btA
 Q/gSSKmv9Wl5aVXyKDIidyh2Wua3Avu6hWirumewJ3wOx4Z/3/XCmJRs+Eh9KXl6wYWW
 sdu3UMSmFgBg/xYPfROW1YYotbxVQVDTe7FlrokuDJAO+A+c1HWKm0zEDqvXCtmTzW9e
 AGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bTGoLJKpmEHEmSIAtw1CNizaDz1VjAT4NSkCv4sAylc=;
 b=vlgfIrCZGRGJmas/E43IosAtwVkHD8N+/Sn8eAm2tjzWY235j89EKkwK3DKAykqKxm
 nnd+JXzjgGhwgkaFnzJMKUsvP1w+8nDlyF/lncIUqwJLrXjGKMkSJtvv5Pyf4/hfLEWz
 2kFoUTM4/FZu/Z943Fh6TLj2ZEfNsBijxFeWiXQwMzwOZZ3spcHi6N+cvcga//bTvMDw
 kY69omqlaPIqZTcdf+ODA4YNS/5dbA+tN4LCr83Z703HX8F9Elo0/GKtmQIIqHJH5XaM
 Jat0k5pHNzl98OPr+DvUNYxaezgw6ZXaECwP8KRYqk3SpNyjpIsAYRcUxlItX59Sse/b
 Wm7w==
X-Gm-Message-State: ACrzQf3luGMHUDWm/X8GHkCIG8qdcO4PGdOGfSets3v2FQ0N/AgnosHL
 yRyvLS1HBnRljkV9G89cC7KT2YYH5zsxaIx86mk/BFFW
X-Google-Smtp-Source: AMsMyM4FSKIxqu2kseYNvsv4xMPiZEQfJmOBp6ek3pLsv4tpsa+k9FLI/KGt0QCB1htmNKFX3gVdy6d8p07HhZw2Plw=
X-Received: by 2002:a05:620a:439f:b0:6e2:a440:b10b with SMTP id
 a31-20020a05620a439f00b006e2a440b10bmr8618209qkp.94.1665282720802; Sat, 08
 Oct 2022 19:32:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220915152520.21948-1-shentey@gmail.com>
 <20220915152520.21948-5-shentey@gmail.com>
 <CAEUhbmW6Zu3Uv5Qo=7cwFeydW7zkeOGkE5jVP04HiExJy9wOHQ@mail.gmail.com>
 <1890577F-7230-4E0C-A375-F0A215F6F543@gmail.com>
In-Reply-To: <1890577F-7230-4E0C-A375-F0A215F6F543@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 9 Oct 2022 10:31:49 +0800
Message-ID: <CAEUhbmVh3XXEjOKumF9JY1LKXMiKa+=ddQDZssRAkTP8K5KM+A@mail.gmail.com>
Subject: Re: [PATCH 04/11] hw/ppc/mpc8544ds: Add platform bus
To: Bernhard Beschow <shentey@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, qemu-ppc <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x733.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Bernhard,

On Sat, Sep 17, 2022 at 1:19 AM Bernhard Beschow <shentey@gmail.com> wrote:
>
> Am 16. September 2022 06:15:53 UTC schrieb Bin Meng <bmeng.cn@gmail.com>:
> >On Thu, Sep 15, 2022 at 11:29 PM Bernhard Beschow <shentey@gmail.com> wrote:
> >>
> >> Models the real device more closely.
> >
> >Please describe the source (e.g.: I assume it's MPC8544DS board manual
> >or something like that?) that describe such memory map for the
> >platform bus.
> >
> >Is this the eLBC bus range that includes the NOR flash device?
>
> Good point. My numbers come from a different board. I'll fix them according to the  mpc8544ds.dts in the Linux tree.
>
> This will leave an eLBC memory window of just 8MB while my proprietary load needs 64MB. My proprietary load doesn't seem to have 64 bit physical memory support so I can't use e500plat either. Any suggestions?
>

Currently QEMU does not model the eLBC registers so these memory
regions have to be hardcoded, unfortunately. Once we support eLBC
memory map completely I think we can remove such limitations by having
QEMU dynamically create the memory map per programmed values.

I guess you have to create another machine for your board at this point.

Regards,
Bin

