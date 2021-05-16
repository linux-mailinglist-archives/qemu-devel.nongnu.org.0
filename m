Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F5E381FBD
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 18:21:20 +0200 (CEST)
Received: from localhost ([::1]:51038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liJW3-0005x6-7l
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 12:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liJUp-00054w-1p
 for qemu-devel@nongnu.org; Sun, 16 May 2021 12:20:03 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:44749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liJUn-00023r-9n
 for qemu-devel@nongnu.org; Sun, 16 May 2021 12:20:02 -0400
Received: by mail-ed1-x52f.google.com with SMTP id t15so4061764edr.11
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 09:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4m1d5JQQEWbRqHbX7Z2ZI/wXomRDudcl9CSBfNIIMrc=;
 b=fwS/GBtXxiKE6XXji9VM3xmCIyPTvEEE2hQeZXmwXK+enu2z/LMuUpOk17zHk8Fbjs
 VSPPxvcWYx/y9EujEvd7bwlZQa2byWriqJFC5esTOvbo4nLR9bWZX6NZYoM3jaCPGo8b
 xAJ6Xf+KWQ281P1x+dAMj+/oFq6oNg0oGhkUJvEY8WuMp1GlmKtqQbdERqWDIP3kKUzH
 a2HhtCGtup12rJhwFyrhXnON9IKUBXs8gYRRbUE9XiL8gamRY9uc1buPPmG8+YXKV3BI
 0u/fo/D4TpE1BGFRsGqLJj6LX7tygrEVUjefBPHWWWIOMBmfMcUFTjr4I08uBjkd3DtE
 MDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4m1d5JQQEWbRqHbX7Z2ZI/wXomRDudcl9CSBfNIIMrc=;
 b=ckTPSrHUCD/U8Al4xu5v/JrdR24OyVsATAsr2brgZgxVv92hfc0cFlczRK+CWD2/+Q
 Hrido0iELqcyFOWs0eRY+NW707tL6etvvZYBYOfglTMMWpJu4aG1EuSVNJmHDX49d+V0
 ecAdPQpQ3A2h1G49on/0HcVKjqfrU0+4omHaww3ab79wi02z4bQBJV0SjsHc1dn0F9nY
 6XdoZrgDxLesmWM4IxsCE5Zv0WRXIgXA32ZGBhLu3NcE7gaz8hSAhwoUjYWSugb4xj1M
 EOnch83Qe696Mex+RkCDKNxmWivncUfBIKQUoIFzlOhHzgUXU6U436NLJmjj8fKe1AxE
 5PGg==
X-Gm-Message-State: AOAM5307V0lU4l2b9fTMkSr50KVamHdnoAcdPAQ+6ZWU3QzexuENyot2
 3T+dib68uKfwwKR2ZKPbSBYTe398d7PFVHabkOVo2w==
X-Google-Smtp-Source: ABdhPJxTjVerxRVbztcarVtTXfP1jvz1QwPEVNInZejP75ouvBb0i29or1nniyM5ESuANA2hIsrpFnxbrh42Trp0waA=
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr67046206edv.204.1621181999733; 
 Sun, 16 May 2021 09:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210514121518.832729-1-thuth@redhat.com>
In-Reply-To: <20210514121518.832729-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 16 May 2021 17:19:45 +0100
Message-ID: <CAFEAcA-kj52g=E2mwD85NxLupfjcJw2grdouTqRezLJFEhEv=Q@mail.gmail.com>
Subject: Re: [PULL 00/20] CI, qtest, and misc patches
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 14 May 2021 at 13:15, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter!
>
> The following changes since commit 2d3fc4e2b069494b1e9e2e4a1e3de24cbc036426:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-misc-2021-05-12' into staging (2021-05-13 20:13:24 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2021-05-14
>
> for you to fetch changes up to 568740bedf22cc8d0ec9ab1ce522a97baab5961c:
>
>   cirrus.yml: Fix the MSYS2 task (2021-05-14 13:11:48 +0200)
>
> ----------------------------------------------------------------
> * Replace YAML anchors by extends in the gitlab-CI yaml files
> * Many small qtest fixes (e.g. to fix issues discovered by Coverity)
> * Poison more config switches in common code
> * Fix the failing Travis-CI and Cirrus-CI tasks
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

