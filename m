Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2EA372374
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 01:11:55 +0200 (CEST)
Received: from localhost ([::1]:49126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhjG-0005hZ-Qc
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 19:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldh8d-00006x-Fy; Mon, 03 May 2021 18:34:07 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:46980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldh8c-0001sD-4k; Mon, 03 May 2021 18:34:03 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 k4-20020a7bc4040000b02901331d89fb83so216315wmi.5; 
 Mon, 03 May 2021 15:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HAdnMd/0J2Fiycy5KhA1NdMXqbDE+aBjDv9mLHWLw4U=;
 b=pB+JtunweKk0Zo9vMslQeondtuFhi0BVAVrcvht+ZiOkFAW3ouugNC3z7S3IWscLTU
 74FVatXZzeZJ5Az5oyWIT9jDnaFaKo/GP7ox4yGXfaFK6kuC3fC4wOG3YH0hY82d3fa4
 ViNx7QHl32Xnv0c5CZIF6mJ6DBN0hh0b7/xLVnQ3qchiMmr/3QlJEqTAEvry38FUTl2l
 J9qSE9xOznXF8m1ujIuM7FzUEOQgNuKL0FtfDyWCh0abarLkqntJrQnby7MDt+MpzWXW
 0P160alMba2NNNicZp6yRBXJKvu7RoqUzCBMCS/uKybIK9mixCT6HzBSP9gBoYlu//QM
 uSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HAdnMd/0J2Fiycy5KhA1NdMXqbDE+aBjDv9mLHWLw4U=;
 b=fVgHrwSrp/zkOn/vPoBp/31BWOsNoKDaF/wpi8uFE6d4XSps/l0Z/9Im+bos85pEX+
 a/RTX5fszp6WEr/0ParWlTy5/86chUKafd4zoohJJfHKSXBd37nr7sD+XvcSUZGDQ7Aq
 oLf0M9BP7kFWc8l/+CKOQpJcU5A6lxfqJR1H1YU42Z1Tq/LUUXR7JiFg8ul6zPWITIeX
 y6R6O5XXws7wx8DC6FENrdGPiqGLumQDkzTLqnTCSVpZi7jqypR3HxXZ1coVCOnmtDTC
 DKaTZt6i1T1NphD+rzvIGjxSNkOIUV1qaY028ubSudaQvvca0LVjyuJD4eFHV3VbDRpb
 wQeQ==
X-Gm-Message-State: AOAM532LHweoueOEXhoQSEi3OpQTTO3QxPzV7pOXKnVY5LPcWMmlM7el
 y352ExP07+H8DoRdkepSu38=
X-Google-Smtp-Source: ABdhPJyCuh2JT9/fuqfZT4vIytuUtaoF2SHNCp2i3j33NWHc0ORmNK01/SypSwqCtklVEbEUhGfHRg==
X-Received: by 2002:a05:600c:2994:: with SMTP id
 r20mr792363wmd.37.1620081239360; 
 Mon, 03 May 2021 15:33:59 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id p14sm13718581wrx.88.2021.05.03.15.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 15:33:58 -0700 (PDT)
Subject: Re: [PATCH v3 02/30] decodetree: More use of f-strings
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <450b7bb4-de18-d30c-0b8d-4f97c8792621@amsat.org>
Date: Tue, 4 May 2021 00:33:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430011543.1017113-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: luis.pires@eldorado.org.br, qemu-ppc@nongnu.org, lagarcia@br.ibm.com,
 bruno.larsen@eldorado.org.br, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 3:15 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  scripts/decodetree.py | 50 ++++++++++++++++++++-----------------------
>  1 file changed, 23 insertions(+), 27 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

