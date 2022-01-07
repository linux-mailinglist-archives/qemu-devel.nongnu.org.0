Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EFF487928
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 15:42:20 +0100 (CET)
Received: from localhost ([::1]:41594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5qRf-00085z-8K
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 09:42:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5qML-0005bZ-UE
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 09:36:49 -0500
Received: from [2a00:1450:4864:20::42e] (port=38736
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5qMK-000050-Fp
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 09:36:49 -0500
Received: by mail-wr1-x42e.google.com with SMTP id a5so7471557wrh.5
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 06:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DXvjvYiQc5MWPGdeDyYAjbvjX+NKxAglYXBoWfyHwhs=;
 b=absYFuG0EypvzKoEgrfEvc6mA9ar2Tu+9VDnabA97UYm3h/OaB7HvSGIYt/ATA9gqk
 Slwg/elIn5N8dfi5HjcsOnUSNG06jGH2LrU00d1Hcc+Y6Od3BIsyJt6Cr/WjWvXgY061
 yTJLbDqunbUxWcMTXwN6C/DNa9o0IQ5FXC0ikokK557JmjrNsXrOC7we9dfJMpdhbkDo
 Aoifov3gd89XcJvVWS0esYuq6kn/MuZ/stMlffp6DC219ffN0KKMLYS5WYhUi4gsM5cP
 2E/5FwuccAclZyZBHwxDC8hnShpvd13cWLpXHsdlMj5X+GId4JiE6yy6O0cRasT0Yj84
 QU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DXvjvYiQc5MWPGdeDyYAjbvjX+NKxAglYXBoWfyHwhs=;
 b=BHRIDdNZuVZMSTkIrum7k3I3KjxJV1pCF0X8OF5Rv7WhgeEzW1miJL9/ndzNmt1f6+
 IlG8zF6+ZVDoahqcwjq6zF4Wy2THzs43s7oI5Y77xq6NbBrG2SU8ff63Xb0xlHXWCOBZ
 bMZ+pXpKe0etTuIbb7Mq4wXljVi8rlLGkqrW4dF10DHeua6Xnxwg9N5+maKU86i3CH4g
 3l8rCCahn8/KtDu6opBDZo/UOxQIBZujnJN1FWGXABLFNZTkljNKD5Gefopn62eYXQv+
 MkDHbsi4IAvGQKtOkGnQJU4apzuuVRFyieAfntBKu5tT7zwCBeIj8Jnf8qa9+bJSD7qQ
 bbqg==
X-Gm-Message-State: AOAM531CuB4B62HLe+3xj96kqEmmuY4WSTfzGjZAvrYJrTc1isAr7LEu
 7e3QaQicc5oPWBzjyg9N6So=
X-Google-Smtp-Source: ABdhPJxMTPPJOZce3tK1R6iSO4djuKtOSFYWdujkNXv5X8JQSlLfn8YOd+AAKiThv5SdG7NvHJsEWQ==
X-Received: by 2002:a05:6000:1569:: with SMTP id
 9mr54293466wrz.127.1641566207361; 
 Fri, 07 Jan 2022 06:36:47 -0800 (PST)
Received: from [192.168.1.33] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id b5sm4829436wrr.19.2022.01.07.06.36.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 06:36:46 -0800 (PST)
Message-ID: <54c61a1c-03d3-650a-4405-cfa2b0b082a0@amsat.org>
Date: Fri, 7 Jan 2022 14:58:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH 0/2] linux-user: Move target_struct.h generic definitions
 to generic/
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220107042600.149852-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220107042600.149852-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: gaosong@loongson.cn, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/1/22 05:25, Richard Henderson wrote:
> I noticed this while reviewing loongarch64.
> 
> r~
> 
> Richard Henderson (2):
>    linux-user/arm: Move target_oabi_flock64 out of target_structs.h
>    linux-user: Move target_struct.h generic definitions to generic/

Series:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


