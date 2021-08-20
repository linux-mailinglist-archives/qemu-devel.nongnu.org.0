Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A996A3F2CFB
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 15:16:24 +0200 (CEST)
Received: from localhost ([::1]:52178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH4Nj-0008PB-PC
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 09:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mH4Lr-0006TL-Ap; Fri, 20 Aug 2021 09:14:27 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:53944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mH4Lp-0005RD-MH; Fri, 20 Aug 2021 09:14:27 -0400
Received: by mail-wm1-x32b.google.com with SMTP id o15so5933122wmr.3;
 Fri, 20 Aug 2021 06:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=coorekylvS9sm+JwMSLZBNqz7SV+s2ztSxAqaH5N/nI=;
 b=lUhHopKewBCMiO9ZuJnhI7wSnVth6wkrPUyNa/tRiNH9vytP77km6n2UL1OeUXVYpj
 TIoo0FJowBIIMbBUVqzzx2sDIZh3dU7TJ5FE5Q+TuAKqSA/BQ/zFg+AmPSlNDn98w7GJ
 jEykJpJhD4AarxWjar4c4g2f9KwdiCNZjd8T0Cf0exqdyqJOYM2K7VTQtzX6CSJtq4dY
 d+I8uLp6r7BSjxjZvTJq3F9bM2p43lO8KoNwDUaThvZJP69/W5buORUqdA3mGvokdHbp
 +XO+laGGM8SWUSnKBNh1h/4lzDx2D83i43XoK/h1qPSWinCxVPq0UJOhMbQ+DUiHAvB8
 LvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=coorekylvS9sm+JwMSLZBNqz7SV+s2ztSxAqaH5N/nI=;
 b=G0xWBFRdXyk9dd7zq2S5FzJ7dp5GrVcG3NOfHK7Mhh777oXBpceJTjUAxPpYzKMSHw
 gzTQPi+bgQr5kCqjjr3f4/yN9p5kiBc/JfSppygTv7Jq+Mb1wMfjpDXwrfBr0It35FsY
 Gk+W6D001nSh9bCsxKUmAXDJH2TFWET8Y3jHld+EF1Rsa2pEdZgCTAQ5n8QbqNzxwPVT
 nPjN8cwzCIMlzB0uWejK1fTVkpgJT0q33623P/MGd1OujHYXc3+zQ/95SN75+xQBh5iE
 KGEb20Yue1WksXdifOxitPvjfb9zg6/ANw81UdToeyX9cdohMiruPLlhPKkkn9UMNRKI
 LW+g==
X-Gm-Message-State: AOAM5324GQXsq6uuvsaFzEu/vm6adlBS3e3HGBsVuEqhyiWvB/7DczIg
 mmRD34zfLnOxzJqFIq7cSWI=
X-Google-Smtp-Source: ABdhPJwnTyULF05yLjk2nPQ9WFjUdjEDb1uB1oukIqtcOr0+b5u55H5No9HICIcB9B2wNlIMJeo4LA==
X-Received: by 2002:a7b:cbd8:: with SMTP id n24mr3956841wmi.130.1629465263643; 
 Fri, 20 Aug 2021 06:14:23 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id j37sm3833703wms.39.2021.08.20.06.14.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 06:14:21 -0700 (PDT)
Subject: Re: [Patch 2/2] hw/arm/xlnx-zynqmp: Add unimplemented APU mmio
To: Tong Ho <tong.ho@xilinx.com>, qemu-arm@nongnu.org
References: <20210819031525.653995-1-tong.ho@xilinx.com>
 <20210819031525.653995-3-tong.ho@xilinx.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <faea8430-fb60-2c7b-ed70-4efd16a264f5@amsat.org>
Date: Fri, 20 Aug 2021 15:14:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819031525.653995-3-tong.ho@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.49,
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
Cc: edgar.iglesias@gmail.com, alistair@alistair23.me, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/19/21 5:15 AM, Tong Ho wrote:
> Add unimplemented APU mmio region to xlnx-zynqmp for booting
> bare-metal guests built with standalone bsp published at:
>   https://github.com/Xilinx/embeddedsw/tree/master/lib/bsp/standalone/src/arm/ARMv8/64bit

Again, please point to something more useful:

https://github.com/Xilinx/embeddedsw/blob/master-rel-2020.2/lib/sw_apps/zynqmp_fsbl/src/xfsbl_hw.h#L271

> Signed-off-by: Tong Ho <tong.ho@xilinx.com>
> ---
>  hw/arm/xlnx-zynqmp.c         | 32 ++++++++++++++++++++++++++++++++
>  include/hw/arm/xlnx-zynqmp.h |  7 +++++++
>  2 files changed, 39 insertions(+)

