Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 457AE42ACFF
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 21:09:38 +0200 (CEST)
Received: from localhost ([::1]:46300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maN9d-00030Z-6k
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 15:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maN5x-0000jn-En
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 15:05:52 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:54919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maN5v-0002BB-Pd
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 15:05:49 -0400
Received: by mail-pj1-x1030.google.com with SMTP id np13so362642pjb.4
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 12:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=kDhtejP4ma4Z730w3NCx1iv06qPAtdt0h6DdlAwYf4I=;
 b=iTz9N4fFUAG4F8HqdZmKMYLQ184wbNd2HODBoXMSzBE8NXXWYAfYFgZc5QixycZQQV
 +LKZb3iTMz8m2pMiau4FAfNZ59qu/47ZxYfqzBv2B5p+RDHfJaxljhYK6V/REvhQmFZW
 tgoT0CeDP9SXXtlFW2/pznUrcfY6/6FlJM6cIESMJra1d4ycvQQmDU3AwheBuiNB8vWs
 KYtbCraRv07Qt5XHJ0VaFofYJjO7CU9VCaGk9ZcR3BnNqJ8T31rUOYBJOoaDnYlEYsaH
 F2pft7HvGvTZaY2LAbTC2E7Wq0ff6ziW5jCkpQSnqwiYkntaMHOxY3PbXekrXKWBVT/+
 IDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kDhtejP4ma4Z730w3NCx1iv06qPAtdt0h6DdlAwYf4I=;
 b=NISGkUuuNepF9xKe5S3VNtKA4uf0qSYp3i6Cz4F3UYpmuqXsIdwMP8YeujcY3Y5Qrf
 dEFx+g4E1L/epQ+dH4gzlGqRTq1LyrjLGkKP/7W+Lkt3JCWq+AGNDaQ1+U1+Q6Sy2Ux2
 Cp690c5/OiHx8M0u8KjeyMp9v1QSWFcnBR/Hs544TjkrkeEhacHuEScjbOO7gIJ6aVMz
 7/1gjq7mO8KxalDTU9Gff4sXpT+Exnh3aZTA2qzWelfe4ZxO+eBUHvkfRjlKf+wSEoGB
 HySMm62ILlymmvJuQZFJMwjh00VKHJq9fc/XDsbs+2zxqanP0bLVDlSxDGl+eoLHYAYa
 ku4Q==
X-Gm-Message-State: AOAM531Gx2ErswhckEDyypyS9c8jZMjN6SjN6hOcl7i3kUrZ0OcZjr1o
 8OwHPHQM9EdF407Q951R5ib9EZsCgKWb/Q==
X-Google-Smtp-Source: ABdhPJzue1b6zNq13vpmSw+BJ0OUUyjqW0ihTnlOlhi4/wcLh/1tkN/pvm4CR8K81FGhVPpuuNx1Fw==
X-Received: by 2002:a17:90a:a386:: with SMTP id
 x6mr8056925pjp.56.1634065546179; 
 Tue, 12 Oct 2021 12:05:46 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w11sm12047577pgf.5.2021.10.12.12.05.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 12:05:45 -0700 (PDT)
Subject: Re: [PULL 0/1] target/hppa update
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20211012190357.528140-1-richard.henderson@linaro.org>
Message-ID: <8b8cd79f-886a-3ecc-e1ad-6480d5a320a7@linaro.org>
Date: Tue, 12 Oct 2021 12:05:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012190357.528140-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 12:03 PM, Richard Henderson wrote:
> The following changes since commit c09124dcb8401a0d635b4a52b295e9b3fc12392a:
> 
>    Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request' into staging (2021-10-11 08:15:32 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-hppa-20211012
> 
> for you to fetch changes up to e770b8cf76083cc51497b854e73f0a9bb92d1bc7:
> 
>    pc-bios: Update hppa-firmware.img (2021-10-12 09:27:28 -0700)
> 
> ----------------------------------------------------------------
> seabios-hppa update
> 
> ----------------------------------------------------------------
> Helge Deller (1):
>        pc-bios: Update hppa-firmware.img
> 
>   pc-bios/hppa-firmware.img | Bin 785696 -> 757144 bytes
>   roms/seabios-hppa         |   2 +-
>   2 files changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

r~


