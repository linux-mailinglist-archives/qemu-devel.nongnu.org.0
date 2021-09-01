Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB633FE0E1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 19:04:55 +0200 (CEST)
Received: from localhost ([::1]:51998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTfS-0006DV-7x
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 13:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLTMr-00056L-9b
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:45:41 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLTMl-0007uO-33
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:45:40 -0400
Received: by mail-wr1-x436.google.com with SMTP id i6so569605wrv.2
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 09:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3fvtAxhEY5nL9DLpNoTk6vLTmi/KUTXUNNo8llOdbV0=;
 b=q1sIppuczAnPqsGefMRhIZv8qS/HZCygriGK3RUfkiCeIxWWRTBPW4JHzXfiDt6ukH
 5M820/RWq0tG21g6auLQe/5otAhFK0wjjJxoYN6lEQNSwOyefDSoWu84oApW+VsPzUOA
 C3NBiltrcQ/SwVcw/E6Bpod1K9zzD5avIHSdShOp610soN3wCgA6mdu/Hen/uosXjiHQ
 Z4uYn0LfpylvR+eCghqPHr0GydBA+PiZ7fEE2124swHt9XSRpGrxBvNsYj7x8nURvKg2
 tGkETTaROE+PfprMGyD+86V+Ua8pmrdUcQxQFXjFSGYZ3rd8U2CCIZa2dsLM9Hh61XVy
 CCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3fvtAxhEY5nL9DLpNoTk6vLTmi/KUTXUNNo8llOdbV0=;
 b=IuE5Dv9cT2xWjmrwn/pXodQa8UqfQsI3vximbmgWhNd1hmaQ7QUkRji3mW+Pl1CDb2
 3BFAQmeC3hAXxZ6o8JxhY5zYA3+92nAUix0x82sPZmiPP2wy8N/zdWVGB2T9FM9jmodg
 19drb6D3dEOUD0/aV0pMQ0/e/8jeFwQcRJ23THNDLK9kDJ+iCA2mryEBOEEICqLy54d5
 FZSWSeoHOn4v9Zqllk/61MvY+ObR0D5YFJ4dar2yVY0QWxJ739t3tUi/WaQl+tXNycpT
 U7S+WEySwqHM4lcttTmB3VNnfKCp46PuFMOyUqPlPzzR9dg7CwgzmtoMdxNIRx6FmGY1
 2Nzg==
X-Gm-Message-State: AOAM5315iScqVVhH5WE+8Pf2kGN6kyWhWsdpp2e4Z9Uax9iNeTbC2Ri4
 ljjJEkWndtow84aKeDATk/WpcHg8GLngziGV0J8gUQ==
X-Google-Smtp-Source: ABdhPJwXGpNdcVsSBvkg5MjILw4zJYLTcj6UW47J4Xb15UlRqj8MrQbsa2ZW/O1oNDhVHa0n3N0Sjz+zK+diZJmOl6M=
X-Received: by 2002:adf:ba0f:: with SMTP id o15mr368819wrg.386.1630514731252; 
 Wed, 01 Sep 2021 09:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210901065342.3316013-1-kraxel@redhat.com>
In-Reply-To: <20210901065342.3316013-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Sep 2021 17:44:43 +0100
Message-ID: <CAFEAcA-GVtPDHjfGBCBfzYLfT018=9p644pbOrvwKuA21pxwUQ@mail.gmail.com>
Subject: Re: [PULL 0/2] Usb 20210901 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Wed, 1 Sept 2021 at 08:01, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit ad22d0583300df420819e6c89b1c022b998fac8a:
>
>   Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.2-20210827' into staging (2021-08-27 11:34:12 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/usb-20210901-pull-request
>
> for you to fetch changes up to ae420c957aff2871b8a1af9cf9ee1a7a75b3552b:
>
>   hw/usb: Fix typo in comments and print (2021-09-01 06:37:13 +0200)
>
> ----------------------------------------------------------------
> usb: bugfixes.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

