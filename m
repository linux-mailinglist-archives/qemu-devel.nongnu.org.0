Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F2B33F81E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 19:29:43 +0100 (CET)
Received: from localhost ([::1]:50506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMavO-0002k1-D4
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 14:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMatp-0001Sl-G5
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 14:28:05 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:46624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMatn-0006W2-Jx
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 14:28:05 -0400
Received: by mail-ed1-x530.google.com with SMTP id h10so3462778edt.13
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 11:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aRmOQTk+J1nCPAiAWJQxe3kco7E2NQCgboZT/C/ee2U=;
 b=XUIHpXtveAa+2dkGHYmfNsOooi8rQbq/+SpM/WQoALrIRruyQ1zFiAzvx1z2+yued5
 aiKl6PqWm6lF+4/yzPWoN3AxwXo3TFK5fJGnXHt+V+cloGcPrr2t4+bqbiRqBLTcMLUc
 et4ffjEvbgviVhmuFB8/TkYZqHvsxJvqoKRFNlO3aZE0l0eNyltnpcgH0jOzPcIomZMi
 tkzR+GRDOAf7TJwl2HRTAthvamd48xzP1BcEfYU1tQaFU4H5iTBlLF9CZgEW6rsuRQ+m
 ojBHNFDLBdiZTnwNc8sBZ5smWh/9YjTkfc9yrHHg9H2KNahKFn6eAGZFc8sQouARvPOo
 GSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aRmOQTk+J1nCPAiAWJQxe3kco7E2NQCgboZT/C/ee2U=;
 b=hkFJNxVWujMnkBmbDtCKccl75L9shUA4J0+gJKPdxpPUI3LrBZ8B6GuC/AC8MBwNZP
 JECTBmYhzwAba8bdwFARkc4GuJLVdCApdQZBanbEXJjbjRwZBQ8Ck0bgs7Hn2MN5z5dt
 naKmcPb++agreyQ7w2rYGDTIhjqpX2YIWfH+TMB/Y0JscfbDb4OM1P2abTdQMHB1evOb
 Bkp0ZKWMt+zsEw3eZjFBT7+ssc6aDEf+cmsxWJk6XpTG82m767k/ofqlHOtUkaYq0mdu
 WyOw3NaHXAVPTBqPoge6362P1gizGvuqyDNoRjYuM0b1aF9fVKloTqJYBZ96TFtZOX/I
 Tu/g==
X-Gm-Message-State: AOAM531utzLThr3/bNoaxO1oMIbxbMqk9atJKywIWdd8ycCPxR3XMv9s
 V3DXbIKvMQPZHkO1sp4iUL3dV3AQHxO/ZrFuByKrXU2vzEvk1w==
X-Google-Smtp-Source: ABdhPJyg9WIktKLm+9zFff4jhSCEi/cQVk0R7G2blPVj72z40hbP5JUFFCfTfqc+sCCxc8yBrfiMBDtUeoAsIzXQWwc=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr43394366edt.36.1616005681912; 
 Wed, 17 Mar 2021 11:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210316104745.2196286-1-kraxel@redhat.com>
In-Reply-To: <20210316104745.2196286-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Mar 2021 18:27:38 +0000
Message-ID: <CAFEAcA-_hQ9c5Bg48S5_ny0FWA1vd5SoqbW0qhknp8amhx_ELg@mail.gmail.com>
Subject: Re: [PULL 0/3] Audio 20210316 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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

On Tue, 16 Mar 2021 at 10:50, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 2615a5e433aeb812c300d3a48e1a88e1303e2339:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-reque=
> st' into staging (2021-03-15 19:23:00 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/audio-20210316-pull-request
>
> for you to fetch changes up to 3ba6e3f6888d2825709eba2f623f0615069c036c:
>
>   coreaudio: Handle output device change (2021-03-16 07:17:50 +0100)
>
> ----------------------------------------------------------------
> coreaudio fixes and cleanups.
>
> ----------------------------------------------------------------
>
> Akihiko Odaki (3):
>   coreaudio: Drop support for macOS older than 10.6
>   coreaudio: Extract device operations
>   coreaudio: Handle output device change
>
>  audio/coreaudio.c | 428 +++++++++++++++++++++++++---------------------
>  1 file changed, 235 insertions(+), 193 deletions(-)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

