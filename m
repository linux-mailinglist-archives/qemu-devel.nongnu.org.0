Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA684D3926
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 19:48:41 +0100 (CET)
Received: from localhost ([::1]:59342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS1MW-0001n1-Ed
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 13:48:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nS1JB-0008KR-LV
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 13:45:13 -0500
Received: from [2607:f8b0:4864:20::112d] (port=40982
 helo=mail-yw1-x112d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nS1J9-0000Sj-Ig
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 13:45:12 -0500
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2dc242a79beso33318977b3.8
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 10:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZMRDBVxV3GS4e+8xhJ4Qh2hnzVKxlIIsyXlFeFHAogM=;
 b=QmLhVsm8U2f+N7rvOAO2vLfoGbJSmZTRkycJXfkzTcDtQek05+a7UTrP4xJLpDgDXy
 oB3eXTU3RFnimaoQJnvSJvz0nmL/RsNAM+olS4bbCMUj2NSHbJ9ZIGnGp7UdGLh6A9yh
 AZTi9F5c92zIWqgH4G7I8gSdWqFb3fS2BCsO1lcUQZnEfXWGLVUrMxwKw7xsY1WYZOeW
 zl2s2aPZGIx6X2Uh7cnp5iOCkG5g9NrkpQghVce0aB/FlBwVcsDLW2Q/FACQvypmWXmz
 +4cooViHY/ePd28wU8cJmxmI/AZHJ0q0YA2xuF7NbiBl7tBRmGGtzHmR6/rwb56zyWVz
 jvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZMRDBVxV3GS4e+8xhJ4Qh2hnzVKxlIIsyXlFeFHAogM=;
 b=BIPrKL95lyj+xYUarJ6CbNYHUw3cBvRa7hopOPtBXgKErQCbfxyZkKc72EPzL0kQhF
 037UfoA+UzyEl3At/riNh1fgBLAQs3VyxrIA/H6rt3WDDgpIVyZGGOjw9GpzTKmlDRbu
 UxqRr4TWk6wkhEm9DDE3LoMquf6d+iFVY/6dTp5rFN8dgllwYbVj4dIWy41u/cW8iaqC
 0L87JhbJpA9JO5O2mC6dV5YH5KECcDRe/n+TJ2jeRw6N+E3B4Du5HMnj+c94orCHT6eO
 Ee5zwmSCq+vHnIX8U9DVoLEV5DhQoYQ+Wd3A9fYY3pKL4RvP5BDoGZ0mSmVTvTlFXV9l
 smww==
X-Gm-Message-State: AOAM530ESlkK6T0co0+V4STAnZR2BZENy9fJgOmjw2OesISqAwHiJ9IF
 yr+wMdW2di1Q86Fk9fBz4/kJJH2y8/W2grWPCvjrhg==
X-Google-Smtp-Source: ABdhPJx7TsdWpharreTS289IMNDSWKWqRtvr8ArODs2zH/b9g7vBuqHn3EF4aNAxC/+wr2vGSoS/2CuQlX1bbZpS3AU=
X-Received: by 2002:a0d:e2c9:0:b0:2dc:1f22:e349 with SMTP id
 l192-20020a0de2c9000000b002dc1f22e349mr1054773ywe.10.1646851510471; Wed, 09
 Mar 2022 10:45:10 -0800 (PST)
MIME-Version: 1.0
References: <20220307181633.596898-1-pbonzini@redhat.com>
 <e6d0fc5a-c1be-41b7-239c-c5db02f21cf1@redhat.com>
 <06fed507-e09f-b62a-30cc-046fcdd80760@redhat.com>
 <391c0c77-3072-2299-f675-6e214110002e@redhat.com>
In-Reply-To: <391c0c77-3072-2299-f675-6e214110002e@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Mar 2022 18:44:59 +0000
Message-ID: <CAFEAcA-Db_ThUpbdPkzKn0d3CMPBH-GufHAZtERb0XQpUyKz4A@mail.gmail.com>
Subject: Re: [PULL 00/23] QEMU changes for 7.0 soft freeze
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Mar 2022 at 09:47, Thomas Huth <thuth@redhat.com> wrote:
> Since the fix is not available in any meson release yet and we're in QEMU
> softfreeze now, I'm now also not quite sure anymore whether we really should
> go forward with the TAP approach right now... maybe it's indeed better to
> revert the patches for QEMU 7.0 and sort it out later?

I'm a bit lost about where this discussion thread ended up,
so to be clear: are you OK with me applying this pullreq
from Paolo, or do you want more time to talk through the
issue? (I have another half dozen pullreqs still to merge
so it's not like I'm waiting on just this one.)

thanks
-- PMM

