Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B21DD4F9799
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:05:02 +0200 (CEST)
Received: from localhost ([::1]:47592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpET-0003r9-AS
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpBB-0001kB-Jq
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:01:37 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:46878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpB9-0008Cw-Rb
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:01:37 -0400
Received: by mail-yb1-xb36.google.com with SMTP id d138so15210821ybc.13
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FaRSHR1ViO1dgNDWJW+RFgNMATLndpoUvUrjxJ3LUyg=;
 b=r92oXS2Oj6UuAeEc2Vxw6JYV7BIFlM/CCMeWEJAul3KWTm2qW0kW8ajDIDavhr6NGA
 ICr/K2xDK4+QdBGAWtxFhTY0fdUSKJUHXSnD9jWWJZ6IjqIkznF5JL69JK49bT/riwY4
 uLs5XYxzkIJtzQB3j5IzWGF26LXBYkCAmTZUrVNO22LdRDr03hD8sdAuHIUKhqfeyDCn
 hBqFkRbsYFceCeKBFA9dMHr1QMAnnliL43xUUV/VSjSWBGSmSFxAeR/XDWUs7RcUPaww
 Akea6deY3zCU9F5DciE218XYlctaQIVJbljXRQjloJmnhQ8J3c/8hjOuu1MgqkW2osqv
 Gkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FaRSHR1ViO1dgNDWJW+RFgNMATLndpoUvUrjxJ3LUyg=;
 b=RN1tMx1jDWlGhsjcNQSul0hMkbiL04i02yLtxffql3eCCjRGr3gXtleRxH7Gr0ykhN
 /w0eag9KPCPZZPvI8oN+6Q5Pyj2thF6ddzckeuPNxoart0L8gu3XLeQXOz/zo9eG/wij
 +ZEWQl0aYoBGkKL33Y5QOE7jtoBAJ0Pnrd+ywzcNJEm8rcsf/Vfd0hp5kv8nTzW9VU5Q
 zMai9MDaptHQ4I+LyaOLLZNd/MOEV++xrB5Q/N2M6DVSVP3XYTmMpEPqy0+udszysSzp
 yzGapGDGQVfnVON5oHf9P0tj0oWOxhh8SlzcfqpFpr58Vbk4afeTcap1EpC+Lf0iYv6a
 zHVQ==
X-Gm-Message-State: AOAM532U06+NYuY2diLYSWwDkMIsEBWQ3Zo9TiGtmQ/qtURezhhS0diO
 qRayrsnGKnbe3wp+kUONRenqVNUfFQ2OIArEOFMTNA==
X-Google-Smtp-Source: ABdhPJxnM7auqrk97D3MDPp1wge9RkgeZCnrWjcOlx8iXamBlIe5iGilJo9Yez9KbQrxh71TnvFVKEsf+x/E3Jyfy2I=
X-Received: by 2002:a25:3d0:0:b0:63d:c88a:fafa with SMTP id
 199-20020a2503d0000000b0063dc88afafamr13705193ybd.479.1649426493989; Fri, 08
 Apr 2022 07:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220408045252.2375896-1-kraxel@redhat.com>
In-Reply-To: <20220408045252.2375896-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Apr 2022 15:01:22 +0100
Message-ID: <CAFEAcA-XB74dOk-C1fZc1_nagCFtacZJ0KP-eMwQzdBpsQ2idg@mail.gmail.com>
Subject: Re: [PULL 0/2] Fixes 20220408 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Apr 2022 at 05:55, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 95a3fcc7487e5bef262e1f937ed8636986764c4e:
>
>   Update version for v7.0.0-rc3 release (2022-04-06 21:26:13 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/fixes-20220408-pull-request
>
> for you to fetch changes up to fa892e9abb728e76afcf27323ab29c57fb0fe7aa:
>
>   ui/cursor: fix integer overflow in cursor_alloc (CVE-2021-4206) (2022-04-07 12:30:54 +0200)
>
> ----------------------------------------------------------------
> two cursor/qxl related security fixes.
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

