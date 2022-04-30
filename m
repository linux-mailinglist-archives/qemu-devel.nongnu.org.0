Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174E0515FA3
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 19:41:12 +0200 (CEST)
Received: from localhost ([::1]:54476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkr5i-0006wM-Ex
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 13:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkr0C-0004dx-6Y
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:35:28 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:36668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkr0A-0005oL-8w
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:35:27 -0400
Received: by mail-pl1-x634.google.com with SMTP id n14so2702447plf.3
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 10:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=A/m/Yl3kHiyrPKWo0g46eaoCSRadAjHPQKJo7EyEqXQ=;
 b=H5BxONloN31Z7S3Zo8ZjSJJ0WaMQhWXg+qDnkn6wyxgvcPdTJuP9tkkUtVT4JyvhVi
 pSevsuilRhf/71+VUq1vWkFFPGhMjz1C0tQ8UdVpLvH+nrw5gGq96Z6yZ7XNjGXxSyNt
 pkzpjxICDvMKvpUTk4LyuqRYDVm0RqEyAyA4RmSF/99QidLl8/1NBVxkpSiuY97zg8ow
 bJIGX7I/Q0osQw2PR+kJDQ3gU37Ra2lyHDUdRAXC7Qp8VNRODrJprUahJH4vT3WKeMCM
 4FQxeJMAW3Rhn9gNB1ZCTVB2eZhxCGcQkX/gZNEcDTKQJEg0RvAXCljuofR2zwMaog9e
 gaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A/m/Yl3kHiyrPKWo0g46eaoCSRadAjHPQKJo7EyEqXQ=;
 b=L3kRV17FxjcIK4CYBMdTleZnSNjGBYVaFN652yIknyD8aKQTjTJ8Q9hhoY0tIzIzb2
 G8Jw0vY9qaez2aBAnejjzDRSXtolDeyVLV9zIEPoAmV3q17Vai2TRzS44js0rsfZ0yUV
 aw7g2lGPd7DA6MG4eV011tujJjwqK1nc1H/GnW1MbfDAF/V7qk0DLGo/dJek1tSmmpDb
 DWXr07YCs9lqf1cm4NTvsclx/UD/ybkcQtsnzTc1lnKNGiz4c/RCCi2UhcHVuPl9KHhm
 emgV47Ybj7QeMfvDOONR8auDz2koH4gc4hv+ecjqU68pjfHAn9jnIMqm3z3XAJEky9RO
 Ewfg==
X-Gm-Message-State: AOAM531bBd1PEGmxJ4ddIhC+Dvt+GGAnPoj/RbbAp/nS1OA9IP/RnXWF
 9sWdH0aHm6X0EKsnDuI9s0NCKw==
X-Google-Smtp-Source: ABdhPJzQ1Xy6hNS9EU0kkwbXN4qJsICA9C42hBipi6PU+Y/Ls1HMWMDOvo90oBUkltoNwVO0Jd5ivg==
X-Received: by 2002:a17:902:edc5:b0:156:68e4:416 with SMTP id
 q5-20020a170902edc500b0015668e40416mr4605227plk.87.1651340124775; 
 Sat, 30 Apr 2022 10:35:24 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170903228800b0015e8d4eb289sm611688plh.211.2022.04.30.10.35.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 10:35:24 -0700 (PDT)
Message-ID: <8e2e152c-58c9-03de-9d4c-9bec75be8331@linaro.org>
Date: Sat, 30 Apr 2022 10:35:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 26/43] target/loongarch: Add LoongArch IOCSR instruction
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
 <20220429100729.1572481-27-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220429100729.1572481-27-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/22 03:07, Xiaojuan Yang wrote:
> This includes:
> - IOCSR{RD/WR}.{B/H/W/D}
> 
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/cpu.c                        | 44 ++++++++++++
>   target/loongarch/cpu.h                        | 25 +++++++
>   target/loongarch/disas.c                      |  8 +++
>   target/loongarch/helper.h                     |  8 +++
>   .../insn_trans/trans_privileged.c.inc         | 35 ++++++++++
>   target/loongarch/insns.decode                 |  9 +++
>   target/loongarch/iocsr_helper.c               | 67 +++++++++++++++++++
>   target/loongarch/meson.build                  |  1 +
>   8 files changed, 197 insertions(+)
>   create mode 100644 target/loongarch/iocsr_helper.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

