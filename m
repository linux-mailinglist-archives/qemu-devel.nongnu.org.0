Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0D94686D8
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 18:56:50 +0100 (CET)
Received: from localhost ([::1]:49444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtZHE-0007cb-Cp
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 12:56:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mtZFL-0006JR-Bd
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 12:54:51 -0500
Received: from [2a00:1450:4864:20::334] (port=45770
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mtZFA-0006sI-AC
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 12:54:51 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so4651509wme.4
 for <qemu-devel@nongnu.org>; Sat, 04 Dec 2021 09:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fpdPUV74XzbskA39s8KAtlYYXR9mqwMr7fIuv8IUaQ8=;
 b=F5IeOLrz0zW4JFN809KaOG2b4OGJcQsbLnBDsuHqlcw8SkPDCSHLytxS/HQH/lIFYn
 XkrX/hculcSa/6K5CoHgqIR1Xky+PBd5Dy206CbMpgmyOA9Ppg67eP4G53RgtPqreoqq
 xUv/6AriWMyKFUtQBiG947QQoh7kcvorQ3TxLTBaRRaQcCsQh4QBZ99njXihPvh8RTkx
 SCfpX/16zG33IoJ1t8Uqvyy4TTTEMiTrlIUYpYcbaymIEOEFsh+VnwKR42ZMwP96++7d
 5MIcMTcnt8PdHpizCBpZmxMU0PbH6tti+XGfBOL7NFx8/JvJEQCFCvh1BMuhtNgKBhM8
 YrSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fpdPUV74XzbskA39s8KAtlYYXR9mqwMr7fIuv8IUaQ8=;
 b=4RRDRViukbSb61ZqY0HXQxnH0LsCiZBUUNYa8JZD0hQyeGosrVrabDrJsHIUm8U2z4
 MG1CdlXapZZqV5s3TQxzYOQGLw945DvZ3JcNsVNWdFHZuVlBZAeEOJbRB3NlAT/PgsrM
 rgla+WN6z+qV0RfWlw7L2sjfSDMdYZKu2DCKplAiwn0eEMMDTWZjVwNNgKLWbWII2iBu
 PYcP/SwkuqrQMCaYQ+oES8+rKw1AKGldO8+NJ9KwxUqRqTWV6wOJEcRJYgGVHYUiMf2b
 u/2uRPO7GNMyvn8fcpAfh44EAliS3RMzv4eywDzSC9GL4tHPxjFNgVHiSMoJxzBlPgsX
 O1Ng==
X-Gm-Message-State: AOAM5324kwfkJgv1iDh/Dp5mulDCaeJ40vXRotfAaIdCJvx1sTtN7F2Y
 s2/gu0o/a0xbgZks0kPZBic=
X-Google-Smtp-Source: ABdhPJy6mlRzGLaYhdQnHHAcEfyN2je35zKPPwmtb6B7T3IWazCno77V6TOg73f2M3OIl+xwXDeVzA==
X-Received: by 2002:a05:600c:4f48:: with SMTP id
 m8mr25347540wmq.50.1638640478863; 
 Sat, 04 Dec 2021 09:54:38 -0800 (PST)
Received: from [192.168.43.238] (168.red-176-83-218.dynamicip.rima-tde.net.
 [176.83.218.168])
 by smtp.gmail.com with ESMTPSA id p8sm6028690wrx.25.2021.12.04.09.54.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Dec 2021 09:54:38 -0800 (PST)
Message-ID: <88460ee5-3fc3-b14a-8e37-0e8ba99c115e@amsat.org>
Date: Sat, 4 Dec 2021 18:54:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH v3 22/27] hw/loongarch: Add some devices support for
 3A5000.
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
 <1638619645-11283-23-git-send-email-yangxiaojuan@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <1638619645-11283-23-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-1.011,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 i.qemu@xen0n.name, mark.cave-ayland@ilande.co.uk, laurent@vivier.eu,
 peterx@redhat.com, f4bug@amsat.org, alistair.francis@wdc.com,
 maobibo@loongson.cn, pbonzini@redhat.com, chenhuacai@loongson.cn,
 alex.bennee@linaro.org, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/21 13:07, Xiaojuan Yang wrote:
> 1.Add uart,virtio-net,vga and usb for 3A5000.
> 2.Add irq set and map for the pci host. Non pci device
> use irq 0-16, pci device use 16-64.
> 3.Add some unimplented device to emulate guest unused
> memory space.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>  hw/loongarch/Kconfig            |  8 +++++
>  hw/loongarch/loongson3.c        | 63 +++++++++++++++++++++++++++++++--
>  hw/pci-host/ls7a.c              | 42 +++++++++++++++++++++-
>  include/hw/intc/loongarch_ipi.h |  2 ++
>  include/hw/pci-host/ls7a.h      |  4 +++
>  softmmu/qdev-monitor.c          |  3 +-
>  6 files changed, 117 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
> index 468e3acc74..9ea3b92708 100644
> --- a/hw/loongarch/Kconfig
> +++ b/hw/loongarch/Kconfig
> @@ -1,5 +1,13 @@
>  config LOONGSON3_LS7A
>      bool
> +    imply VGA_PCI
> +    imply VIRTIO_VGA
> +    imply PARALLEL

Is there really a parallel port? If so, maybe you forgot to
instantiate it.

