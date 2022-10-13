Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 410EC5FE49D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 23:58:15 +0200 (CEST)
Received: from localhost ([::1]:58528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj6DW-0002na-AI
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 17:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robh+dt@kernel.org>)
 id 1oj62s-0002TB-ST; Thu, 13 Oct 2022 17:47:16 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:36140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robh+dt@kernel.org>)
 id 1oj62q-0005Bs-0L; Thu, 13 Oct 2022 17:47:14 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 26E5B61965;
 Thu, 13 Oct 2022 21:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 889CEC433C1;
 Thu, 13 Oct 2022 21:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665697629;
 bh=y1ZB6H/8lHumiAK1VP7JPxhbQP3COaOC+djHTR8wtvI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YUtYvGU/W4IkhvExq6SAfJW1WwwsdfHgVVUec4q+bAEkVdO46gLm/YVykef4pL43Q
 ZSuX7VGJofaEMRQNDbL5jU2UCxCLB6GjQ+0TXTH3WeQOuAKXsQ5H+mzqfxUp80vYMS
 q3UMvLxlcyuaFW1A3vjuK+uDquDkWAZD3eZ+BkTkGjOsBQ5wx6ZDO2WxkmYZrZywlE
 2niUqXMPuja4DuVj71IDc08uYtHUf8+2bceLVJr+5cXaB1oHXdQenm/OTscZf7Y/2P
 /dbUj6kAfHhd9gJ5nUEDJNKD55DXgzQ+MPYeSO8wjmOev2eKgxbnJQWXB0SStyjsuf
 osjZdc6BGHifw==
Received: by mail-vs1-f50.google.com with SMTP id a2so3141481vsc.13;
 Thu, 13 Oct 2022 14:47:09 -0700 (PDT)
X-Gm-Message-State: ACrzQf1duzdraXMRxlckH1M7FaDZ3L5FE9O9nkNb5Ul6NnSvxuXu2jsF
 WImKgpzT3Hjtoy4bfXAMpGUQGhyKv3WEpGXNEg==
X-Google-Smtp-Source: AMsMyM5m+/btBICrdcrStGlDNLMOhTDCW5jQ9FQbf/OLCAuDrbaXYgmDTBo3SSzK0NExh9QrLlvn3oRJL86KibA1/O0=
X-Received: by 2002:a67:e19a:0:b0:3a7:6b54:cc63 with SMTP id
 e26-20020a67e19a000000b003a76b54cc63mr1256614vsl.26.1665697628505; Thu, 13
 Oct 2022 14:47:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-5-jean-philippe@linaro.org>
 <CAFEAcA-5BDiv6sXJ_kpzCwpu20PJRQzOpS08bAswyJiFMSiT4w@mail.gmail.com>
In-Reply-To: <CAFEAcA-5BDiv6sXJ_kpzCwpu20PJRQzOpS08bAswyJiFMSiT4w@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 13 Oct 2022 16:46:59 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+nw2g4fDr4-G3g2OL_mUkAGvNM0DJjuKqzFUijut1Hsw@mail.gmail.com>
Message-ID: <CAL_Jsq+nw2g4fDr4-G3g2OL_mUkAGvNM0DJjuKqzFUijut1Hsw@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] hw/arm/virt: Fix devicetree warning about the
 gpio-key node
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217; envelope-from=robh+dt@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

On Tue, Sep 27, 2022 at 6:56 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 27 Sept 2022 at 11:12, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> > The node name of the gpio-key devicetree node should be "key-poweroff":
> >
> >   gpio-keys: 'poweroff' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
> >   From schema: linux/Documentation/devicetree/bindings/input/gpio-keys.yaml
> >
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>
> This restriction only went into the DT documentation in July
> (kernel commit 5eb5652250).

Fair enough.

> Please don't retrospectively make perfectly valid working DTs
> non-valid. I don't see any reason to change QEMU here.
>
> More generally, the set of things you might want the
> validator to warn about for a fresh new human-written DTB
> doesn't necessarily correspond to the set of things you want
> to enforce for a pre-existing code-generated DTB. For the
> former it makes much more sense to impose "coding style"
> and "naming convention" type rules.

I too would like to distinguish that, but haven't come up with a way
to do that in json-schema yet. The way schemas are applied
independently makes that a challenge. So far it's been low on the
priority list as any platforms with few enough warnings to get to 0
haven't been a problem to fix (in a few cases we do end up relaxing
the schemas).

On the flip side, even existing things eventually get updated for
coding style or evolving conventions. As long as we don't break ABIs,
the same should apply to DT.

Rob

