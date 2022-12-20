Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 864CD65269D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 19:53:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7hbv-0004Hg-NP; Tue, 20 Dec 2022 13:45:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7hbr-0004F9-S2
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 13:45:03 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7hbj-0002Zc-P7
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 13:44:59 -0500
Received: by mail-pl1-x631.google.com with SMTP id s7so13161849plk.5
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 10:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cUV8pG/Yyx/nsKvZQimT3QFq5pMp6Rsb/QjJITjz4fc=;
 b=Gt2tmR/SvXrxvq4pRM6AHQrFmDDwL/9A7bMVdwcIIIH+5vNGl/3CwIoRzgTbe6nFsO
 7oVHbniFDLd/LuYS89T3ODyhAxl5oboS5TJTbp7oJcp+0Bsw28qvh35PsLq7LilCSdgt
 kcN3VmpbGjSenoqqfTbyL17OAcclQW+8czcExVlT5Aqpi7I5F+7wye0hp62p/2IQX8th
 KRRNYPCjYvw42l6ybElhiXLTw+PWHi5pWUDuCDSYGrFDaXPLFkn+9F6xPTVB/bpaWfIw
 bjuqcWazw/XtTWtc6Zlsi1MQIq/KX1xRX42N4aMcqw0smhGFvmTSUvyc1Z0XzfbOYO4w
 qv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cUV8pG/Yyx/nsKvZQimT3QFq5pMp6Rsb/QjJITjz4fc=;
 b=hqvb7jP+Ce5RiWDKr+cTTsFD6xz3+iwQfyTqRsm5+4DeOvzo4l/IM98EWrf2uPbktY
 FVuf3fTyuNyfPXiv5TNfEYSg0piA9JXgPR4MNdbBqula30SlqOVEfL1fIc2GeamAEYT1
 TCCZe5lXRIQ0soLhPz+WEjxMEaugMMa36U71D1EAoz7A2bDipUPeru0Slmj7LdGOmYmF
 vlkqhbhMPiy3fBdSVt0CZGjYnlQ1ik4avnaW7RvfLdYjO+z1uej8ri05t0Sr9eL1kTv6
 V4fCNB0Q9zGyTfqzXejt7J9OeMLNNGZu5n9MfV87IkLxuusBLNX62t31iHHqqDgePdj5
 aKMQ==
X-Gm-Message-State: ANoB5pncxx0eu8VSd16+XUL4eR+yqE5o0aMkP4m6bOzobiubl8xpHCoM
 7cg8Jj5zqb7P1XdX4y1FjwTX5jYpGd7dDs3+4GgGcQ==
X-Google-Smtp-Source: AA0mqf5gEL45MhrRJ20fQBw5rHH22nxOmNakQVblUCjGcSAGCRM7dluLVx1pc4Ntv3kvQ/yJsA74v+24HiszM+cayAo=
X-Received: by 2002:a17:902:70c5:b0:189:b0a3:cf4a with SMTP id
 l5-20020a17090270c500b00189b0a3cf4amr37233125plt.60.1671561893869; Tue, 20
 Dec 2022 10:44:53 -0800 (PST)
MIME-Version: 1.0
References: <20221219222935.284704-1-deller@gmx.de>
In-Reply-To: <20221219222935.284704-1-deller@gmx.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Dec 2022 18:44:42 +0000
Message-ID: <CAFEAcA_y9Gdq66PxehfYCdX5Ck=1UQi+r3kp7rvZEWHnuj22qg@mail.gmail.com>
Subject: Re: [PULL 0/2] Hppa fixes patches
To: Helge Deller <deller@gmx.de>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
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

On Mon, 19 Dec 2022 at 22:29, Helge Deller <deller@gmx.de> wrote:
>
> The following changes since commit c15dc499cc22f4a71639e42e36051e118761c25f:
>
>   Merge tag 'pull-misc-20221218' of https://gitlab.com/rth7680/qemu into staging (2022-12-19 10:28:57 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/hdeller/qemu-hppa.git tags/hppa-fixes-pull-request
>
> for you to fetch changes up to 59f8c04b222ff4b9f3799fe92a7e5d427ae48197:
>
>   target/hppa: Fix fid instruction emulation (2022-12-19 23:14:06 +0100)
>
> ----------------------------------------------------------------
> target/hppa patches
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

