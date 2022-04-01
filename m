Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 423844EEEDC
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:07:35 +0200 (CEST)
Received: from localhost ([::1]:48084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHw5-0000dY-V1
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:07:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naHtE-0007Z8-4t
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:04:36 -0400
Received: from [2607:f8b0:4864:20::b2b] (port=40575
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naHt8-0005Kg-RF
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:04:35 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id f23so5183868ybj.7
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 07:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YJ+i0hhsWk13jaMzuSAJwOsKApnofRVbnuRUAcpKqrA=;
 b=GTMmewJWX5Lc+NiQBzPlnXBtEwahBpB7wQ9bX+gT0/YkYszamsNVlfBRd1xsO8Q+6R
 Uhh/8x07Zu8XIyHtubkboQ8e6BwMjc//zPRser6JIWnwHSWhC3w+b7+mb5hqLjmGLY07
 o7grIo8kqilW1RmVS+x+tEs+xaZbBNAM+TusJHCVwNJ8u89PlgQ/OQL6TT0qUy9dQJSH
 Ea2jv2mFtbfSl59gxovBvROfyRxtt5uTXH/ZMbEZD6oAbItXoTTgp+PMNA1PP26MUu9n
 apuetV+0SLZKvxw/bX3KJjxyYsM7EwEnhGEoazGV5Rl0Ccc0mjd2aCNmOpVEErW43jAg
 VEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YJ+i0hhsWk13jaMzuSAJwOsKApnofRVbnuRUAcpKqrA=;
 b=XOD4c3bbvG1YKgm6iOWAGMY1YIvmZwXyih7XAvgY1z/0R5fuGPCNqtbrkxcmYw/Fa/
 oGN5V3Ot777BXGS1Uxvxk81c+t7R9HChbAjiHY6aNhog6Td3u0yKK7XZA/4kq5Axac/N
 hqAcCz/TuYFzSWaGrmJtfCFrtrPlEISNKTJQZpkJuOkJvlNQZxWn228pmpYZNUPk+G2o
 EEMuIEGQFS+ddEiuWq6EWEej+1D9Q4J7gSOYUnpoPH4Jb/5btO0yTCutIiQF1kOf8nF9
 lCTO1E2hR52NpOqWTGyJeIkeTPi0PqyskMapmVygyF7j8Ld/CU2mB8w6yaWqXoV5TYf7
 xWzw==
X-Gm-Message-State: AOAM5303bbltljqFFMAZyd1R82ShVA2ttJXjZnX6UJnHXqzKJcgiZTb8
 1H3OgOV+EI7Qi4+gZaO/ukv2EDoNpDsxwnaZtbUFAp8VuFdwTA==
X-Google-Smtp-Source: ABdhPJxsvk3zH9Cj9jETsQZoQhu95J/ccEo5zVpmv0uVU09OfxPjgko1mKcnJ9dGm90oKTxf6WrezCurxL/INxWMbGY=
X-Received: by 2002:a25:418c:0:b0:63d:84a2:2364 with SMTP id
 o134-20020a25418c000000b0063d84a22364mr856310yba.85.1648821869564; Fri, 01
 Apr 2022 07:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220331221857.433867-1-laurent@vivier.eu>
In-Reply-To: <20220331221857.433867-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Apr 2022 15:04:18 +0100
Message-ID: <CAFEAcA_6_z_PPV-KTCkNR1v+8ncDYFBwfiKmvL+C9_5noyyMVw@mail.gmail.com>
Subject: Re: [PULL 0/4] Trivial branch for 7.0 patches
To: Laurent Vivier <Laurent@vivier.eu>
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 31 Mar 2022 at 23:21, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit cace6c6f3aca7b88afc42995f90bbefb37a0ed57:
>
>   Merge tag 'pull-qapi-2022-03-31' of git://repo.or.cz/qemu/armbru into staging (2022-03-31 11:56:52 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.0-pull-request
>
> for you to fetch changes up to 04cca669b237337cc8734788c3ad968aa8e0b57f:
>
>   tests/lcitool: Do not use a hard-coded /usr/bin/python3 as python interpreter (2022-03-31 21:32:49 +0200)
>
> ----------------------------------------------------------------
> Trivial branch pull request 20220401
>
> Fix sh4 linux-user build on Alpine
> and some trivial updates
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

