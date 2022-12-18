Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71628650503
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 23:12:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p71tS-0007YF-GN; Sun, 18 Dec 2022 17:12:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p71tN-0007Wn-SX
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 17:12:21 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p71tL-0004ji-Hz
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 17:12:20 -0500
Received: by mail-ed1-x533.google.com with SMTP id m21so106141edc.3
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 14:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qI1SxwIqoCEETmQqOYYFc1gpFwI3z5UWmYTO9bbXDgo=;
 b=ynhIjBqGjBALgUmQ2M8ZyejE2V9FOL/faJSnJSIDxJVg5DRrpc1UpRkw0eXt6IYloz
 gHjZQZ/OViYh1H1bQLq9kyY+xQ9rgqJplD0i13UAaGbCcDOkvcRNHbCNa2kp/y50AzoJ
 ZmJa5xqE6lG7DPF30v9mJ4Lbo8Kl0GzpSPkcSdaU8EOexeFm6I8U4akI9Ewt5obdN8CO
 Y44IdnaPhTYILUXKY1dlTKy5vUNVBktFGM6K0Tke1uQ6X01mBvqoHEQyn94SNcZpMunF
 8DPi/+W4EUuu042o00CG5luqWPwyTDQEgzDX04onr2j10HgDSZF2tjfiR5JePlnISVn7
 Jywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qI1SxwIqoCEETmQqOYYFc1gpFwI3z5UWmYTO9bbXDgo=;
 b=kBBYGSO2EnCBbTder7nVFrjBo41tJ2gFTWV3JXHDL0WexKdwYrBE3rWeqe4pfn/vCi
 jMZKNCSiKxEPLx+iE6Rb1kDNfLRiqIbB5xyyFjNaOICe6/bgUwWxaZfAuKEjzSb/XX7+
 KyJPfPsqBemTmObSTvqSnjDEhWgD25KXkLynssCRIkA9KwB90Ea6td6grjlXeAEsYU9g
 6GnOxo3XwjF2Y13mhhvgW6FKWCsTNS8boVAoEHP7HA/9Rs7x2svO3Vw/FewEvZnDuKQN
 5Q7oPXpOzyLYRqv2YUPHmuVvcakkqQW7ovGpG169Agp8knGS1lrdlRSCyOYuRLlCElUF
 kvHw==
X-Gm-Message-State: ANoB5pnox+SzEhQqk+6XhCUoS6nZCJ5dd1i7cuxw0r7BIPS5vo/XXc29
 evBPLZ/yAxeMxbeA5p3BBiGd30PYJ2ucLm//Ico=
X-Google-Smtp-Source: AA0mqf7pT6Bv62K2hfnBuJKL8/m9/+YRMXS5HPDe4ZdAMb5PHh4L90mK+s/XFqkfEaTSr4bw6haBrA==
X-Received: by 2002:a50:ee8b:0:b0:46c:b25a:6d7f with SMTP id
 f11-20020a50ee8b000000b0046cb25a6d7fmr34762281edr.8.1671401536864; 
 Sun, 18 Dec 2022 14:12:16 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v10-20020aa7dbca000000b00461cdda400esm3629190edt.4.2022.12.18.14.12.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 14:12:16 -0800 (PST)
Message-ID: <fa5f8ec6-4b3b-06be-cb08-97f58267ff03@linaro.org>
Date: Sun, 18 Dec 2022 23:12:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2] contrib/vhost-user-blk: Replace lseek64 with lseek
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, qemu-devel@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
References: <20221218220740.315839-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221218220740.315839-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 18/12/22 23:07, Khem Raj wrote:
> 64bit off_t is already in use since build uses _FILE_OFFSET_BITS=64
> already. Using lseek/off_t also makes it work with latest musl without
> using _LARGEFILE64_SOURCE macro. This macro is implied with _GNU_SOURCE
> when using glibc but not with musl.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> CC: Raphael Norwitz <raphael.norwitz@nutanix.com>
> ---
> v2: Fix typo must->musl
> 
>   contrib/vhost-user-blk/vhost-user-blk.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
> index aa99877fcd..7941694e53 100644
> --- a/contrib/vhost-user-blk/vhost-user-blk.c
> +++ b/contrib/vhost-user-blk/vhost-user-blk.c
> @@ -532,9 +532,9 @@ vub_get_blocksize(int fd)
>   static void
>   vub_initialize_config(int fd, struct virtio_blk_config *config)
>   {
> -    off64_t capacity;
> +    off_t capacity;
>   
> -    capacity = lseek64(fd, 0, SEEK_END);
> +    capacity = lseek(fd, 0, SEEK_END);
>       config->capacity = capacity >> 9;
>       config->blk_size = vub_get_blocksize(fd);
>       config->size_max = 65536;

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


