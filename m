Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6C55AEE1C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:53:26 +0200 (CEST)
Received: from localhost ([::1]:53228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVZx6-0003a8-3I
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVZcB-0007L0-80; Tue, 06 Sep 2022 10:31:49 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:35706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVZc7-0003ph-Pv; Tue, 06 Sep 2022 10:31:46 -0400
Received: by mail-pf1-x433.google.com with SMTP id 123so2160138pfy.2;
 Tue, 06 Sep 2022 07:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=MkuYgNmZp/DNU60W+5WQ8cIJ811+nWmopYw5yrckXa4=;
 b=Fgg1kAlHHnoDAzbL2E13W3SclbloM6U7qhZpjUnmsdT48KFo9LjjP7wVAd7zAY+hqY
 t1S6gNTr0Gl1XdlQSlp3XewmNCuemyU0BHTFEjkgOqWe0gJk3eIjQiAV5u+IkFHgeMe6
 EksNV5Mtv4SV96J0lgw8II6XrvznK4A0MnWBBLidu+jLE1uP1RiwK8O9qeTbdmMg6Fe2
 LlAwDgoxbgMgL+mcYi0QCYDVyazt+n0HYizgKs7+l0/pInIKKJ6elIuur5VhB5kl7Xv1
 //W/v69FwEaghR/EC8MkTFRWDAAahIvBI08FBZO9hIXur4iLyehR6SG9I9aaPjjS7StT
 MJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=MkuYgNmZp/DNU60W+5WQ8cIJ811+nWmopYw5yrckXa4=;
 b=ifjKdQMVpVSovRkRL8wS9NwrDL3jHCcXJrGO+alKYzGQE/VK2Id9Q3YM0qlSYvBHhB
 EDEf4rLEV2wA8PC834ImVr63qzDIf9zynqxV4FUcgpShZF5ZiBVZJ0pSQagCSz/c75+w
 zgz28XZNd1mX2JZlktko7vKqfXAIAflNlkJDOsPHKikR21fd71cd/awhzZmZYb71awCI
 +q+nHsALREYo6dRwlOZ60DvDGD8ecm5tbDoSiETaH0pcKDqtgO9t0hQdr+POE52Ey0oz
 yEq4Ipctkf45C+Ysib0he9whpIrEiYRZuhnLCpfKBBsQCZiznjARyBaD+43/zjKyD45v
 g5KQ==
X-Gm-Message-State: ACgBeo2a+NLAU0X+g81AcTbFEvAuaUX1O/HY9VbvFLpS2RpzUpSCAVZy
 lmUhdmA5X2RWDFXxEWRDNdA=
X-Google-Smtp-Source: AA6agR4u1AikXpZ/Uav7PNOejkIAzsdrFi8w+U7autNinwDo3EHRYUoHPNjbwxzWhZ8saDp/44dbWg==
X-Received: by 2002:a05:6a02:205:b0:420:8b7e:3ff with SMTP id
 bh5-20020a056a02020500b004208b7e03ffmr45111589pgb.427.1662474701930; 
 Tue, 06 Sep 2022 07:31:41 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a17090a910500b001f50c1f896esm8864420pjo.5.2022.09.06.07.31.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 07:31:41 -0700 (PDT)
Message-ID: <f3fcb2b6-e9f0-71e4-9544-be3063322b85@amsat.org>
Date: Tue, 6 Sep 2022 16:31:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v1 09/26] target/s390x: Use gen_psw_addr_disp in
 save_link_info
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
References: <20220906101747.344559-1-richard.henderson@linaro.org>
 <20220906101747.344559-10-richard.henderson@linaro.org>
In-Reply-To: <20220906101747.344559-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.752,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 6/9/22 12:17, Richard Henderson wrote:
> Trivial but non-mechanical conversion away from pc_tmp.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/tcg/translate.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


