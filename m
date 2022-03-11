Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D204D694B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 21:07:21 +0100 (CET)
Received: from localhost ([::1]:35776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSlXj-0002RW-Ro
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 15:07:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSlWp-0001kx-Pl
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 15:06:23 -0500
Received: from [2607:f8b0:4864:20::62b] (port=34617
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSlWo-0007bl-AD
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 15:06:23 -0500
Received: by mail-pl1-x62b.google.com with SMTP id r12so8544226pla.1
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 12:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=d5IMxWkqlVhCZNPVghqqParoon9zkjdkr9kJ4OMvwRU=;
 b=ZnH9qUSpxshvZHqG7dEseuTaski5ZER6Fd6xUMPNJn0cx7HHIKbeJZ5jyn72jwn5PV
 4wfUIPZEfjg15ztQrV9QhvqhYkZPbwLN2NV+PtqH/93FnfLEljGHzliHqkulWqYlHBGb
 EQSNYKz/c5Js5tPT/op6Y2mteUa5BB7UvUeplbOV+msZQBT2zmDz60CSR0ft9miPaSHS
 vfVwsKhrr+qixm3OUs6nUFdTleqRSagKMs5yP8R/9qGBT7AHweK9FJ6ovia736TdW0+V
 N66/i4BQGulVere6rvPnXZQPoCaTfM7XA+MNHMqKKo1lsZrfPluOv82eVGeIoqttAX8y
 tRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d5IMxWkqlVhCZNPVghqqParoon9zkjdkr9kJ4OMvwRU=;
 b=6CSP6SHXOqC/sYB+wazq2Yj8EWXnub1732CTGcMjTfWK7BV5YQzxw6LAhjVmDb4FCH
 cF5Bs7pqTEcv88VZlt0A/csBPzfDZDORBpAXfzpx3Cm7AERuGlRJYo3vlQ9Jt8oWH6mW
 KOf8XyE24Loup7QpcbhyIkXyKxR+hh1c/SMBVqX1WpalXds1hRuz6cdkRtXKC3N6cnB4
 NPzm8UcoArCbYywwIxfiV1nM5c5HwFcpnB9+F870h2kDrzslwJn+jjCX4e8p/BCowZFt
 NC0/1zt+6gmtDGcnoQytjN2Yhyc11xN3bfGV3V+8jkljYpdMe6Y6x3+ELrFOb4xQsDA/
 0X7A==
X-Gm-Message-State: AOAM5303PZV34oPCPCq6EKJHxMGCiHEMdZ6Ho/+a5rWkZJKTfiWa9Aax
 P5Na8zWkXAqDXRAFF/rk0q2/Yw==
X-Google-Smtp-Source: ABdhPJyCf3FFlcjGyRGoG29YCS1EM465WJyWSzB3GRUH1boqCbfAo1ti8DDySI/uofbo1vu1pUXs7A==
X-Received: by 2002:a17:90a:4:b0:1bd:3db8:5ca5 with SMTP id
 4-20020a17090a000400b001bd3db85ca5mr12457241pja.120.1647029180887; 
 Fri, 11 Mar 2022 12:06:20 -0800 (PST)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a056a00159100b004f763ac761fsm10029799pfk.33.2022.03.11.12.06.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 12:06:20 -0800 (PST)
Message-ID: <8cad0855-d686-c308-24d7-0edd8fcbc2e1@linaro.org>
Date: Fri, 11 Mar 2022 12:06:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/5] dump: Allocate header
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220310111608.3362-1-frankja@linux.ibm.com>
 <20220310111608.3362-2-frankja@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220310111608.3362-2-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, mhartmay@linux.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/22 03:16, Janosch Frank wrote:
> Allocating the header lets us write it at a later time and hence also
> allows us to change section and segment table offsets until we
> finally write it.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>   dump/dump.c           | 115 ++++++++++++++++++++++--------------------
>   include/sysemu/dump.h |   1 +
>   2 files changed, 62 insertions(+), 54 deletions(-)

You're collecting the important pieces that go into the header separately (phdr_offset, 
phdr_num, etc), and you can certainly change those as you go along.  But I don't see the 
point of allocating the ehdr early.  I think you should create it and write it out 
immediately.


r~

