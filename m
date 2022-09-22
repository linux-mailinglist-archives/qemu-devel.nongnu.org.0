Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDA95E6101
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 13:29:19 +0200 (CEST)
Received: from localhost ([::1]:56474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obKOL-0004kB-Ix
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 07:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obJsN-0006NV-Rv; Thu, 22 Sep 2022 06:56:16 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:41589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obJsM-0005Zn-9Z; Thu, 22 Sep 2022 06:56:15 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 q15-20020a17090a304f00b002002ac83485so1762581pjl.0; 
 Thu, 22 Sep 2022 03:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=GUSeWDDELCnw+VlK94XB3u0UORpJn6W00qONfFCRdBQ=;
 b=i3WyWaCgy5u3m1bqP04+cXPWwOVXIRlHEhjZgO0ILduyKPfraqPQMWIywx9pheQv1n
 xfY2166voGqQqUgC7dvvqPTSudBmbYKjOZzpN7booybREhKbnkgmWuEz9+BDccYZL+Mh
 3RE9raLSfgIgmt4CID35QlqhE44oCEUIH1A39Aw/MJIkSFLqHl46mx5GxFhhoARukPYY
 9Flf1+jxyoFnpVnDJp1cos7y2qp5qWXl3fomDSfx+8oQ+v840y6l13k/Iav7YHNyNc19
 pBTkD0Z4NRDORWcdX9XVqfDtSCu7fbBaggG2Jo76GVzW+r7b5OhOOSfawIp5AO5qtKB2
 R1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=GUSeWDDELCnw+VlK94XB3u0UORpJn6W00qONfFCRdBQ=;
 b=D0bbrOPZkMxPX/c1/f8Yc8iLl4kp/+TN9NlBjkR6NRtIVVgflVbOH+ILjUVv0kbU20
 a0WAdm/N5naNsKxHJTKs5xeV3IDepn+JsetIA+IkOZ34nIMumxz+J0T8t17JZNgE2Myd
 QVXU6JPyUiGbunbF/PAdHTUTd4BN0RBF9i5f6SOGSnPTYs7vRBwSp40zyrMsaNnZoeIG
 f+a4LBywT8GGORSVo7QQyqrOi1ZRxhZjB+SJniDRaG1zCBe4Vqs4rtlBcOkHqYu2J+lB
 aptdGMhcrvOIIxQa9tmdmtCR0VPUbMHvZLpnEC0bnudkdNb2jSQsxucfkmFa/AQOBsA4
 Ob2A==
X-Gm-Message-State: ACrzQf3aQPFtE1+je6dtrs0EcO0SG/sKmY6CWa5btVqbKiWzKSMIbj8b
 lrsdD91JUXXJtJoLH+rccnQ=
X-Google-Smtp-Source: AMsMyM7obNMM5D4Ce6/0VDyLbcMylzHl8k1Z+y91OdKvfy1cTgf9GE4rpUJDvIYLGHaff5viyOvUCg==
X-Received: by 2002:a17:902:ec83:b0:178:39e5:abee with SMTP id
 x3-20020a170902ec8300b0017839e5abeemr2679792plg.84.1663844172541; 
 Thu, 22 Sep 2022 03:56:12 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a170903234600b0017680faa1a8sm3750567plh.112.2022.09.22.03.56.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 03:56:11 -0700 (PDT)
Message-ID: <c19ae600-4fe1-b3df-63a6-af56f1b56db3@amsat.org>
Date: Thu, 22 Sep 2022 12:56:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v7 11/14] hw/riscv: set machine->fdt in
 sifive_u_machine_init()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20220908194040.518400-1-danielhb413@gmail.com>
 <20220908194040.518400-12-danielhb413@gmail.com>
In-Reply-To: <20220908194040.518400-12-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.702,
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

On 8/9/22 21:40, Daniel Henrique Barboza wrote:
> This will enable support for 'dumpdtb' QMP/HMP command for the sifive_u
> machine.
> 
> Cc: Alistair Francis <Alistair.Francis@wdc.com>
> Cc: Bin Meng <bin.meng@windriver.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/riscv/sifive_u.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


