Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC484A6DD4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 10:32:36 +0100 (CET)
Received: from localhost ([::1]:57566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFC0A-0006on-Fw
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 04:32:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFBaX-0008Km-Io
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 04:06:11 -0500
Received: from [2a00:1450:4864:20::42d] (port=44031
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFBaQ-0007HV-05
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 04:06:02 -0500
Received: by mail-wr1-x42d.google.com with SMTP id v13so36909659wrv.10
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 01:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TIu7QoXTfZeLbiW0V3J+2dtYSsI/Og6FqOnooi4ZIjs=;
 b=PH3TFOqB6VFyKSNW62GIYWkihLaOLjyaiFgNFxMWjP8FhUB7G70rYkeUA2MI/A5pyD
 WyZO+0xlkxVCgew1/r5/BS6vdqybPZhS+Nt5uy/ASZwt+rHjCge7Tt7+fI34I4lMnFFa
 1cdvES0XtmqxPHdLsPPDwFln+7QYytt1buQQrGkfgOWaMFGIorcbQ6Y0kaq8TtI7ls3e
 VsG1+oi55XKEABob4trfLYh7mYU8BMyxEHiyvEUEKlSz4/eI7UISKNuyZvQdq7KuXjS1
 uqyIFHMTsYTORB+7AE4DDviarsw2x3s1Aw+pvEvqLWenQIKx9uKNec2L9HwKzwX/mrVL
 kJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TIu7QoXTfZeLbiW0V3J+2dtYSsI/Og6FqOnooi4ZIjs=;
 b=zHJB9OcBfrwu/vSmmt6RO5ozjs+XWnKcO39F2UTStauYZF42A1G+pG8zwJHiXiN/px
 jlLLYzuN4M/Jq3zMHNezkq3oMOOoZXxowcWTARnhxSsZB5sZC8nphHDj2pn5+iftOUPb
 lWgaHMAPJ2Pr92jIPcVuW4rUtvxdtrlhz+TnS5BKPuiEw+XPoAu6z3arrOh2ghuMWedK
 Q4dQY2rkmmdFfryDB9qtekWJLjrk3R6/mfepC8y4D27jVCQMHEfZJNKByZ3aQYyMO/T6
 f+5FM+qxIXgqb7ZI776UCZ5EbYH6J0lK5reDfDC9VIDDKf3m/GXSI0yI5VZZmfSIt6dE
 N/hg==
X-Gm-Message-State: AOAM530y2XV63JEKwVJ+Wdtb4s+CysccLsP12IFKWNoPhGEa3AvcJtha
 Vn17Lh7Vqbkc4bueUZMjrBPC3/hdaG36RpTWOIsEaQ==
X-Google-Smtp-Source: ABdhPJxHo1ruAPcAviN/79555qK9XKZ8m1683dxPD7VgqIOlD69EfDspCkuD32pPngvYhgbfTTgbgbzPvvKyFQwCC2s=
X-Received: by 2002:a5d:5343:: with SMTP id t3mr25218729wrv.521.1643792754134; 
 Wed, 02 Feb 2022 01:05:54 -0800 (PST)
MIME-Version: 1.0
References: <20220201152108.171898-1-kwolf@redhat.com>
In-Reply-To: <20220201152108.171898-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Feb 2022 09:05:43 +0000
Message-ID: <CAFEAcA-bDzVp1tYxqOFeu1_3_rYYjXvLSQPMOLreqXpuitL5YA@mail.gmail.com>
Subject: Re: [PULL 00/10] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Feb 2022 at 15:21, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 804b30d25f8d70dc2dea951883ea92235274a50c:
>
>   Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220130' into staging (2022-01-31 11:10:08 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/kmwolf/qemu.git tags/for-upstream
>
> for you to fetch changes up to fc176116cdea816ceb8dd969080b2b95f58edbc0:
>
>   block/rbd: workaround for ceph issue #53784 (2022-02-01 15:16:32 +0100)
>
> ----------------------------------------------------------------
> Block layer patches
>
> - rbd: fix handling of holes in .bdrv_co_block_status
> - Fix potential crash in bdrv_set_backing_hd()
> - vhost-user-blk export: Fix shutdown with requests in flight
> - FUSE export: Fix build failure on FreeBSD
> - Documentation improvements
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

