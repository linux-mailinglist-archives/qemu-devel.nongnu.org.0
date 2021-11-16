Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E02F453889
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 18:29:47 +0100 (CET)
Received: from localhost ([::1]:36926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn2HC-00055p-8z
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 12:29:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mn2Ft-0003qy-Cn
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 12:28:25 -0500
Received: from [2a00:1450:4864:20::433] (port=36755
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mn2Fr-0004tv-Rz
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 12:28:25 -0500
Received: by mail-wr1-x433.google.com with SMTP id s13so39122870wrb.3
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 09:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YRydQ9nejDm7X90ZltLhYxKD9kPB2Yfk48m8AchSCFc=;
 b=H+N4Fb2fcD49vLDZMLsq/6rUS/WIufA3naex7FAFkE16TT5HpL/xe7Q5vGCYDBnaPj
 xKBep1Mv8fPu7eT6hGXbt32Ln9VqgsUkCHvxR4Tv/8DvpHzJXM2KPTbmwzUkPFTGskma
 8kmm+FniXF1J7j51slfcInwG+OMVltGF3au87EvZs1Wn3075hza3XQnL+MKckN0u41it
 bnU66qSvXOr/eMJuEF+iZgrPdYuXK1n8ZtrneRp2L7J9a0wVQjg6xgEplEA/V7dGBY3T
 Gv1Ech7YpUrv8p0eE7fvGnhwQk1wX9DWTN6oTL3BaEiiEo0xQ1PuRCR+P/IHuuYvq7yE
 EZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YRydQ9nejDm7X90ZltLhYxKD9kPB2Yfk48m8AchSCFc=;
 b=0/2iUXPwIpXIJOxB/edfyXcdDNFNLXBRRPEQ+VzEzFDHZ9pgqvWixO0v4Lx3/3p80L
 eVtAQC9tfr2ItutFQoREpcmw0K2LHRsOxw16aICdm6GkruWjAd6hrZV4TuPHcRlKPSYf
 C5C2ppz/QcgmBDQTSUR4ymk6DCc0tBXTATnbf61uN7fLYbwbl3U7I4NWfC5MdO0RFSZz
 DmeUTgBS0j0FgJOHc+W0w09fslRBRj1pwOJholvhyHAzB/5Ic98oPgto6F7zchSKjoSE
 zdzSypY9wyp3GLB/ieAiqahMx3sQLs/PkGxfPGnX7dVa/a+KNATAftIFfXrCC+sweOZP
 XuPg==
X-Gm-Message-State: AOAM532q88gU7mKI7r4GHleh6k0izfvQmJ0gN52TtAt9mKM/M5tZ7jf4
 i+A0/NKYmCL8T35Id+Rf0k1tYgOgL9FTnZ3CyNc=
X-Google-Smtp-Source: ABdhPJzjSg2uQFvXzlyuKq+nR+fnoaqQ0PXLA1n2fDP1E9auhCH5o14fzxJQAFaAWhzsh2DJVIibkg==
X-Received: by 2002:a5d:604b:: with SMTP id j11mr11737215wrt.22.1637083702265; 
 Tue, 16 Nov 2021 09:28:22 -0800 (PST)
Received: from [192.168.8.105] (145.red-37-158-173.dynamicip.rima-tde.net.
 [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id z12sm18074012wrv.78.2021.11.16.09.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 09:28:21 -0800 (PST)
Subject: Re: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>
References: <20211114005111.515543-1-aik@ozlabs.ru>
 <735870db-c919-5f85-859a-eddbf507005b@kaod.org>
 <e0d2a9bd-1c63-7033-7daf-271fea702d66@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5ac387fa-8b6e-7d77-d425-a26f453bcc94@linaro.org>
Date: Tue, 16 Nov 2021 18:28:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <e0d2a9bd-1c63-7033-7daf-271fea702d66@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.446,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 6:12 PM, Philippe Mathieu-Daudé wrote:
> On 11/16/21 17:46, Cédric Le Goater wrote:
>> On 11/14/21 01:51, Alexey Kardashevskiy wrote:
>>> The following changes since commit
>>> d139786e1b3d67991e6cb49a8a59bb2182350285:
>>>
>>>     ppc/mmu_helper.c: do not truncate 'ea' in
>>> booke206_invalidate_ea_tlb() (2021-11-11 11:35:13 +0100)
>>>
>>> are available in the Git repository at:
>>>
>>>     git@github.com:aik/qemu.git tags/qemu-slof-20211112
>>>
>>> for you to fetch changes up to 73944a4bf4ab259b489af8128b4aec525484d642:
>>>
>>>     pseries: Update SLOF firmware image (2021-11-13 14:47:56 +1100)
>>>
>>> ----------------------------------------------------------------
>>> Alexey Kardashevskiy (1):
>>>         pseries: Update SLOF firmware image
>>>
>>>    pc-bios/README   |   2 +-
>>>    pc-bios/slof.bin | Bin 991744 -> 991920 bytes
>>>    roms/SLOF        |   2 +-
>>>    3 files changed, 2 insertions(+), 2 deletions(-)
>>
>> Queued for 7.0.
> 
> I am not sure this is a good idea, as this will make bisection
> painful over the release tag.

It is my understanding that Cedric will rebase for the mainline PR.  At least that's how 
David was handling subsystem pulls.


r~

