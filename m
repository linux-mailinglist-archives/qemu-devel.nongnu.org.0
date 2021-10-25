Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA4F43A5D9
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 23:29:00 +0200 (CEST)
Received: from localhost ([::1]:50130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf7Wc-0007R5-Se
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 17:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mf7VB-0006k4-2R
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 17:27:29 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mf7V8-00064D-Nr
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 17:27:28 -0400
Received: by mail-wr1-x42b.google.com with SMTP id m22so11927251wrb.0
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 14:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rdpmBjwQVBEvLmnye40/Fzci6hnIsGySLT2iSVJdrPs=;
 b=m747xfVw8QDL5Wm6wx0tR7mGbLWAmXnKcsuP77OTcw6F6ESLHlX8dztSI5z1R+YzLm
 VLEs+3+M067Ew33zqYF0PQaakHPuCF3hDh1oxynIbk1LP7mmKdmcN5Okni/dBda0xzEe
 3ZnZzvdmFam228dA3FpcFMmwV5CyFUqpc77DSQF9Y5CCAgG40ttw85Avvoyb7sqyfe6j
 ih1/OcD8jgK435X2/YRFejmrpFRbqw3u3G01IQLxsY65VNwipFzn+C3/NAzighrljrA3
 C4hN4XHgsq7LEH7dxvdCM/lzGjjmKvkSCzAJxEsrAL8eEVxOifYleGVZMDbE8kvv4aq/
 6eow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rdpmBjwQVBEvLmnye40/Fzci6hnIsGySLT2iSVJdrPs=;
 b=vMelejBZaQmBUsJb6ieC1PgVF89rv7a75qNoPA8mF60NOcpWGSmfi/4EopBNL4xy8h
 e+aCJVJr1fyeBLi6+lw0FwdWn3/uTZXbue2cHGMMTl44hgchUE9F5/RMDQ4pB/zvlpca
 tI+W9tl6BZ/NL5f07YjVN8je3EoWzx3BHv10hs/YwD9tNU1sdwtmBGT1uSsnen1XCwM8
 6dlQZ4YoUolQY7ZBWgnYieKujKfZpyDF60X1mp93T/Co3G6LnhPkhXpRyUWO14lVIpAI
 y4WgsMp8witVqMPGFES4afmcgJq5ygH07klyoxZ7M7HiswybwiKhLt8FlQq+8IitLOUs
 DB9g==
X-Gm-Message-State: AOAM5308Jj6BGWexDelFzn5xo1yDscf8kbEEWm7vQI6gMWy72x+BV2VG
 VTtqvifZlmfaRD5L+T46yy8=
X-Google-Smtp-Source: ABdhPJwrq9HUN0YIlU15Es0nKi9o0mmJ1C7Scc3Fs3EWoZ3nmNJjvBTdA/R3y9hWMYNQADtLNMpS7Q==
X-Received: by 2002:a05:6000:1689:: with SMTP id
 y9mr26324916wrd.52.1635197245375; 
 Mon, 25 Oct 2021 14:27:25 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l6sm18785159wmq.17.2021.10.25.14.27.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 14:27:24 -0700 (PDT)
Message-ID: <2f43f570-6ff6-610d-ff98-e566a0cfd0cb@amsat.org>
Date: Mon, 25 Oct 2021 23:27:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Commit abb0cd93494 breaks -singlestep -d in_asm,cpu with
 qemu-system-sh4
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <ec65bc8f-2f99-9f49-d6ee-7b96e67a3a1b@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <ec65bc8f-2f99-9f49-d6ee-7b96e67a3a1b@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.846,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/21 23:16, BALATON Zoltan wrote:
> Hello,
> 
> Commit abb0cd93494 (accel/tcg: Split out log_cpu_exec) seems to have
> broken -singlestep -d in_asm,cpu output with qemu-system-sh4 after a
> delay slot.
[...]
> However I still don't understand how the delayed branch ends up at
> 0x8c800964 instead of 0x8c801528 above. Is this ouput not showing some
> already translated TBs even with -singlestep -d in_asm,cpu,nochain and
> that's why I see those cpu dumps without instructions? What's the
> correct way to get a trace of all executed instructions?

IIUC this commit you now need to use both cpu,exec to get the output?

