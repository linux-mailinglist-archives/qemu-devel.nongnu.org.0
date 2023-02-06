Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5580368B5E2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 07:56:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOvPq-0004Nx-6o; Mon, 06 Feb 2023 01:55:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOvPo-0004Nb-NU
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 01:55:48 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOvPm-0007Sc-QN
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 01:55:48 -0500
Received: by mail-wr1-x434.google.com with SMTP id m14so9355821wrg.13
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 22:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sdnM846SLxL51ZmC5bhKZqC3LdY1DWUttQa7u3aMkwY=;
 b=I1gXfRVUkDXykkfOjPO0F1i0UHu4GW0qge2roLyVDsv6L+wgukvpvmontMAIJvZepA
 DwPLSckLNc2mCORTRg/5uGN+k4swcxCb0EBaOUJcV+mUrR31/zaimem+/O3nPK2/jjtJ
 oV22+6KecKH5RI/Iu11Ii9ha3Sbstr53vVULJbIdocLwgCx6+uH4Oy8jXpOOtqGZIq0G
 POCezDBWUSi0rQyD6IwWsVCRS5Kb37NJHuCwQkubL0SUhNmytXeiTY2aFsHbGvDnJWBA
 D6d3FAzNFWbntd/hRK2UTTw91QZ22eDprgijnk2NTYd18y3dAIJ/dMC/zbcnlBvpRWP4
 212A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sdnM846SLxL51ZmC5bhKZqC3LdY1DWUttQa7u3aMkwY=;
 b=fcSlFWHLGSD6eID9mFHqz0Zka/iYyEC+TN5O5LTo+fMvZDzOYfjmw/1hp4KLFDmr/y
 zQBYitHUhW6NVp7x5xgoyR0dQEWfAFazuCEgsN6FW7klU56XL5OzbYAAtidORe9XcdMW
 0ZhxQ7zbzebbnKiovDbHRgZ7vlNrSEkEKZhtNHYBB1wOs9LA1/nN0Q516GZPzCqFqT1f
 spueEbKskJmIANyegGeJFLNoTyvsEflmM6t2aiW3RCCByxe7qfgCMLmu+Omku/1Bp+Nu
 D02f/TtY4xZGyjBSId223axkiN9pU+RF4Dz49/t7EUMGy8zYoZR3JMmQ/uMl7xcj9zsv
 KJlQ==
X-Gm-Message-State: AO0yUKUcz65lAnre5GtVc0ij2UJe5bYt7q6fgLevQQCg/2ddYGAmRI84
 kmuYopmiv5xzAb6XH+cDKuKOcg==
X-Google-Smtp-Source: AK7set9TL3jEjAUfRq0Eq8AP0+Awp0k5QiSsTrS+wcGWc1AR04o+U/ACeBwFQvJFrPQjwwiV2JMaVQ==
X-Received: by 2002:a5d:6d05:0:b0:2bf:b741:3e0f with SMTP id
 e5-20020a5d6d05000000b002bfb7413e0fmr19469303wrq.41.1675666545260; 
 Sun, 05 Feb 2023 22:55:45 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l2-20020a05600002a200b002bfd687a96dsm8448923wry.16.2023.02.05.22.55.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 22:55:44 -0800 (PST)
Message-ID: <26dd56d3-3df6-16dd-4b74-e4cfded96db4@linaro.org>
Date: Mon, 6 Feb 2023 07:55:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: qemu-img hangs on s390x
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>
References: <3bae2f38-1f16-46a9-604c-7a0a3e141471@msgid.tls.msk.ru>
Cc: "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <3bae2f38-1f16-46a9-604c-7a0a3e141471@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

+s390x/block lists

On 5/2/23 20:10, Michael Tokarev wrote:
> There's a bug filed against qemu on debian, about qemu-img hanging on 
> s390x.
> While digging in, I discovered that the thing is broken there indeed, 
> and it
> is broken for a very long time, and it is interesting.
> 
> The reproducer is rather simple:
> 
>   qemu-img create -f qcow2 -o preallocation=metadata blank-disk-1s.qcow2 
> 512
> 
> this hangs until interrupted, after writing 327680 bytes of output.
> I haven't tried old versions, - 5.2 hangs for sure, as is 7.2 and 
> apparently
> all in-between. In particular, current debian sid (whole thing) and 2-years
> old debian bullseye hangs equally.
> 
> But the thing is that it does not hang when creating file on a tmpfs, -
> when the filesystem is tmpfs, it always works.
> 
> Also, a few times I were able to run the above qemu-img create 
> successfully, -
> maybe 2 out of 100 runs or so.
> 
> It looks like the problem has been there for a very long time, and it is
> timing-dependent.
> 
> Comparing strace of the two runs, I see differences in most futex 
> operations.
> Here's the parent process:
> 
> ...
>   read(7, "\0\0\0\0\0\0\0\1", 512)        = 8
>   ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = 1 
> ([{fd=7, revents=POLLIN}])
> -futex(0x2aa29af8bb4, FUTEX_WAKE_PRIVATE, 1) = 1
> +futex(0x2aa03600bb4, FUTEX_WAKE_PRIVATE, 1) = 0
>   read(7, "\0\0\0\0\0\0\0\1", 512)        = 8
> +futex(0x2aa03600bb0, FUTEX_WAKE_PRIVATE, 1) = 1
>   ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = 1 
> ([{fd=7, revents=POLLIN}])
> -futex(0x2aa29af8bb0, FUTEX_WAKE_PRIVATE, 1) = 1
> +futex(0x2aa03600bb4, FUTEX_WAKE_PRIVATE, 1) = 0
>   read(7, "\0\0\0\0\0\0\0\1", 512)        = 8
>   ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = 1 
> ([{fd=7, revents=POLLIN}])
> -futex(0x2aa29af8bb4, FUTEX_WAKE_PRIVATE, 1) = 1
> +futex(0x2aa03600bb0, FUTEX_WAKE_PRIVATE, 1) = 0
>   read(7, "\0\0\0\0\0\0\0\1", 512)        = 8
>   ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = 1 
> ([{fd=7, revents=POLLIN}])
> -futex(0x2aa29af8bb0, FUTEX_WAKE_PRIVATE, 1) = 1
> +futex(0x2aa03600bb4, FUTEX_WAKE_PRIVATE, 1) = 0
>   read(7, "\0\0\0\0\0\0\0\1", 512)        = 8
>   ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = 1 
> ([{fd=7, revents=POLLIN}])
> -futex(0x2aa29af8bb4, FUTEX_WAKE_PRIVATE, 1) = 0
> +futex(0x2aa03600bb0, FUTEX_WAKE_PRIVATE, 1) = 1
>   read(7, "\0\0\0\0\0\0\0\1", 512)        = 8
> -ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? 
> ERESTARTNOHAND (To be restarted if no handler)
> -ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? 
> ERESTARTNOHAND (To be restarted if no handler)
> -ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? 
> ERESTARTNOHAND (To be restarted if no handler)
> -ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? 
> ERESTARTNOHAND (To be restarted if no handler)
> -ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? 
> ERESTARTNOHAND (To be restarted if no handler)
> -ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? 
> ERESTARTNOHAND (To be restarted if no handler)
> -ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? 
> ERESTARTNOHAND (To be restarted if no handler)
> -ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? 
> ERESTARTNOHAND (To be restarted if no handler)
> -ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? 
> ERESTARTNOHAND (To be restarted if no handler)
> -ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? 
> ERESTARTNOHAND (To be restarted if no handler)
> -ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? 
> ERESTARTNOHAND (To be restarted if no handler)
> -ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? 
> ERESTARTNOHAND (To be restarted if no handler)
> -ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? 
> ERESTARTNOHAND (To be restarted if no handler)
> -ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = ? 
> ERESTARTNOHAND (To be restarted if no handler)
>   ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = 1 
> ([{fd=7, revents=POLLIN}])
> ---- SIGINT {si_signo=SIGINT, si_code=SI_KERNEL} ---
> -+++ killed by SIGINT +++
> +futex(0x2aa03600bb4, FUTEX_WAKE_PRIVATE, 1) = 0
> +read(7, "\0\0\0\0\0\0\0\1", 512)        = 8
> +ppoll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, NULL, NULL, 8) = 1 
> ([{fd=7, revents=POLLIN}])
> +futex(0x2aa03600bb0, FUTEX_WAKE_PRIVATE, 1) = 0
> +read(7, "\0\0\0\0\0\0\0\1", 512)        = 8
> ...
> 
> (I've hit Ctrl+C after quite some time).
> 
> I'll take another look at this tomorrow. But if someone knows
> what's going on there, please tell me :)  The situation is quite
> interesting, - is it possible we missed such a serious issue somehow?
> 
> Thanks,
> 
> /mjt
> 


