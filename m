Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A4B620289
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 23:48:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAtl-00069a-1r; Mon, 07 Nov 2022 17:47:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osAtg-00069G-Ac
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:47:16 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osAte-00080D-Ng
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:47:16 -0500
Received: by mail-wr1-x42a.google.com with SMTP id bk15so18295913wrb.13
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g48uk5ZMIFVX6PxtalkEMRw3CPrQwGtOM7WpnVgG0v0=;
 b=UNdUEMzukZYlAsPHCjiJvbaEwzJZNZC3oviPbjXWQFKa0IQRYHxI16gBHj9eTsvFCz
 fOpe7BN7OP+E3Od+kuwXKpYSBkLgVvGvLYdX/Qhv/2oQlNDCkYSjLV9RwGUb8wxhkiJJ
 l8abL4AccXaTJRAPR2Z9OVg+rFZfOTbTELwiixs4nS448T68vY58lJXd7lrEsvNGdBl0
 mIvraFAsxkxuv5oOguRKC26MXSG3+Jdw62isIqQB4oTiWtf+icVMN70hUBzIQG7gc/Tv
 tDmID/BU/ak7Lf8q42YalwSxmS7T0KthiOJgeZRTipTx9y3eKaRGKn66fP57DClDZQYc
 vf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g48uk5ZMIFVX6PxtalkEMRw3CPrQwGtOM7WpnVgG0v0=;
 b=B3IMavzYA0el6sP3FbFEQ8xTFurYCUky1sWGgHDVrJ4l2kFNhutHp/dMrObKP1qaKh
 AQlr/disxVYeJQwN6t16MlZP0M7Ewih3blElTHmLdWLwNQH9p1NRssmbyJiBcAKEUmj9
 b0EB/gTWVuAK6KDSIjr+ufXM7EUxXXOP76b89I/RDGUKhExwtQELjbmD7USsxrC7JIZc
 VEh2P5JdTO6aDbW7fHvymuSD2c4nxCsvrdQraRVxkbCfKQYiU0uG/sj5ZK3Ug5SGXpZi
 9QgM+/14CPR+dilNQ8mmadJlwsY2BghKEa311uriwYoSvt+vSF2f+C93KKwsQNKech/6
 XyVA==
X-Gm-Message-State: ACrzQf2Md1/5ggvH8Nt9aRvxUuhULQgA4FEgkCXLmj5umjYzmcTPYDAN
 h+u7P4N2l2esUOCAyYuO59r+uw==
X-Google-Smtp-Source: AMsMyM4Ten6NtBKbKo6EnLUeS2g1JGfcgiBGzvg1c1vzQs1uwaXGFsihhfVEhnEheuONfZ5cd1dbpg==
X-Received: by 2002:a5d:4a90:0:b0:22f:bf9b:b6b3 with SMTP id
 o16-20020a5d4a90000000b0022fbf9bb6b3mr628140wrq.108.1667861232456; 
 Mon, 07 Nov 2022 14:47:12 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adfe590000000b002365cd93d05sm8414916wrm.102.2022.11.07.14.47.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 14:47:11 -0800 (PST)
Message-ID: <43f4db9f-786e-c45f-f2a0-fa46fd8fa24c@linaro.org>
Date: Mon, 7 Nov 2022 23:47:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 1/2] target/mips: Don't check COP1X for 64 bit FP mode
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org
References: <20221102165719.190378-1-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221102165719.190378-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 2/11/22 17:57, Jiaxun Yang wrote:
> Some implementations (i.e. Loongson-2F) may decide to implement a 64 bit
> FPU without implmenting COP1X instructions.
> 
> As the eligibility of 64 bit FP instructions is already determined by
> CP0St_FR, there is no need to check for COP1X again.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   target/mips/tcg/translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
> index 2f2d707a12..e49d2a25a8 100644
> --- a/target/mips/tcg/translate.c
> +++ b/target/mips/tcg/translate.c
> @@ -1545,7 +1545,7 @@ void check_cop1x(DisasContext *ctx)
>    */
>   void check_cp1_64bitmode(DisasContext *ctx)
>   {
> -    if (unlikely(~ctx->hflags & (MIPS_HFLAG_F64 | MIPS_HFLAG_COP1X))) {
> +    if (unlikely(~ctx->hflags & MIPS_HFLAG_F64) {
>           gen_reserved_instruction(ctx);
>       }
>   }

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


