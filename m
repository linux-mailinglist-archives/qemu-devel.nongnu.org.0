Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0CD3DFCDD
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 10:29:50 +0200 (CEST)
Received: from localhost ([::1]:47270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBCHc-0001Y3-6Z
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 04:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBCFF-0006cz-5s
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:27:22 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:38663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBCFC-0006IN-H1
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:27:20 -0400
Received: by mail-ej1-x62b.google.com with SMTP id zb12so2455157ejb.5
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 01:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cmFR4lmatLpWNFa4ZXHGS2TrtAFcTjIvKa+9HVhQR9Y=;
 b=lHG/gcCrL3J4mIhS/BQMHPj/TrKDLiBd/sx6FhXEUS/vKKMM6E+TJM9xqqwnYY5TM+
 ZZCq41p+GlBADIPg+1O9W/NFry1rSlSJN7uUskHRddFFey34ChQEDc3DA0+l/MpouEtT
 ITDYytpJp2WSBrCVylGG0UPBuAhdf3MpWKVUgG4mR281712Nh9EoDwGXmoooyH/Z+5EA
 u3YuXsJmXc6YF1lMx+l4vz0ZlwtU2dgKKxjW8IqEbzbK+NAJxsLNxUXRXRqHuf9sa3lP
 XKA3olTIpBm0atqICrvIUB+lNq1fHhV99+8RnFQwn/1PGxtDNvGmVn5q6KUUe8VQdgPQ
 Uoww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cmFR4lmatLpWNFa4ZXHGS2TrtAFcTjIvKa+9HVhQR9Y=;
 b=RcZVnyWwBV6G9s+1iSi0Q3TUsxVcQJdeA/ygvBJqaIUFQI6B2NuMxwQo6Gq52mBZKd
 DybhwE14dVb2dVKCgHYkz8DnQrWgQKcV0a6TB0Fw6943W6iHVHyqivYm64H7P/Q5yBDI
 XiZLZz6+smvwJEajwFtHhCxz/Oup2hXQgOlp4XpnZ5eaJjHdYas71EvlZTo1Hv6777xg
 E8U6Cw3mrWYOW80gPYAw9jYoQAbYwHGZeFCanj6FxDtaf9PTCcUbBmGX+jTmgW6OOwtK
 o0PbKu5Y4XIVI92s5p0MRHhYCqB+zuC6r8pg/lV5eeaJP4If8Aj1FINmEMKnHwV2v54n
 8rLw==
X-Gm-Message-State: AOAM530ylLsUiIvOUq2JKaKSeNoZxGhhCbYrI/Jl+omBWh3l+qhrX+Gg
 STUcZcMk1r9bSj6nrFWKXvfB69Yx/jEa+64j2Ni4SA==
X-Google-Smtp-Source: ABdhPJzGZd57SCE6lTB5X3uwmIRU/6FqKH1FmhRKIcqf95jDfe4BGa1sMBTLrl2gZV/5j4OA5IhJn3C6BXKbxyCyl7Q=
X-Received: by 2002:a17:906:6b90:: with SMTP id
 l16mr5763739ejr.85.1628065636743; 
 Wed, 04 Aug 2021 01:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210803142455.89123-1-thuth@redhat.com>
In-Reply-To: <20210803142455.89123-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Aug 2021 09:26:33 +0100
Message-ID: <CAFEAcA8f-4nDUMN40iUzhvg62Huake5rOVTKX5xPJKAWkpKcyA@mail.gmail.com>
Subject: Re: [PULL 0/3] s390x fixes
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Aug 2021 at 15:25, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter!
>
> The following changes since commit 7f1cab9c628a798ae2607940993771e6300e9e00:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-08-02 17:21:50 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2021-08-03
>
> for you to fetch changes up to 50e36dd61652a4a4f2af245655ed3ca08ef0a3ed:
>
>   tests/tcg: Test that compare-and-trap raises SIGFPE (2021-08-03 15:17:38 +0200)
>
> ----------------------------------------------------------------
> * Fixes for SIGILL and SIGFPE of the s390x linux-user target
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

