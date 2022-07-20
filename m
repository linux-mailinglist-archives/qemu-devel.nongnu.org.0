Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACACE57B691
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 14:37:04 +0200 (CEST)
Received: from localhost ([::1]:44792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE8wp-0006k3-AR
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 08:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oE8uV-000410-9s
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 08:34:39 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:39538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oE8uP-00077s-Fz
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 08:34:38 -0400
Received: by mail-yb1-xb34.google.com with SMTP id r3so31844965ybr.6
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 05:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HBrsSHHE4t68MLnkB5uwgPUiT6vn2LCD2ipFoNjvH9Y=;
 b=PoPM8rv1vgZJd2HrjC6WAik7wXtQi7rZWCWTMgQWUP4Yt6gR3cYiNoSw3JqiNyoE5Z
 RQvadlFcR7LAv8vmi4EhMdIVeHPa8DtGFbllEcjL53m4bKDnKvkvB+8Ia+e+r/RVZfmX
 swqYCcf8Uk3cKqOnOKbel/WWbfzhgbqXUSyBhOjWcfa3R/ShkQ5Zr8h+uYYpMO33drvH
 NLU1T9kU3niOCrfpdMPO7J+PzseYznQaojMXAyCl4eUOoP3dFWtEjZr099mVhGMVAqSF
 +aEDJ5BX3cp8ZX1KyBtZT8fTIWRRLdL+dIuyo9SjJVw3fIPnZg0NvWvKdfrfCou3tGna
 BXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HBrsSHHE4t68MLnkB5uwgPUiT6vn2LCD2ipFoNjvH9Y=;
 b=rTVzpwZLuE25vottglWtaRUeuWm3PLkBS7RiULeEUXi49ivflctqJ1tqIJkOaB1BAs
 YJxfAW3glBWqJc/XsrreBsLYwutBNqY7iClp727gyb8/2ynEXTQ2ZGllQqwmBRr0eDu1
 8ksLwO4X+atmNEqAL3Nc/WguAvnY0agDkyje6WIyHYjGYmKVqQQeeg8+Yy0/h8iI0vKP
 CEl138UEJcoaSXmhpw0l3dAPioGIuumUbWHoUFg6eqBu2+lksRLcaOefhEDbZOsAG6A7
 VGsV7UN4gaUBIyYWnD66MpO3LfonV4uuHpwhqhwpgJLjj+Zr6yeFncV9J5+vHwsIZRjh
 DsKQ==
X-Gm-Message-State: AJIora/8kNYrSEnI1A35XFJDJWB6UmPBcQ55jryWM636P+FRwoXskujr
 TVaMYdfWr6oAGixZ31X29IW4zb86NQPdFzGNOjXcqQ==
X-Google-Smtp-Source: AGRyM1s3IaoUaz7Vx9XXnRSFdfTI33s9SWm7hyJU//HQ37NnIS8K7PInl9C0lyWQ2yZIpd3C4TzFsJfi63iV6BCbSZU=
X-Received: by 2002:a25:2f58:0:b0:66e:cf9a:6a2 with SMTP id
 v85-20020a252f58000000b0066ecf9a06a2mr39826723ybv.193.1658320471559; Wed, 20
 Jul 2022 05:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220409200856.283076-1-danielhb413@gmail.com>
In-Reply-To: <20220409200856.283076-1-danielhb413@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jul 2022 13:34:20 +0100
Message-ID: <CAFEAcA942QJL6KzYMKS=Kwk95xU6qboaEQn4K5Yiu9qgTgxv9w@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] Coverity fixes in hw/ppc/spapr_nvdimm.c
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org, 
 david@gibson.dropbear.id.au, Greg Kurz <groug@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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

On Sat, 9 Apr 2022 at 21:11, Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
> Changes from v1:
> - clarified in the commit message which kind of errors we aim to prevent
> - changed the H_HARDWARE return to g_assert() exit
> - v1 link: https://lists.gnu.org/archive/html/qemu-devel/2022-04/msg00569.html
>
> Daniel Henrique Barboza (1):
>   hw/ppc: check if spapr_drc_index() returns NULL in spapr_nvdimm.c
>
>  hw/ppc/spapr_nvdimm.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)

Hi -- I was just going through old-but-unclosed Coverity issues, and
it looks like this patch fixing one got lost somewhere along the line.
Could somebody pick it up for the ppc tree, please?

thanks
-- PMM

