Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C64EC6999CD
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:21:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSgzE-0001kK-Pf; Thu, 16 Feb 2023 11:19:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSgzB-0001JP-GL
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:19:53 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSgz9-00058V-Ax
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:19:53 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 x4-20020a17090a388400b002349a303ca5so2081387pjb.4
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wj14ESZLEAlGOUoRm6CLbRBQGDs/WYzNDBqPj6RxcFY=;
 b=QIiU5uXJUmPB5zdKBAZUhcGxGY7yIqOm1iKOEGNNA2/4dBjIS8bro9gkQ+dUX3hvgu
 s/xRQGu29bI9gssvN1aaMLy6KPvr5VQ5Wlwr8tneZTowZFsu3oPhsbsd0m2mgCjvL9QL
 CK3Ang07oojmlOSMyK+0R8OKsa0h4nLnrnquDJXpqmzrM1KPVNBLu6yuyfM+mXjdopxq
 LQ/JgiI7sewdNuJ7Gs71Uz0lukXtIQl8QnnmPR2/ItoO9L1c8y3zY5Sa1+d0x5En6yV9
 FQvKR5U1phzVyKWfYw0q2ukje7IR+V35llLqPBsZ7G7eE4vMx2hA/t40Y4F0dFJ4Uvya
 jCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wj14ESZLEAlGOUoRm6CLbRBQGDs/WYzNDBqPj6RxcFY=;
 b=UokVdGyt/rA8IOCELkhqlQ9pBQBjFkx91OyPDdwcUWd2TIiQj5GkuOFbORH/GWPBXO
 2VU1AaWD7IfmoKXWpR+2QmSn/W6SSmO8c347n5IGuJOwTswbE9xQzZlMMMHGjDVTUYWd
 ChoVlne2ufRTu/M3LXHKzFhaCBvs702Wsi3Qt9Epn1qTSEYaJOCXjxr2aaICsqT1bQ/s
 ESMlZuiKiaZmi2YQJlU7qVifkvzlLF5kFUiRwYxIi30eUs8hVFSNKIiFcxMJ6XH0/usL
 E9jQh1MLnurH2fz+NaJK1JzCOXoh6ZX3t5iQ7/Lacl8xQLUn5ByuvYMnO5jRQtE2g6iJ
 RDXg==
X-Gm-Message-State: AO0yUKVWfTsxcc9ybmWxU2oxRbyAq/6P3pF8z6Yo0xn8ccOBzGvyBt8g
 WcOHapXzgVuoFSyEFg92KrelM5y7sCH2DnNgdxh4zA==
X-Google-Smtp-Source: AK7set8N0jwGTUV4Vz+NigZhhCwDqL6I4wNIZsM31F0AjS14587y549jZVe3vA0sanNXHFEezzE6Hyhxq17Q4A+k37o=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr756668pjb.92.1676564389724; Thu, 16 Feb
 2023 08:19:49 -0800 (PST)
MIME-Version: 1.0
References: <20230213202927.28992-1-farosas@suse.de>
In-Reply-To: <20230213202927.28992-1-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 16:19:38 +0000
Message-ID: <CAFEAcA8yXgqdCvt6KWHQBUNrjca_n2gWeBG-=RGQQKR1vWrf6A@mail.gmail.com>
Subject: Re: [PATCH RESEND v5 00/28] target/arm: Allow CONFIG_TCG=n builds
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 13 Feb 2023 at 20:31, Fabiano Rosas <farosas@suse.de> wrote:
>
> Hi, could someone take this?
>
> I rebased and put the two series together to simplify. I'm keeping it
> up-to-date and tested while it doesn't go in.
>
> CI run here: https://gitlab.com/farosas/qemu/-/pipelines/776103500
>
> Based on master.
> Supersedes "target/arm: CONFIG_TCG=n part 1".

I've taken patches 1-5 into target-arm.next.
Patch 6 doesn't apply on top of my tree, which is unsurprising
given that it's trying to move 9000+ lines of code in a single
patch. That's so much I couldn't even figure out how to recreate
the code movement locally. The diff is not very legible either.

I think that patch needs to be restructured somehow so that
it's a bit clearer that it's only doing code movement and a
bit more likely that it might be possible to apply it without
massive conflicts.

thanks
-- PMM

