Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3684B2B6A8E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 17:45:46 +0100 (CET)
Received: from localhost ([::1]:36048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf46z-0006r4-8x
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 11:45:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf42L-00037F-3P
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:40:57 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:43807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf42E-0002t8-Vd
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:40:56 -0500
Received: by mail-ej1-x62c.google.com with SMTP id k27so2948179ejs.10
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bSQFFCslTfREORuYr4/lXZqbbdmO/g219BWDZ8BnlRA=;
 b=Q2CnBxiuku6ZIKMcGtAN3sxFOtd0B1cg3NyuItCA7ana0IGtHNxFJYOORlXCp/owmJ
 cwejl/F8l5op9WGVHAcYkZU00aBgljVgLmelAfgTPOmFuF5Px91ht8bh5fmWATfhPRza
 7JpWjnLzBrYSgl2IXk0vX28sUQ8u32LZohZRI482aevZ2iAKfqr/vWOcrQzfUwi1HX2G
 DTXA7zGXR5Ye5rjFlw/LMuiT5UQ0TQmCZxNuvi4KhGORUO75spreNasRqco61TNmGHs0
 PlyZR4XxNaIT+Nq8xZ+Uwt9X6NuA7W8J93iXbKblFTrL29nA8AzcN5fsA9Isosgv+/aW
 vnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bSQFFCslTfREORuYr4/lXZqbbdmO/g219BWDZ8BnlRA=;
 b=hzj9TQSxNqlcP9wo2q4+SW9weliMCz58LI4msRuK4HkaPtnkTP7Yf8hKqYpMloYIby
 ajfFba/75X0IMpvMWzxCbeNSYRXRm/fzrt6UNcehC8V2Wfayy5CfUOKZaxMrsg99s0GN
 S2W4XnpsoOlNOCyb9jQ+RnP/3QIpPxeOsas5XdZvMlKxn/JKD6QTcFiSVqPS0ATh15RE
 3wm1Pr6LEJ5CqR45MtffkrIop5JGyiXM2Lrd0UWvX83D1TubyZxF4B7VpO5GJhsGHty8
 MTJPWvLvStyi34lDtzvffJKZblMRjaQME3I4gyI6j2S5k+isyYrlzPEKIC9j8BfdDc+B
 XgBw==
X-Gm-Message-State: AOAM533a+P23WhV3x9IL7updx4mr4AXlZxLq8Vk/bYWIpVX2hR32fFvv
 ZzbXBGKqa9a2Y7EtK4+NbfXKvdh7Hpsy7hZa2KTSBg==
X-Google-Smtp-Source: ABdhPJxYVtMP8gWudDsXYZp++3T1kkzXx861bCyZYdT4/mzGSDvxCjtCEfht0sk7dgwzB0fiORcPOGFg/CXkbywjBkE=
X-Received: by 2002:a17:906:c084:: with SMTP id f4mr6045780ejz.4.1605631249394; 
 Tue, 17 Nov 2020 08:40:49 -0800 (PST)
MIME-Version: 1.0
References: <20201117121558.249585-1-kwolf@redhat.com>
In-Reply-To: <20201117121558.249585-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2020 16:40:37 +0000
Message-ID: <CAFEAcA-Jf1Qu9Sm=wLXJYjuc71B2SdYya6xTab68mgwvTfMPzQ@mail.gmail.com>
Subject: Re: [PULL 0/7] Patches for 5.2.0-rc2
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Nov 2020 at 12:16, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit bce36c6c5436c0c2679b42c6de54de5393dfcf59:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2020-11-16 22:29:51 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to c61c644f59c43017f9577d7f867c48bb9d7a28ad:
>
>   iotests/081: Test rewrite-corrupted without WRITE (2020-11-17 12:38:32 +0100)
>
> ----------------------------------------------------------------
> Patches for 5.2.0-rc2:
>
> - quorum: Fix crash with rewrite-corrupted and without read-write user
> - io_uring: do not use pointer after free
> - file-posix: Use fallback path for -EBUSY from FALLOC_FL_PUNCH_HOLE
> - iotests: Fix failure on Python 3.9 due to use of a deprecated function
> - char-stdio: Fix QMP default for 'signal'
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

