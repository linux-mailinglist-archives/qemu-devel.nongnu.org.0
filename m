Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE175F6A5B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:13:51 +0200 (CEST)
Received: from localhost ([::1]:36562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogSZK-0005lI-8d
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:13:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ogSVv-0001Cd-Mr
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:10:25 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:47020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ogSVt-0004F7-3C
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:10:19 -0400
Received: by mail-pf1-x430.google.com with SMTP id y8so2272527pfp.13
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=1LoMlyVE8CzThCTOT887LOx78WStN/+cMePcMwv13Us=;
 b=Q5B98w5Uwlht7fcBxcPPUQW8arPXhZqAx3mMEA+BNBthJWEQ1IvD6NNPWVr83Li/Jh
 vLfS8O3oFTCX5+goU4b6X8BNhTJl/rBcLB88aZozyFE6zrawTrox2llOu8hdgI7FWCsp
 SE8VZGjZwYkBNlRVw4qJsrPQbdKUVo6Cl5apKAd6+8iI7bKE4bzKWVODY1FNR83NbZfi
 5D6REZBNS4b4KkbWVuq/uAegCe4WDoClNhEZxT8R1bJ75sg1fX5e236wN1ui8TTPdeFW
 3PgyYhuIaOJjV5CPeEmSJz6Y7gUNOy9h0rJve/DkXQ32I/xQ2Tid6gCsKgxZraHJvZ2U
 Aszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1LoMlyVE8CzThCTOT887LOx78WStN/+cMePcMwv13Us=;
 b=I/ChJJFtIeb3x7A/RplQ7k+zYqIjyr7mNu93unzntzE8dyuQqmz/WFgQI+kHV39nly
 zSolHo/iLG7saGmMG5n6BcBqJYBL+dgwcDI4wZuNM4KazcuqvA77yPp65mnple+EapPZ
 x/mz43fk7Iaf8PA+xv0XfGw1GNVOalXPM5EtMOjJ6wfk8f97px4YMxtoW2quwQLQ1GPA
 C66sQlPFtj+nAi6WO2ARCKUlWllmfFPzRkpREE7npvKkpNl7fT4ajQBsHzv5XwOlIr25
 4JbsLjIWEIebOdHvLKZfzvLaLZ/yCbGUx4fvY7zzIFo3W3FtXuWRIDlZTApPpJVjP7a6
 Cdxw==
X-Gm-Message-State: ACrzQf09NY70a2qc47r1EXA61YWXpHxtPjisQZbI6Iu5x8zZwdYdSxwl
 WPKppXW8EXAxqvqaP9LwNZYQ7y9G5ik=
X-Google-Smtp-Source: AMsMyM7orU/fMg5AWAvcRo5a+FmG6kpTiK6jcJlQV6dx4J25dqaD5w2w4LJoZz4KVyA3u0ooJMKwFw==
X-Received: by 2002:a63:451a:0:b0:439:246e:807e with SMTP id
 s26-20020a63451a000000b00439246e807emr278441pga.347.1665069015486; 
 Thu, 06 Oct 2022 08:10:15 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a170903230100b00177efb56475sm12597001plh.85.2022.10.06.08.10.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 08:10:14 -0700 (PDT)
Message-ID: <27e666ae-0a91-1843-8eb0-c816ab261eb1@amsat.org>
Date: Thu, 6 Oct 2022 17:10:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH] gitmodules: recurse by default
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221006113906.179963-1-mst@redhat.com>
In-Reply-To: <20221006113906.179963-1-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.435,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Hi Michael,

On 6/10/22 13:39, Michael S. Tsirkin wrote:
> The most commmon complaint about submodules is that

Typo "common"

> they don't follow when one switches branches in the
> main repo. Enable recursing into submodules by default
> to address that.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   .gitmodules | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)

We have 3 kinds of submodule (or more?):
1/ required to *build* QEMU
2/ required to *test* QEMU
3/ only here for satisfies license of firmware blobs shipped with QEMU.

IIUC, long-term we want to move 3/ in another repository.

Could we only set "recurse=true" for 1/ ?

What is your use-case? Do we need it also for 2/ ?

> diff --git a/.gitmodules b/.gitmodules
> index aedd9a03d4..5f32332aff 100644
> --- a/.gitmodules
> +++ b/.gitmodules
> @@ -1,69 +1,92 @@
>   [submodule "roms/seabios"]
>   	path = roms/seabios
> +	recurse = true
>   	url = https://gitlab.com/qemu-project/seabios.git/
>   [submodule "roms/SLOF"]
>   	path = roms/SLOF
> +	recurse = true
>   	url = https://gitlab.com/qemu-project/SLOF.git
>   [submodule "roms/ipxe"]
>   	path = roms/ipxe
> +	recurse = true
>   	url = https://gitlab.com/qemu-project/ipxe.git
>   [submodule "roms/openbios"]
>   	path = roms/openbios
> +	recurse = true
>   	url = https://gitlab.com/qemu-project/openbios.git
>   [submodule "roms/qemu-palcode"]
>   	path = roms/qemu-palcode
> +	recurse = true
>   	url = https://gitlab.com/qemu-project/qemu-palcode.git
>   [submodule "roms/sgabios"]
>   	path = roms/sgabios
> +	recurse = true
>   	url = https://gitlab.com/qemu-project/sgabios.git
>   [submodule "dtc"]
>   	path = dtc
> +	recurse = true
>   	url = https://gitlab.com/qemu-project/dtc.git
>   [submodule "roms/u-boot"]
>   	path = roms/u-boot
> +	recurse = true
>   	url = https://gitlab.com/qemu-project/u-boot.git
>   [submodule "roms/skiboot"]
>   	path = roms/skiboot
> +	recurse = true
>   	url = https://gitlab.com/qemu-project/skiboot.git
>   [submodule "roms/QemuMacDrivers"]
>   	path = roms/QemuMacDrivers
> +	recurse = true
>   	url = https://gitlab.com/qemu-project/QemuMacDrivers.git
>   [submodule "ui/keycodemapdb"]
>   	path = ui/keycodemapdb
> +	recurse = true
>   	url = https://gitlab.com/qemu-project/keycodemapdb.git
>   [submodule "roms/seabios-hppa"]
>   	path = roms/seabios-hppa
> +	recurse = true
>   	url = https://gitlab.com/qemu-project/seabios-hppa.git
>   [submodule "roms/u-boot-sam460ex"]
>   	path = roms/u-boot-sam460ex
> +	recurse = true
>   	url = https://gitlab.com/qemu-project/u-boot-sam460ex.git
>   [submodule "tests/fp/berkeley-testfloat-3"]
>   	path = tests/fp/berkeley-testfloat-3
> +	recurse = true
>   	url = https://gitlab.com/qemu-project/berkeley-testfloat-3.git
>   [submodule "tests/fp/berkeley-softfloat-3"]
>   	path = tests/fp/berkeley-softfloat-3
> +	recurse = true
>   	url = https://gitlab.com/qemu-project/berkeley-softfloat-3.git
>   [submodule "roms/edk2"]
>   	path = roms/edk2
> +	recurse = true
>   	url = https://gitlab.com/qemu-project/edk2.git
>   [submodule "slirp"]
>   	path = slirp
> +	recurse = true
>   	url = https://gitlab.com/qemu-project/libslirp.git
>   [submodule "roms/opensbi"]
>   	path = roms/opensbi
> +	recurse = true
>   	url = 	https://gitlab.com/qemu-project/opensbi.git
>   [submodule "roms/qboot"]
>   	path = roms/qboot
> +	recurse = true
>   	url = https://gitlab.com/qemu-project/qboot.git
>   [submodule "meson"]
>   	path = meson
> +	recurse = true
>   	url = https://gitlab.com/qemu-project/meson.git
>   [submodule "roms/vbootrom"]
>   	path = roms/vbootrom
> +	recurse = true
>   	url = https://gitlab.com/qemu-project/vbootrom.git
>   [submodule "tests/lcitool/libvirt-ci"]
>   	path = tests/lcitool/libvirt-ci
> +	recurse = true
>   	url = https://gitlab.com/libvirt/libvirt-ci.git
>   [submodule "subprojects/libvfio-user"]
>   	path = subprojects/libvfio-user
> +	recurse = true
>   	url = https://gitlab.com/qemu-project/libvfio-user.git


