Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1C5643D89
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 08:18:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2SCd-0004Yv-SN; Tue, 06 Dec 2022 02:17:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2SCJ-0004Tg-8U
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:17:02 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2SC4-0002PZ-VX
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:16:48 -0500
Received: by mail-wr1-x436.google.com with SMTP id h12so22113468wrv.10
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 23:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZAGFeuwvLAS/ZETV+xeLZqFyiy8b+89lY4Vmw0tRPuA=;
 b=EK822/P+OTf4SETJ7u4RyNxr1/gM5AIt34YZEKdwTHInWotj+1AQyliyYMR6ikdiPW
 v+kanScyCj/Vrdbc79cOhsaH5FVnWAOiw0TmUlEAcrZMAc3qeaoFvFhH+Rt2kbpbhggI
 lNlMADyqECqitDKXBfyzLn2kyUmFgyuqidSr23U4hmSG0/Zq/ku46BW/xyzgkLETIsAF
 4EmdYBDL6y7pNd/03t3ouBUPfqaLCz0zCW2wkCZBC0gU8Q9LxQFVvGJto2kPYpnjqizd
 D6/5XMduHNixZKGtmlrzxZCkwXBl0OSubitc7h/tMilGuBQqsCmR/wslRK/s3ApP4PuZ
 CJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZAGFeuwvLAS/ZETV+xeLZqFyiy8b+89lY4Vmw0tRPuA=;
 b=Qln+vmjG1G2GfH1qhRUupljoiQp3phW8abgjbLe00BRKqKhfFfhSCm1pfrCsHbZVdm
 4xRNTWVPeMdJOKjZSjJtKNPTwdX/7gShcGDwQcFoYYHLXTiQT4V4U0RDJoCwg9lej/77
 slVRQzBRUg4Lnn+Q3P7Jrn8GyTPs5e2g2wcynd2L4h4nM8tVbe85lHDljNZw0/5fp252
 1y9ioAktVI1HG5SIIQG1BNdK+QqxoytEnQ2M2sV36JFSRzmEzSNzP+LTNchEMTHmdr9F
 nvgwbDCZyKAQ4Qxl0fqlvF6iWYBTr/ivtmpX4XX9XoSVDuqtWcT98IE3UYVIAcza8QsK
 fX8A==
X-Gm-Message-State: ANoB5pkAi+wCXUlBPxrwkrROUkY7UPLPdWiMKfS7DJyxpXtrh2+EQ/P4
 veEvr98QmkDwcVmTfCLbT3rbSQ==
X-Google-Smtp-Source: AA0mqf5EDiAFEtUJECdUY4jfvde6jxvrSsadX6HHEdAv/SJr09MPYAvL7qy3wiEIfpdKmJhCbZpVdA==
X-Received: by 2002:adf:f7c5:0:b0:242:9e8:84b8 with SMTP id
 a5-20020adff7c5000000b0024209e884b8mr28420277wrq.25.1670311002975; 
 Mon, 05 Dec 2022 23:16:42 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i14-20020a5d55ce000000b002422816aa25sm19339264wrw.108.2022.12.05.23.16.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 23:16:42 -0800 (PST)
Message-ID: <60a4ef0d-6a41-49c7-942c-3ba6753577db@linaro.org>
Date: Tue, 6 Dec 2022 08:16:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 7/8] tcg/loongarch64: Use tcg_pcrel_diff in tcg_out_ldst
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221206044051.322543-1-richard.henderson@linaro.org>
 <20221206044051.322543-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221206044051.322543-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 6/12/22 05:40, Richard Henderson wrote:
> Take the w^x split into account when computing the
> pc-relative distance to an absolute pointer.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-target.c.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



