Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEDC698E0F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 08:52:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSZ3s-0003tp-RA; Thu, 16 Feb 2023 02:52:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSZ3b-0003tK-HI
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:51:57 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSZ3Z-0000IM-Pa
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:51:55 -0500
Received: by mail-wr1-x436.google.com with SMTP id l2so1007826wry.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 23:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X4oNMcLvdxv21DOd6b9fbe8hS1Ypp10JvZx7/lmlxZk=;
 b=w2JU7DmI58QoIlqXK6M7IOPnLnzTj5R1n4l3dwzhCL4fM+ojgeCj/5gL1GtHfVRf4j
 YstTkOAIkkQjoWiKBlLd57f7n0UMrezOauH+KMWkStFZU2jicnmBSp8SK63nlp/bCV7/
 Xt0a043YutHb9d+4SKMwsPoCfTk33C2upDP2iQXdYI7IkT2axZJp5QQj+2AocrCCKtYV
 IR/uFOUbs9MvHY0ZZCa1QZvQcGTW/MslgTcEvQbjMZhbpXmPB21NnmcI6SwaEehoxf93
 eJfQ2FstI/B41eS682g5/tswKcLixmAuOEnnZXugKfv079fmOn9VXyqStGLYvebBJdk1
 mXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X4oNMcLvdxv21DOd6b9fbe8hS1Ypp10JvZx7/lmlxZk=;
 b=1k0a170sqxEhNtLJHCTPaX+VKOXK4s6WgmdeLL8faBIT0mWWMmJStSRQ3ZpBYAns4n
 zud6joBF4MSp1t8fhZvshLte6hqk9cfQF1poYn77nWA2i/t5ew6l/JwvsGGUDCrwosqN
 V45oUfmlLFcNaj40H9pA+HYSscOsxOVmffKMumNkKLvii0Xz/AmhybZNmVU+GrLpWs4J
 +lPh4kp0wZJeExSwD/ue9LBxOCyGZyDSpcaFxz+MBXArZqFWfLbBZNexTM/YPerDKT/f
 gZMzhFHmlwfgars654Sk2V51ifTcjsj0r1D1rxyXsNLXrGILPwfbfxg0IDMqesHdJrjt
 ohkQ==
X-Gm-Message-State: AO0yUKUyiSx9AGaiDBG7cGEGxyWmnncXm2JoAEbXtvPQuARFKqAcJd4D
 4MsLOdumuf4tb2fMmwFCK7m/Ug==
X-Google-Smtp-Source: AK7set+Xvg423rHR3jDhwMYgi+Mx5sM31xOIynANJe3QhPu7a45gvb6FKlW6jxhdODbvqamRJgunlQ==
X-Received: by 2002:a05:6000:1801:b0:2c5:52f0:b071 with SMTP id
 m1-20020a056000180100b002c552f0b071mr4213747wrh.15.1676533912337; 
 Wed, 15 Feb 2023 23:51:52 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 x13-20020adfdccd000000b002c3e3ee7d1asm771702wrm.79.2023.02.15.23.51.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 23:51:52 -0800 (PST)
Message-ID: <e17c867a-2af1-ec6e-141f-2f11f772a3fb@linaro.org>
Date: Thu, 16 Feb 2023 08:51:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 02/15] linux-user/sparc: Tidy syscall trap
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu
References: <20230216054516.1267305-1-richard.henderson@linaro.org>
 <20230216054516.1267305-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230216054516.1267305-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 16/2/23 06:45, Richard Henderson wrote:
> Use TT_TRAP.
> 
> For sparc32, 0x88 is the "Slowaris" system call, currently BAD_TRAP
> in the kernel's ttable_32.S.  For sparc64, 0x110 is tl0_linux32, the
> sparc32 trap, now folded into the TARGET_ABI32 case via TT_TRAP.
> 
> For sparc64, there does still exist trap 0x111 as tl0_oldlinux64,
> which was replaced by 0x16d as tl0_linux64 in 1998.  Since no one
> has noticed, don't bother implementing it now.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/sparc/cpu_loop.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


