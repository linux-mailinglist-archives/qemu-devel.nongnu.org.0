Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6194545BA
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 12:36:16 +0100 (CET)
Received: from localhost ([::1]:59282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnJEd-0004Ar-7P
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 06:36:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnJDB-00034r-S1
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 06:34:45 -0500
Received: from [2a00:1450:4864:20::332] (port=44776
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnJD9-00034o-Kp
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 06:34:45 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso1836745wme.3
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 03:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D2rP5J7NaHz0GhmmZ5ny6VQPps1xJU2EMhBwC6XPpAc=;
 b=Cw94c2vm5V+zb0Ch96YGAXcnzdE+lO1kVpRAVqZLmKwVF3CKciVRrx1/S+NJdsCMHo
 C1gGfTaou6Logsb10c1UXpGMhd372Ag4uLGjz4HIlFq24ldjIQjx0S0G2IKhrK9AWqvr
 ZssmN5N6Nb39w0f1HsJjYiX/xBtJJJczfKZRZhejmSyr+xEK0EWPsTIVoKP8vL2Fk/Ca
 oS1Ufpi2TSDEHEGOJ5gKQRKqH7lwiRLCpbUexgwE4xHxebO7Xr/22EVtklH2hpCZEsGl
 S81wqm6OTjonUQbL6Tpskob3SIIzS+x8ohJO56hXkVrqUKN1ban4AIb3ElWRhppsPX5t
 4oFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D2rP5J7NaHz0GhmmZ5ny6VQPps1xJU2EMhBwC6XPpAc=;
 b=69srkFwP67LMJnyYYu/g2Xciv1yOJIAFN+1OZ6xi6jOjRTUNxugxJ5202rfyng+kQd
 9qu2vU5UK54xhV/PTnxCtbwvd3A/zTGWyHSDAAQdes/YkjEsAWWWGqpaOu2YFxjUJPqX
 gDO9GDlcNM8BlFDquwiNCNmqMGRVlpUJ0mCo0cFKq0IKhQsH+C2d+foQqDyZok4MIe+9
 8rkY0CYlV0EDnpvbJ1huzgNU5tS5VAFYF55j9E/qJmkH/Sjv7PVFpaqjMa/qYgqS/Jl3
 qV2syFmMCBOvfyaJ0ofTems6c3Ix6XFwiCYvgCeorCy6IMhacJOmexOf1bQUYcBDJoeG
 0Mjg==
X-Gm-Message-State: AOAM533kgj2Eq5uORSL9s0GumNfPXT9Bumld5OtajKPnCmlFZOEaDhS3
 sHr5yamdB1sRL+rqZVDYAcpbaA==
X-Google-Smtp-Source: ABdhPJzwKON/KGCk3Xv2BJq7BMAc89oLUh4poaQqtFFDETMx5/3LwgVvtMeNxU21ZAj7+NjLWN8wNA==
X-Received: by 2002:a05:600c:1549:: with SMTP id
 f9mr16974614wmg.118.1637148881974; 
 Wed, 17 Nov 2021 03:34:41 -0800 (PST)
Received: from [192.168.8.105] (101.red-176-80-44.dynamicip.rima-tde.net.
 [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id c6sm6814003wmq.46.2021.11.17.03.34.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 03:34:41 -0800 (PST)
Subject: Re: [PULL 0/2] riscv-to-apply queue
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org
References: <20211117092031.99019-1-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8e1fad3d-2a31-4326-e4a0-5052befd3d03@linaro.org>
Date: Wed, 17 Nov 2021 12:34:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211117092031.99019-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.009,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/21 10:20 AM, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> The following changes since commit 8d5fcb1990bc64b62c0bc12121fe510940be5664:
> 
>    Merge tag 'python-pull-request' of https://gitlab.com/jsnow/qemu into staging (2021-11-17 07:41:08 +0100)
> 
> are available in the Git repository at:
> 
>    git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20211117-1
> 
> for you to fetch changes up to c94c239496256f1f1cb589825d052c2f3e26ebf6:
> 
>    meson.build: Merge riscv32 and riscv64 cpu family (2021-11-17 19:18:22 +1000)
> 
> ----------------------------------------------------------------
> Sixth RISC-V PR for QEMU 6.2
> 
>   - Fix build for riscv hosts
>   - Soft code alphabetically
> 
> ----------------------------------------------------------------
> Bin Meng (1):
>        target/riscv: machine: Sort the .subsections
> 
> Richard Henderson (1):
>        meson.build: Merge riscv32 and riscv64 cpu family
> 
>   meson.build            |  6 ++++
>   target/riscv/machine.c | 92 +++++++++++++++++++++++++-------------------------
>   2 files changed, 52 insertions(+), 46 deletions(-)
> 

Applied, thanks.


r~

