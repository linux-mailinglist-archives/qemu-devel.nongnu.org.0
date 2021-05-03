Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACAF37235E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 01:02:21 +0200 (CEST)
Received: from localhost ([::1]:54594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhZz-0004NW-Qx
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 19:02:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldhAx-0001p0-Un; Mon, 03 May 2021 18:36:29 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldhAw-00037a-80; Mon, 03 May 2021 18:36:27 -0400
Received: by mail-wr1-x42b.google.com with SMTP id m9so7236303wrx.3;
 Mon, 03 May 2021 15:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M6DhStYJsMhMzDdFAP3PwwV1n4lGET/sk2+rqiSo3vA=;
 b=N3gw0U8Xgix3aavcTAOiPEYXY1eKDIB+sLm7b6erlXhi5nTIvsbgtEFJwXUQ50gNDO
 ytNJ62so5qzmkrfueFW53mCgJYA1CXjKl652Lzr9DsVAqC/l814VoIjbMqylRQGSKo7w
 oB2wUvfsIeGJJsIb0+syWdNJDXZ8YPeGSRmSiJfzoCn9dapQhCmrhTH/8FcmnZS7aKWO
 9JlzRfJz4x4UDbS/Gvu+ISU04Tu+X4VDpPLVbcEdYZP3nAxx72mfxQdu57SeY+lRH9Pw
 FUVKaK1zWFZTEUGhGuWdyU8b3IHGmSGAk7MyClCO7K8oXinOFLCwyiTSVn+c+bFDX2sF
 Eiow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M6DhStYJsMhMzDdFAP3PwwV1n4lGET/sk2+rqiSo3vA=;
 b=IBVun3Sej7LGAhOPO42ffVvJmeEvSASRAJwQ0sI3JGfjhxTe1JVv7D4h7G6Xxr1Z7e
 A3fXbmEfXyRSUiEJr/DCGe6JK+zHI7CxpsY2tCcVPTeUQkVG3IsOkVg9UA2EX0ui9WSB
 m+XbAfCbISYUXOghwZnc+8skiDqgsVYraDP2NebE3VhdIMH0oNyCyre0dh/50Rr90/lG
 CnKzMHY4lJC6Gp4U9WJ0BKcdfedZfJNtW8XooFgfpplu8y2NL3T5KL1YgSUCVAFcWyRB
 HidTqXknOPtd6HbElsnN2iaMyEMQoWN1PL8Qj+ixe3wwkB1wvECgNj6HtjNief1MmBwh
 EvBg==
X-Gm-Message-State: AOAM5334qkg4QivZ5X235XNd3ol7odO8/39nxOnDgFz4R/e+wccEdcke
 cpo63R/1/XkYjzE1BnqOVCo=
X-Google-Smtp-Source: ABdhPJxbjnJMHZ/cURswXGKho4+lR3JkkJJ4AAGAj8GsikXWAcgTVPYLWAwCddAIW/EFjQb710bLZw==
X-Received: by 2002:a5d:64e5:: with SMTP id g5mr28263766wri.30.1620081384522; 
 Mon, 03 May 2021 15:36:24 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id p10sm13355746wrr.58.2021.05.03.15.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 15:36:23 -0700 (PDT)
Subject: Re: [PATCH v3 20/30] target/ppc: Mark helper_raise_exception* as
 noreturn
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-21-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <27735d9f-7ad7-b5f0-837f-8f5722507836@amsat.org>
Date: Tue, 4 May 2021 00:36:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430011543.1017113-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
>  target/ppc/helper.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

