Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 871DE433EDD
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 20:58:10 +0200 (CEST)
Received: from localhost ([::1]:58714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcuJN-0004Zt-77
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 14:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcuHi-0003tw-2r
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 14:56:26 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:43925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcuHf-0002ll-6M
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 14:56:25 -0400
Received: by mail-pg1-x52f.google.com with SMTP id r2so20219053pgl.10
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 11:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z5ZHqEbXhhsQktvfM6ugDXdRygJQdokgGfe//IqKYYk=;
 b=mQJeqLGVlr0YkQt9Gb5onmNu3dxslr5uXeHtfK03313QPezWC9uqsI/LZf0Z0gV4UM
 EhBaqjEAA2dfxrvvtCtJOKIgApcE4XTYXttSWRuu0MmOxHkgvnto+gm/gLZHVaa6KiC3
 JHJDpbpxyxpyXmZBYtSNGt9S3vyLKP5weNHbWHlMDHeYlIvyFMJ2QOhmKd2fhBOnA0B4
 b44NN767rcbXcEf7JykY6mrW2f5ZN817D7lu+ZtJaTHOO12DqW8yA995F3JSfE/9id1Z
 Z4JzmoqlbmpDQyua2o+39R+LPcLibRyx/c9oG0qWRspib/aCHXasV+ytjX4kFSBFRYrO
 r8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z5ZHqEbXhhsQktvfM6ugDXdRygJQdokgGfe//IqKYYk=;
 b=yqvaqon5ZO29zrmUFPMnaMOab+I0VUD5efDIJpso74NuFqlD8vVsH33/suiCHQQphh
 awYuPH/+Lw7XGX3Z9Y7qBBfqWMHw16ZQxmINJEwJHqPPLqQxBPBmdwzaDRlx964GvqZJ
 yf3fW+mCtV0oTbikj9UdkNKjKixMaTPlA7xj67JJWdTKNL3REiXzz2M2u0OB1h4bl9mU
 Xk2IWGKf1wK/sQ51UjzTvLOKUFede4Tv8g50ChFkP+MnpPFlKVUjzY6wO/QLzH3Gkkil
 0k1DBQt2KcQA+49RDzPQBCepQsNo33Co40ggaVwn7tshNWDoEqYjQQ3oEQNb4Tm7IKj7
 5h2A==
X-Gm-Message-State: AOAM531zszy4RteYCvYwwzvuOF9l/AQr+wEO6RjqyXTHZbhXkweOPWxb
 oKaS3Ix/R6JKHAa+V17RWj7fJA==
X-Google-Smtp-Source: ABdhPJz6WSJeKdvEtc/8qltKDXyh2s2VdFW3fF15dFnBONk2N5CnEwn+IO0gGwLt7lv1i++TH1JCXA==
X-Received: by 2002:a62:64c9:0:b0:44d:27ba:9a8e with SMTP id
 y192-20020a6264c9000000b0044d27ba9a8emr1645760pfb.2.1634669781566; 
 Tue, 19 Oct 2021 11:56:21 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d12sm15941306pgf.19.2021.10.19.11.56.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 11:56:21 -0700 (PDT)
Subject: Re: [PATCH 01/31] target/loongarch: Upate the README for the softmmu.
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
 <1634628917-10031-2-git-send-email-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bdc2249e-f6d0-bbcf-b53e-0a9c81d8e378@linaro.org>
Date: Tue, 19 Oct 2021 11:56:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1634628917-10031-2-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.074,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 mst@redhat.com, philmd@redhat.com, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 alistair.francis@wdc.com, maobibo@loongson.cn, gaosong@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 12:34 AM, Xiaojuan Yang wrote:
> ---
>   target/loongarch/README  | 134 +++++++++++++++++++++++++++++++++++++++
>   target/loongarch/ramdisk | Bin 0 -> 3077952 bytes
>   target/loongarch/vmlinux | Bin 0 -> 24565536 bytes
>   3 files changed, 134 insertions(+)
>   create mode 100644 target/loongarch/ramdisk
>   create mode 100755 target/loongarch/vmlinux

Wang Xuerui has already mentioned this, but let's make sure not to include such large test 
binaries in future.

The proper place for this is in a stable url, which could then either be referenced in the 
documentation.  But even better than that would be an acceptance test entry -- see 
tests/acceptance/boot_linux_console.py.

> +  2.Modify the kernel code for the tcg. Modifications are listed later. I will try to
> +    commit to the kernel host.

This sounds like a bug in the qemu emulation of the device or boot environment.


r~

