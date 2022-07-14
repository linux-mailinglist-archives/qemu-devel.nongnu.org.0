Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9C2575169
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 17:08:06 +0200 (CEST)
Received: from localhost ([::1]:39024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC0Rh-0005ep-19
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 11:08:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC0O1-00021A-Kk
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:04:17 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:38704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC0Nz-0008Am-6B
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:04:17 -0400
Received: by mail-yb1-xb32.google.com with SMTP id i206so3687041ybc.5
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 08:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NV+Zn9aH1rkENQjOTXfjXCYi8aumA7lke8GfegN3l48=;
 b=r1hdqpT9yUFFRiGQyaqZpkZQtL+9I7N8kTf6aWc5OTv878jRDf+EEpU8ILxUMhzl+t
 Jc1gOXjzV4VARipXNWjQjSvFP/CYWe/zihIecSXuH/4FkVzZq0q+xxSVN1dFx8SYak4K
 qz4hOqpgRWjkHsDxdp8YOc+ijFNb9CQ/baBfFVD3Ur9IuoslgAGZ5g7u6ee4wB8mrJFO
 ldLpGWqK0Evquf8ZAlgwZpBRR2AGJzCj3eZ/QCdVNN8UtL/113dvFAHOuwaDITzZBiia
 VQ+cEjyH7N399K/YoRWKbpX8+JQlcQ0eoNQUi5LpWFRCNx7T94taJ8vdybKQD9Xv7+5M
 bw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NV+Zn9aH1rkENQjOTXfjXCYi8aumA7lke8GfegN3l48=;
 b=XrrQxwExvcTrUKHUOyeCJfXTfx7eBGNBUaaBQWwO5Kk8cKpbRvT1QopQUjtNdfNe17
 EghH4QFBWt95nTkeqzjsuxUyXinVGqLPjF2zgazSABfpweSdLRydBKuCTgN6EjSwrurC
 L9KjODjfUsz7Dbqu/HBwHK9OP8NSuTH+8cNYFRTwIrVncHOWN7PFH5cz33SrrrvVXjbk
 hXXuaDjVkjQcrO8k88MHPeJPPEZPRkYud6cVyNDqYY6wx6pCArxoDQhqisfjOui3aIf3
 rcGK6ixw5OUnbyXAYW7fEft8I6IcSrHcLWjZxjfAPe+YOvdRsCiFalQhD6zVoC5JunWV
 lYZA==
X-Gm-Message-State: AJIora9wyMLhMwVuUf5LSltB8ioS1tms3KK4AdZzfhzX1RpXBBklKQSB
 RHucgo7We94SNPJEMnPljfmIeCyQ/VBKhNZOhLxgTw==
X-Google-Smtp-Source: AGRyM1vM4LES25JfwLF739YIDkmZzLImwNcbXY9jUrcbz+4G2BfU+behu/yHyl3FBD5au/gDSgngyrS6rTmLYKGz/Og=
X-Received: by 2002:a25:230b:0:b0:66e:e008:a76b with SMTP id
 j11-20020a25230b000000b0066ee008a76bmr9621645ybj.479.1657811051222; Thu, 14
 Jul 2022 08:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220713081735.112016-1-shentey@gmail.com>
 <20220713081735.112016-7-shentey@gmail.com>
In-Reply-To: <20220713081735.112016-7-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jul 2022 16:03:32 +0100
Message-ID: <CAFEAcA81ewt+F4-CavVDECS=NO75xqc_2A1tX=-fuU=hmxAy9w@mail.gmail.com>
Subject: Re: [PATCH 06/11] hw/i386/pc: No need for rtc_state to be an
 out-parameter
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
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

On Wed, 13 Jul 2022 at 09:37, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Now that the RTC is created as part of the southbridges it doesn't need
> to be an out-parameter any longer.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

