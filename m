Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C8268AC09
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 20:14:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pONxy-00036Z-3A; Sat, 04 Feb 2023 14:12:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pONxq-00035T-BI
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 14:12:43 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pONxo-0003QV-0H
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 14:12:41 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 n20-20020a17090aab9400b00229ca6a4636so11779644pjq.0
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 11:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xMpJm77nRrQBWuJavlFWKNpL1hx0wO3x5xgfmwCTnvQ=;
 b=fHhhVXNLHXNfVIipXi6aRcDc6Zh1JLeA7FWDFvmyDQ8+yMPOrwxx2gNufBCCEPqu0v
 vq6T/Tinx8vT3yGl9BxOmSlAh1lIElHAO7XPQHsXJ5EybGD36QpY6+LuvwHWpG/9U1VV
 b+8Hal30UHjR/pKa9zEdQF3KWZZbZvxd+S3zWjTL/VcSETIhj5g7+EyR0A8wNlCdEmaw
 iY8yV5Uf58iimD//2KlHLtWaNHlH3/CSXqspeZt137s+hl/ctpiHY0xSJSau6/PKdpNz
 m32CncikApqa+SIfKoWXwcg11eOVH6LI9IvDncXK3IpfUiZWm1IqDdpUadj5SslkROZk
 7zXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xMpJm77nRrQBWuJavlFWKNpL1hx0wO3x5xgfmwCTnvQ=;
 b=O6twIrxagDWvNDBZDbTfz6rd0GAeRXpr+Im91kVYTTaE7gDoZEan85tMVL2pd8+R20
 4lCsNBLYfNRJ4mG1rXOrYmc6hNiqHo7cgCYcAwsWwTsN4dP7LDNcTb4oIZr69WiAQxE2
 3uE+MlSX6Jeo7Jhp1V+yALV20fqmtxiExsQU4IXmRpDIBPnOawJuI65CH2txHaZlrCWh
 q3nA/Fvnh+hkTQx0Iw/S4+FSjBy93K6h8SIvewzONu6C9L2PFryWeDo7+RIVueQ2MIOs
 e5QjgltaF7bRVu+xSpdRPnnNp77l4DJRJz/z8P2mbf27txhjjcwv+D8VCCiiGIetSFDh
 3+cQ==
X-Gm-Message-State: AO0yUKV0pOuE0tb1Bow3wZtd5izNGhq/cuLTgCcOY8qrwDKtCW3pgZs8
 5TESe/XINkJMcpmQjyDSwetqndjL0DK7um85tOE9fw==
X-Google-Smtp-Source: AK7set/IK3GXQ/uGXtDoStue6+J66eMU+v86ZsN3GyYit8EP6cgvvH/qslBdqGSNr19EBmZCK1RZpHWFN7YZ82XTZRw=
X-Received: by 2002:a17:90a:a38d:b0:230:81fc:db1b with SMTP id
 x13-20020a17090aa38d00b0023081fcdb1bmr888554pjp.89.1675537956061; Sat, 04 Feb
 2023 11:12:36 -0800 (PST)
MIME-Version: 1.0
References: <20230204160830.193093-1-laurent@vivier.eu>
In-Reply-To: <20230204160830.193093-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 4 Feb 2023 19:12:24 +0000
Message-ID: <CAFEAcA-tJ_1HEoTjfjaaMHAHEz3CPNQU3+RU8QzngsUndvoO2A@mail.gmail.com>
Subject: Re: [PULL 00/22] Linux user for 8.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sat, 4 Feb 2023 at 16:08, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 13356edb87506c148b163b8c7eb0695647d00c2a:
>
>   Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2023-01-24 09:45:33 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-8.0-pull-request
>
> for you to fetch changes up to 3f0744f98b07c6fd2ce9d5840726d0915b2ae7c1:
>
>   linux-user: Allow sendmsg() without IOV (2023-02-03 22:55:12 +0100)
>
> ----------------------------------------------------------------
> linux-user branch pull request 20230204
>
> Implement execveat()
> un-parent OBJECT(cpu) when closing thread
> Revert fix for glibc >= 2.36 sys/mount.h
> Fix/update strace
> move target_flat.h to target subdirs
> Fix SO_ERROR return code of getsockopt()
> Fix /proc/cpuinfo output for hppa
> Add emulation for MADV_WIPEONFORK and MADV_KEEPONFORK in madvise()
> Implement SOL_ALG encryption support
> linux-user: Allow sendmsg() without IOV
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

