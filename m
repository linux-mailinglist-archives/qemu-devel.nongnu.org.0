Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D6548F6DF
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 13:36:17 +0100 (CET)
Received: from localhost ([::1]:56852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8iI3-0008PG-KS
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 07:36:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8iGB-0007Bz-D9
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 07:34:19 -0500
Received: from [2a00:1450:4864:20::333] (port=56266
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8iG9-0001QR-RF
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 07:34:19 -0500
Received: by mail-wm1-x333.google.com with SMTP id c66so11043256wma.5
 for <qemu-devel@nongnu.org>; Sat, 15 Jan 2022 04:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jUb0X3oDcATZrcX0q8T+oJMuFjOo9RcU21a2aTX1XfQ=;
 b=k9dGUomyA/ybIoDQU06mTTjAGU30z5H0fe4dS8Kaf5XJwa5YKQq4SRVOpB5L5lY9WB
 qkJW/vsvkUIwAhO6aK3CHctI7hlfJQMUtSoAUA9hyMo6JcpLgP/mf9XYl4PQLN3/Bb5Z
 sTe1OVEWEJnX0MSJALHVfBhyQJ3im3G7/YUdBf5P2cq9ZnVz0YluJfvdOFSkbSEe1Sag
 mQlnwpfjt1BuPY4OIdu6LRi4JCwsH5jyrKBK6hEYiqlD63PdBdV81Frdwv2mNBdL8LC5
 rGjZUMuD5iYbfa0oynnssQvtB6KNCBh6x3caZ4yIEYxwbJCGfxE69yCQSHHLIOG5qh1X
 WBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jUb0X3oDcATZrcX0q8T+oJMuFjOo9RcU21a2aTX1XfQ=;
 b=EJLl84DFL3mCljwaKNt7em07CjGvKo8t2kk/d9IKY8UTETGyBHq9XGEgH8baFXly5r
 rkiFMZX4rtr+b+H/aqCKn1WL5cuYbLCWCrZF9vvRbNhFiQVLX6Yn/TzIYzGOJdHFRZ7l
 BwVQdOrUdqE9QwEVrDQF2ej1lL/0J/obMQl5UDx9sgLpoONwrtwWK0w98yepVm3rDm0e
 qWrpGs1LOkEVut5DPGSOCVidgEgCWqPjJ/X6vjX0ASTYHTByExmqhc1WPE+Ew/9NR/CP
 WvD/S6tMz2pkNGSrZf7VR93opToeXAsL1YSA9WVo0JoTf4uV19RS0xfL8jFiOgDp/7QC
 rscg==
X-Gm-Message-State: AOAM531kfKed+McMb3LtNJRF5OBht53gXq52N6lgfkWwIQs3u7cux9AY
 /SNoT9GKXebL5todE1/GFit6h60IhJxvJx80vjRVmw==
X-Google-Smtp-Source: ABdhPJxzERowbk5G9cPhcNEjkMJy7zPEg5Fj/Bb41XRJkDbJxJ7VHsxtUpwrw5wXVsKguqG6+gWCLaz1gWEKuY8Wq3c=
X-Received: by 2002:a5d:6848:: with SMTP id o8mr12585711wrw.2.1642250054451;
 Sat, 15 Jan 2022 04:34:14 -0800 (PST)
MIME-Version: 1.0
References: <20220114135226.185407-1-kwolf@redhat.com>
In-Reply-To: <20220114135226.185407-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 15 Jan 2022 12:34:03 +0000
Message-ID: <CAFEAcA-9HbTYeUKfJRiTPnWcbBaMckBzQGQLD3Wc7xbRk1Eutw@mail.gmail.com>
Subject: Re: [PULL 00/16] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 14 Jan 2022 at 13:52, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 67b6526cf042f22521feff5ea521a05d3dd2bf8f:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2022-01-13 13:59:56 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to e5e748739562268ef4063ee77bf53ad7040b25c7:
>
>   iotests/testrunner.py: refactor test_field_width (2022-01-14 12:03:16 +0100)
>
> ----------------------------------------------------------------
> Block layer patches
>
> - qemu-storage-daemon: Add vhost-user-blk help
> - block-backend: Fix use-after-free for BDS pointers after aio_poll()
> - qemu-img: Fix sparseness of output image with unaligned ranges
> - vvfat: Fix crashes in read-write mode
> - Fix device deletion events with -device JSON syntax
> - Code cleanups

I still get intermittent failures for iotests 040, 041 on NetBSD VM,
but those are a pre-existing thing:
https://lore.kernel.org/qemu-devel/CAFEAcA-UKdcTROB7e3jO1qe=WCbuHRuX5WN7HZF2CcdMsmAt=g@mail.gmail.com/


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

