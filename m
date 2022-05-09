Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D67455205F4
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 22:35:48 +0200 (CEST)
Received: from localhost ([::1]:43062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noA6d-0000LN-Tl
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 16:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1noA5g-0007xG-Ea
 for qemu-devel@nongnu.org; Mon, 09 May 2022 16:34:48 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1noA5e-0001T6-Rc
 for qemu-devel@nongnu.org; Mon, 09 May 2022 16:34:48 -0400
Received: by mail-wr1-x435.google.com with SMTP id e2so21009538wrh.7
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 13:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b/FQHLZLwy14NIzQK+jrhhZYNOAUAejosbEPC4XNe90=;
 b=PWwfHcl7LCOkZGh60ho0kVRy5dAuItoDpf/Qx5+4GO7XB49q7/wUlmJP61ek8ha9m1
 atxSoPNkDNG8yiOs/i/nQdm1GmRpfGSJYK5k0Z2vqQ9MH2Cd8CdAOByoHg2ABrYmp7EG
 lDdHk+ayV3Hun5AiV3IhhZrI4bz2u0mYqmf4owiSrP/8hiIyhwLHIuZS+6NInOsP2Gev
 KG9LbcZEqDRGbDIWqyLHJuMm82DeJc31zFr4TCIW6niIfEa0l6zqyjUfrSKVDT0G9LpH
 3RnThAmBg1qZQeMKmcYUydw5OzEcea/7dAaEyF08tnmEvkuaxjGe85p3Ok8CgNXkH2JM
 G/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b/FQHLZLwy14NIzQK+jrhhZYNOAUAejosbEPC4XNe90=;
 b=CMpMBWiGsbfSWkvSAQbyLEJEkTnyQ2ocHYU4jiyjQrEKsJdM8LwaRg22e90sW5+yct
 LfFCM3BrduZc57Doo2eampL2S/wH5lJTfvWOlEYFtpPej4B36Xra1BJ/RJr9avlZ7MRY
 GsxES5yHmXkYIf98xaQRDgw3g/QOc8j7kIRnNvmXZwheNxp0MbAxGRyz65zQdvYG9QMC
 IVf9bdNKUbeveAWPF0OKygglJ0Av4rlt2SOTgAzFzWuBbUPD/6pC9DA4Fdvh5cJMbtiZ
 z2P6wXNdnk2rPdmegOn+odrmeombz372y1LqZeUjdxvsDDsk0P4TxvRwhOa3TQo0zXF7
 2KSQ==
X-Gm-Message-State: AOAM532Z0fB80CF9bR86vDOrwG7120HfP4LXOzWdezh7xjNnfgYXcR6w
 JrVK24MkAELAI16CHUmWA40=
X-Google-Smtp-Source: ABdhPJxT+keaj+uCEsXkaLTqwYIThkFVgzV0trRYKro+sQKAzntz+QP3vYRPAtIP+P3pfANS1+Zktg==
X-Received: by 2002:a05:6000:1ac7:b0:20c:6c81:175d with SMTP id
 i7-20020a0560001ac700b0020c6c81175dmr15395083wry.262.1652128484901; 
 Mon, 09 May 2022 13:34:44 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j33-20020a05600c1c2100b003942a244ec9sm400983wms.14.2022.05.09.13.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 13:34:44 -0700 (PDT)
Message-ID: <0de5379d-abad-547c-92bc-fe6b5c5348b6@amsat.org>
Date: Mon, 9 May 2022 22:34:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 4/7] target/mips: Fix emulation of nanoMips BNEC[32]
 instruction
Content-Language: en-US
To: Stefan Pejic <stefan.pejic@syrmia.com>, qemu-devel@nongnu.org
Cc: ot_stefan.pejic@mediatek.com, ot_dragan.mladjenovic@mediatek.com,
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
References: <20220504110403.613168-1-stefan.pejic@syrmia.com>
 <20220504110403.613168-5-stefan.pejic@syrmia.com>
In-Reply-To: <20220504110403.613168-5-stefan.pejic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 4/5/22 13:04, Stefan Pejic wrote:
> From: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
> 
> If both rs and rt are the same register, the nanoMips instruction
> BNEC[32] rs, rt, address is equivalent to NOP (branch is not taken and
> there is no delay slot). This commit provides such behavior. Without
> this commit, this scenario results in an incorrect behavior.
> 
> Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
> Signed-off-by: Stefan Pejic <stefan.pejic@syrmia.com>
> ---
>   target/mips/tcg/nanomips_translate.c.inc | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

