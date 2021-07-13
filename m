Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 306313C74C0
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:36:36 +0200 (CEST)
Received: from localhost ([::1]:43726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LOd-0000u7-1N
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m3LJZ-0006go-Lx
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:31:24 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m3LJY-0006dP-62
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:31:21 -0400
Received: by mail-wr1-x436.google.com with SMTP id v5so31298657wrt.3
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WNxyFoGLZi8Pcrm1fSlygAgPHnpQi352g65t/kVD9KU=;
 b=jovAwq69Ee2pNRrc/GxLRRSDQy9rz20SaWwF9nYwhKEGwLicracCczqPevh9aVVLxm
 tt3vbHIwctOvxJjzOvi4Hm5ror2VH8/6wFZijFHFHmw00XDW+bDQg2ijdfvOlBdgcxLS
 shOXfUytdFPyyA3cb1iNXzN2g64FOaoq1HK6b1oWbOvBMFf5FRauO9yucQAli1MJrRIF
 89vgIKASrhDruldxyMpCtld6qRTNKFPE+5X/vnlq0VSCevF8QShsW8WE1jE/nDFKoqfn
 ddE3zUKL9CdiIfgukUzQTnpeKHDRlabAYNlwWrDJbwDgUU+GMqzlocJRXs+l+6IyEKhl
 3pcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WNxyFoGLZi8Pcrm1fSlygAgPHnpQi352g65t/kVD9KU=;
 b=eIzRnjVM5ljdBmtWJiq7p+hlh9iSqMjlRCeyiTQczF6Ysmtqeyn53H+15s84KtL8vf
 O9pucz0wzAbg5GTtfgj5nHEDJUSX2K4SRNJ9wYPUpKqn5hUurs+7uDF898hENkMmfKhx
 uwTjTzJAOlJpXxMo0rV4i+QkxjmxT7AlbXolOLxVtk/YD5a2bQ/Dg4Tydpx4Z2xjKVzL
 hNn3JQ32cjjN8Vm69151ZTCUfIGHQaHENCV4iroAZ5m8grhu1rn2ZmMePSIyri90S8eQ
 AGp0DlKMnMPDWl9KClKKFPJ0881OWdtKcWi1QXDEsK4pnbvaFdACiR6zF+BMbU8l3K+d
 G0IQ==
X-Gm-Message-State: AOAM5317vcYGrhBF0LWqHW0/60bGRCRqGAi8M24iPJRTMHd7z3XM0rMl
 WzA/sOAIipQK4CHfhqymFx4=
X-Google-Smtp-Source: ABdhPJwxI60O1Qw0Q3Bsrk+SFIe59aCVJOZ5XvNuVNFOS4YQ68quch/we0+NmeMEehaI6PONJR95Kg==
X-Received: by 2002:a5d:414b:: with SMTP id c11mr7044701wrq.162.1626193878852; 
 Tue, 13 Jul 2021 09:31:18 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id 11sm2778041wmo.10.2021.07.13.09.31.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 09:31:18 -0700 (PDT)
Subject: Re: [PATCH 05/11] hw/audio/adlib: Remove unused variable in
 adlib_callback
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210712215535.1471256-1-richard.henderson@linaro.org>
 <20210712215535.1471256-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e1dc5d49-a2cd-f4dc-96ba-9d150bd9cff6@amsat.org>
Date: Tue, 13 Jul 2021 18:31:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210712215535.1471256-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.368,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/12/21 11:55 PM, Richard Henderson wrote:
> From clang-13:
> hw/audio/adlib.c:189:18: error: variable 'net' set but not used \
>     [-Werror,-Wunused-but-set-variable]
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/audio/adlib.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

