Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0771479E83
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 01:17:20 +0100 (CET)
Received: from localhost ([::1]:49044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myjt9-00039S-5N
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 19:17:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myjri-0002Ib-I8
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 19:15:50 -0500
Received: from [2a00:1450:4864:20::42f] (port=34642
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myjrh-0004iT-4q
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 19:15:50 -0500
Received: by mail-wr1-x42f.google.com with SMTP id s1so11901968wrg.1
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 16:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UnS2rEOFPQ1yI8P7gEro7FvP5Rqfto5Bb17lra9GOGI=;
 b=Tbj5W9Z3ZabIdlpx+/dvMm48VsEhDDo16/ypQtImE6o95Z/q4+ux76KCqET4MyNk4R
 YEzEIyeRO94E/9hcy6wOyIzWHDNAPikp1ZKVa6+iyJDfl930AyFhWpc1FHB4ur+26rBD
 MzDbK8xj45QraPqe2PADvajb/4SBE3k0jjP0RgSHO7JEjoLb+sEvHVYhT2Cdow8zeIEl
 R5dfYN3kds810IMMcqR6+yoC8uBPMTcPf7+0SKuDeDlrtU6phdU9azgMfk1rT+1QA+zf
 H8fboPD5eHKIKKj51cCx4vrpmjYtHjJhkPiN3wuyB+FI6DUWeuf69/0kCY8CkwIqYI1t
 PzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UnS2rEOFPQ1yI8P7gEro7FvP5Rqfto5Bb17lra9GOGI=;
 b=taqW6Rkoi6fHAsQWZyFzWpoMNLF/9+9vLyhEKn0X822Q8OWJoCKoIT4AIykmVbVUOh
 K1wf/eC4pvmKH0A52gIZ0fPZQpxDv3TlQ01ugbphuoNSJIUmEeVQjnVfYOJ9cHRhyAfb
 Y80vXeQssTK1cAmZEqBm9Agypbjq+rmeD7H267h4PEZG14I7kMD+zvQRNNgIaUQdgYR5
 BDbZOSOryUDQzfi8bRl2KTqtQH54iUoTQBHkVnmClLCT5VxLS0x6ejbJt/Qv30GbivcK
 567X3fM5AYbwnJushb+HkyVxuVf5SXMzfTFypc7o3XEaAsI1C4PMcizzknHM0fTx+E8D
 7O6w==
X-Gm-Message-State: AOAM532H39cQjIaZAw1Te6U5Zr+hiTRTQTDmoeq9HlyoUKblLOtPFg5f
 OnRpKH8tEMUtwaGd1UZ1hK0=
X-Google-Smtp-Source: ABdhPJxqWRkMQQNpEuRKCOD50y7WoqrEFK7neSqRfVBbzc/SQkWwQXkyE+rYZZpJukmy0Y3uM3elig==
X-Received: by 2002:a05:6000:15c8:: with SMTP id
 y8mr7707880wry.305.1639872946619; 
 Sat, 18 Dec 2021 16:15:46 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id g7sm11226996wrx.104.2021.12.18.16.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Dec 2021 16:15:45 -0800 (PST)
Message-ID: <7fe9cd95-1a26-b478-a301-613e802b11d8@amsat.org>
Date: Sun, 19 Dec 2021 01:15:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 03/20] tcg/ppc: Implement vector NAND, NOR, EQV
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211218194250.247633-1-richard.henderson@linaro.org>
 <20211218194250.247633-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211218194250.247633-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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

On 12/18/21 20:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/ppc/tcg-target.h     |  6 +++---
>  tcg/ppc/tcg-target.c.inc | 15 +++++++++++++++
>  2 files changed, 18 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

