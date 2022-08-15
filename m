Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B64E593AA2
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 22:31:28 +0200 (CEST)
Received: from localhost ([::1]:59220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNgkB-0004V3-If
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 16:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oNggf-0008HZ-9l
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 16:27:49 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:42963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oNggc-0002Z7-Lg
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 16:27:48 -0400
Received: by mail-qk1-x72c.google.com with SMTP id h27so1999136qkk.9
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 13:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=UYWcVUCm8A4Zo1ovf15GFjMc5swI2yDbuMF4qzITRzQ=;
 b=lQG36e3Z9j1Fb8Sv3OiW9gqVl6zE0ARVF4wkOG87Q6QvUL+2O5bnhXqOY6mfnDql4X
 X1Xd9UVAmRlEIylsVbu4QaOmcZnt1tUkgshZ06VYYDe0mBA4BKxPyFwAtCTk0DZ0Mly5
 8Hh1kXRBWiz0KLHmpIxu+XyoHOenfD24GvftImzRsKFTwMwAvalpL6Wkc6ACS8aTos69
 F1anHL+nAiZn95IF1E8mFE5lHWXgpGyntMRSs98tNVqf2Gk4Z/vzBSs6FMAz91rnV1ob
 tnqnlnnGNS7dwEN0l6xBm39XxbDEQJC+yckIoqtXm/ZZOEIYU7Tci/AySiITK5N5kg4R
 oxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=UYWcVUCm8A4Zo1ovf15GFjMc5swI2yDbuMF4qzITRzQ=;
 b=53H1bYgX4P2QB2vy5YiFR3Q6tuZzYZLPUf7BkqBJeI5acgL9ReFplHel2TA7l9vL+d
 fUy7VbAo68mPTLM4lYixpvZlw6kfPTPXUS5SM5VwFxEk9X/wchHBOUj76CIkWxAkmZ7N
 0E3Ed/kqtPczr1YSWE1U0UJDEvFzYrK47CqQhpe6PcVcymCWHePTwOnhPtIgqG7QAPtX
 8fuDFfCGpjN9iLgXUYD5TZBVvDwZyF1XKSXaXN10HkcqyrrpSlxWMvRP4maITfrdmdDf
 WLl3fj7vstSyPrTHUZnvj1EY8v5ibeP4zKgA28CVQGSrKD/iK0BO4akJrhENOvmsQMlF
 xxPg==
X-Gm-Message-State: ACgBeo2dsWqn+gP3TOwuLR6KuE024WmWG2SdqwnrrJ3KNlSuNuml8V8c
 NJXmHhYuOhQA9rN0WfwFpferng==
X-Google-Smtp-Source: AA6agR50wn9lxZ+Wt4WE7D++3xd+SMpVO2LFQ5j/5lLSnI/BFQyDrjHONWbgFwo4iMSPe08xJqSlkw==
X-Received: by 2002:a05:620a:1426:b0:6bb:268c:1c67 with SMTP id
 k6-20020a05620a142600b006bb268c1c67mr4876535qkj.298.1660595265701; 
 Mon, 15 Aug 2022 13:27:45 -0700 (PDT)
Received: from [192.168.125.227]
 (173-11-255-51-houston.txt.hfc.comcastbusiness.net. [173.11.255.51])
 by smtp.gmail.com with ESMTPSA id
 o4-20020ac872c4000000b0033fc75c3469sm8309176qtp.27.2022.08.15.13.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 13:27:45 -0700 (PDT)
Message-ID: <ac44051d-ca57-a39d-90ba-d993efbcf924@linaro.org>
Date: Mon, 15 Aug 2022 15:27:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/7] Allow semihosting from user mode
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stefan Pejic <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Furquan Shaikh <furquan@rivosinc.com>
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220815190303.2061559-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 8/15/22 14:02, Peter Maydell wrote:
> Peter Maydell (7):
>    semihosting: Allow optional use of semihosting from userspace
>    target/arm: Honour -semihosting-config userspace=on
>    target/m68k: Honour -semihosting-config userspace=on
>    target/mips: Honour -semihosting-config userspace=on
>    target/nios2: Honour -semihosting-config userspace=on
>    target/xtensa: Honour -semihosting-config userspace=on
>    target/riscv: Honour -semihosting-config userspace=on and enable=on

Except riscv, for which I think needs changes,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

