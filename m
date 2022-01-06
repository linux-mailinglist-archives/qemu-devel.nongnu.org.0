Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A488486229
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 10:35:00 +0100 (CET)
Received: from localhost ([::1]:50478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5PAg-0008Ko-RC
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 04:34:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5P9l-0007eW-GI
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:34:01 -0500
Received: from [2a00:1450:4864:20::42f] (port=39680
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5P9k-0000c3-1C
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:34:01 -0500
Received: by mail-wr1-x42f.google.com with SMTP id s1so3563380wra.6
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 01:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pf6TGeZVOSK1xs0c9vwKLgDlPlviNAtaURd7LV0SYrY=;
 b=V3svsko4SAeOuFo5qaTCGYHudFbqyhGjy3DjvJ6kUXM5i0gLsUaud1B5nkKx2xPKKb
 FK62p+2Ei8plln2cPvt/DHMH8/Ss3llpznnQmDQ/3+Zfp7lGngptCJ2njR0mpNmSGYNx
 usKZ2bww1mi/mUAGows9G2Z/jE3vdNU/Rf8+GjlUthiBJ4Z8zFSEQGhV0qvZqyOnvaHM
 6/HMBseKK2dksIlVJbRHWDzVw3qvWaHscqYPde7hUp8EwYzzt09roNBnGuaBNkItZ9XY
 Y2/Xjprts+WYEtwWyykZq4pmJQAaSwRMrykY2RiU2mWLBluKFbvtTwxLmKyc0GdedCcA
 pVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pf6TGeZVOSK1xs0c9vwKLgDlPlviNAtaURd7LV0SYrY=;
 b=uUGKC9zxVBX4K/NBm78igEfgESaFPu3JpKVmHEAOLptvA1/b0mzzgHoW6DNE1uTgGV
 LjgkBSRwahEZ/Bkpp98A8qplscE1qQ1sT9kSljd3jc9BW7+rmHj1IW6M/1M/kIjnENHk
 ElpD+bV0gacO9pFAL7wdVLm1RvZAfKJErdxWikRy6QjQmYLAP7j/bBSoh2xyFbW+Gbi5
 I+q+lO11lwJRvsBDMTl+s9V0Fd/gioZwgwRswC+6fr+UfGmm1IblJgk4xEZKxfX8P8Ud
 zhQd4tbQil66sVrckGkM0SWkoFCbTOUvzsEIW7SDV4lR0GhXOnwjySPNpY7Ahi45f8mg
 0d6w==
X-Gm-Message-State: AOAM530rRCyijbRU+z4sn6dSw8kPLu6aLyuPQ1hMRFmP9482ZjVWRIOq
 k2d1bW9tjOOVmO69QbqzQ6U=
X-Google-Smtp-Source: ABdhPJx9p2V5ZkfDBM0Km2BYcwlCLVdxjQ6ViMxGlcQ1HIe2B7BEEGhl0NZcj+Y9/q/QBEJttJP/1A==
X-Received: by 2002:adf:ee0d:: with SMTP id y13mr51209982wrn.427.1641461638712; 
 Thu, 06 Jan 2022 01:33:58 -0800 (PST)
Received: from [192.168.1.33] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id k19sm4549356wmo.29.2022.01.06.01.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 01:33:58 -0800 (PST)
Message-ID: <d060d757-859f-3c0a-5a01-0f4504116f1d@amsat.org>
Date: Thu, 6 Jan 2022 10:33:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH v3 3/3] linux-user: Remove TARGET_SIGSTKSZ
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20220106074740.1754661-1-gaosong@loongson.cn>
 <20220106074740.1754661-4-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220106074740.1754661-4-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/22 08:47, Song Gao wrote:
> TARGET_SIGSTKSZ is not used, we should remove it.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/alpha/target_signal.h  | 1 -
>   linux-user/generic/signal.h       | 1 -
>   linux-user/hppa/target_signal.h   | 1 -
>   linux-user/mips/target_signal.h   | 1 -
>   linux-user/mips64/target_signal.h | 1 -
>   linux-user/sparc/target_signal.h  | 1 -
>   6 files changed, 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

