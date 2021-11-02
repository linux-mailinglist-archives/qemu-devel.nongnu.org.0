Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A40443069
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:28:58 +0100 (CET)
Received: from localhost ([::1]:51666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhumX-0001vF-5g
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhuRK-00078m-81
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:07:02 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:37530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhuRG-0003Hq-K2
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:07:00 -0400
Received: by mail-qt1-x82b.google.com with SMTP id o12so8164144qtv.4
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 07:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=EBYPzclCaW71iei0tvVtPlQbCecz13BYYYtj4s6xQ6M=;
 b=THHeSa1l8XGQGr4+xyfJ22n5u+eq2ajGcmiaRpIY9TDie0CmwpYsm1LwCjo7r+ZJ0A
 AIHbdvUmaVPwfAMdq59yeAnJBeqsTA6gLKY396m9LyG3y11A3kBH6oV1TSbojo23kERd
 YL56TRPgljCMnc1zViB2v3j8w9mtiKWYX1a9CG6VIfo71LutfZ4s8grnUmBdi5aMTxpn
 Fu5m2aZx7pqHW9vpiENmhb/kga7crCSgW4NB7Hjt/hmVlnYK6+R/fg6GQ0E419eBhStu
 aByU21uTGJu7aH8z2DX/5INur+3yMTiIKWwotvglw1aw2lCLcCyzFuFJwUB7w5U0HyxY
 X09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EBYPzclCaW71iei0tvVtPlQbCecz13BYYYtj4s6xQ6M=;
 b=REIDq0c+Mfz5PTNset136P63tjsxf3eNTRFvTUCNq3zgqnvD9GUbJW7vjern3EtG97
 FVcFaTc6vwgRu67Pixvrx8j38Es8gQ+n1gI6I/APxVnFNIHXMgB/n7VnrGM7Ys8B63iC
 DsNK2MV5ebDOPOZ80QcAfNPPyiOTlkvbraz1/ictJtdMxaI8p7cQXV6ceKd6QN3f+OkB
 Ae46VkxO89xWcCOPUrZ3W8sj5BEaPdYcfIcRTkhW9VwstxfOP7okYql+pG+zuy3NM5pe
 iv7uJOM9+gWE8lpaXz66VS3u5sh79AwC4/hre3q3BqgTUqicp92Q8X07NZJmClHU6I5A
 VUYA==
X-Gm-Message-State: AOAM533QfF1yIG2L1c4gQyGBJDVmI6UVV5EHe54cRXTa2NirfftepEFY
 aN2RmiE3NbUCX4tJKIudQBXrjGVqKU2xIQ==
X-Google-Smtp-Source: ABdhPJwgbxuEr4bVGrb/VJROJ384w5tUsR0AU599bpmwIAHw0/qnZM1jmE26OeFGuPtXDD7pJ0yCcg==
X-Received: by 2002:a05:622a:1647:: with SMTP id
 y7mr38454992qtj.370.1635862016112; 
 Tue, 02 Nov 2021 07:06:56 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id y7sm12933194qtj.39.2021.11.02.07.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 07:06:55 -0700 (PDT)
Subject: Re: [PULL 0/1] qemu-openbios queue 20211101
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
References: <20211101215636.6141-1-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f6b79e12-d018-f421-19e1-b81cd6db0d64@linaro.org>
Date: Tue, 2 Nov 2021 10:06:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101215636.6141-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 5:56 PM, Mark Cave-Ayland wrote:
> The following changes since commit af531756d25541a1b3b3d9a14e72e7fedd941a2e:
> 
>    Merge remote-tracking branch 'remotes/philmd/tags/renesas-20211030' into staging (2021-10-30 11:31:41 -0700)
> 
> are available in the Git repository at:
> 
>    git://github.com/mcayland/qemu.git tags/qemu-openbios-20211101
> 
> for you to fetch changes up to 97a5b35c17f4bcddc7b550ac1f4d7e39f100aec1:
> 
>    roms/openbios: update OpenBIOS images to b9062dea built from submodule (2021-11-01 21:50:52 +0000)
> 
> ----------------------------------------------------------------
> qemu-openbios queue
> 
> ----------------------------------------------------------------
> Mark Cave-Ayland (1):
>        roms/openbios: update OpenBIOS images to b9062dea built from submodule
> 
>   pc-bios/openbios-ppc     | Bin 696912 -> 696912 bytes
>   pc-bios/openbios-sparc32 | Bin 382048 -> 382048 bytes
>   pc-bios/openbios-sparc64 | Bin 1593408 -> 1593408 bytes
>   roms/openbios            |   2 +-
>   4 files changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.
Please update the wiki for changes in 6.2.


r~

