Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE775A577B
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 01:13:50 +0200 (CEST)
Received: from localhost ([::1]:37492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSnwz-0003mk-S8
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 19:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oSnv7-0001j9-4d
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 19:11:53 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:41578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oSnv5-0007aj-KP
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 19:11:52 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 n8-20020a17090a73c800b001fd832b54f6so7493731pjk.0
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 16:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=ZyPCZZAR6QKRlCWAXlO9KmVn5k7tK+XCVDwR8NA4m34=;
 b=Er1eCqCHLzVa+2rt8yLTPGcax//mA0ZYXh1Rw2Jz2krmg8XfAi98NfORzqvwjWm3J+
 JStvizNd35w8NBNx28G6b4cJQEm/CLwMKnMxn4WozWGNScfembUM57KUxmhxYOVIRkah
 sQd7LXTEnvmNA5TIkJIk2X2zakMM2U2bkbW7IasdWeuU1YlfCmpGfU0trcDMKxoOmJ0J
 l9IwUOH9i9RMaGFloOLF3OShk2pn8bycTuPsYnRLiM+30nfiF/dMeTgprK6r6Ne4oPCF
 ikuJiZ4sB1tZE2T9KNtnxpb4ICUjcNMeFTzisvINAA0SCJjufHbvUtp5mZ6X0snIkA5l
 gkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=ZyPCZZAR6QKRlCWAXlO9KmVn5k7tK+XCVDwR8NA4m34=;
 b=UFsj2U/SuwPep95uiDXH8YneCKi5MtoglysdtJbA3WiJ6B+ZMkGJmuVvKqLNF+smFP
 a51RO4sh9slkSPKl6OOdo9+u5qLlpPfqCVWWzrIHvpppPMIPSL6FUkCmXpB+JHJJwosK
 6A82j7eFe5m/Y/L7/DcfTdua9eisYbq9aWX1E/LQpz7MUW+C+rbdQ5IzSUs90eG2MDw0
 AA+2AFY89zyKf/0gipc7WkSU9kNVtTsXiT5TWuNSELUVhCI1L4B50NalS3Tkx+YFhkzu
 x6hmsfQTN9wBTNnBWJOFVae1lMPKcKsQRkjnd6CQbaymsl+94p/caYWQd6/ztaJN/X/o
 pYaA==
X-Gm-Message-State: ACgBeo3BgYFI3jg08OdBX/Jgcw9pd1LnhG9V0woTX1hNGRUTiaobg59X
 qbF3Xrd08CiM09YgCeIlQNA=
X-Google-Smtp-Source: AA6agR7HM9tv1OpynqCpsRH+U6uQr2ec6oLP05l+s6i5l4C98Xa0ENpHPeMOp223pRwQUVtKpTopLQ==
X-Received: by 2002:a17:90b:3e86:b0:1f5:2b4f:7460 with SMTP id
 rj6-20020a17090b3e8600b001f52b4f7460mr21015821pjb.97.1661814710299; 
 Mon, 29 Aug 2022 16:11:50 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y27-20020aa793db000000b00537f7d04fb3sm5539948pff.145.2022.08.29.16.11.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 16:11:49 -0700 (PDT)
Message-ID: <54da58b2-8694-2989-980b-e9332b13d4cd@amsat.org>
Date: Tue, 30 Aug 2022 01:11:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH] MAINTAINERS: Update Akihiko Odaki's email address
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20220829083120.143415-1-akihiko.odaki@daynix.com>
In-Reply-To: <20220829083120.143415-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 29/8/22 10:31, Akihiko Odaki wrote:
> I am now employed by Daynix. Although my role as a reviewer of
> macOS-related change is not very relevant to the employment, I decided
> to use the company email address to avoid confusions from different
> addresses.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   MAINTAINERS | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>



