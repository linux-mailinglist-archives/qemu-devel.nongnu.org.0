Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD6A49065A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 12:03:09 +0100 (CET)
Received: from localhost ([::1]:51096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Pn1-0000iL-2v
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 06:03:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9Phs-0005sS-Gc
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 05:57:49 -0500
Received: from [2a00:1450:4864:20::332] (port=40491
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9Phq-0001mu-Ot
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 05:57:48 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so23376860wmo.5
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 02:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pkgLX5B1gK+uk/Ts1/d57/d02AFPkf0CtdUZipykU5w=;
 b=dL2A3D0tP82HhZytrNxzH0cEABLc1ioVLC2VVioG8PfbgpB4DT9s6ztrmWR/O4kx4j
 oQO3P5idqfgRii21hdIGEAbZOOZDrsxkzi7C+nRpQ75U/NaKJkNPHWO9KaI5mPOXhV2A
 xXW+JH7YToaE//R5jH9DPrU11q1YZMcBeWFzjHQ5EdvJ3Y4pRGyBkPhuuZShK0dM/CTQ
 yT4IRm5GFjJbwDaKBp1BKPANEolhci2zCjtretTa9v6il1wtlgHd8kRzMfpD1iVLnh6a
 YLaRo3/FbjWoZKubOo2owb5n9pOSJjB/9mMa5tfRsDjr3/zhc8tdI9113JfijwjM6xph
 ENiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pkgLX5B1gK+uk/Ts1/d57/d02AFPkf0CtdUZipykU5w=;
 b=OxMByDREbkBIvS/nWqd/vYqQeaqf87m7bodyxRR3GA6yOXueGFm6hGrDyj7bbexIvA
 FA5oNT1ufuJMl5BhrmwnN3ej0QKqBdx4x2kQdHsKIOdQE32aYalNbpjKTMQsFNVUnlyL
 R5xMRiczsBfLOysWG00xbwwaJlKQU7+jBrhUjl004GZwd04KhbgWR3XSIvAzqxuoJdyQ
 dP/Rx+VPTMtvwmlXFsWiGGiJWYwj8bwBu1PNHYtKZIii5RRFMRCr2L+4WGBqBplYA67Q
 FUOT420hI/yt7TGpBnnD/Db1S5la9I7YB1B3k9Qooipoyg0NON0YgoAG4XAkgBhD4s3Q
 OECA==
X-Gm-Message-State: AOAM533JlIf5JJbDu9Ev0V0OYf2iIGS7wtNtazc9ovyWJSRYEDIYxaBQ
 CNqUJxaB3EUpsx8l1dACNA/jr8U8Xh1vBJ8AE77JVA==
X-Google-Smtp-Source: ABdhPJy3YDBusS2QHzXteLAsQFRbrnzy+2su+9izOWje0AABP6UXWyBL1Y1PIg5C1u5n984oG5t9qsnYDRVNh1Jyq2g=
X-Received: by 2002:a05:600c:4f51:: with SMTP id
 m17mr5062578wmq.32.1642417065254; 
 Mon, 17 Jan 2022 02:57:45 -0800 (PST)
MIME-Version: 1.0
References: <20220115173944.18400-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220115173944.18400-1-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Jan 2022 10:57:34 +0000
Message-ID: <CAFEAcA_LH883eiQ077LvAekGi6bsXTm4gY8AZ781DFGDsZpZ+Q@mail.gmail.com>
Subject: Re: [PULL 0/1] qemu-openbios queue 20220115
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 15 Jan 2022 at 17:39, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The following changes since commit 1cd2ad11d37c48f284f557954e1df675b126264c:
>
>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2022-01-14 15:56:30 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/mcayland/qemu.git tags/qemu-openbios-20220115
>
> for you to fetch changes up to 8d7ebae4803611ebd03096fc4804396add52ec62:
>
>   roms/openbios: update OpenBIOS images to 04dfc98 built from submodule (2022-01-15 17:34:36 +0000)
>
> ----------------------------------------------------------------
> qemu-openbios queue
> - gcc 10 build fix
> - change Qemu to QEMU
> - add extra PVRs for MPC7450 family


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

