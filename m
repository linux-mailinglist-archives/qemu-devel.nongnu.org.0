Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF8A372358
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 01:00:27 +0200 (CEST)
Received: from localhost ([::1]:50724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhYA-0002mI-C4
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 19:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ldhVa-00017V-J3
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:57:47 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:37557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ldhVX-0006Us-Oo
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:57:46 -0400
Received: by mail-pl1-x632.google.com with SMTP id h20so3729863plr.4
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 15:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sbbJwUWO8bI3Q2v5GJNDG/h+AzVDEI4zdvtryQsMoi8=;
 b=oxTLG4AdbQ15UX6AiW4eBTKanZSTnW9LCDA9oDInQNiubLJ/9C996HyAQrscZrLGyU
 EKxQcng7Igm4wth5X4pkqNymcosOHPwluvy89Vggmm1OcGD++zvwbrk8SNFjlW0vvHQh
 ERx/TWG0UPov6quwmWJWwEtKKXkHkIy6vumTbFIpQaEoeQ9VgYlIbZs5QnyDgBuzyoze
 oSBZZikfKHu4ZEI74sSWY75aPvdOOXR8ppOxuIkddYNpc8/r1jVfAq10ZwwHD2ofwSI4
 fWURo1B/gUUlTt/sZqyYhXjy53iHcCfh+n5R1ncKUHw2UD/yrJGu3sqSOc0Plopm6MPX
 Rdtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sbbJwUWO8bI3Q2v5GJNDG/h+AzVDEI4zdvtryQsMoi8=;
 b=dvir2uzd0nyyXwtLhUxQkShoZ6waiSbmIINK5B0+ZOrM70ze4sauPKX/Vqg3l6RQM4
 Vz6SEeGuybpMZUFGPDKgdwPX/+JtEZWElQFoXpBB5dyogmcou7FG1fODvyQAbcSUU/ku
 2Tchf18qEyP2D4uVYZgrQiRw87CBVaUNBTGFtN8Gnn9PbF0OSfQ0VdZu9FvX3NHbYy/0
 DpVd4IdhOn5UCgPl+eAB7sixCSZ1DzL42XPR2vZ1uQPdgQzQjD3taZsJkQvkWwjXQHej
 UoVkJU2ws7lUQjSN/mEuYwFfvP5kppjWitFHlaO30O1RX571qkGXSkUyD3bsocgPeYWO
 9GzA==
X-Gm-Message-State: AOAM533HNzE8eMIafH4TBiqo4jVi9r5lIH/CxdnLnwBihhvAyzvfRLNM
 yLxKsf7mG84XT8Grgi7kWAKVWSeOgrZbr4bMsRo=
X-Google-Smtp-Source: ABdhPJwjsN4OZJSu2jvjYRAwPqvpGY2ZuMb7esWHsdl3UZrs4yMAN10JWQ37aTWYg3XJCT16nECNyezOEcLKEABdmQc=
X-Received: by 2002:a17:902:ab89:b029:ee:dc90:7008 with SMTP id
 f9-20020a170902ab89b02900eedc907008mr5896892plr.30.1620082661556; Mon, 03 May
 2021 15:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
 <CAKmqyKPYu1Y5EaAvVgB9U4kCh4yBJG_75r6ivdvMuZDN6F3ZcQ@mail.gmail.com>
 <17b136e5-5811-27e2-224a-47795eb68bb5@redhat.com>
 <CAKmqyKOtnRvXZffxc_8zZUYQxwFFO9cEocU0cRkUs3PGJnCNVQ@mail.gmail.com>
 <dad95862-e7e3-2416-6c62-c19d81dc3e3b@redhat.com>
In-Reply-To: <dad95862-e7e3-2416-6c62-c19d81dc3e3b@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 4 May 2021 08:57:15 +1000
Message-ID: <CAKmqyKM=boN1ngw_R8XxT4oe=S-QdGW_PxkrwwBNqpd2p=LaNA@mail.gmail.com>
Subject: Re: Let's remove some deprecated stuff
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dirty.ice.hu@gmail.com,
 Robert Hoo <robert.hu@linux.intel.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 4, 2021 at 1:13 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 03/05/21 09:12, Alistair Francis wrote:
> >> deprecated.rst is mainly thought for the things that only have been marked
> >> as deprecated, but not changed yet. Once it's done, the items normally get
> >> moved to docs/system/removed-features.rst instead.
> > Too easy, I'll move it there instead.
>
> Can you move the description to docs/system/target-riscv.rst?  The
> switch from ``bios none`` to ``-bios default`` in 5.1 can be placed in a
> footnote if desirable, but the documentation of ``-bios`` is worth
> keeping in a more prominent place.

Good idea. I have sent a patch that adds a line to
`docs/system/removed-features.rst` and the rest of the information is
in the RISC-V documentation.

https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg00789.html

Alistair

>
> Paolo
>

