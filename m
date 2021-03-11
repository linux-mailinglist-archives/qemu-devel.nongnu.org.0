Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5870D336F4B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 10:53:52 +0100 (CET)
Received: from localhost ([::1]:59588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKI0t-0007WT-Dd
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 04:53:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKHz7-0005x0-Q6
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 04:52:01 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:44848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKHz1-0003u0-Oh
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 04:52:01 -0500
Received: by mail-ed1-x52d.google.com with SMTP id j3so1801908edp.11
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 01:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wJ3WyaEJpEE2ahj8fy06mQl0tlHWoOJxzj9Ke3gF9Jw=;
 b=y0KZfUJhvaMz7eggQof85GFcbovheAvKAUlojN87C+gn3yu150ZFMGB0TcLHHwxA8v
 XAPttBTA72Msk8V2mEExlJkSQryxEiIYJTT/DPpuQ6/8kLf2ZeFqqGz/8pwVilnndQOf
 ZFtu00qR5WWYe6KwmgMorK+XFxQiuilqaX3dzRs08tkA/UCAAvNX8JjLuq9EYRi1Rweh
 D6fHxBdyg1hWzFu5INq1pnTZ/d8SMz2JQxBc1H+iSsVCOSUQOLDuwPe0G1008rC/8HVR
 zvj8UzQjPJ69FLKiKt8XI7A/BvM83huIlhELFOdzjZ6hjsSR6jlBieB5KNnIEQWL49fO
 vyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wJ3WyaEJpEE2ahj8fy06mQl0tlHWoOJxzj9Ke3gF9Jw=;
 b=Fz2hzZQFkMT0OsIUvBx00L+THn/yeouMUEyDHcQ1u60ZgBOf5/HTqOEtqsmBgZkBsp
 QSNViSMZ36FNuUEWWlwLnVmyUyF1nIZaIRyW16CFkOLAUT3R99Vjo5/y/jqZZFAdw9Uu
 WX5SiqG6iDCXzLP6UM8DLi7LK727dmdQHn+jmSHo4RZObMoXmzpLIHaPVd/sJq6pddjO
 NV41w4ghX+BIk7vfxFreM7/69zIZr1mQvrmiPv5XRCiFVvnEnrYaJBvxCdvgetqkOBn5
 PhdbQVNMJlu8+j6wCVlb3WSJuzPT+CNZoqBvGEXQNk3FvpbHLWsQiY5my2oWBLYEkMdj
 Tysg==
X-Gm-Message-State: AOAM530ueB+6F/pS3IxOc0cD218f6BIfIlKiK1xApvVq22sryhJZDCPI
 ZH2S9NUHZaauh6UgFCnBRmCvxyQUq/kfdIted4jr9w==
X-Google-Smtp-Source: ABdhPJxqFTLQxJ3k5q68f4Gh3WME7ecA1yVDGbT6tvKLMtLhj9Y/q8/Y68N3g0BjP/ZxBDccRm3PeSa7Eh90InClZCc=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr7545042edu.100.1615456313119; 
 Thu, 11 Mar 2021 01:51:53 -0800 (PST)
MIME-Version: 1.0
References: <20210309114512.536489-1-its@irrelevant.dk>
In-Reply-To: <20210309114512.536489-1-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 09:51:34 +0000
Message-ID: <CAFEAcA8sFHNQWEDVKapG-eTJ6g6wHKEB_tbR3dnM5vikrVfkuw@mail.gmail.com>
Subject: Re: [PULL v2 00/38] emulated nvme device updates
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Klaus Jensen <k.jensen@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021 at 11:45, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> The following changes since commit 229a834518b950d56fd1bc94923276504d0ee9d4:
>
>   Merge remote-tracking branch 'remotes/philmd-gitlab/tags/renesas-20210306' into staging (2021-03-08 15:45:48 +0000)
>
> are available in the Git repository at:
>
>   git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request
>
> for you to fetch changes up to 23fb7dfeca17c55e4329ca98459d33fc204c1f59:
>
>   hw/block/nvme: support Identify NS Attached Controller List (2021-03-09 11:00:58 +0100)
>
> ----------------------------------------------------------------
> hw/block/nvme updates
>
> * NVMe subsystem support (`-device nvme-subsys`) (Minwoo Im)
> * Namespace (De|At)tachment support (Minwoo Im)
> * Simple Copy command support (Klaus Jensen)
> * Flush broadcast support (Gollu Appalanaidu)
> * QEMUIOVector/QEMUSGList duality refactoring (Klaus Jensen)
>
> plus various fixes from Minwoo, Gollu, Dmitry and me.
>
> v2:
>   - add `nqn` nvme-subsys device parameter instead of using `id`.
>     (Paolo)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

