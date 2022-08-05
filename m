Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D876E58A858
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 10:55:54 +0200 (CEST)
Received: from localhost ([::1]:54356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJt7Z-0006pY-KT
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 04:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJt3S-0002os-Mq
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:51:45 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:34647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJt3P-0002IE-M0
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:51:37 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-31f443e276fso18492847b3.1
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 01:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=I9DJX4M/KCdx7QDDT4gZRFUYytwQRtRZalW7ADsgKjQ=;
 b=kAlWQT5y76Q3jYKkfpvTtttoDtOzhhxFWN7KcvdoscwSOJ530FL366D4H8UaAPB1eD
 ZqUuAyjW/DD/WLyhVdnXRY2ZIZByYoJrzPlGeysOVSK2jB9zM6y2g2ZtjhSOoA+Zozc1
 m+cCDJh/cNsG0X5n4/C6/KVjYN5K9H/vvQ0E2KROUVwf5NlY2KzVXvvvdijYRwiiC8MF
 WcCSA+Fa352V5dCfKRCVshLGql2CkufXHsAqC9m0yNXWz+ElgqNA2cpiwUykzdTe14zm
 Fhfqgb9CLhIEyR6MZFzXQd3sK+bDnkVeoY7r7litC6VseDvG+Zx2HTLSQ3AWVviIANvM
 i4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=I9DJX4M/KCdx7QDDT4gZRFUYytwQRtRZalW7ADsgKjQ=;
 b=Dww/cQ1nHSdDfHBzjTjRN/xcidbDOIiMmOICks/lwDd4KbfRAyXtmKsLdMkvo5Q/d3
 vCPDuTjgoKWbOsBT87iKhuEkMzBO0eI+0X78p575+GWhTDgDv+nAMbBd4GEErwGW+vtc
 vRjHWX2PzLMtwvKbjyMPReVtdOqI/3HCwDM39qwVojDr1j0HnOeiU0rILgNobOJokhmT
 5BzHBz94jphoviyHgbn6HYBVkYtr/AqrWCmHKYZvbdLhlh6zxh3KhaxPv5pMm2QSpwtd
 Ux09tYBLmAR+VqEVkaRPvi9w/PGDgOU8XWgKskcKVY6zI6ALFyOTmihVwCgbDDG98hlT
 7JXg==
X-Gm-Message-State: ACgBeo35eekPP7jI22i1pkcmQd84FvINbau33m9s0yLBmRc0VbAQXgVT
 UackuFWhDnEPRYAr/TVrMMwaulRr96rvqnvbnY1uwA==
X-Google-Smtp-Source: AA6agR6b4d9j5SJzMYWUBirb5Jep6LABO/KduvA6rFk2x2yDr5A9p/qU5ySccmiqC3b02+wmO9QfHfifbTVEn+iyHT4=
X-Received: by 2002:a81:7bd6:0:b0:328:297a:f31f with SMTP id
 w205-20020a817bd6000000b00328297af31fmr5042406ywc.469.1659689494605; Fri, 05
 Aug 2022 01:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220804182359.830058-1-iii@linux.ibm.com>
 <20220804182359.830058-2-iii@linux.ibm.com>
In-Reply-To: <20220804182359.830058-2-iii@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Aug 2022 09:50:54 +0100
Message-ID: <CAFEAcA9FG+b4=-QNujG5Prx_me8uw7YTWjk-mqr3_X1Wb0wHzg@mail.gmail.com>
Subject: Re: [PATCH 1/2] linux-user: Fix siginfo_t contents when jumping to
 non-readable pages
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, 
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, 4 Aug 2022 at 19:50, Ilya Leoshkevich <iii@linux.ibm.com> wrote:
>
> When the first instruction of a translation block is located in a
> non-readable page, qemu-user fills siginfo_t correctly. For the other
> instructions the result is as if it were the first instruction, which
> is not correct.
>
> The reason is that the current logic expects translate_insn() hook to
> stop at the page boundary. This way only the first instruction can
> cause a SEGV. However, this is quite difficult to properly implement
> when the problematic instruction crosses a page boundary, and indeed
> the actual implementations do not do this. Note that this can also
> break self-modifying code detection when only bytes on the second page
> are modified, but this is outside of the scope of this patch.

Which guests do you observe this on ? I think we should indeed
fix this in the translators. More specifically, I think we should
get this correct already on Arm, and I would expect it to work
correctly on all the fixed-insn-width architectures, which can't
have page-crossing-insns to start with. x86 probably gets this wrong.

thanks
-- PMM

