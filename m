Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DEE3B3FB3
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 10:47:33 +0200 (CEST)
Received: from localhost ([::1]:33502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwhUq-0002GS-QE
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 04:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwhTI-0000lJ-9o
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:45:57 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:44713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwhTG-00060e-V1
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:45:56 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 h21-20020a1ccc150000b02901d4d33c5ca0so5319784wmb.3
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 01:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xf99ll2p1RBPUSYEWizD3jaGpf5jLUcLLWsXbxhq0wI=;
 b=eXvS/BxwuhJi3z979eb2AVlMKbYxSY+34o9bZw5NctdJVAfwurathdCTzKv8XIeDlr
 5AboTLrHk6LZQma8vCPR+zuC9efKuhRacl5dMwb9t7IbuSRbF8Wtxu7dxlzoNsRr6XHL
 E5wrvFgNH19ZCIkt1Ux/bc0cHpUWTBxYE6HB3I6idwl6DH1UKhnmWSaQQ7dF9KWilrWa
 UwJ8PLcxTDG2lwNJeO7wcdaYcQazugpNjVLdqhQthrkQZxO6zCiiA9kAvfhqo5Fj1gvF
 CszRTg5EQBsI3dqnZJLSRE5IP/PTpz9XV1OE3KMmVtoQYlV49KghNugniu1XiNb5p6wf
 ikjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xf99ll2p1RBPUSYEWizD3jaGpf5jLUcLLWsXbxhq0wI=;
 b=lPvNl80Rr98WAghYkmiLULc1sIgX4okM5C1WT174W31Zm2jlV9GeyfKud+QpAJvroB
 9WCVvZBOmhAsMNo5f5HYhZcr2fJr807vPuPjw0blx2imYtS5A4QkGLai0a5N4bp8/0+u
 WJ8P4CVB//RxDDwAN9mdm9AV7xDe9vlFdSZLtrNJpztPSeOr63nURzpQwox5sT83NvoR
 FqxdAkPSwcKrgPft40vUIHawxHHposUI5f82C6NkiE5TI6TTV8wonsYexJsPhGGqx5v1
 E4sggi1cshMXw03p7yOWCz0vq/cFvwls1nObb7EjOdQYuTQQsxX3w0yVT0U7oS5jlTYC
 h/WQ==
X-Gm-Message-State: AOAM5301VRsTXW5ZwHlbfB24IV/QjAAX8aJAIYFvcGRCZFaOLblUcOUz
 2kN99CFLA1psL++7YXU9d3g=
X-Google-Smtp-Source: ABdhPJyU/dRODrVL0KZaeFkx0GvzCpDXwN0cObTxvSyIcK7XZzhm+3FAK3LpprDW3NoaTYZl2Sw2GQ==
X-Received: by 2002:a1c:9d89:: with SMTP id g131mr9434515wme.45.1624610753617; 
 Fri, 25 Jun 2021 01:45:53 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p13sm5323242wrt.89.2021.06.25.01.45.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 01:45:53 -0700 (PDT)
Subject: Re: [PATCH v2 01/10] dp8393x: checkpatch fixes
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, jasowang@redhat.com, fthain@telegraphics.com.au,
 laurent@vivier.eu
References: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
 <20210625065401.30170-2-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d53d0b74-8ba9-5716-14dd-06d4d480b8c8@amsat.org>
Date: Fri, 25 Jun 2021 10:45:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625065401.30170-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/21 8:53 AM, Mark Cave-Ayland wrote:
> Also fix a simple comment typo of "constrainst" to "constraints".
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/net/dp8393x.c | 231 +++++++++++++++++++++++++----------------------
>  1 file changed, 122 insertions(+), 109 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


