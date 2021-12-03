Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4151467E8B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 20:56:20 +0100 (CET)
Received: from localhost ([::1]:40968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtEfL-0006o6-QF
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 14:56:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mtEXI-0007oS-OC
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 14:48:00 -0500
Received: from [2607:f8b0:4864:20::532] (port=39689
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mtEXG-0001As-Ia
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 14:48:00 -0500
Received: by mail-pg1-x532.google.com with SMTP id r5so4088500pgi.6
 for <qemu-devel@nongnu.org>; Fri, 03 Dec 2021 11:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=lN0Pzf3oUSp10ZgShGkOb4BQ+bLRutqeBojwkOItwlc=;
 b=oSQxqAGQxU5smeVW1qKA/PAjlWuJVvXvErUNX1aCKy0+dsG44FG/RN4uzkdfIj9Gwy
 MXxAlhlch+BOQfiXEUQ3VweymH/1lFLWLKwsPWQelVrnPqRL1dauwR1LfeT9m2c05up1
 2stF8TF/58EN/0/C1BTbzJ5JgGydcEUf1RbBBUujMjfOW2AfhBhaFe1lzwuINBEF5gG1
 OuVtT8J/S6rKqRob3/rvbwXaE+ExgVvs1Lqj1F3nNm1iWXME5jq3pkTieCgV2awyeOD0
 hCHXIxSOi9seLhIkUZOMY8PkBVjy7k6itbqYwn2i/26+s4gStQHaseirq36Qxmf9wvrd
 af0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lN0Pzf3oUSp10ZgShGkOb4BQ+bLRutqeBojwkOItwlc=;
 b=fTtGjsf81T7oeYgZ65aWQCSJ+0Aqa91UeYcVdqW1LtV3yTcx7X4fbY3kKXv96qPC6+
 JApwSfuU4TlyMPLVx2J8FuI0Ls2/rKdmN7PwrVaJlm5tzKCoz7N2oHyDkn0EnKCNTZE0
 MVkK40OlarfftUdynAGJM/aGUYeEzhoixwo5vE83/s3e4d4GvbxAOZJPBgAJ8xszAa66
 GDexBvltgR3UGeiJFk02bXJ2WGfg+VqQHNiT/cBb3UKGNYwzt7wbapAJBzkTJStIwM2i
 NlHFxdKANC4Lw3vJVmgIj837NoiB8m/MZf2vRlGphHva1QFKKgymgld1KdUD60LTEKoc
 wBNQ==
X-Gm-Message-State: AOAM531sMKb+wH5LX6El4W0RiaoIEsP3aeQBsFrENAlWWjfLIeCHHPcW
 H9d+KA9FE5pNT9EcFsYde4PAMgzq7s2SRw==
X-Google-Smtp-Source: ABdhPJwXWVEWAMMqZA1MUiyTqGa4T1OO+0IwhV26/zpbv/BA54JuuxRH3LRqO76j/pMXQg+r+ROqNA==
X-Received: by 2002:a63:4b54:: with SMTP id k20mr5756788pgl.474.1638560872963; 
 Fri, 03 Dec 2021 11:47:52 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id f19sm4101707pfv.76.2021.12.03.11.47.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 11:47:52 -0800 (PST)
Subject: Re: [PULL 0/2] Seabios 20211203 patches
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20211203085552.347186-1-kraxel@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <220734b2-83c9-ab92-6837-0d3291e618ea@linaro.org>
Date: Fri, 3 Dec 2021 11:47:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211203085552.347186-1-kraxel@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.938,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 12/3/21 12:55 AM, Gerd Hoffmann wrote:
> The following changes since commit a69254a2b320e31d3aa63ca910b7aa02efcd5492:
> 
>    Merge tag 'ide-pull-request' of https://gitlab.com/jsnow/qemu into staging (2021-12-02 08:49:51 -0800)
> 
> are available in the Git repository at:
> 
>    git://git.kraxel.org/qemu tags/seabios-20211203-pull-request
> 
> for you to fetch changes up to 3bc90ac567f64fbe07b17b1174c85ec8a3e17d94:
> 
>    seabios: update binaries to 1.15.0 (2021-12-03 09:54:11 +0100)
> 
> ----------------------------------------------------------------
> seabios: update from snapshot to final 1.15.0 release (no code changes).
> 
> ----------------------------------------------------------------
> 
> Gerd Hoffmann (2):
>    seabios: update submodule to 1.15.0
>    seabios: update binaries to 1.15.0
> 
>   pc-bios/bios-256k.bin             | Bin 262144 -> 262144 bytes
>   pc-bios/bios-microvm.bin          | Bin 131072 -> 131072 bytes
>   pc-bios/bios.bin                  | Bin 131072 -> 131072 bytes
>   pc-bios/vgabios-ati.bin           | Bin 39424 -> 39424 bytes
>   pc-bios/vgabios-bochs-display.bin | Bin 28672 -> 28672 bytes
>   pc-bios/vgabios-cirrus.bin        | Bin 39424 -> 39424 bytes
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


