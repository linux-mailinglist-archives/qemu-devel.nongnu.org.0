Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E8B40D76B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 12:31:03 +0200 (CEST)
Received: from localhost ([::1]:43564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQofW-0002x6-EN
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 06:31:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQoTt-0004xO-CY
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 06:19:01 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:34424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQoTq-0004ag-6t
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 06:19:01 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so5479309wmh.1
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 03:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SI8ZGm4fyPDtUQE7I+aPia0knBlk1mUhyUCYoOZnkBs=;
 b=cVlMY8Bet3k6e0kAhYV7nJTKjMZsDfcvQ7fzrIMy9PyOLercqe+eMZ4sC65PpNCNOo
 vqBCsHMlXMOOh1xkTIYqpKx6hICfOyQrIiGvohl+14E536E/Q34nbP7qQXJGtvA9eoty
 92vTW/ssj+nEyu/PsbuPrt+LMMcUMAZYWCTU/4o/DwbWJ0PK87+kDf6aDKdkg6ORpoZn
 t0oa5VUh+bulQsI7o0J1s/Orj8ZQE5y2NlKBIjFjycvF+a24K/8mmuhNVGHU29rpE2EF
 tcmRmaksZS1aevJdrtnX6e7pfJ4nlFGgl8CdpchANqd38Ogl/irf6f5wVaUAvbGhWaTN
 s7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SI8ZGm4fyPDtUQE7I+aPia0knBlk1mUhyUCYoOZnkBs=;
 b=UcfYbYsWXa2JMo4DTNYTpAZlEISIZfmrq52KavYftZlXXb68IgbDyKaBvM+IskueHI
 bQ1nNeiFC6bvXU0gOSSZ16Et2TdZjrvRG8BfQ4fzMcwq8Sk8Myl74QFlTqr8kCnnrPT1
 TifwPw/eZ7y9c/aaZm/OGkV6GUJHDKSMT3pcA7dmeJsl3DPNd8OVlm0C9tYWh0koYVf5
 TetwMVj6AFCp76StetRutQe1gYKky8ft68ZBfos9V9oNu4kupWDfMTRZA2pOgCvoy9EM
 LYGx+e6+we792kHIgabIYPkn4P7i0awOb6/hyh1MlJ8yGdSvRR30tQmwt3TUQctH5M7r
 id+A==
X-Gm-Message-State: AOAM5314KpYz7R7aZ53uVjHmIX/TwwG39Gn01NWxwYIMi9GES3f8kAfR
 4HdW3MFJX7oWD1AkaBqwOGTVSiMkj5fQY5hYB9DvDw==
X-Google-Smtp-Source: ABdhPJzD9Gq558jzM+jOJxi+e/e0GOktR9bCoAUn3QiPfbfe9NSY+21mLPMtQ3mpE5OS2y3jMP3UFts9QqPqDLOG/Bg=
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr4296922wmm.133.1631787535364; 
 Thu, 16 Sep 2021 03:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210915175318.853225-1-hreitz@redhat.com>
In-Reply-To: <20210915175318.853225-1-hreitz@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 11:18:04 +0100
Message-ID: <CAFEAcA8bxUeNp1+Uw2src-pOsU-4UDUWtwr0rUJDRff5qKN6Mg@mail.gmail.com>
Subject: Re: [PULL 00/32] Block patches
To: Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 15 Sept 2021 at 18:53, Hanna Reitz <hreitz@redhat.com> wrote:
>
> The following changes since commit 0b6206b9c6825619cd721085fe082d7a0abc9af4:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210914-4' into staging (2021-09-15 13:27:49 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/XanClic/qemu.git tags/pull-block-2021-09-15
>
> for you to fetch changes up to 1899bf47375ad40555dcdff12ba49b4b8b82df38:
>
>   qemu-img: Add -F shorthand to convert (2021-09-15 18:42:38 +0200)
>
> ----------------------------------------------------------------
> Block patches:
> - Block-status cache for data regions
> - qcow2 optimization (when using subclusters)
> - iotests delinting, and let 297 (lint checker) cover named iotests
> - qcow2 check improvements
> - Added -F (target backing file format) option to qemu-img convert
> - Mirror job fix
> - Fix for when a migration is initiated while a backup job runs
> - Fix for uncached qemu-img convert to a volume with 4k sectors (for an
>   unaligned image)
> - Minor gluster driver fix
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

