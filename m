Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8511494CB5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 12:20:12 +0100 (CET)
Received: from localhost ([::1]:57576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAVUB-0006M2-J5
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 06:20:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAUUc-0006TH-2O
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:16:34 -0500
Received: from [2a00:1450:4864:20::331] (port=36736
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAUUW-0000uj-N4
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:16:33 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso19272330wma.1
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 02:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5MUgJIGUEx5BV4CgdX4emoumwTGDFxNWrvfynpO91NU=;
 b=hZPKO4q3kSd1fSnQunbgGh/WclbBSCX3uPqnp+p5l75RodiybYYt8lThpORLUMrpgu
 +gHAs22p/5hPUwRexnUFu8WSJuAUoT46xmZi4+e/Djc6Kc5Wv2kC31pgsM4Dat92kyij
 58H99nC4CPIRyQ+6lwqjNq1e2r4dx/LfDIWxkGjsKH25wDsv8xGCoDvWs2c+cN0duB+1
 O/WdjW7gmGG8FsDVNpd9CTf1eG2U7rlk8ZPy9PLoEQBDtDeZ6nM6Vq5EKz9GDviPSdbb
 axLwZTJw3VjpQHpZYA9f3lPFdpr2IcMxgpAxh49r+22Geua07GPRSly7kLEo8nlSgNAz
 yEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5MUgJIGUEx5BV4CgdX4emoumwTGDFxNWrvfynpO91NU=;
 b=VcCOEfo3VsQcJhc7eQVNppLNdg6fuisaRf915LN+E4qIWAV4iiIkr2v5Cfo06bGivY
 TFqbW9lJIuP+74G2iK6+dEmYcWsuZGxDJL+aVsShhH42gpRXHB6SId8Zm/JiBWIrlcc8
 iJRhDCiUC9aYycytYeVEx0Ldu2R1MujZvfnM39+Wa3Lld3/UHjJtj4KVu+MTmdzNi6sy
 UssVGFOGyMnzOz5vYtGDvY0E9NID9n1W4B9/l/SRrLsxEOeTmJvaUhDMgWNez9PPc7Bc
 IWzgqdyH6hsmyJxwJN3gR3bEKJmmM4eoJ3q5pc75AalYQLypNEa+Hya3Hm7FDFefitsH
 1dqA==
X-Gm-Message-State: AOAM531QhCbNIRZQFA/EV9q9rVYutsIyqYaMKBMKi7BE6zXL5IHL3On6
 whzUDFlorUVjv6ZmYNQdSjQ=
X-Google-Smtp-Source: ABdhPJyyuWLhRcLBTdpy7lvNaVBM1IxWWt5jouGgeqk9JFgX/qm9lnXY29C2cBkCJSo0oAfzprb4ig==
X-Received: by 2002:a05:600c:3d18:: with SMTP id
 bh24mr8115651wmb.49.1642673784108; 
 Thu, 20 Jan 2022 02:16:24 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id i3sm1854884wmd.30.2022.01.20.02.16.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 02:16:23 -0800 (PST)
Message-ID: <3750673d-1222-011d-cfb5-859d28f2a0e4@amsat.org>
Date: Thu, 20 Jan 2022 11:16:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/1] Allow setting up to 8 bytes with the generic loader
Content-Language: en-US
To: Petr Tesarik <ptesarik@suse.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@xilinx.com>,
 Alistair Francis <alistair@alistair23.me>
References: <20220120092715.7805-1-ptesarik@suse.com>
In-Reply-To: <20220120092715.7805-1-ptesarik@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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

On 1/20/22 10:27, Petr Tesarik wrote:
> The documentation for the generic loader says that "the maximum size of
> the data is 8 bytes". However, attempts to set data-len=8 trigger the
> following assertion failure:
> 
> ../hw/core/generic-loader.c:59: generic_loader_reset: Assertion `s->data_len < sizeof(s->data)' failed.
> 
> The type of s->data is uint64_t (i.e. 8 bytes long), so I believe this
> assert should use <= instead of <.
> 
> Fixes: e481a1f63c93 ("generic-loader: Add a generic loader")
> Signed-off-by: Petr Tesarik <ptesarik@suse.com>
> ---
>  hw/core/generic-loader.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


