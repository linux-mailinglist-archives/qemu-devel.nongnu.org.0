Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44849379737
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 20:55:38 +0200 (CEST)
Received: from localhost ([::1]:41166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgB44-0003qh-TV
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 14:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgB2k-000382-O6
 for qemu-devel@nongnu.org; Mon, 10 May 2021 14:54:14 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:39520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgB2h-0004wy-Bz
 for qemu-devel@nongnu.org; Mon, 10 May 2021 14:54:14 -0400
Received: by mail-ej1-x633.google.com with SMTP id f24so26084775ejc.6
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 11:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=l7nNToHYlzpbCmgpu82PWwfHJ8//OBcbPa/u+fxPSvQ=;
 b=QrcT+rDUtZ/lqX9hzeFvXBnO2E85YX/MtF4u1AhNhyXLdqLPatfFgd6hRnICRClobf
 uOF01mSFXvi3jTuViSiCcFXrGNSXPKUxJ4iUFoCbdih5yvJcRSlOdR5OkyWRkQ/jrgwx
 YfW9tQ75jf/2nx3E2S8AtW2mp+fveIaoqIDLmoszL+rR59/sejY6VWESfm/j+BLa+CxR
 MBBqXwCdyWtsTQk/oIobpv9+geCI0vjudakD3HazyD68YQy7woXCULBMybxWrcauQ6LA
 qVniyNTKTKrQmesyyg+7KIOJTN12WXi+kpDnaKJMClBMXcsn0CVykZSV9o5icX1sGZTs
 R8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=l7nNToHYlzpbCmgpu82PWwfHJ8//OBcbPa/u+fxPSvQ=;
 b=Lzws6POxoUDgGSfXkQ7DPjQT23iCBFeeZFWhqRhT5HE1uOCV5uMbiRDBeo92SxR7gF
 OLa3WtqgDJFblPpBTSpoSG4PYDAI+IuomNPhM+Ybns+zic81V2yRc8fWYKT4fFnvyPfb
 6LJP97jjffQXwzCK9CwVQJf2TqZTHy9IvL5T8ccZhi/qydXWjA6u8/EQKjUaqZRl8kNi
 1dtTEvwgxaYuyUFZDHDWlMAuQzASjBMrphSnyJwl1dwyRUqo05cEsutLbFqcQ+GkgA/q
 kzbc9Kc9z9az4KW6spw+6ILAb+PifJcTRoOLgnBw2y6KG93QkmFyiicRFAWOhdkv6Nvs
 cNtg==
X-Gm-Message-State: AOAM532/fSaKHLcagCz1rgEu5YPfwAV10UljJW9FA/OPvWIuywgoyFrg
 KMjRNCUiqWt1YEbxvReoS3tmJNwUmVv2l/9leISQVBvy2OA=
X-Google-Smtp-Source: ABdhPJwvU+JXEWkfo83lrOW1Og4nWOWWKj1spifuCO7++89nfTPy3cQeggkdchI5sOWB0n2Gp28KXDzt4vVzGCRHYQE=
X-Received: by 2002:a17:906:364d:: with SMTP id
 r13mr28058860ejb.250.1620672849251; 
 Mon, 10 May 2021 11:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210510162733.2366-1-peter.maydell@linaro.org>
In-Reply-To: <20210510162733.2366-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 May 2021 19:52:57 +0100
Message-ID: <CAFEAcA9yyMjicvbMbH5apkcdkv8RjTOYiWUXW-GE=amdi73VCg@mail.gmail.com>
Subject: Re: [PULL v2 00/26] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 May 2021 at 17:27, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> v2: fix compile issue when building user-mode emulators with clang
>
> -- PMM
>
> The following changes since commit 4cc10cae64c51e17844dc4358481c393d7bf1ed4:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-05-06 18:56:17 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210510-1
>
> for you to fetch changes up to c3080fbdaa381012666428fef2e5f7ce422ecfee:
>
>   hw/arm/xlnx: Fix PHY address for xilinx-zynq-a9 (2021-05-10 17:21:54 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * docs: fix link in sbsa description
>  * linux-user/aarch64: Enable hwcap for RND, BTI, and MTE
>  * target/arm: Fix tlbbits calculation in tlbi_aa64_vae2is_write()
>  * target/arm: Split neon and vfp translation to their own
>    compilation units
>  * target/arm: Make WFI a NOP for userspace emulators
>  * hw/sd/omap_mmc: Use device_cold_reset() instead of
>    device_legacy_reset()
>  * include: More fixes for 'extern "C"' block use
>  * hw/arm/imx25_pdk: Fix error message for invalid RAM size
>  * hw/arm/mps2-tz: Implement AN524 memory remapping via machine property
>  * hw/arm/xlnx: Fix PHY address for xilinx-zynq-a9


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

