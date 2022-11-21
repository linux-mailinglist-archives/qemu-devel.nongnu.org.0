Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E8863200A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 12:14:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox4jd-00087s-Eu; Mon, 21 Nov 2022 06:13:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox4jX-00086c-4O
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 06:13:03 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox4jV-0000zF-9e
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 06:13:02 -0500
Received: by mail-wr1-x436.google.com with SMTP id l14so434055wrw.13
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 03:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GEAt+qB73Jkg1WP8V9xEykeRMPKiveWLpihp2K199qY=;
 b=NxSAX1bVPbEZQLmNyMi7+pkHgK6ejKY1Rf1xt+3xuqCaXN9B1qTYzyH16apLGeEgXo
 v+tSTDymROyyusPqcKUvULFG9TKdiad6xZR5r1+cmOlp7tBuai906bcDqPzGt8pNl8wo
 ZUIvKF06QU6Ze4HHfTim6MAgT2k3kWOhFyXBQTd/P6srLtSJacyoBAHoOBuBwdL0Aeg5
 bx+wEEJZX4ZqeO+UaSmQV44EQFbZaM+dwO2+KRHCTWUS7lk43gUuvq8XONjAyPi4nxk/
 Q8Jx4WHnJpC7i1iPwzstm5O7cJ6p04zDlBops8uMxxFOi8FZBZH9gAZFNCWC3sC0kerA
 WSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GEAt+qB73Jkg1WP8V9xEykeRMPKiveWLpihp2K199qY=;
 b=EKvlVQD+ZyCCcEOsWxBuVs2TknVmbNcB2wsNYS8g7g0zqeFoFMO1xag7QB01Mon/zy
 6G4XN6Dk441aCl7TNKvybwycyHgHHnmP70mBw70XsyHlxLmSxkUGCoYFw5XSHLN7TaN0
 JK2gwC2Q/T8jnAqy8s4la9sSwTA3SEkCeU6wsQFtlsp4Dl1gCbumi+ou1fre+YVsE+JN
 vbxgOmGDc/as/p+hz4OATX62h5SnjB3+24yJEY2K2Yx8co+j1rL6arNzKBZv4DZV4ic4
 DJ9n7DftkM7z4B+i3pQJkiNkQ+dW5E7alotjJecG+o9FugMSjXNzJgiyuYIOzfA4BBJM
 9yGg==
X-Gm-Message-State: ANoB5pktRmr0tW2lzVVuhnrPj6T+iHJwI858x1aYUJxVBYSuOiZnOwcB
 u58EFiqDMj3mV70Wg8PYF5pIAA==
X-Google-Smtp-Source: AA0mqf5YMml89bgCFLkNlpTea8XBC7bRJWVDGeZ4ZtJ/I5D8TygifAB4YfEHdGm8FaAAZZS4/QX9gA==
X-Received: by 2002:adf:f70b:0:b0:241:792e:237a with SMTP id
 r11-20020adff70b000000b00241792e237amr2869278wrp.511.1669029179327; 
 Mon, 21 Nov 2022 03:12:59 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c458d00b003c7087f6c9asm18988194wmo.32.2022.11.21.03.12.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 03:12:58 -0800 (PST)
Message-ID: <21cfb02a-dec8-3a78-8a7c-e99ac06a090e@linaro.org>
Date: Mon, 21 Nov 2022 12:12:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH] tests/avocado: Update the URLs of the advent calendar
 images
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20221121102436.78635-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221121102436.78635-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/11/22 11:24, Thomas Huth wrote:
> The qemu-advent-calendar.org server will be decommissioned soon.
> I've mirrored the images that we use for the QEMU CI to gitlab,
> so update their URLs to point to the new location.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/avocado/boot_linux_console.py     |  4 +--
>   tests/avocado/machine_arm_canona1100.py |  4 +--
>   tests/avocado/machine_microblaze.py     |  4 +--
>   tests/avocado/machine_sparc64_sun4u.py  |  4 +--
>   tests/avocado/ppc_mpc8544ds.py          |  6 ++--
>   tests/avocado/ppc_virtex_ml507.py       |  6 ++--
>   tests/avocado/replay_kernel.py          | 40 ++++++++++++-------------
>   7 files changed, 34 insertions(+), 34 deletions(-)
> 
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
> index 4c9d551f47..f3e6f44ae9 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -1029,8 +1029,8 @@ def test_m68k_q800(self):
>           self.wait_for_console_pattern(console_pattern)
>   
>       def do_test_advcal_2018(self, day, tar_hash, kernel_name, console=0):
> -        tar_url = ('https://www.qemu-advent-calendar.org'
> -                   '/2018/download/day' + day + '.tar.xz')
> +        tar_url = ('https://qemu-advcal.gitlab.io'
> +                   '/qac-best-of-multiarch/download/day' + day + '.tar.xz')

You could insert the year in the url, so you can eventually add other 
editions :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

