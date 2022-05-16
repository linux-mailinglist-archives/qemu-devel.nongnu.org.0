Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C08B528DA2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 21:04:33 +0200 (CEST)
Received: from localhost ([::1]:32930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqg19-000347-Ld
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 15:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqfyq-0001Zm-4R
 for qemu-devel@nongnu.org; Mon, 16 May 2022 15:02:08 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:37509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqfyo-0005SW-At
 for qemu-devel@nongnu.org; Mon, 16 May 2022 15:02:07 -0400
Received: by mail-pl1-x62b.google.com with SMTP id m12so15342659plb.4
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 12:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SFiVYv/IbqDpwN1LgOKQLkynYUet5czih9ddTHYgs/w=;
 b=vsaIyduUv5d5noR/+vmCX/eIpdNPf2LKHATFTuvjH/sw44W8gqSpGUbB50GubikcTK
 YXzJ24yfWqYKQykrIv+OiDsFUz50Es285JuKhbOZvcqLnUF1SZHevnm3wdlNm8IKLgWX
 KfOVSgJjZcguEsMFVADJYKWHyfioj0Fhi1hBdsC5Wl2+EeqdNZDHglkpiCt3/Y9wrrRF
 lUffx+bh+VgGXS7XcmV/eZYDgBtg6YmzlVuJcHSorWNZbA51wSMWE5DP7+hK9EY36mOj
 lkWYE5iBs9BGLOTanzR4LWhAqdL07byrzo1l9lT7T/250+e7y+5G703ByptkN+sppD5B
 awVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SFiVYv/IbqDpwN1LgOKQLkynYUet5czih9ddTHYgs/w=;
 b=Pjc8s+3d+rH9xxh6V7B5f/6Yrg3wXPbi/hxpezvIDAl7zGQxExwXEA7eWVgAICgmJL
 08HLNffo7Zje5kLpg7Rf4GbGUHl0hr42yiVqWt13iUHw6NFSnK0ajne/ArFD4nKO5KOW
 YvsCeorrPnMnIhYSkoOIIsyX4sLieD26OkgfvzjztVihIl/CwHHBQnYg6LofnfwuC7nc
 33j6Y4JrYKauUNZ+c0Tm6BPv8KrjOzHYiV6cr5Ri1M9K2k4CWUPahKkWf20BmrliIltf
 Kh4SJ/8ttsZszuaJ5tPQ/jZc7MNxXsBdSz44Q/qmWaDX7iO+NPFS409WMPlV5w5wPS5u
 14sg==
X-Gm-Message-State: AOAM530aQCsNoScqpJHI+C3l99r9k/+OIUpTdLRhHy1AKVP/tTyfMShq
 Ic7KAigZzYb+kbyd3jfgs7Bm1w==
X-Google-Smtp-Source: ABdhPJy/BA6gbEV/ytRgdoWyb/a0eGhmLskgL1FQANhXCd5MWPd+VgEwYHm6mi1vKWZx677song2Jg==
X-Received: by 2002:a17:902:7586:b0:15e:c2fe:bad0 with SMTP id
 j6-20020a170902758600b0015ec2febad0mr18204753pll.72.1652727721642; 
 Mon, 16 May 2022 12:02:01 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b0015e8d4eb27csm7496801plg.198.2022.05.16.12.01.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 12:01:58 -0700 (PDT)
Message-ID: <e8cb0309-3a0f-7493-59ea-e0ac1b54c41c@linaro.org>
Date: Mon, 16 May 2022 12:01:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/91] virtio,pc,pci: fixes,cleanups,features
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20220516095448.507876-1-mst@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/16/22 03:35, Michael S. Tsirkin wrote:
> The following changes since commit 9de5f2b40860c5f8295e73fea9922df6f0b8d89a:
> 
>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-05-12 10:52:15 -0700)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> 
> for you to fetch changes up to baebc5a4ab3ceef940887e3cc2f1d0e48cee53dc:
> 
>    virtio-net: don't handle mq request in userspace handler for vhost-vdpa (2022-05-16 04:38:40 -0400)
> 
> ----------------------------------------------------------------
> virtio,pc,pci: fixes,cleanups,features
> 
> most of CXL support
> virtio introspection commands
> fixes, cleanups all over the place
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Fails to build:

https://gitlab.com/qemu-project/qemu/-/jobs/2463276202
https://gitlab.com/qemu-project/qemu/-/jobs/2463276291

libqemu-ppc64-softmmu.fa.p/hw_virtio_virtio.c.o: In function `qmp_decode_features':
/builds/qemu-project/qemu/build/../hw/virtio/virtio.c:4167: undefined reference to `gpu_map'
/builds/qemu-project/qemu/build/../hw/virtio/virtio.c:4167: undefined reference to `gpu_map'



r~

