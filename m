Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 961B56AB743
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 08:51:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ5bl-0004oG-OE; Mon, 06 Mar 2023 02:50:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ5bi-0004na-Ey
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 02:50:06 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ5bd-0003gq-0H
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 02:50:02 -0500
Received: by mail-wr1-x436.google.com with SMTP id t15so7787364wrz.7
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 23:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678088998;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TrYXg0Pb1hUZPPzGszvn8OfNeHYh0Bv020GMdjKeXxY=;
 b=rrfM0nUp04lpjLUCe865tt6xbah9g+9KmK/Lx2InhtgNXZMlvVtB+2rqCmEQqOyaHu
 fHwDagZM+FI3Q5Q0HueBMooZRjwrIDxNVRm8n/B7Z3DRhQQzrluhhTRSEuoifcQD/VPY
 FDLRD9zsvKw0gph391W7TxPWIWz5IAm+CNZTZSMCHwWNW3Z0E5znCGATYYy+a2Hs2JkE
 RRELC3B2EzaER8VKacOCrr4c2RP/ytXcMztOeQZW9n7CjShcjPNeMmMeuuSZKMsx1Re+
 fnvdW71nZpZRqTclxcWPv4DVCquqQE9ltD+Q6erVIzdWnyn56rw8bjcH+sKNMYRXsaqM
 7sRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678088998;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TrYXg0Pb1hUZPPzGszvn8OfNeHYh0Bv020GMdjKeXxY=;
 b=j4TkFTXydp4+eMck2UHQAvjUkrUIIN0dqrAsMv7zb881T9wWr7xoAgIsPZ8vXdj0cD
 Gv6ogwuWAB3Lc+Iw39HeUl68pfFhVd6KPFq2MYDw3/Q4a3aU7OsVmDeoyyZsloV/zhEd
 dy94GR9d2XOS6+KO4zgJxCFz7RcAHUC/il8GG00GzJ32TC3aay7foxzK+fPQ+s/Bs98/
 cSm4Z/Dh1EUOhH2iKROMqTIZGQp0BGakcJePiZa1fIX7YESDc4448gYq+SOi5Md/072K
 8ACpq+CsFk0JquoTuEWL6g9GbVWroIVM+AGv9rnm0MnTacvvljwag2OLPVXLCfSN8Jek
 HmhQ==
X-Gm-Message-State: AO0yUKUAoNeAulCUkeL3btZ5+ntynGPWykjST1O6skKzO2dDG0aYPFZw
 KG5mdwIJ9YJlDYWY8zTcTLYGBQ==
X-Google-Smtp-Source: AK7set8SZ0YLgmY/tJJQnj3f5o8OGCddPl04dBLH+8rzFEn2VZmk8LG844MJhLlvTn3yqsneoSN9GA==
X-Received: by 2002:adf:fb10:0:b0:2c5:4c5e:412b with SMTP id
 c16-20020adffb10000000b002c54c5e412bmr8717750wrr.23.1678088998215; 
 Sun, 05 Mar 2023 23:49:58 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v38-20020a05600c4da600b003eb68bb61c8sm8975326wmp.3.2023.03.05.23.49.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Mar 2023 23:49:57 -0800 (PST)
Message-ID: <130713a2-4671-36fc-b8c8-21ba2c3d8f3b@linaro.org>
Date: Mon, 6 Mar 2023 08:49:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 4/9] accel/tcg: Pass last not end to page_set_flags
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230306021307.1879483-1-richard.henderson@linaro.org>
 <20230306021307.1879483-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230306021307.1879483-5-richard.henderson@linaro.org>
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

On 6/3/23 03:13, Richard Henderson wrote:
> Pass the address of the last byte to be changed, rather than
> the first address past the last byte.  This avoids overflow
> when the last page of the address space is involved.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1528
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/cpu-all.h |  2 +-
>   accel/tcg/user-exec.c  | 16 +++++++---------
>   bsd-user/mmap.c        |  6 +++---
>   linux-user/elfload.c   | 11 ++++++-----
>   linux-user/mmap.c      | 16 ++++++++--------
>   linux-user/syscall.c   |  4 ++--
>   6 files changed, 27 insertions(+), 28 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


