Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1D9534FF2
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 15:32:44 +0200 (CEST)
Received: from localhost ([::1]:44388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuDbV-0005W6-6g
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 09:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuDWw-0003SB-1W; Thu, 26 May 2022 09:27:58 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:44989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuDWu-0008F5-4D; Thu, 26 May 2022 09:27:57 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-f2cbceefb8so2135696fac.11; 
 Thu, 26 May 2022 06:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Vg/XE++AFxAL7hVrWByschj6Dia4LmCmI6HG8jqugIQ=;
 b=g0oAr592c+C3m8aNq3PeT9sqqyMhmQzIsD1Z9IVNzeaBFPDOIbtRhPqVXKdn2WNNAt
 xGjH5cri25nXA/aaXYGY6/Ose0Qg/1/j401lDj3byYOTmbreoTx+ZLatQcrFnL5N33p7
 CT6PCh6eurhEJs7IXpTq4tMEXMhctIpi1SIc7rjWmdrSmXjywL82kBFEVKxrIbXMK2Tb
 ev5xmGq+bWNeSOK+AhjRqRKl6jd9lxtk0I2AtezezisFILJcEFiSE42Som00PhhZl/LP
 CV+V0cuEN+fjaN6gaqT/CtCLI2fiHJHysVJIH9FJOd1ZOb3EKLoPBL5IIrlaGIGbcupZ
 Rx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Vg/XE++AFxAL7hVrWByschj6Dia4LmCmI6HG8jqugIQ=;
 b=VWVBTxKuaeFDPGw6weiFMh2ykyX7Sn2J7e0JMfz/f+juspAfvPyvKcxh3hOL1k+6C8
 vMGudzSdNEBAn+7Hknvwg9mYq8464fiUAZzTr9Yca5dARdAX+06PwByHxZqGqllv52XN
 9E84uDiKaKHUrQIbQM0p7R+pbkzwjG4r/Ha95X2sqHlQYDl3IR2FWnr7RVNkF04BEfTD
 6YAxjnz/t4TOvwWj98/W3Y9FpiZxcBm9r7CGC5d1MGJk3AIgDKQofFeqjYM+WO2qCHlr
 LFO9Cb020IMrmTcd1rtf1SWSyYau6YcufUzniBDFGHfmV97F3HtbUxdcnHQ9uvf3ipWA
 ThWA==
X-Gm-Message-State: AOAM530nybcRIj4C9f4UG1ffEP8dEjwxTFOHr/5oKpKty26ulOR5zYvb
 MYtkmqcFHXJ05CGE7C0B/jk=
X-Google-Smtp-Source: ABdhPJya4e/LPS06iJE3pqYAkQ1flXjjG+WMU6LZmBo7SjRenGnZIYk3g86KWZCSnP6UXA0cAoYcxQ==
X-Received: by 2002:a05:6870:79e:b0:e1:f5bb:4627 with SMTP id
 en30-20020a056870079e00b000e1f5bb4627mr1236372oab.74.1653571674386; 
 Thu, 26 May 2022 06:27:54 -0700 (PDT)
Received: from [192.168.10.102] (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 bi7-20020a056808188700b0032b7788af61sm622357oib.41.2022.05.26.06.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 06:27:54 -0700 (PDT)
Message-ID: <96abb644-4031-7d7f-db45-6376f8f74161@gmail.com>
Date: Thu, 26 May 2022 10:27:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PULL v2 75/86] include/hw/pci/pcie_host: Correct
 PCIE_MMCFG_SIZE_MAX
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, Cedric Le Goater <clg@kaod.org>
References: <20220516204913.542894-1-mst@redhat.com>
 <20220516204913.542894-76-mst@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220516204913.542894-76-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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

Hi,

This patch broke the boot of the sam460ex ppc machine:

qemu-system-ppc -M sam460ex -kernel ./buildroot/qemu_ppc_sam460ex-latest/vmlinux \
-device virtio-net-pci,netdev=net0 -netdev user,id=net0 -serial mon:stdio \
-nographic -snapshot
qemu-system-ppc: ../hw/pci/pcie_host.c:97: pcie_host_mmcfg_init: Assertion `size <= PCIE_MMCFG_SIZE_MAX' failed.

The reason is that it changed commit 58d5b22bbd5 ("ppc4xx: Add device models
found in PPC440 core SoCs")) in a way that it wasn't expected by the board. The
code seems to believe that, for a reason that isn't stated in the 58d5b22bbd5 commit
message, PCIE_MMCFG_SIZE_MAX must be set to 1 << 29.

I'm CCing BALATON Zoltan since he's the author of 58d5b22bbd5 and can provide context of
his initial change and why the board seems to rely on it. qemu-ppc is being CCed for
awareness of the sam460ex problem.


Zoltan, I wasn't able to amend to quickly amend the code in a way that I could
preserve the current PCIE_MMCFG_SIZE_MAX setting and make sam460ex work again.
Can you please take a look?


Thanks,


Daniel



On 5/16/22 17:55, Michael S. Tsirkin wrote:
> From: Francisco Iglesias <frasse.iglesias@gmail.com>
> 
> According to 7.2.2 in [1] bit 27 is the last bit that can be part of the
> bus number, this makes the ECAM max size equal to '1 << 28'. This patch
> restores back this value into the PCIE_MMCFG_SIZE_MAX define (which was
> changed in commit 58d5b22bbd5 ("ppc4xx: Add device models found in PPC440
> core SoCs")).
> 
> [1] PCI Express® Base Specification Revision 5.0 Version 1.0
> 
> Signed-off-by: Francisco Iglesias <frasse.iglesias@gmail.com>
> Message-Id: <20220411221836.17699-3-frasse.iglesias@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   include/hw/pci/pcie_host.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/pci/pcie_host.h b/include/hw/pci/pcie_host.h
> index b3c8ce973c..82d92177da 100644
> --- a/include/hw/pci/pcie_host.h
> +++ b/include/hw/pci/pcie_host.h
> @@ -65,7 +65,7 @@ void pcie_host_mmcfg_update(PCIExpressHost *e,
>    * bit 12 - 14: function number
>    * bit  0 - 11: offset in configuration space of a given device
>    */
> -#define PCIE_MMCFG_SIZE_MAX             (1ULL << 29)
> +#define PCIE_MMCFG_SIZE_MAX             (1ULL << 28)
>   #define PCIE_MMCFG_SIZE_MIN             (1ULL << 20)
>   #define PCIE_MMCFG_BUS_BIT              20
>   #define PCIE_MMCFG_BUS_MASK             0xff

