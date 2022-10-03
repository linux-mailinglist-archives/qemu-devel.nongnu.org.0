Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A0C5F31BE
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 16:09:57 +0200 (CEST)
Received: from localhost ([::1]:43406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofM8p-0006VL-PA
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 10:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofLtI-0007Ar-4L
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 09:53:52 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofLtG-0003bR-DH
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 09:53:51 -0400
Received: by mail-wr1-x429.google.com with SMTP id u10so16732319wrq.2
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 06:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=4vHSDwSyCCZdJxGv0jFLEWPh8J4zkL5nk6qutLtKNLU=;
 b=Lz9udfe8r18lmpUKiGYo269nRx/SkeWvnybRHEgFQj7wpzKN8WFJiIDUOoXHYx3v75
 +qpBTmv27KVRWQ+5USYDobBl3G8oHEtKL6NYe+BIVzFXwvdZK5s0rAdOdRr6F8sBZtHP
 x+j6/0JC9Gc+Y+9vUh8s5EE7TgFje8LCfYr6uzYbYQ6wjP3Bfnjd+hp7tNaihSxJ2ywU
 ofoVC29/MZuZfnOav0btKfT2911GutBLV5jb3Ck3jFhsZ3biWF/tX7FmD42NgjRnWd4v
 wG+P4lZ9SnF5ahXDcQVjem6tHV2qZXp+qFo2lWQ6f+mhE6Rid/vszRbYqptdF48H5o22
 GFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=4vHSDwSyCCZdJxGv0jFLEWPh8J4zkL5nk6qutLtKNLU=;
 b=d5P4ZfQADmJM8Jta0G1n+ee9RTGfVeOD1OvSrznJje0KV9rD+ZQjyp9hL5RJA//7kr
 qX6JZUbS81/I/Bw8H0X0baZjIB8x3eP+BnUHmuxAaSa82+Q7IwDQDK99wdUFET4a/kxL
 86DS5xRvocBQYjd9trNQS/5VfiyTGc1zcX7KD54HdAjYq7IwyfRPhpCkqTvEJnmAMqt8
 tEwza+bbPP2/2YshHIzJCu9E83GuF449ALAeYIn6cjJo8sgR4QA+ieovt3avY+RftP9Z
 T/gAJlwAbqLuy9xxCaFdUdIffa1oPUZPWxLuWRg1rfi8+tkCmnOFV1mYdF9a7OVf5zzX
 gq4w==
X-Gm-Message-State: ACrzQf3tJJ040G07CXzcRsWTVy/2bjW6F4i12/iSJx2Us0qNRmUWmrJY
 LrT66/rBesSClzXQAExQ0MA=
X-Google-Smtp-Source: AMsMyM6DVbReBMB1SSsia5dh3v9wZLFJgKUrmsV53Xg2YBs0ILb+H/qHJWtiazgYYUZql9cPpDRpOA==
X-Received: by 2002:a05:6000:1d94:b0:22e:34ef:b07f with SMTP id
 bk20-20020a0560001d9400b0022e34efb07fmr4967842wrb.272.1664805228730; 
 Mon, 03 Oct 2022 06:53:48 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a5d595a000000b0022abcc1e3cesm9185516wri.116.2022.10.03.06.53.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 06:53:47 -0700 (PDT)
Message-ID: <431ee380-400d-c67f-0d4d-67d7e8dbc2b4@amsat.org>
Date: Mon, 3 Oct 2022 15:53:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH 1/2] crypto: check for and report errors setting PSK
 credentials
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>
References: <20221003102718.600058-1-berrange@redhat.com>
 <20221003102718.600058-2-berrange@redhat.com>
In-Reply-To: <20221003102718.600058-2-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.467,
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

On 3/10/22 12:27, Daniel P. Berrangé wrote:
> If setting credentials fails, the handshake will later fail to complete
> with an obscure error message which is hard to diagnose.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   crypto/tlscredspsk.c | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


