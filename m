Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B8F557A62
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 14:34:22 +0200 (CEST)
Received: from localhost ([::1]:52576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4M2O-0007mt-OL
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 08:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4LzA-0005uO-VI
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 08:31:02 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:39556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4Lz9-0002zJ-De
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 08:31:00 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-3178acf2a92so158303567b3.6
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 05:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h4FAaAxDkft/GYKrZH8p1e5O8Z/g+GpcmXs91Mv5s28=;
 b=w/PZidQ07LR5n2YGfOx4cK5vDAtot3ycJ9M2vvnvf/oz5ZzRvdaWSE+BXZ7jBdESwQ
 nmeqNxjz8XVaem0TXV8wZO+8wR3PN0WwfA97V3e//IHNwjVyXW7ASm71/Gjxa94C5wbc
 dC6kr0uvE6l1jO73LuFVv7vB7rrGjzVowPS9o0cwFTBg3ynaZ51CTt37XY3WqCchNQzf
 npTyXNGPxP7wSQUdDtxXdFIEeGQgdOQkVPtrLeqdwndaaJBGrKrEFavDLy7KvmhofpTH
 1OpH+ApP6ejgyZoP9UzJTaMqofMlGZoMEIG7iL9LPpmLqpgZDWmCQ7MCx6rkmtWhXDXq
 dGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h4FAaAxDkft/GYKrZH8p1e5O8Z/g+GpcmXs91Mv5s28=;
 b=VJu7ehL2AWQiqv+xJ57ORmqrMAl4uHRrWVF2Ak7wsPJyiAvt/05ffG+mxTa05En4T2
 mAbWiZlis5odmhVkhwixOwXuimYZf/yUaQ0QdRkbuKC7gY51XwtHXca5VkGXyxp6AMl2
 P0ETm3E3BJc6D+sFzwAZ5Ja1iCN2g6OOax+l3yiHpz1HcbM7jjDt3xGfnRGlxu3n2Tfi
 jU5+UPOr6fqhKDRTvECzuZ/PQCe7I7zSG1e/enDGWC2yr8Ago6+VqgkBgJMB8caSkO/I
 MM7jAXXp7lxAj9w8eceXESyvlGEffumXdJAMDKGn0AmQciG/gBl9Os8ivzhWeM4hjWeo
 6k+Q==
X-Gm-Message-State: AJIora9uJ9Uqjlqg8Ynf4TXt6FjQO9lFZY9qfaMGWsVD4gTftNOYVgHW
 6HWqMB9VOW9R+RzEGIs728/LMhjx24qv0tkcXJjUYg==
X-Google-Smtp-Source: AGRyM1vy9K/iFLl5trhp+WIivaF6gz7O/mzMR28cDbyBiwMAjJBEksTqDzrSIrfDMZqHbUruV7+BTzJY5o4dIPToknY=
X-Received: by 2002:a0d:ca0f:0:b0:317:a2cc:aa2 with SMTP id
 m15-20020a0dca0f000000b00317a2cc0aa2mr10658496ywd.347.1655987457511; Thu, 23
 Jun 2022 05:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220623095825.2038562-1-pdel@fb.com>
 <20220623095825.2038562-7-pdel@fb.com>
In-Reply-To: <20220623095825.2038562-7-pdel@fb.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2022 13:30:46 +0100
Message-ID: <CAFEAcA-F59JEVBVYSdGX4KcS5d+EB4dNoZ2iE1aitSvo3B7Yfw@mail.gmail.com>
Subject: Re: [PATCH 06/14] aspeed: Add system-memory QOM link to SoC
To: Peter Delevoryas <pdel@fb.com>
Cc: clg@kaod.org, andrew@aj.id.au, joel@jms.id.au, pbonzini@redhat.com, 
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com, 
 richard.henderson@linaro.org, f4bug@amsat.org, ani@anisinha.ca, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Thu, 23 Jun 2022 at 12:31, Peter Delevoryas <pdel@fb.com> wrote:
>
> Right now it's just defined as the regular global system memory. If we
> migrate all the SoC code to use this property instead of directly calling
> get_system_memory(), then we can restrict the memory container for the SoC,
> which will be useful for multi-SoC machines.
>
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

>  static Property aspeed_soc_properties[] = {
> +    DEFINE_PROP_LINK("system-memory", AspeedSoCState, system_memory,
> +                     TYPE_MEMORY_REGION, MemoryRegion *),

To the extent that we have a convention, we tend to call this
property on an SoC or CPU "memory", I think. (Better suggestions
welcome...)

-- PMM

