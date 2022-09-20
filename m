Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A005BF156
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:37:50 +0200 (CEST)
Received: from localhost ([::1]:35960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamoH-0006ip-Cd
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oahTT-0001NP-Vy; Tue, 20 Sep 2022 13:56:00 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oahTR-0006yE-AM; Tue, 20 Sep 2022 13:55:59 -0400
Received: by mail-wr1-x434.google.com with SMTP id t14so5638135wrx.8;
 Tue, 20 Sep 2022 10:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=Y0wHt8iEqm25SFbGyqcH5xO9yMmfKLoRPBVWoNmTQSU=;
 b=eLTMThgOeGG2gls3GbGAdqDWZBWgLT9hOkLae5Hfw4m651H+4pOuLWMYqv/hozAWaV
 /DX0iED3CrVNJpPArtYLA/QI9fxgsJ7Yvo2OiPeCFRX/tF69mf0cY2/2U7FZpLsWd5Dd
 F2sMOQg4LoG+88lSY6oDvX8BNAMFWeXfMgYY1Yo3+m50CNjKxbZvQKX5Tp0w1x9wuH5n
 3NSYAjfPxJ7xxsYVyfq6TZorCQEkT10DNfiACbgtbpwfdDl5TkI85xdQKXFFZMraMpAo
 pwsc3GTV65jr2wMGQ4Kh204CzzFlO1b6/pP+tOXNLOniNSExVyBReidkFZPd7p9J2rWy
 tJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=Y0wHt8iEqm25SFbGyqcH5xO9yMmfKLoRPBVWoNmTQSU=;
 b=WBCbDxvhbo+as16gVPiaSbcbCXdkRVd5Ep7zlET09ghvWyCHkZoF1k3IOkQfIO4Lte
 3XTYOjhzD9cgBfRf2iC76Uyy9djknaFW9XPd3vZaVKmlalBIk8srFBd3TTZU1BTS2r6f
 qkWajy8F0SEnvtplGgMq+TPYPBf1pQrzcnjMADxrliWnnorxMooDTgkhJSzMZm+WeU7y
 lJV4Ht/EKxkGXHqvMF+b5aQcKgbWEFW5TDpdKLfUvbJo91XVGBHSQEWH3cj/puHHChoc
 7muF+FPVP8eq8XWrQIbPPQLQLai4f5NN+xAX6hPPn9sXHrHLw74StQxb31eSUGbXeykj
 1hzg==
X-Gm-Message-State: ACrzQf0RDtHQCydZzN6vBkkvNdeq6XOd0Zqra3CumgN0NvVJy7Dmxdf+
 VDsRoTuhjfSp0pyPdq3jglE=
X-Google-Smtp-Source: AMsMyM6b9tvvI4m1HNEsOYIRF60eomKYnRyiPLbbfK2C/+GVtqZTsMahqBQ9vTPTyR0x9jWHQgN8bA==
X-Received: by 2002:a05:6000:15c5:b0:22a:49be:8000 with SMTP id
 y5-20020a05600015c500b0022a49be8000mr14663371wry.664.1663696553567; 
 Tue, 20 Sep 2022 10:55:53 -0700 (PDT)
Received: from [192.168.232.175] (29.red-88-29-182.dynamicip.rima-tde.net.
 [88.29.182.29]) by smtp.gmail.com with ESMTPSA id
 m18-20020a5d56d2000000b0022878c0cc5esm405419wrw.69.2022.09.20.10.55.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 10:55:53 -0700 (PDT)
Message-ID: <feecbc71-ce8e-5ed1-a7a8-b258b67caa24@amsat.org>
Date: Tue, 20 Sep 2022 19:55:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH] checkpatch: ignore target/hexagon/imported/* files
Content-Language: en-US
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>,
 qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, qemu-trivial@nongnu.org
References: <e3b6a345a88807a1c4daa45f638b2a90af538fd5.1663681339.git.quic_mathbern@quicinc.com>
In-Reply-To: <e3b6a345a88807a1c4daa45f638b2a90af538fd5.1663681339.git.quic_mathbern@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.182,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 20/9/22 15:42, Matheus Tavares Bernardino wrote:
> These files come from an external project (the hexagon archlib), so they
> deliberately do not follow QEMU's coding style. To avoid false positives
> from checkpatch.pl, let's disable the checking for those.
> 
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>   scripts/checkpatch.pl | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


