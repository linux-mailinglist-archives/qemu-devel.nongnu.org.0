Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE5C467F6A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 22:37:29 +0100 (CET)
Received: from localhost ([::1]:44174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtGFE-0004P0-1k
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 16:37:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mtGBo-00006X-Li; Fri, 03 Dec 2021 16:33:56 -0500
Received: from [2a00:1450:4864:20::329] (port=43523
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mtGBm-0003uU-7R; Fri, 03 Dec 2021 16:33:56 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so3208905wmc.2; 
 Fri, 03 Dec 2021 13:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ulEvP9TDcbF4yUaNntj84tNdtoZzQut7GEihev8y02Q=;
 b=jm7woDrNrNQOuOHakKVblB4nilyti3h2tYrCR2yMBmh+dCzDqOaNOp5QF6XKoKMo7+
 XEGFiYZMdWKvrSkNi9lBu5uO9KpH1KNKJdogN1dA/PDkdMD6fY6jeGG5irWYayAMrL/E
 GfoFPOYhyYal1FnlDOS4R7QLryo9ARAr+IbMZxl7KBoiZtkUjFkXYX4sChPlTnCJncqV
 9NO/VFamZc7IMU3kUEeqG0pTad0wpQ3zHmQcbThKMPb+wPYwVzcLkcGK2WnR0CtXX2VN
 CZPx4ruXB3uNpT2aPYP1nWNnGj7qaonXmG9EiBjE7FyABBKh/Rdh7qol5ngdsDR+nyDd
 s0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ulEvP9TDcbF4yUaNntj84tNdtoZzQut7GEihev8y02Q=;
 b=skhy1sqpvwIeMIyOJTCo+ojoJ+2a3p679SmlCRzWk2hX4X2DrDA4doFrqg2+7cPgi4
 jYMMCTMsLBoRNKfkd0E22EtGsHtv3URx8tEAHfLZxwMK5+qBvhNBaGLoKKdgWKLZ09wi
 nEDVhYu7xfFSuZIa8efVzEiRvx8LIaf9h9XkUH6UvHpUa2IZhCy1HbDUx9FNRUAm6etG
 5tOLCqWgveU3dsIuZzEZyc+Bk1TyAddnU3QHfW/O2NAJR2Qm7XYZwjZjrPpgzMLUhjqP
 ZQmEsw708NfOSmzdV6qea+p/7XqeihoT5sRhoo43+Nl/IiN1vqCmVS2qxdOKa+7pGWS+
 tzPg==
X-Gm-Message-State: AOAM533+rwW+J76026LYWE1JqkByKgbcfATDdmI1CPJVQZathrvwnorh
 TU3sK4VNlviuzCIfQF/NlMM=
X-Google-Smtp-Source: ABdhPJxPR/Q9FzIRnm1qoXLSG4fBJRIVvlJvVqEvl/eqDB9tjR8lZ8x0Yqi0tx54Jsh/WB6fSrOx2g==
X-Received: by 2002:a05:600c:4154:: with SMTP id
 h20mr17794407wmm.189.1638567231623; 
 Fri, 03 Dec 2021 13:33:51 -0800 (PST)
Received: from [192.168.1.34] (abayonne-654-1-109-18.w86-222.abo.wanadoo.fr.
 [86.222.60.18])
 by smtp.gmail.com with ESMTPSA id o1sm3746072wrn.63.2021.12.03.13.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 13:33:50 -0800 (PST)
Message-ID: <acf4e618-c182-f2f7-85d0-12109adca3f3@amsat.org>
Date: Fri, 3 Dec 2021 22:33:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 15/35] target/ppc: Use FloatRoundMode in do_fri
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211119160502.17432-1-richard.henderson@linaro.org>
 <20211119160502.17432-16-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211119160502.17432-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.938,
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
Cc: alex.bennee@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 17:04, Richard Henderson wrote:
> This is the proper type for the enumeration.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/ppc/fpu_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

