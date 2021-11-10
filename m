Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D7944C131
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 13:28:33 +0100 (CET)
Received: from localhost ([::1]:56934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkmiN-0007Ir-Ri
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 07:28:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mkmgg-0005g7-IT
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 07:26:46 -0500
Received: from [2a00:1450:4864:20::534] (port=37574
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mkmgf-00088T-3A
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 07:26:46 -0500
Received: by mail-ed1-x534.google.com with SMTP id f8so9886091edy.4
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 04:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qdFXG3K0pZTJm159HN9Vt9agxRy/Xb9or8xxr7htTxQ=;
 b=B7G0LN7C47G0+Q3ZAZQ7/gA8fL3a0t/9bZL+86JnDjtoB8vQFnxg0ZUnkl6hKB6R8S
 SHDRo5LKsNNuWYOqc3RUX3+nimpWu69ZfYBpeouTtCAhdSfTwTOcI3P9Ly3boqtNstao
 yQVc3jC4eiCMv6W28jl/swPM0qnaGbJf2aYpIFvelp8/nxBFGEI5nifNhpsfMpXcPo4P
 Ikg+nWRgCA4krmXpk7N1Dnik2O89UebyYeSeh4DlP+/WPVgPxVxfaYk93iyUD4hngCoN
 ujSCYNPGGm1pZtn5TLz+KdlxA973ms1dlebrK9Y11yPxI3y33it4wcnghVIor3oqYBOP
 IgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qdFXG3K0pZTJm159HN9Vt9agxRy/Xb9or8xxr7htTxQ=;
 b=Os3XRGdy8H+wgVepxgSwIUCMv2fjDipC9RYn+GvaMlGdLsiohZ3JEygid7rfeVNRqO
 zLDVLoaq/Ar9B/meLmqFTtPZRx0mafQCWTu4ITB0eg8z0hHJCK4litYJGKtozt5pigqH
 /npD58l2GBBeJCckmv9Dn5q4r+39WremJWiTe5Op73w48JTx5rX0cp2l/EpVDMZ9XfkP
 XN7e2/ybyl2zgVBLZYVxR6KIZua2pk1yxqM44YSOru9ESQ9xBDSH4G1f3Ka/j5WQJ3A7
 b90WSLDZFeVH34cJnha30VxTY2S5/p2yE63Mvp5R/vwNkGKqy5cf5nncK9e8ki9n6Fz8
 DGuw==
X-Gm-Message-State: AOAM533W7UE6yYVjIaQOJN8/WGfCoYwHrMDQX2x6rfbWaE4sMk1ypC1J
 u09CRn9Mmv2TWOAD5Q3WmLw=
X-Google-Smtp-Source: ABdhPJw9EFUp1daCSCSKcGXVlvgOS47NHB0/9jLa3SwHZ0dn3n1hyquQxJChavHuqGaCDAvcJFJrOg==
X-Received: by 2002:aa7:ce17:: with SMTP id d23mr20928626edv.264.1636547202457; 
 Wed, 10 Nov 2021 04:26:42 -0800 (PST)
Received: from [192.168.20.130] (73.red-83-57-43.dynamicip.rima-tde.net.
 [83.57.43.73])
 by smtp.gmail.com with ESMTPSA id r26sm11201745ejd.85.2021.11.10.04.26.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 04:26:41 -0800 (PST)
Message-ID: <ea249635-a1de-6aa4-9945-9b21a9c325de@amsat.org>
Date: Wed, 10 Nov 2021 13:26:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] tcg/optimize: Add an extra cast to fold_extract2
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211110120156.188537-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211110120156.188537-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.678,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/10/21 13:01, Richard Henderson wrote:
> There is no bug, but silence a warning about computation
> in int32_t being assigned to a uint64_t.
> 
> Reported-by: Coverity CID 1465220
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

