Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B41BB4B7A65
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:22:29 +0100 (CET)
Received: from localhost ([::1]:41110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK6DM-0000EZ-R3
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:22:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK5xo-00069Z-8x
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:06:24 -0500
Received: from [2a00:1450:4864:20::42c] (port=46892
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK5xf-00064Z-HQ
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:06:23 -0500
Received: by mail-wr1-x42c.google.com with SMTP id q7so282356wrc.13
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 14:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tjwzavPHuwLQhDLaeCIqve1wOTSq+fSSdSxuL6FgndY=;
 b=hyLB+QdgTJkxAQcnPlb1uORvHQNf7bCW7gFZ3rq0q+qUBm6oYmv3rdnP95ES9ZxqcH
 egoy5KXm/XUZ6lz8E0OwECBrioAWEdpIxqIQRH8JRnV1YIRNHDrLRcgB1OfubqeRvOGQ
 EcC6+cnj21qpeJf3N+cza83GPTplGnoj4MXBChj0rGEaa0V7Q0OWrjmiu0EvUTHOMU49
 2NOXl+oI8VK8zD5/LvPL9bB7DK9J963HeWSvBy63LNIuPsfsLwWj/LJ59JtmbiePaQQB
 c6fytC1C938zGJp3Fm3Ld0G3aghvBMiTnVFRzb9osxjY8boHBjmEYU2uRS5r6bQW/VjC
 JEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tjwzavPHuwLQhDLaeCIqve1wOTSq+fSSdSxuL6FgndY=;
 b=SvR2JC0rF3rg6ca1BHMySFc6nWXP6hhGXDAdzg7ZdY5+5MBspR+JBhmPQLW+G3zky+
 Kmd3lMdJ5uuzyHVOet+Yl+GVEaj4DPgrH2jfrwaMJldihtslJ1SVuSOHWdNm1FnjPl8H
 InhzpaJS+RYaXRMYI1nFY7hKq04jQyIQkx6tvqGiYW2o3PBQyLqWB2NrRBYlhJ0hi7Ax
 zQ/GEZQwvHK63/fbwp9H8MqxSMN/46cfmuAlSXaFa5js7sfUFodornIStlCz/Fz5OTni
 rAx90OhpdgIjJbgis4nffy0bVeZo34smwlS0DGg3JliVFro54URZ/fh35K4R0TDN0c06
 wCpg==
X-Gm-Message-State: AOAM531XgAsLrNw6N8wa0rGeNtlvhATyEOScwrJ0MN1khhjiTD7zy1D5
 oznTLLdmWP43vzXbZiqGjeoNWga6KtoI8Msql9wZQ3qnSrj6Pg==
X-Google-Smtp-Source: ABdhPJy9A1echo2ApI0kvDf5CxuPujmHL7vq/P0koavyLj8vSUfuOFNlqBbgnIjJ+0eZbsDQp/jgGkx6gs3BLPUFyrE=
X-Received: by 2002:a5d:59ac:0:b0:1e4:9b6e:eac7 with SMTP id
 p12-20020a5d59ac000000b001e49b6eeac7mr73224wrr.172.1644962752631; Tue, 15 Feb
 2022 14:05:52 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org>
 <20220210040423.95120-10-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 22:05:41 +0000
Message-ID: <CAFEAcA-xbQadTvdYtadfxEYPG_5smfgikJJaOvf2ByjNJg_27g@mail.gmail.com>
Subject: Re: [PATCH v2 09/15] target/arm: Implement FEAT_LVA
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Feb 2022 at 04:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This feature is relatively small, as it applies only to
> 64k pages and thus requires no additional changes to the
> table descriptor walking algorithm, only a change to the
> minimum TSZ (which is the inverse of the maximum virtual
> address space size).
>
> Note that this feature widens VBAR_ELx, but we already
> treat the register as being 64 bits wide.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-param.h | 2 +-
>  target/arm/cpu.h       | 5 +++++
>  target/arm/cpu64.c     | 1 +
>  target/arm/helper.c    | 9 ++++++++-
>  4 files changed, 15 insertions(+), 2 deletions(-)

Need to add FEAT_LVA to the list of emulated features in
docs/system/arm/emulation.rst.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

