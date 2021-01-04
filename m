Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A562E944D
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 12:51:09 +0100 (CET)
Received: from localhost ([::1]:58154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwOOC-0008Lh-Da
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 06:51:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwOMA-0007TN-J2
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 06:49:02 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:40989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwOM6-0004SC-VP
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 06:49:02 -0500
Received: by mail-ed1-x52c.google.com with SMTP id i24so27011679edj.8
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 03:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fKCnx/I9P/UrRwpnQl2g55m3YR0ss5fvnhnmrp8Uk5A=;
 b=Z8mBiAxlBIZbUCAgEdZsIJv5ggsF9z4K6AI7nGMT44ZgCh5Mr3kRreBjTpnhmqQcCD
 ro15gS+4ZmSFu6bFaOO9SJCnsjBROiEYzXDd3D3a0/ofoskbg5Ku1las+D1cf57UmMZA
 tZKYkczvkfLgUSw/Pa6AnjSebDhWWchSh9EkzQTnYNUXbD8e4f2ecmadY3zRGx0WNP0y
 5ZmcwvFOBXtA+K/KBrMWZHPr1rhvb7OuqE8lE9tBqFoRdohC9b9xkd06ydXT+7PQuAA+
 2z2Ml5BWvRrG9Ip4Ycp3ImKlbOIUlMaWOPAURzuwAtDHmz7n4/6XjgB3SIa66L+gIlLm
 I8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fKCnx/I9P/UrRwpnQl2g55m3YR0ss5fvnhnmrp8Uk5A=;
 b=R05owUFx99KcQjAAljP7bVfgOzXuYH9Qgnn9feUBsypYdRiCwt+dZ0eZKNoifzEgj7
 YaLJ6g89tVvAn44ekfWDwQwxF9kYandY3ar+VJmNvA9b0exqhFBatI8KAbc5/0OXfqWW
 8fG78NgWk8KglD6bYLmXoFCciIZnRFWES+WYFCC7lPglR3KGk92DD2drDL2EB+TsxdXk
 xZdQ/EP1fMnprm6tWhwUSuXv1FI2askTbCoDRLrhT96VD1YgM8uy43+neNQI/7niWcAN
 PoZh/K+Es9O5XjzKY3Iu/edJIqgxCXchiLjPGlmD+7/Pv8HEFa62Vl6LZhrI0K9au1VX
 swYQ==
X-Gm-Message-State: AOAM5322PXSLYkpPOkHdo8jaGOjZ+u24xdJfIxbhyHNXdWy1E1U0NnTe
 9V1LVF6/8ia8Majnuai7dtTblp9Hdb/BouOWJGtsQw==
X-Google-Smtp-Source: ABdhPJwAuoJdCT+Vvl+yzSfH6cu9jGxgUdPK9NytRBUkVOmbAIIdeObu9EnzSKc5ceSMDWOZbUIM44YRQjCbCeNfG9c=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr15586134edw.52.1609760937015; 
 Mon, 04 Jan 2021 03:48:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1609413115.git.balaton@eik.bme.hu>
 <a55cd539835084bd322695c483273dc4b144ccbc.1609413115.git.balaton@eik.bme.hu>
 <41b3af5a-2f2b-41eb-98f1-909e80b26ff@eik.bme.hu>
In-Reply-To: <41b3af5a-2f2b-41eb-98f1-909e80b26ff@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jan 2021 11:48:45 +0000
Message-ID: <CAFEAcA8Et5z+ixLosVTf2SU9K7_fJ4BmzLwCtkchvbS15SsCjg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] sam460ex: Remove FDT_PPC dependency from KConfig
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 4 Jan 2021 at 01:51, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> Something is still not right with this, I've noticed that a few other
> boards also have this option selected but they don't need fdt.o that's
> gated by this option in meson.build. That fdt.o is only needed by PSERIES
> and POWERNV but removing FDT_PPC from other boards I get:
>
> ../hw/ppc/sam460ex.c:43:10: fatal error: libfdt.h: No such file or directory
>   #include <libfdt.h>
>
> so apparently this switch also pulls in the necessary CPPFLAGS or libfdt
> dependency. Is there a separate switch for that or we can only get it with
> fdt.o. Not a big deal just not trivial why we need an option that at first
> sight select a source file which we don't need. I think I'll drop this
> patch for now when resending the series.

This happens because hw/ppc/meson.build does:

ppc_ss.add(when: 'CONFIG_FDT_PPC', if_true: [files(
  'fdt.c',
), fdt])

ie if CONFIG_FDT_PPC is set then both
 * add fdt.c to the build
 * add the 'fdt' dependency (which brings in the CFLAGS and
   LDFLAGS necessary for libfdt).

So yes, at the moment for PPC there are only two options:
 * board doesn't use FDT at all
 * board uses FDT and gets hw/ppc/fdt.c linked in even if it
   doesn't use the functions there

Since fdt.c currently has just one not very large function (which
is only even present if TARGET_PPC64) this doesn't seem like a big
deal, but in theory the "need libfdt" and "need fdt.c" parts could
be decoupled.

thanks
-- PMM

