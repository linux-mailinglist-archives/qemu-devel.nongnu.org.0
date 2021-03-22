Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DE634485B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:58:45 +0100 (CET)
Received: from localhost ([::1]:46970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOM0y-0006MQ-PR
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOLTE-0003iu-55; Mon, 22 Mar 2021 10:23:52 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOLTC-0000I8-OW; Mon, 22 Mar 2021 10:23:51 -0400
Received: by mail-wr1-x432.google.com with SMTP id j18so17146999wra.2;
 Mon, 22 Mar 2021 07:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jnIo8HPggCqKZrBl1Zx42TTPHS5LxfE/2ye8p2BPFwg=;
 b=qwwApDjgsB0PiMjpUFUI+GXpZ9oMnvC4z1pX5rsZyNWPBIWDocnE5hlo9CDRjoGM1D
 7JO0GG4u7SvqYk7uFmUGH0Qa3D80KLfI30jBS4yY5vMejJgbh0N7KjVz0kl0myAciXGO
 FZIncabB8AwWC6YkAwswWkopi+OhvrF4V0dxFh+ljubNIUpi/QU2/bR97QnmB0+fP6/r
 UX4/eUifMY0SaqzQtgggGXOIA2kTneW6Bu3JEErlih1Eo9szPBp8PXstcWRQtmPtfxPy
 l266wz//Ma80TB7wdr1YUgzqD+IQWbXSvnnwXlrpp280Lc9ixQ6R5a1h2dgabD7o/Gtp
 qS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jnIo8HPggCqKZrBl1Zx42TTPHS5LxfE/2ye8p2BPFwg=;
 b=i/0zM/Gsqs9QHs3DbnadHRgoT8F39IyZyaXSJ+aUFTpg8tClBqsDpOqEJwU7p0XPFz
 NystjFecUwyAcJQsQ640sMO/AAxYlLUdgP/aKBbNtrKbA9DXqQWDl7tm6G9Q1gUfpxV5
 pLmal4jvNqsNhImq3uwEvOCHwRpST1Z/87Swq583XwXlL2/cRu++w7+7no1jT1SOWQQc
 kNJvEkSD8rcaO2Y24Na5xkyX9EAUGoJhwKvgLOvyJVAYFrW8lhZJm8FBwdZ/GT2bmNGU
 gVmpeHqBDf3AzwDD3cG223tMasiJQk9GK8JTLo8vItSHGj0b1AjwpIi77ybBCLrC12SA
 rBeA==
X-Gm-Message-State: AOAM5336Jd+JAMT13L53n+u9ktvbVk3qb69OCSOrAdsBHoa3/taYT5Le
 l2LX0SdyaUNfVpyKzwv24ByqErq61wLxbg==
X-Google-Smtp-Source: ABdhPJyhEiASes8WHpcXaKzH03YL38L28ABps0WvU6odUIJCsIAPZ6m126MAla5RZkl8zKPqhvN2SQ==
X-Received: by 2002:a5d:5744:: with SMTP id q4mr19058562wrw.390.1616423029011; 
 Mon, 22 Mar 2021 07:23:49 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id h9sm17078822wmb.35.2021.03.22.07.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 07:23:48 -0700 (PDT)
Subject: Re: [PATCH] hw/sd: sd: Fix build error when DEBUG_SD is on
To: Bin Meng <bmeng.cn@gmail.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20210228050609.24779-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e539790d-cb05-32a4-1a80-649d3cc02ffe@amsat.org>
Date: Mon, 22 Mar 2021 15:23:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210228050609.24779-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/28/21 6:06 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> "qemu-common.h" should be included to provide the forward declaration
> of qemu_hexdump() when DEBUG_SD is on.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  hw/sd/sd.c | 1 +
>  1 file changed, 1 insertion(+)

Thanks, patch applied to sdmmc-fixes.

