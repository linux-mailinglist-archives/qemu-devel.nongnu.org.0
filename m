Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB671496B88
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 10:42:14 +0100 (CET)
Received: from localhost ([::1]:50978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBCuT-0005nR-DM
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 04:42:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nBCs1-0004OC-Uo; Sat, 22 Jan 2022 04:39:41 -0500
Received: from [2607:f8b0:4864:20::531] (port=37423
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nBCs0-0007G5-Dg; Sat, 22 Jan 2022 04:39:41 -0500
Received: by mail-pg1-x531.google.com with SMTP id e16so981905pgn.4;
 Sat, 22 Jan 2022 01:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AYvyHaIfZ6xeNEEL65GSHFVIJNC3qp9L29so3te0UlE=;
 b=WvogRzNx6JQNcnnqU5MV7o/xOorwFcnDxkRYmXWR1x7lFL6pQRloe8lJy702a+NQa3
 DgDI0+MKCzRSjM+kNSG1cg/oNMO3POfyVHoZHC82z7pEozh7Jbp04XvROHwWj4y4nKEE
 BryHJSf3HW/U+nr4SHAAkGPKUbHCu+VtvjLvdbJk5BFoN2Xqzx7ZRcexjzax4kgJhF8K
 Ut0l8Ba6nN8/NgI3MRltpq800sOXdCqrQRBtGTYwwQ1a6+qWCpYYmgC2IrWL1E7JaQae
 qnys3Sj5MaOJTXDJHnbxJYBZdik6AEyT7MGi+uyruTjOpa6VmPfKH4vnZcORdjkFV2WO
 32Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AYvyHaIfZ6xeNEEL65GSHFVIJNC3qp9L29so3te0UlE=;
 b=LALAK+kxRYk0EyphAgmXpFOn6wgQ5k9IfE7zIYYglWaYJIQiyCXWlibSKaIHNUenv0
 RNr6UWGdD5T2s59B1/c6Tuvkbwmhuirin3dOMRz8RB7EU3MJXkNIJS4Ca85hNGLzTBR0
 ru6Jz+qdXMofQ3vL57ASjh3p2Mv2Wvgp2XhnCZLU5KyfrkxLKPZKnw2XSuNSqG4lo5dS
 otpi+hASwJxtFFPyOTq+cw4HD3u8LcdNASlV5vYmgSRNgCHG30teMakEpWquUT11QqaZ
 vg+oMPnc/eT1WgWGdboXSLeinKL8KEgLbDPXvFKNfTs9rXcfOXhuS+5hbRciRVG6AhKx
 EESw==
X-Gm-Message-State: AOAM533w5K5v8pnL+67NNnhAqzx90yTtIcfGBsLPH2ftyvUbsQCEVdrO
 BeE4QGCiJAyshotEPzNQYGg=
X-Google-Smtp-Source: ABdhPJwFOa4JvbU4CCrtCl+DkjeFV9Y6Exnw//OK/aBPkoxHPIoiAdFPMFIof2gZHWMfHkzHWKu8mg==
X-Received: by 2002:a63:7d4e:: with SMTP id m14mr5581844pgn.514.1642844378510; 
 Sat, 22 Jan 2022 01:39:38 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id f12sm1229750pfv.60.2022.01.22.01.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Jan 2022 01:39:38 -0800 (PST)
Message-ID: <87fb885a-ef7d-c564-4499-3908b07383b8@amsat.org>
Date: Sat, 22 Jan 2022 10:39:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v2] hw/nvme: fix CVE-2021-3929
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <k.jensen@samsung.com>, Qiuhao Li <Qiuhao.Li@outlook.com>
References: <20220121063225.312603-1-its@irrelevant.dk>
In-Reply-To: <20220121063225.312603-1-its@irrelevant.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 21/1/22 07:32, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> This fixes CVE-2021-3929 "locally" by denying DMA to the iomem of the
> device itself. This still allows DMA to MMIO regions of other devices
> (e.g. doing P2P DMA to the controller memory buffer of another NVMe
> device).
> 
> Fixes: CVE-2021-3929
> Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> Reviewed-by: Keith Busch <kbusch@kernel.org>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   hw/nvme/ctrl.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

