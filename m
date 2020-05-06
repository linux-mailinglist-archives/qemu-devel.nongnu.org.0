Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DC61C7B03
	for <lists+qemu-devel@lfdr.de>; Wed,  6 May 2020 22:14:46 +0200 (CEST)
Received: from localhost ([::1]:45914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWQRJ-00068V-B1
	for lists+qemu-devel@lfdr.de; Wed, 06 May 2020 16:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jWQPh-00057Y-Kg
 for qemu-devel@nongnu.org; Wed, 06 May 2020 16:13:05 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:43332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jWQPf-0002xL-Ta
 for qemu-devel@nongnu.org; Wed, 06 May 2020 16:13:05 -0400
Received: by mail-ot1-x32e.google.com with SMTP id g14so2453394otg.10
 for <qemu-devel@nongnu.org>; Wed, 06 May 2020 13:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xFD9SVKQKUPVHIweiTFydzU1Q4OsrMMuQhJttvDDS1Y=;
 b=Ckwd6MKQMr6ga0goaaWC+hKojERhY1sxeNLMa31snUPuMM/ZIr0FYCdAE3ozEMzz+Q
 hIum/nXtgBz+fWBaxdAfPu1XhGjNZtrCZip7SWFStU3TPLF938SzMBuoQ9q64IwioSxq
 GhcYJRyQBIVyZkiWxe3qkeUzwXxy3YFH6s0fauO8hE669+DISOZTFtfGL+DQF7P0pSt8
 iaYfOgVQPt8VPtzzobpoHKug3F4UodaALqRTUJTuNPBPxoj3g8oiHrw5cuLfJ4ZayEcw
 4uXnBptQp2jYqb1le5lEu16rk+rNsBLxp2X67WhG+60MtZCqfbPqN3Km5cOdoJfZIeTt
 E6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xFD9SVKQKUPVHIweiTFydzU1Q4OsrMMuQhJttvDDS1Y=;
 b=eJ70RLPgB4jksB3S9qA6EZJh3c1AxKAbgOhAhGxM7xeVqJYh7FBvtAq2/CiCCkMt0n
 IvD2veZrdWUdIjKQF+1pSP91lqQajHDlCpWpGfdsPocJtQSqbfqmvKgNp+j757mkyQiK
 yKaSfZmiiCKN1oVHz7g8qH0rL37Zk/OoRZOAJekNfDI9IgTFQScUCGSVGs8r+COV8etm
 UsKG9qfuvnapqxTUDTbQOkvEwbt0IdQqXMh2o9d1LswTODpeO+QKeGC93U8TxBtivbWZ
 FL2Gd8hiMBO2Bkzj2wdLASR7MGQY0G8qEgaQ7j4I3J4FJOM5HCvq79BqPwLkUxSvuY+a
 f6Ng==
X-Gm-Message-State: AGi0PuYU+NVKY5HYogi8DKIWmCJja5qo1KuFEQ878G4zOVbt4e9bece/
 Jh5Pn5VFnrTtMm0IgQ/5Wp9JfXRVboDui+z2gtG8q6uI
X-Google-Smtp-Source: APiQypKFhFXoQPfI3nm+XleyL5PY86xx9ijCBVhfelO12JgAxxNXiQKXZ9U7CoF6WD6rHFlF/wQWrn+t9B8vTq+n7ZI=
X-Received: by 2002:a05:6830:22dc:: with SMTP id
 q28mr7278793otc.221.1588795980512; 
 Wed, 06 May 2020 13:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200505230941.3984108-1-alistair.francis@wdc.com>
In-Reply-To: <20200505230941.3984108-1-alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 May 2020 21:12:49 +0100
Message-ID: <CAFEAcA-uOMX5p3o0OeZ4YcSNsFDuWDux3efPhvEpx9Rxx2+dHQ@mail.gmail.com>
Subject: Re: [PULL 0/1] Register API Queue
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x32e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

On Wed, 6 May 2020 at 00:18, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> The following changes since commit f19d118bed77bb95681b07f4e76dbb700c16918d:
>
>   Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2020-05-04' into staging (2020-05-05 15:47:44 +0100)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-reg-to-apply-20200505
>
> for you to fetch changes up to f08085f49fb66a5cdc86653bd896d0e728bcee50:
>
>   hw/core/register: Add register_init_block8 helper. (2020-05-05 13:37:51 -0700)
>
> ----------------------------------------------------------------
> Pull request for RegisterAPI
>
> This is a single patch to add support to the RegisterAPI for different
> data sizes.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

