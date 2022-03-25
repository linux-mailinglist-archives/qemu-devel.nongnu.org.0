Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C3B4E70FE
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 11:16:41 +0100 (CET)
Received: from localhost ([::1]:44112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXgzn-0004DU-Nn
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 06:16:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXgxy-0003N8-NJ
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 06:14:46 -0400
Received: from [2607:f8b0:4864:20::b2a] (port=44757
 helo=mail-yb1-xb2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXgxx-000374-2f
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 06:14:46 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id y142so13166981ybe.11
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 03:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0eLR7MRU0I0fxKjpoLhUFgasjpDQNAdJghDhTNtJIc0=;
 b=v0aZFACw8onmM0ME76J0yApABxjWaiQh4EBh0M5hb9BhLWV0m9Itpzt+QqhCYI17gL
 wxkCEImCT5o07AFKEm3SJ513IpBFWsSM2fVZoKQwNLyh3Z773oDXFy64hKCzMkbAhCa+
 1nRD4kdEwjJ0expMwmtb9uPv+lC1H36zdVgqVD9voIIb+iKWDza/wuYXDFTI6PisI1QD
 cwoINldtH3mKuQcMH6TWV4L7pjIkKgOQHdUK+X/CjrjRF7Q0YPYUewxwAwV+Z91k+SEp
 6yY5pQKg3USTqqNVUIWgzRAyJdEriVkWdcvYvnga5IV395jvfNgiTf/EnlG50LTG3LPz
 N1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0eLR7MRU0I0fxKjpoLhUFgasjpDQNAdJghDhTNtJIc0=;
 b=8Q1ad89TeA3zjGnuyD/c0zy8YAgHLGRwMt0QdPTuKYa0cerpJknULiH3sgR+KvoMVJ
 yXZh38XeULVsxzIaW92QfWVEU/Yk6D/vCFAhVJiB+EG08+3MzB4ArquRk62vF+gxFth7
 oiR43yn1sfnqUdfNKa20NDQPxkCwr/VbuhQeZM60PdkZYaIHHceEYcqPLXpfxq+wOmjg
 i7e/P4AqBC5pBAAsJ82IadZgjXjzmM4g00ep/FBu/bTvwCd0FciiOmgkJeIaQZNT9i5e
 4hiv3VH5H2DECp4Lb2Hd8wdGVOnE5+S34lST5qyWpcCqt98LutgPfiQ175bMY3ExTfoY
 Bhaw==
X-Gm-Message-State: AOAM531hlx5aWonh+6nk9WGtWfCH3/3JT3w43rhh6jowcaUOrs4mHEMF
 mMI3jkPhYL1xjG0kmAY0jCnaFazjnom3cg616/of7g==
X-Google-Smtp-Source: ABdhPJxVnE5wi0G5bK3oOsKqRNrHjYK3DLigz4SPBEUXqMK5HO0CMxR+VbGvIbx7xv9ngx4VEZU0L4d99YkMGS1CxRY=
X-Received: by 2002:a05:6902:1147:b0:634:6e83:70b4 with SMTP id
 p7-20020a056902114700b006346e8370b4mr9359458ybu.85.1648203283989; Fri, 25 Mar
 2022 03:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220324171527.1256604-1-stefanha@redhat.com>
In-Reply-To: <20220324171527.1256604-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Mar 2022 10:14:30 +0000
Message-ID: <CAFEAcA9EzczgoGKLhEn-wkd+Rt+sqpt-6diQvJp3LVy_KS-LXQ@mail.gmail.com>
Subject: Re: [PULL for-7.0 0/2] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, Hanna Reitz <hreitz@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Mar 2022 at 17:15, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit 15ef89d2a1a7b93845a6b09c2ee8e1979f6eb30b:
>
>   Update version for v7.0.0-rc1 release (2022-03-22 22:58:44 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>
> for you to fetch changes up to 2539eade4f689eda7e9fe45486f18334bfbafaf0:
>
>   hw: Fix misleading hexadecimal format (2022-03-24 10:38:42 +0000)
>
> ----------------------------------------------------------------
> Pull request
>
> Philippe found cases where the 0x%d format string was used, leading to
> misleading output. The patches look harmless and could save people time, so I
> think it's worth including them in 7.0.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

