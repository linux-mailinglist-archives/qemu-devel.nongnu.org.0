Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBE56A0E5E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 18:10:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVF5f-0007rp-2J; Thu, 23 Feb 2023 12:09:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVF5Z-0007qy-LK
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 12:09:01 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVF5W-0003BT-LZ
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 12:09:01 -0500
Received: by mail-pl1-x634.google.com with SMTP id e5so14819252plg.8
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 09:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bn+qZpML6lrMrK0gjKDL5LctfTdthgr58F7D7OqYxuY=;
 b=ZU1kSth8XzPQo5tjEN5OS/y2ugB5Ff0f6LocH8zbrj57HXcVJEWG33oJAkK67Gb5op
 OC1eeRILxwPW35MEAZUi+Z433DXHOi0sfHYp9VMau7o16Sf/V1ohRWDVSI3bbgAOGvTw
 K11POCYXXE5wOl6PepT/k9+u+k2ZFUN8QqlJG+jcHACXNxJspU/rw5LLfKuKGC2VCXiu
 ZLCVtYAtCiwe77jrCbqm7PxSRxOZAKtbuWZX6UCvnj8Ju2L+9lo1LRwng5ejCkKeiyjt
 MDL1xOmB5o/X0K42sntE+q79uBhipBHBHiO7PnHPXe9UVPXaiOBBA1jKQg+tNifCoX//
 lSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bn+qZpML6lrMrK0gjKDL5LctfTdthgr58F7D7OqYxuY=;
 b=vKMgVNZ1x9rkpLUIB6ToHLXbqTPfI9L4cgRvQ132rVQYUiYKMzjJUttLQLv6I4/zLG
 TEaxrdU0UyX/JLT0w2BmY0KShDv1rCbi5pS7rSc3LiOVfFmfkcb0rV7PY/aUy9iOgG2p
 dhwXtyIYPIODoXgto3hrINq1RFn46IDc1wHGpCbzLAVpHjFPjk7jDZ759tZFjix14AHw
 but5ieVckMfh6XqUf816A2jL/8nT+GFZadjAkY+9eYoqP9CYOsZMFMYWO/+yNRNzzYJL
 oFITQAvOaapsQdJBeciVDDDYTzRYkHWwTZf2l0grAv3ZgqY06zbwBc6t9QMXk8kZaxVV
 oVlg==
X-Gm-Message-State: AO0yUKUv0C8h4N2KMERVLj1ePe+Tie1PtMN5hIXhEiq8o4Iitztxv0le
 IcQl05QdxfCKykoSgY9L8a9LT0agJ2/9ZLZeCYH40w==
X-Google-Smtp-Source: AK7set9TRVriRjN17Erom+bUlY39g3AD4BmnKcdL0QaZ2HF6ECZTqaagMqItHeKC4m31H5MB4SpsD088XC3EsQOo3GI=
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1303974pjb.137.1677172134328; Thu, 23
 Feb 2023 09:08:54 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-2-richard.henderson@linaro.org>
 <CAFEAcA8LQPEAQ34otcgNeqOFbi1PVVs-d3M41ar2jycjJYQF1w@mail.gmail.com>
 <8e759fa2-674f-184c-1ddc-35638a18bda5@linaro.org>
 <CAFEAcA-6vYGvnxE9ZiQ_WYoD8jg1kiQCvj4A-DjncW=TUiM8Vw@mail.gmail.com>
In-Reply-To: <CAFEAcA-6vYGvnxE9ZiQ_WYoD8jg1kiQCvj4A-DjncW=TUiM8Vw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 17:08:43 +0000
Message-ID: <CAFEAcA87_M1+mcMWuu8ugjg78FBLCrw53uYH=Zo-n_ih-bkWvQ@mail.gmail.com>
Subject: Re: [PATCH v1 01/19] target/arm: Make cpu_exclusive_high hold the
 high bits
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 23 Feb 2023 at 16:51, Peter Maydell <peter.maydell@linaro.org> wrote:
> The current state of affairs is arguably broken, because it
> means you can't migrate a guest from a BE host to an LE host,
> because the migration stream contains host-endian-dependent
> data.

...thinking it through, this isn't right. The current code
has cpu_exclusive_high always be the 64-bit word from
the higher of the two addresses. The change proposes
making it be the high part of the guest 128-bit value
(which is different if the guest is in BE mode).
Neither of those definitions depend on the host endianness:
they're just different and we would have to figure out
how to convert between them on migration.

-- PMM

