Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AC366DAE0
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 11:24:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHj8U-0001ti-By; Tue, 17 Jan 2023 05:24:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHj8O-0001iv-Rc
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:24:06 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHj8N-0004Cd-4X
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:24:04 -0500
Received: by mail-pl1-x636.google.com with SMTP id 20so5738738plo.3
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 02:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4co6V3iEJk/Bk48E2HEQdmYpbR5s2l3LYIXCNZGsTvM=;
 b=FRzLrTCmRm/RCzFS0Ao40O4ZgiOpMbj2HdHqob9sNjUtGgi9tHktvu7YoKO3Xv765L
 VWe8p3FD8imBShCHR8x9SN7s74E8NyNRunDxBN6HsJiHFLTgzO8OCxDlBngFclNws+vV
 QrA0tgyJ4mdHLZPUk7GHAFAxaiCNszDMizmak5QBIqYMh7lM5eowVN7Ql5zzZqJ0Tvpg
 JlSmRrR4+Flj89FN6/Bl5H8a1MUSgHQ4oBWRJSX/b7K9a+fZRHYTBs93Q2e3EykXfzhw
 vAyN92wIhyg8mBwUg+wqbRL+2tHSRe3UJ0K+jiox+B4f2qyxWYhZTQg7mN5/OCiXUB6Y
 0eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4co6V3iEJk/Bk48E2HEQdmYpbR5s2l3LYIXCNZGsTvM=;
 b=CQ6sJWhgQ055/MzIp7OcbDAtgGERTbLiv4k2JFz4HaygHeVy9kUs+aPUuh3rgD9YA+
 oHLQeWSWFg4f3hvqEgE0X8xgnbbotQnyRXka22X5DkuhDK9jvyMayuL/RwjM757wP6sB
 0HvfWv0x1CvnVRLTgvf/ehoDSwsEkrZYLXgIgm4fxuiH9LXINicK9xiU6+y0zaZvG+7O
 vEfcHqji1mj9b0FVKQrm5Q7p7mYdjPxnmNeLoM2b+rVTHTuj3DYIvhfokiSkLt3r8aKF
 +l2Q6AQeaVVCGL7zzhZllimxqpZyVCT70FTAx5F+qcMTnFJn4VFn+IzAXzvvyajsnNF7
 RINg==
X-Gm-Message-State: AFqh2krOmAH20smc75cDDlmSxbiPxkb356ysZNmN7lP8mB/g2qVp34oa
 A/V2drAJKnwe+o/WFqkolvaZpfbD+UGwuJpWC26P32gwF567Mw==
X-Google-Smtp-Source: AMrXdXvMYKHcvda3esEiqDYfG7x6dk7G6z7eK5P7ZnFczEiRhY2F0cCNLx3eMjDfcwGs7vHOCx80jwRVVS/X3W34m2g=
X-Received: by 2002:a17:90a:c784:b0:229:2631:e8 with SMTP id
 gn4-20020a17090ac78400b00229263100e8mr197829pjb.215.1673951041569; Tue, 17
 Jan 2023 02:24:01 -0800 (PST)
MIME-Version: 1.0
References: <20230116091912.1882152-1-laurent@vivier.eu>
In-Reply-To: <20230116091912.1882152-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 10:23:50 +0000
Message-ID: <CAFEAcA_oN3pb6=ZCSuE9Xr5J8nUfNChFJwJjXUOk_dMEGn3=rw@mail.gmail.com>
Subject: Re: [PULL 0/4] M68k next patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x636.google.com
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

On Mon, 16 Jan 2023 at 09:19, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 886fb67020e32ce6a2cf7049c6f017acf1f0d69a:
>
>   Merge tag 'pull-target-arm-20230113' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2023-01-13 14:12:43 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/vivier/qemu-m68k.git tags/m68k-next-pull-request
>
> for you to fetch changes up to 1a282f60a971aa86e3cdd1b7ca000790e43bb310:
>
>   target/m68k: fix FPSR quotient byte for frem instruction (2023-01-16 09:47:31 +0100)
>
> ----------------------------------------------------------------
> M68K pull request 20230116
>
> fix FPSR quotient byte
>
> ----------------------------------------------------------------

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

