Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D112D35C9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:09:47 +0100 (CET)
Received: from localhost ([::1]:59302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmlB4-0002v3-EO
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:09:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmksb-0002zn-2v
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:50:41 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:34463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmksZ-0006hf-Gz
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:50:40 -0500
Received: by mail-ot1-x341.google.com with SMTP id a109so239571otc.1
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 13:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w89jvt9xEQkyHcX0w1o44P7qbLiRNjqGfW4EIZv9AzA=;
 b=hq4rtzcxreLjWyZ1walMSdBn3yQrxk8T/ZZqpI8ju0LHX5+OXBAHOkJam6Zku8tf6R
 qe44C6uCIbTrlN/a09pmHwfYp4SWKsZn5q6zz6vDWujbfWYoPu4GxZwIU7iseWt2WZ9Y
 7/8MhpdzDhoafcbcQ6FR+41vhhrCPmprkloLb1LQt7Hb8q1qGBVhKryP42U1emCE0XHA
 fjbZaxkriphJizdr5RQTDxizuBuxflot9C7EeCb8OhJlQMMzirHpvr9taeXOtmc5l9f3
 5V4etpUcCarI9X+mWkvkcjvP74TG33zFwCPewSlisQG5zYDMJtHApcR96MuZZUJnkBp1
 yYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w89jvt9xEQkyHcX0w1o44P7qbLiRNjqGfW4EIZv9AzA=;
 b=OpKH1rDlXZh/4QvjrSDcZKXUzHoxhbBLvwHfcEfdu3/Y3m+OMh19yO8dpFYrsEWl8j
 K3jEtWSW3A1bk7a0pu+lr3CRUbHk/q+lgIZEUd4eYTY+A44dpLL6hvh5KezFlijWVUNu
 emIK0d252gWuDeMsCQbrnzjL3PyJP/jkbj7S3HzbhYgE6dohlXiyr4PzvvDLps2hOCuR
 Zi+hBaRH6WgMouZmfhJZwy5/Z8Y8+/t4jf2C+3DO1foEdFQO9g5AgxeOK+ypsBzi9Bz8
 oA+FtYlZlXcXv5odLH7/EvR37vmBY2AoQiKPOrTv3g2mUdyJL3VyQ4Z6ltLigBBJSd9N
 d+KA==
X-Gm-Message-State: AOAM530eDIFsI1Lp0eOHMv7DB8a+fp4bmZdZ9LXQX1QkFbcHULaGn28E
 qnzI1T8Sv3hK32z1ENwrG/63hg==
X-Google-Smtp-Source: ABdhPJyOzZZGjfZpGo/f3tX1nyI3xV4XB9a6mSy1TfhklLOwufw8hMUrUrmGNWkMr1b+clhHWEEGXg==
X-Received: by 2002:a9d:6f91:: with SMTP id h17mr120044otq.104.1607464238185; 
 Tue, 08 Dec 2020 13:50:38 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k30sm51888ool.34.2020.12.08.13.50.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 13:50:37 -0800 (PST)
Subject: Re: [PATCH 06/19] target/mips: Remove unused headers from kvm.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201206233949.3783184-1-f4bug@amsat.org>
 <20201206233949.3783184-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8d161704-c46c-0ca8-357b-1a28b17dca49@linaro.org>
Date: Tue, 8 Dec 2020 15:50:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201206233949.3783184-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/20 5:39 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/kvm.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

