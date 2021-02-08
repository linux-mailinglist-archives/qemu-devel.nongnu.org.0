Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A8131433E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:53:21 +0100 (CET)
Received: from localhost ([::1]:49670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FPE-000398-3p
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:53:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Cjx-0008D0-BI
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:02:35 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:39963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Cjt-0004my-V1
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:02:33 -0500
Received: by mail-ej1-x62a.google.com with SMTP id i8so27184460ejc.7
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 12:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dezqfKpJGZXxheIZiJmMGeG3q2AI51nfkr4jhj6cBXc=;
 b=TvI8kMGYg6hNsd548O0Ez4tgttYoinGow8rfQdn8Ld6372H6A7pkOQKUMmVGSBBUXa
 E1fFt/o0YQFcLeMCYqEKRlOOLvq3Im+I/yGdxq0aSlFSDr4ED3R53Rl/+3FpnugOivUp
 2+XzRUYVIc3eIjHHcJFAKVRshgi7aF9lll87aWERGBDsME9GSqznQKBjg63phbuL0ChZ
 n1kr5zq9uDzTEUPGgkXPvWLNrTa+oYAERilieFpsuO+ga/8jDqJjTP1AhDcSlzlD+RBJ
 xvOXcFtwRyKRinXzuikL0yGoAFB9Z7J4DGgITNqD6X6HWrHmrXNjpz2smQGKI/nbOwgS
 lJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dezqfKpJGZXxheIZiJmMGeG3q2AI51nfkr4jhj6cBXc=;
 b=uhRkjta8uR7wAeKZNrPCPV/rV9KKvqb/ExRHZYJUmNscjML10d0gKpBHdBx8f6rOxr
 UJMghMWmkUV+ZaXx5JMIMTrCgFMNmq9gAWQV+sbN27BO8zDeyXh4LMONTVlEb5cT1J6l
 GOtzb/KwncNynAqA0JYBket+uo2oRrD6G8MlBk4AT4VLR1zL0qYb8otHqEzdnIc7oFC8
 m+SXDUC4IXP7Fcq4k5/PLsP27OPJ87B+zd+ChbCga645hwymW5rD+f9erVSKycnh/iHQ
 xtVR7JhuTgB0aNY9DIbwRBiVGnqMEtwcHkqGtF5Z3VZFM2P+rstY1k1imzjyNrizhbmL
 PpVw==
X-Gm-Message-State: AOAM533CeviPfnpXVB/c54yu3k3r+3ac9KqlU9Ot6HTc+UW8E293WMSN
 OGYFSOdPLZxG1Mk9bTh4LouDIuhGri1tRxNGBXD1lw==
X-Google-Smtp-Source: ABdhPJyBr1q7DWiYISspQaHb5ybdDIVkTBBUoqDo0RP5CR6ySajtaG/gcBSuJqPweDCPVnXxjz42i7beIJO7ztUNSrI=
X-Received: by 2002:a17:906:3a89:: with SMTP id
 y9mr18556975ejd.4.1612814547233; 
 Mon, 08 Feb 2021 12:02:27 -0800 (PST)
MIME-Version: 1.0
References: <20210208112918.185058-1-dgilbert@redhat.com>
In-Reply-To: <20210208112918.185058-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 20:02:16 +0000
Message-ID: <CAFEAcA-ZxYAFWJV4XY33Fh7r2fQbWM_Zb8bm_W_R4WoeDZebfw@mail.gmail.com>
Subject: Re: [PULL 00/27] migration queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
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
Cc: gaojinhao@huawei.com, "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, s.reiter@proxmox.com,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 andrey.gruzdev@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Feb 2021 at 17:46, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit 2766043345748626490e04d69b7a9493c0294cfc:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-20210207' into staging (2021-02-08 09:23:53 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/dagrh/qemu.git tags/pull-migration-20210208a
>
> for you to fetch changes up to e846b746502e94ce5cb148201ebdaa9c0f658741:
>
>   migration: only check page size match if RAM postcopy is enabled (2021-02-08 11:19:52 +0000)
>
> ----------------------------------------------------------------
> Migration pull 2021-02-08
>
> v2
>   Dropped vmstate: Fix memory leak in vmstate_handle_alloc
>     Broke on Power
>   Added migration: only check page size match if RAM postcopy is enabled
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

