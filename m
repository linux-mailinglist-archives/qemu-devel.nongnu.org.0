Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2B7437E1D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 21:10:27 +0200 (CEST)
Received: from localhost ([::1]:42524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdzvt-0008Kp-QI
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 15:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdzuc-0007ar-5a
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 15:09:06 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdzua-0005sR-3M
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 15:09:05 -0400
Received: by mail-pl1-x62e.google.com with SMTP id v20so3406993plo.7
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 12:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=CLvayFalaP7vCuCG5qpmOWbrTKCoNJ204C6jbHP1jDM=;
 b=ze9/C3lTKe/rEH8oV0mBoHz30U32aurY31Jj4dhsnvOfL1f/FR0Pp5RMrz752mnR23
 mQnTYe9hQkMbSlGJkaihAzqwtgcHKhu8p794cwVmM2LX3yLXqqm7FqHFqm8L+n2fd00x
 iZoatcrw2PicbSCMvRQY8RrVEVlygejpdH9vpio3oPYqsvSn3fptcEEMFn/fCdRgs/7S
 Pc+hCaR+GUhhBzYMIERszZ/I+8KiuTtPKjkfbUIJWEB9wA3kDHt4jnP5uRJk+7C1P17o
 Wy57/SKmENeflW0BYuBHlDVUyIdqBDZTCwTL8sz9KElPxYu8EWF8xT6QxdxUDq2yvGl3
 Kyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CLvayFalaP7vCuCG5qpmOWbrTKCoNJ204C6jbHP1jDM=;
 b=RJbrnPX6b4A0PDZ6Q+SZeeHbxRmVG2XLCcTI13gDCR65pgknpVjVSAZQnTgcMtXIkW
 k9AO/YbWdJ1kjYTk3NU0cUzaXu6s8a1VPHErdul/FtAQ38u6uGgBSPwnI1dnIv3u/jgY
 4sBVRsSw2vQU6p5Lqc9AVxxwr0Bdn95rvCjfTWnsjo4vGQJUULapHzq67rzEjGOv/2pm
 Oik9w7PfhdONNlUFOHZbXR9dqZU9x1grJ2Vblv+ew2LqAauMg+y8KPNQS+zfl9IGVYGe
 5ISeytZ1Memv147T6Pirt0ScPuTE4kQFsT279NmAjtRSaLxhXL3Jg2N+ZpFNEwo3Ew7u
 bpQA==
X-Gm-Message-State: AOAM533TGwqLYmr1FeJBf4xvg9l1u52v4JZTYPsdbxm3lu4Yr0l4rjOa
 aZ2go92nN+5SIGT35vr3Ps9Qwj2s4yRunQ==
X-Google-Smtp-Source: ABdhPJxPOwXO4VcSjaFJFoajz2vkmLX8EhSJZX+Vp0mj77PQoQd/cYU0K+gw9Z2+84C72PQvqiyiOw==
X-Received: by 2002:a17:903:41c2:b0:13f:f26:d6b9 with SMTP id
 u2-20020a17090341c200b0013f0f26d6b9mr1716188ple.14.1634929741568; 
 Fri, 22 Oct 2021 12:09:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c24sm10313464pgj.63.2021.10.22.12.09.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 12:09:01 -0700 (PDT)
Subject: Re: [PULL 0/2] Seabios 20211022 patches
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20211022121420.2636991-1-kraxel@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4b6e2bae-d501-eea5-c379-32314971790c@linaro.org>
Date: Fri, 22 Oct 2021 12:08:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211022121420.2636991-1-kraxel@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.742,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/22/21 5:14 AM, Gerd Hoffmann wrote:
> The following changes since commit 4c127fdbe81d66e7cafed90908d0fd1f6f2a6cd0:
> 
>    Merge remote-tracking branch 'remotes/rth/tags/pull-arm-20211021' into staging (2021-10-21 09:53:27 -0700)
> 
> are available in the Git repository at:
> 
>    git://git.kraxel.org/qemu tags/seabios-20211022-pull-request
> 
> for you to fetch changes up to 9fb3fcfce512da58cd048eaefd293e1d3f513de2:
> 
>    update seabios binaries (2021-10-22 12:32:29 +0200)
> 
> ----------------------------------------------------------------
> seabios: update to master branch snapshot.
> 
> ----------------------------------------------------------------
> 
> Gerd Hoffmann (2):
>    update seabios to master branch snapshot
>    update seabios binaries
> 
>   pc-bios/bios-256k.bin             | Bin 262144 -> 262144 bytes
>   pc-bios/bios-microvm.bin          | Bin 131072 -> 131072 bytes
>   pc-bios/bios.bin                  | Bin 131072 -> 131072 bytes
>   pc-bios/vgabios-ati.bin           | Bin 39424 -> 39424 bytes
>   pc-bios/vgabios-bochs-display.bin | Bin 28672 -> 28672 bytes
>   pc-bios/vgabios-cirrus.bin        | Bin 38912 -> 39424 bytes
>   pc-bios/vgabios-qxl.bin           | Bin 39424 -> 39424 bytes
>   pc-bios/vgabios-ramfb.bin         | Bin 28672 -> 28672 bytes
>   pc-bios/vgabios-stdvga.bin        | Bin 39424 -> 39424 bytes
>   pc-bios/vgabios-virtio.bin        | Bin 39424 -> 39424 bytes
>   pc-bios/vgabios-vmware.bin        | Bin 39424 -> 39424 bytes
>   pc-bios/vgabios.bin               | Bin 38912 -> 38912 bytes
>   roms/seabios                      |   2 +-
>   13 files changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

r~


