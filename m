Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF48868DC2F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:55:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPPN0-0007Tu-KX; Tue, 07 Feb 2023 09:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPPMy-0007Qo-41
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:54:52 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPPMw-0004dc-2n
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:54:51 -0500
Received: by mail-wr1-x42b.google.com with SMTP id bk16so13803209wrb.11
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nOsk9Qsh/uGLWBfOVIJY6IJo0wbiEIvr9IixuvPaNbw=;
 b=Umr3hAuf9YtYKozA06NMAlnjtQCHBpPCFHNoHa4ZaykyDJTYB1QbMIM0tpdal/llxQ
 H5lXyW19Uzm92Pe+XLWBnwwIlbcOyMFVnmiy5uK6J3INEatVA6Jd0R8H1g1iShH2u5pg
 db2ucyd9L3zCzgrqvJkq/AkoNpFx4eYCJq0ql3xtR2qgRuYZQBtxRKPAwHviuYst/Ux6
 lAsirFthXOzPSjvVwo5TvkmGpJbUzLUY0+TedblsMV2t0J9QVRb04mAeieb0qGhAj+NC
 qIJPJueeqVmn2nKjouuuIf232DbJVNOp0ehhtL4JUPxE0EYUeKWUl4/T5IoX8hybYqjq
 diEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nOsk9Qsh/uGLWBfOVIJY6IJo0wbiEIvr9IixuvPaNbw=;
 b=oTpY30KTgvfJ0f82I30YRYGja8i5u8OmVxd3nTt4pl+XiujSK76MZE0wMfEyjEgExa
 A5Mvu/QpK38D5Uop36NSEFufuJBhjwHnB7I+BMr669hMpbohG6m++mBu8IabQiLudIQt
 Bi9rab1cDEVtnsMqCiuO89XH+4VzoER86Lz48e1zh9jCBdHK7SMnwBlXkf8zH4EUFaIr
 Vij3Srme6IorVhradWOA2huZc107hG2ZW2beEjW/7z3M1eVLgQDAFlHDifu1pojRO5wB
 cQluciI/Fn4luv1btx3VPqdqXZs4BgJ1jjc3hgnoBV3CX3ax4Uj3n8k3FUVJjJ/P7kS0
 qzTQ==
X-Gm-Message-State: AO0yUKWWEld/h2m/lyyC/Z8wxtZpWYxMB5RR74n8mj2oJlvkhXStvHLA
 cgVdLPQy+m90+lui/TYnJIcEpw==
X-Google-Smtp-Source: AK7set/UhAP1izVo6xk+PbP1BupOqGEQ+j3CcUbHIpeh87dtIiOGBwsP9QX+Xufa/h6YH+sMro2xww==
X-Received: by 2002:a5d:4149:0:b0:2bf:dd84:adf6 with SMTP id
 c9-20020a5d4149000000b002bfdd84adf6mr2905672wrq.60.1675781687946; 
 Tue, 07 Feb 2023 06:54:47 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d17-20020adff851000000b002c3dd82a0e9sm8715849wrq.91.2023.02.07.06.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 06:54:47 -0800 (PST)
Message-ID: <53dd2acc-0eb7-5e49-e803-2625f0841880@linaro.org>
Date: Tue, 7 Feb 2023 15:54:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] Hexagon (meson.build): define min bison version
Content-Language: en-US
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>,
 qemu-devel@nongnu.org
Cc: anjo@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com,
 quic_acaggian@quicinc.com, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <a6763f9f7b89ea310ab86f9a2b311a05254a1acd.1675779233.git.quic_mathbern@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <a6763f9f7b89ea310ab86f9a2b311a05254a1acd.1675779233.git.quic_mathbern@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

Cc'ing Paolo/Daniel/Thomas

On 7/2/23 15:52, Matheus Tavares Bernardino wrote:
> Hexagon's idef-parser machinery uses some bison features that are not
> available at older versions. The most preeminent example (as it can
> be used as a sentinel) is "%define parse.error verbose". This was
> introduced in version 3.0 of the tool, which is able to compile
> qemu-hexagon just fine. However, compilation fails with the previous
> minor bison release, v2.7. So let's assert the minimum version at
> meson.build to give a more comprehensive error message for those trying
> to compile QEMU.
> 
> [1]: https://www.gnu.org/software/bison/manual/html_node/_0025define-Summary.html#index-_0025define-parse_002eerror
> 
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>   target/hexagon/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
> index c9d31d095c..42b03c81e6 100644
> --- a/target/hexagon/meson.build
> +++ b/target/hexagon/meson.build
> @@ -183,7 +183,7 @@ if idef_parser_enabled and 'hexagon-linux-user' in target_dirs
>       )
>   
>       bison = generator(
> -        find_program('bison'),
> +        find_program('bison', version: '>=3.0'),
>           output: ['@BASENAME@.tab.c', '@BASENAME@.tab.h'],
>           arguments: ['@INPUT@', '--defines=@OUTPUT1@', '--output=@OUTPUT0@']
>       )


