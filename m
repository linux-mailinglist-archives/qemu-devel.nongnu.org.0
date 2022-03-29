Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5C44EB536
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 23:25:55 +0200 (CEST)
Received: from localhost ([::1]:39820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZJLe-0005ol-FJ
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 17:25:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZJGH-0000Th-89
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 17:20:21 -0400
Received: from [2607:f8b0:4864:20::b2b] (port=42762
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZJGF-0008DF-Gp
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 17:20:20 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id u103so33739950ybi.9
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 14:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W9/GATM091OmGUihJg3nvhDCS3dWY/iScIFoKB/K7b4=;
 b=OEN8HOZeKJa25MZTm2Wqjf6pNA5T/iI9FX6HpGsKLmHVB76o/rRhlUhPkqnFB7yIxR
 SEmySxi65IPECVgw22sRIvdwM0eYMDE0hH8YG8WAtxzknDlh7yaXWgfnZvvZfMvp8nCR
 0mFZHLv0vcDmdllwQnCbLiCfWGqMGfxYjyR/B9H1bEinVjBDO7rruLqvE0UIQCDsMh75
 pHS/SD+XtZKwC+O1lqFzHvvVa8PWBuWJ4JwFz+WyvxSYJ/cggUjbSYEwve0mLXi/vSJB
 ZuDQiIKxnBdqNNJ1JRZC6AQw10RF8n53rQ0tFCPcTksqFdGNyCwoaSMMBa8Gi/nAkUvM
 PECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W9/GATM091OmGUihJg3nvhDCS3dWY/iScIFoKB/K7b4=;
 b=t76IM1ZSAXxx8rwWw6bEoxG0Jd5jqavQA+yzA+O7pwQfN4BH+GBujwqqf02mLcbjZc
 t1DqQ9wX4w6RYzjL9PL8WgD42y+FMaBq4sHuDKPYIBnF9BqejpFo0tL2lwvPp4XlCV6z
 D7kKNHkj5c3F+aGZAUmv3yjb8XIHcFAcJNlrg0SJWQUQJhqUcEhVT3yZ2w/Dttm825zo
 ZOwYykx5V+P+aC17LTP9ttlGuDw5/0sOiIGcED21vvQaUejyOqH+cmRe6xbtzSvmEIv0
 0YpvgcTR2ZXonETFIgKZRlwmE9ma+qyK+XKeBn1Xmp7AVITUWn5P8Wao/UqvV6sEWv6U
 0skA==
X-Gm-Message-State: AOAM5305YtfhNUgdQ0MNnAtoUTFAjXulu4K51kITaEub0W6RyREZ68Zd
 8iytJD09fGwmzoHzQbMJJDJUKN8N2U+2NqGcDRKUig==
X-Google-Smtp-Source: ABdhPJyikLOHi8a+EmEaLRH38/xNQrdM+pjDae12nf74VN4gBRGMWBrJlmODUq5v6Cscx8swOIYb0qBwL6uDtUKupM0=
X-Received: by 2002:a25:7443:0:b0:637:18d3:eea5 with SMTP id
 p64-20020a257443000000b0063718d3eea5mr28999420ybc.39.1648588818496; Tue, 29
 Mar 2022 14:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220329145849.121051-1-hreitz@redhat.com>
In-Reply-To: <20220329145849.121051-1-hreitz@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Mar 2022 21:20:04 +0000
Message-ID: <CAFEAcA8Qq1JEQkpQmz6tiXhfnop7+ANx_LEGt2t778RiOhrtxg@mail.gmail.com>
Subject: Re: [PULL 0/4] Block patches for 7.0-rc2
To: Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Mar 2022 at 15:58, Hanna Reitz <hreitz@redhat.com> wrote:
>
> The following changes since commit 44064550d98a680e2ff55fdd783ac19d850ac8ca:
>
>   Merge tag 'darwin-20220329' of https://github.com/philmd/qemu into staging (2022-03-29 15:17:53 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/hreitz/qemu.git tags/pull-block-2022-03-29
>
> for you to fetch changes up to d5699c0d4b29e919b87049d948a30527897b7e8a:
>
>   iotests: Fix status checks (2022-03-29 16:30:55 +0200)
>
> ----------------------------------------------------------------
> Block patches for 7.0-rc2:
> - Disable GLOBAL_STATE_CODE() assertion for the 7.0 release: We got
>   another bug report for this, and we do not have the time to
>   investigate before 7.0, so disable the assertion for the release, to
>   re-enable and continue investigation in the 7.1 cycle
>
> - stream job fix (regarding interaction with concurrent block jobs)
>
> - iotests fixes
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

