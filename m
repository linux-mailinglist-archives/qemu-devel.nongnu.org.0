Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134E240D6F8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 12:02:45 +0200 (CEST)
Received: from localhost ([::1]:43696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQoE7-0006Lt-Tk
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 06:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQoBP-000579-FE
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 05:59:56 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:55120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQoBL-0005FA-8e
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 05:59:54 -0400
Received: by mail-wm1-x334.google.com with SMTP id s24so4344562wmh.4
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 02:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+g8qABCbdzZeKnBeP531yWMDszzMmUeiAiy+nZOe4Gc=;
 b=qpR/VI4962+zA935mfiUzsWziGUktc39lDdSXgg13YH0tLL/XMNxvBmYKz+SeHaouo
 8goxjwfxtaan2Y86gpAvVa6zsDZvGZNH+66lvCz0dR/kXIpcXy5nyHUOX5eCO5tT50cq
 lbsrsOaAJ/fXe4pzyNA/Po9VCfoko7A1OPGFhK6VDbp0R45yHOrGe5MMwq35sBQpP8vW
 PRADDRFcolg/FzTiXn961WzjKGUoJBUx+HMh9lthuLSmABjxXWDCVP5Lqnu2776276eF
 NkoHmoLgdAyu3CfJYBXiXZtF0sJ8447v1ZSIuetXD9p3umAZ95Q7s0ZJdc7c9yT4JTDA
 0aew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+g8qABCbdzZeKnBeP531yWMDszzMmUeiAiy+nZOe4Gc=;
 b=Z1XSGrt+LKcSa4FnhI3utsn8YX3XZ3t19eSnwb3GWb7bpR/6JQ+UHTFFe3uzfZdKVD
 WwNRQj50U6u2eg5uh3ErGlDm6yEvNTNl4cYzfSDQmEXKINCJtQG7DMBDFMuKXY+HpYu2
 sMKDTJb4rmW6OZCzk0QKyNsnspcdF6rP6OQ4SrVYuvyj2hkm6MwZLgf8O3LXkpR2dCOO
 +mSSWGDZDo6ySgz5IVAuOIRUtbRgSotup0m1AC/rF6mv/wSOMPuBj7jmDHtd7U9ERlMw
 RCRb87TEYHjEVok6Q4nDbWvAupjSaiK3qOgUtNgfpa7AipJV3bk+xARSHplnSwUxyHRi
 Egng==
X-Gm-Message-State: AOAM530prJ0Wt3kkT7T2DtZ+LrJgPhQtY3NBxrqHAR+tgSUQAtUtP6au
 pL9lcRkUBEGozJzjAdZNPjYsF3Adr8B614oONKeI/w==
X-Google-Smtp-Source: ABdhPJzAhWTLzzun/vqAYxdWm7mKmf6WWPGDunYpC/gY3eZuZH1e96MjfNV6K0DgORyCFswWqEgIsclDeZr8EXlyOiY=
X-Received: by 2002:a7b:c194:: with SMTP id y20mr198031wmi.37.1631786389717;
 Thu, 16 Sep 2021 02:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210910170656.366592-1-philmd@redhat.com>
In-Reply-To: <20210910170656.366592-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 10:58:58 +0100
Message-ID: <CAFEAcA9qXtt3z8RhiFU+VxiSEYPHkxg=6r6zJ247L-+aqM96Lg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] elf2dmp: Fix minor Coverity nits
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 10 Sept 2021 at 18:08, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> This is a respin of Peter Maydell series, with slightly different
> logic on the first patch. Quoting v1 cover [*]:
>
>   Coverity complains about a couple of minor issues in elf2dmp:
>    * we weren't checking the return value from curl_easy_setopt()
>    * we might divide by zero if presented with a corrupt PDB file
>
>   This patchseries fixes those.
>
> Viktor Prutyanov tested the patch but didn't provided a formal
> Tested-by tag, so I haven't included it in the patches.
>
> [*] https://lore.kernel.org/qemu-devel/20210901143910.17112-1-peter.mayde=
ll@linaro.org/
>
> Peter Maydell (2):
>   elf2dmp: Check curl_easy_setopt() return value
>   elf2dmp: Fail cleanly if PDB file specifies zero block_size

Thanks for doing the respin; I'll take this via target-arm.next.

-- PMM

