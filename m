Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9183042991A
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 23:41:48 +0200 (CEST)
Received: from localhost ([::1]:36884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma33L-0007hq-M6
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 17:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ma2yh-0005Qf-5n
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 17:36:59 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ma2yR-0002l1-B5
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 17:36:58 -0400
Received: by mail-wr1-x42a.google.com with SMTP id e12so60337622wra.4
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 14:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MORrlAM2HeY0TmDxFU08WHeGxDy+DgUB9geBCMI/8qE=;
 b=gZMTl8CpnAli8QwUnOtkSQM891DKRryuEMclk2fW7k8xhbqwzbt19Pbxl0B6PmK/Qw
 ZxXIZo+fPDLFdY8Zw+/NvYe86kx9Df8wMZgtFZbAEb9W/L/ZwnrK7+7YKdp2rRedEO53
 CFgo/NAJBRErYQoXXVgjohAQkse1aZu1gNgtWEf+aPqC2uqgmrhPla5lHQYNT1KJsNSV
 jR+cb+3jnABWJGP/Zb89F32dRjdd2aUt+AtvjqBcpxBTD9CSLcrL/e6kXtwzdnALhf7J
 zHzDM+o1x8OuUqH0tIjAVd0noxGXsHVhp/++tdR89qWkno8PQgRealhClQPckh9bWZiZ
 CYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MORrlAM2HeY0TmDxFU08WHeGxDy+DgUB9geBCMI/8qE=;
 b=p1vkDsW1bqglHYTWrSjYKy2Rs4x7iEsgPUf2bL58S3ryscwzqjViox42tG3qFuwrB4
 /YlfU2V9grq7VVPeM2DctLZPrFI9drGoqRGnh3AQHMDOY7U4zWPpKpcQ1XhCOLqPW6LC
 FpDE40rSemZVBdRx0VEa6b1NGpeVtY697sgkG20BYssBidIQcwBuVwwD3Lan1Rr0TnhV
 0nVfbGrkklO8daJJKoSoZ0bcXh6VFFSyCcD25ElvkMSPbvBL+gc5F8vIWJ+Z+zxPQaF9
 Mqkaz/aXkVNODo5McKm+6JI7R5NsKAsIjaU8sBOCAKn+XzXicNle328MUSGwgDTz9tms
 6zbw==
X-Gm-Message-State: AOAM532xRTByLXCOrTBdcQfscPmNvv48248gd/4xrr8CS3E5pCn4nuzZ
 TxKLbOkinHQeU4DoU+ILolDFpJOK4jQ=
X-Google-Smtp-Source: ABdhPJy20wwPFQKX568Vg6x5YBHjCBx+Mq6WZ5GYRPIoJqxGEuerUMtJZfgHcf6MOgiBl2G/rMZF1g==
X-Received: by 2002:a05:6000:18a2:: with SMTP id
 b2mr27869173wri.155.1633988198042; 
 Mon, 11 Oct 2021 14:36:38 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id q3sm581028wmc.25.2021.10.11.14.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 14:36:37 -0700 (PDT)
Message-ID: <6033d474-2bb4-f5fb-0f50-d12dcc9a35ee@amsat.org>
Date: Mon, 11 Oct 2021 20:52:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 6/9] bsd-user/mmap.c: Convert to qemu_log logging for
 mmap debugging
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211008212344.95537-1-imp@bsdimp.com>
 <20211008212344.95537-7-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211008212344.95537-7-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kevans@freebsd.org, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/8/21 23:23, Warner Losh wrote:
> Convert DEBUG_MMAP to qemu_log CPU_LOG_PAGE.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/mmap.c | 53 +++++++++++++++++++++----------------------------
>  1 file changed, 23 insertions(+), 30 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

