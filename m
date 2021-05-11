Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5E737B00D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 22:22:38 +0200 (CEST)
Received: from localhost ([::1]:51328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgYtp-0007dO-Jd
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 16:22:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgYsm-0006m3-Uw
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:21:33 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:42745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgYsl-0000VN-BG
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:21:32 -0400
Received: by mail-ej1-x62a.google.com with SMTP id s20so26131792ejr.9
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 13:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w3QG6oE6XFxK+C8mxpRyc8xyhWT1b4/Q8Xqo5OjgPlg=;
 b=SwIBaArByIxrtLw1F3QPbRlG1FsXkrqQuc3yzDlCg7m0J+px1TUKl2MyTeko4ineFD
 bgw5tkVwQIMhBSS1S0HuErchLiWLVE2cafrznY5TUY4J9hqtlo5wry7ylnVRxcD6WsOI
 871tStm6VPFnsuSy3sl98sWfyQDf11ddXeO4TvN0exXtNLC2iiD7dNQEflnLdXOq/lmT
 +EZpluhcOUV75bYEWmA071tmqiVRaTeV57TQ5/5sGNZgApFJm8L0X4xotA0I3fNC7syt
 GZYF6mhZyLuaMRHtDhPbHHKkc2/Eg/i1p621UkMA0dBE1641isrjy+IT3cVj1GCCdVbD
 WKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w3QG6oE6XFxK+C8mxpRyc8xyhWT1b4/Q8Xqo5OjgPlg=;
 b=doHqkPgj4yBMhtUyGyIVBu4e+Elr9ufR9ONkd7b0/y/oSmzKMHCQOUrnl83h5gTgsI
 ZDKoGvqEYN1n5YP25aRyK0UP5wKJ3ZOXjUwVOh+3I3s+wSyLsSS+8Hj9+kM9e3/Zlkbs
 Gt87e97I8pIFq/cS3ODIQrsjgRruzU/KcCrVq5Dn4klNu3JnQq8BsJx2r/9zyJ40qgQR
 56yuFH/smuN0zvQ6CwXh1In2kZ4uDDfzh6aaSlrjaIz5dlnSWCXuh21dBsWzaCOGhbxY
 4X+nr41n4kIkUt4tb4IJ3WxM4I8LIJbtHry3J3R+voYocDCR5asQZb0UIfp/FrHUty0J
 Ydbw==
X-Gm-Message-State: AOAM532DO/1k+clACAGtw52EGVwzol8lkjEX7BL/OXcV1+3FPtDQK9iR
 9bWvwj6k7iPIgL66h18By2lSFMFAQa6L63ARyiHT+Q==
X-Google-Smtp-Source: ABdhPJy/HwfcNppRp/bK8/4nd1gi9jr5FAwxpSzQM4n0+YHiMitLkcxxoW+l42JSea0KOqDQmVSeazq8UDmVHW45J4A=
X-Received: by 2002:a17:906:eced:: with SMTP id
 qt13mr33320407ejb.382.1620764489601; 
 Tue, 11 May 2021 13:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <1620458319-5670-1-git-send-email-jasowang@redhat.com>
In-Reply-To: <1620458319-5670-1-git-send-email-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 21:20:16 +0100
Message-ID: <CAFEAcA9uVxbnJt_kcuy5RE3n2sDYk4y3bsEQCPFchvqbpmUMxQ@mail.gmail.com>
Subject: Re: [PULL 00/10] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 8 May 2021 at 08:18, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit d90f154867ec0ec22fd719164b88716e8fd48672:
>
>   Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.1-20210504' into staging (2021-05-05 20:29:14 +0100)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to 2bdeb0c2564c36b218ac73e21d7a6f6accb49091:
>
>   tap-bsd: Remove special casing for older OpenBSD releases (2021-05-08 13:59:12 +0800)
>
> ----------------------------------------------------------------
>
> ---------------------------------------------------------------

This causes meson to emit a warning on one of my build machines:

Run-time dependency libkeyutils found: NO (tried pkgconfig)
Checking for function "gettid" : NO (cached)
Run-time dependency fuse3 found: NO (tried pkgconfig)
Found CMake: /usr/bin/cmake (2.8.12.2)
WARNING: The version of CMake /usr/bin/cmake is 2.8.12.2 but version
>=3.4 is required
Run-time dependency libbpf found: NO (tried pkgconfig and cmake)
Has header "linux/btrfs.h" : YES (cached)
Has header "libdrm/drm.h" : YES (cached)


We shouldn't be looking for cmake at all.

thanks
-- PMM

