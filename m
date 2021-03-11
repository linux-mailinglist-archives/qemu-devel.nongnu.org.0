Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0A33379B6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:43:06 +0100 (CET)
Received: from localhost ([::1]:53288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKOOv-0000zN-98
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:43:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKO3Q-0000Bu-7t
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:20:52 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:39734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKO3N-0003pd-PS
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:20:51 -0500
Received: by mail-ed1-x52f.google.com with SMTP id bf3so3636272edb.6
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 08:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NdjeCu6JGHWCb4GXVKcbM9NWJWb6gGDlYNmxR/9jyJ4=;
 b=ojInKSD7hrLDDweOHeIRX/f6EVa83T8wiW2GivFu8pEvpCAhOnNEWlF5ng4BY7NRui
 hIA/zUwNIxf3nBK2rI3wJe5VMORniM2eYhvqKWY8IAuMonxmuWx9T5SwSBGYs+wqxcbx
 APK9iYBazB24XRWsrdybH1sabvUiNfHm3zqiw66WFsk/EEn66ruMDLj75Gp+j7J5NNMe
 LtN9xGj/i2JFbkyf9mrRXGyS3Bub1Xrbg1T/N9D2eZfU9VPdX+Ie0t2A6q6MHh9HwwCZ
 AKTSKU0jDqVBOaTwm8lxrAesNidM6yhojhyEQ+3/8alnieuAJjiVQTg9aS+2WoGC7bz0
 06jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NdjeCu6JGHWCb4GXVKcbM9NWJWb6gGDlYNmxR/9jyJ4=;
 b=r3AW9qWPCu7SljOjQ6RhCFe6WmcrCKlyQ+KlygK+TWZZerfbIpcJfYai7LGNwMdcOE
 PBiSqmGTPJ2Y5CBbVfiUTHu9ABiQBM9/2lymK16lpxKkwVwYxa4LyG8SoaZxwtiYL+Bw
 gtnDusvxC9zmfQ76SP/+w/eySNRJ0iFgrBZdPF60MLsl5LtKEbSskXzJ1X3FQGVvcHZH
 udvTMYT4NfZ4gFK19lZ5raemEC+GsA0DrLldiNxt9K0WJHnBhSii9kwcLmapzAzNrbLr
 Pz8NI5JeqH81ioqQXbIfMoKJHV094qIh8OFc4+jaL9Q/G2v4V72xyToZJFj9usei86dH
 VBKw==
X-Gm-Message-State: AOAM533QI2OXbd887cX8b2z83MF2og2macNBkb/4xJrU666qFFmhdQoB
 WYVmvylsUqs/TQS+moTEwFzEBB/D1IlWJGxqOPQq/g==
X-Google-Smtp-Source: ABdhPJxCZ2tok+ZJHvqooHDU8lTOP9p+3suGw3BbLidLIVXpvc4QmCufNdO34+5U2J5IIXGXbMue2wI/Pl2ddC4ScJw=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr9184003edt.251.1615479648042; 
 Thu, 11 Mar 2021 08:20:48 -0800 (PST)
MIME-Version: 1.0
References: <20210309155202.1312571-1-eblake@redhat.com>
In-Reply-To: <20210309155202.1312571-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 16:20:29 +0000
Message-ID: <CAFEAcA-Kbim-HkU+024orvkQXzg4+B8hGvL2jABG=JKoBmdyOw@mail.gmail.com>
Subject: Re: [PULL 00/17] NBD patches through 2021-03-09
To: Eric Blake <eblake@redhat.com>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021 at 16:23, Eric Blake <eblake@redhat.com> wrote:
>
> The following changes since commit 0436c55edf6b357ff56e2a5bf688df8636f83456:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-03-08 13:51:41 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-03-09
>
> for you to fetch changes up to 1184b411016bce7590723170aa6b5984518707ec:
>
>   block/qcow2: refactor qcow2_update_options_prepare error paths (2021-03-08 16:04:46 -0600)
>
> ----------------------------------------------------------------
> nbd patches for 2021-03-09
>
> - Add Vladimir as NBD co-maintainer
> - Fix reporting of holes in NBD_CMD_BLOCK_STATUS
> - Improve command-line parsing accuracy of large numbers (anything going
> through qemu_strtosz), including the deprecation of hex+suffix
> - Improve some error reporting in the block layer
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

