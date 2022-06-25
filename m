Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A75BE55AD5E
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 01:12:42 +0200 (CEST)
Received: from localhost ([::1]:56102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5ExF-0001E4-KT
	for lists+qemu-devel@lfdr.de; Sat, 25 Jun 2022 19:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon.sapin@exyr.org>)
 id 1o5Evk-0000PN-Lv
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 19:11:08 -0400
Received: from r0-2.smtpout1.paris1.alwaysdata.com
 ([2a00:b6e0:1:40:1:0:10:6]:52853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon.sapin@exyr.org>)
 id 1o5Evh-00075I-C2
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 19:11:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=alwaysdata.net; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dbB0S5jDaDkZ52BVP2mP+Zx2aDmFlY4rcY9LI0B5qVo=; b=Dsou3AKY+PTbYoQtLaeEoIWuHB
 qhgoRv3FI7pBvvxxq9VaFmo4QEuocV7OSCmjlT8dq3u0hH4jbm2ehzkyBZqdZegczdL6kgLxQFcX9
 vErADKPhSQGsyxO229ho2+UBfunQMT1DTlyCsBP3nvceZCPvaTlqx5xd84nN5Fzjo1RU=;
Received: from [2a01:e34:ecb8:5a0:f192:bd1d:5684:24ee]
 by smtpout1.paris1.alwaysdata.com with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <simon.sapin@exyr.org>)
 id 1o5Eva-0006B0-Oj; Sun, 26 Jun 2022 01:10:58 +0200
Message-ID: <cff65101-b708-bf4b-8cb9-523b757bcdc9@exyr.org>
Date: Sun, 26 Jun 2022 01:10:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] Add some documentation for "dtb" devices tree blobs
Content-Language: en_US
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
References: <20220625223458.1273408-1-simon.sapin@exyr.org>
From: Simon Sapin <simon.sapin@exyr.org>
In-Reply-To: <20220625223458.1273408-1-simon.sapin@exyr.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-alwaysdata-ID: 127191370
Received-SPF: pass client-ip=2a00:b6e0:1:40:1:0:10:6;
 envelope-from=simon.sapin@exyr.org; helo=r0-2.smtpout1.paris1.alwaysdata.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 26/06/2022 00:34, Simon Sapin wrote:
> diff --git qemu-options.hx qemu-options.hx
> index 377d22fbd8..eea75ddb37 100644
> --- qemu-options.hx
> +++ qemu-options.hx
> @@ -38,6 +38,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>       "                hmat=on|off controls ACPI HMAT support (default=off)\n"
>       "                memory-backend='backend-id' specifies explicitly provided backend for main RAM (default=none)\n"
>       "                cxl-fmw.0.targets.0=firsttarget,cxl-fmw.0.targets.1=secondtarget,cxl-fmw.0.size=size[,cxl-fmw.0.interleave-granularity=granularity]\n",
> +    "                dumpdtb=file dump current device tree blob to a file and quit\n"
>       QEMU_ARCH_ALL)
>   SRST
>   ``-machine [type=]name[,prop=value[,...]]``


Before I added the above chunk I found no trace of `dumpdtb` in --help or Sphinx 
docs, but a code search finds two C string literals that seemed to already to 
document its existence:

https://gitlab.com/qemu-project/qemu/-/blob/v7.0.0/util/qemu-config.c#L192
https://gitlab.com/qemu-project/qemu/-/blob/v7.0.0/hw/core/machine.c#L810

However I had trouble to find in the code: where are these strings used? Are they 
ever shown to a user?

-- 
Simon Sapin

