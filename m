Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8968A2E367B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 12:32:38 +0100 (CET)
Received: from localhost ([::1]:39366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktqlR-0006uf-43
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 06:32:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktqk3-0006SD-CO
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 06:31:11 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktqk1-0003Ls-Ll
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 06:31:11 -0500
Received: by mail-wr1-x42d.google.com with SMTP id m5so11025646wrx.9
 for <qemu-devel@nongnu.org>; Mon, 28 Dec 2020 03:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kXvGsV6xYQwqRsx9gRxqYbyHrZ+1sBdguTHEEPGEEzE=;
 b=BA1BY3IwwcAepaKOhK1zL+XaQgiXFRon970/UASw1P4vg75Ht0aCdFq/UJyZuefWU+
 CUI5KtH8VimZNB6lzy12v8pahSodta/icAFJp1RxN0APUeYgXIxKsmwnwCBux829qovu
 T2qFyxK7oyZUutJSIUhPFa/Db2/f22dGnChf6FoeuhdkE4yd8ywW6a0kDR7261XFCgiQ
 8Xm91vOTumHt/NmhnC0VrNb/pIvlERGU9rHgXyRpJ6M56B8OUe1L31zGnCevqOZX3ObD
 0SwsBGfHKmkVcVSfHc6Z8pubOxXeQ/9Uc63TvSQEXYhhdgvfTqIb0/odm4Ifru4OT0g2
 C5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kXvGsV6xYQwqRsx9gRxqYbyHrZ+1sBdguTHEEPGEEzE=;
 b=Qh2R99tK9KLlDilzsTJpqEf7g7FNXExsXi5VsHTO7+FRl7aEdr03EwD2CE3hrsIgus
 f6FXu+4LJVHh6DoNB5Tr1RCFvIy/8uZ9Bu3zskQlaIu44O0Xgj9F8KmR+6IYWV39ogLI
 vbDTZCPaYG4sklZ1XstyBjRwFU1GubgUuW4I2oRehOmn4ILDr0sBcv8lTDAZj3nH9/eu
 QYF+jFTic6CoztGn5yxobBJ1Eej0R6V1loSDOyk9NZ+zfvnXt/SUITJsYQwArZK4s/wj
 pvgJoqhPJg9ryCRaaLI5yHuyekc9zpNTh/82GaMheh64w4HOGMeOa0Cvvf8iye3Ab1f8
 m7/g==
X-Gm-Message-State: AOAM531M0KXbnMu1otW2JhDRenepEFKeuVI1bLSmp8ZnEU92LtaWgASL
 y/KWOywevqstytzgs+9aKU4=
X-Google-Smtp-Source: ABdhPJxotwNZPEXMVHrryB6IJWLbLEfJdcSOhkvV1Z2OUAdbq6RCgMc/QTzO4XhoT+QINVBSOUMI9Q==
X-Received: by 2002:adf:df03:: with SMTP id y3mr50852546wrl.102.1609155067951; 
 Mon, 28 Dec 2020 03:31:07 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id s3sm18070352wmc.44.2020.12.28.03.31.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Dec 2020 03:31:07 -0800 (PST)
Subject: Re: [PATCH v2 03/10] vt82c686b: Rename VT82C686B to VT82C686B_ISA
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1609121293.git.balaton@eik.bme.hu>
 <ede62ad54154ca9b33badc1476ee95e016cf8e72.1609121293.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9527eb28-e083-3ad7-14c2-2a00374f2b02@amsat.org>
Date: Mon, 28 Dec 2020 12:31:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <ede62ad54154ca9b33badc1476ee95e016cf8e72.1609121293.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.829,
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/28/20 3:08 AM, BALATON Zoltan via wrote:
> This is really the ISA bridge part so name the type accordingly.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

