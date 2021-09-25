Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9CA4180EF
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 12:04:29 +0200 (CEST)
Received: from localhost ([::1]:37156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU4Xk-0001xv-JM
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 06:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU4Vr-0000j2-JQ
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:02:32 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU4Vq-0000qo-7b
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:02:31 -0400
Received: by mail-wr1-x436.google.com with SMTP id g16so34987608wrb.3
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 03:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qxWcWFcNL8KT0bes1eF3eY1gfaoabOvTZmjkKVS1CkQ=;
 b=CahWXG+rgnHQ4RHWBCeT5337nZ8UfEa4wRJfzROnb5KbE9jjXLhNq+MSD7Tl26Q7rB
 LiXoZrJYGaB/EtpLk7nQYMg9726HtouAMtv3yXCnqcWT8b10AQ+D/TTJHIfEt/uY4DGK
 Qq93JjcUM1s6+1JSiu64twaprLc3wNvOe/lnD1+yysWLMDNU+fmkYd3xLTJm2XRWMWWZ
 vh3KasYoNM/Ke/nECTGpPYQOZRvyVPmRFxLlUVE2Ph5UxD/L6Pmv2X4hmv2b0yNH5kq+
 jbSr1X80En55PaiP+uFoH4Re/fv/Nlu8qZGzLcxLDFnK+iDBvkITkVcbWB0aJ7M/DwGR
 gyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qxWcWFcNL8KT0bes1eF3eY1gfaoabOvTZmjkKVS1CkQ=;
 b=dgTm2DWTxM/fFCcthBTJdcZnXl4wGbS5ZBQgJmlwvjuA3HUiz0itNhQ4QV+BbJSBEx
 x8H9TY0BYUPxaXy3uUZJzwFgZFoj3iEIenEmx4ZETNc8zpZywEBdKMd7LPXlvmf6le8h
 B8cmBrwpJljPgP4MJEggqkaaWceiI34rsUyXVxhp0FeUcqymcbgqwawUtLiEuu3/6xSZ
 WDq5x4i9+20r5qH0d99F9YZb6XbaeYJ3hj8G88YoAQKEwbdNlD4Q1tCfQ3AXxhYl8G2S
 4sTb8sWVb+1o8anC4gkX+EtCWtJ5chtddmdOIeRGa4sxKjBTH8i2a3Wx8ufw126BHnRa
 D2Qg==
X-Gm-Message-State: AOAM5306gfKdqFSqp36uR0UwzxiIGPH8GEhpi0obPWXb77iUfCg4VzP3
 /iLXLfRS22FwY+dK+DMc47E=
X-Google-Smtp-Source: ABdhPJxGLYHsnxK+xHF3/CQyWVM+T7ogBbncRSfEZV4MHG6dreYv4f6WtarOL0SttLyDelWJjHTthQ==
X-Received: by 2002:a05:6000:1567:: with SMTP id
 7mr16201278wrz.84.1632564148936; 
 Sat, 25 Sep 2021 03:02:28 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id k11sm874300wrn.84.2021.09.25.03.02.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 03:02:28 -0700 (PDT)
Message-ID: <3ee4d1d9-7013-7839-cb26-03beea166783@amsat.org>
Date: Sat, 25 Sep 2021 12:02:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 17/30] tcg/loongarch64: Implement add/sub ops
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210924172527.904294-1-git@xen0n.name>
 <20210924172527.904294-18-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210924172527.904294-18-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 19:25, WANG Xuerui wrote:
> The neg_i{32,64} ops is fully expressible with sub, so omitted for
> simplicity.
> 
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-target-con-set.h |  2 ++
>   tcg/loongarch64/tcg-target.c.inc     | 38 ++++++++++++++++++++++++++++
>   2 files changed, 40 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

