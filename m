Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 584125E61D6
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 13:58:08 +0200 (CEST)
Received: from localhost ([::1]:53088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obKqE-0004fB-Tu
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 07:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obJqc-0004Zy-9e; Thu, 22 Sep 2022 06:54:26 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:39802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obJqa-00058d-R5; Thu, 22 Sep 2022 06:54:26 -0400
Received: by mail-pl1-x632.google.com with SMTP id f23so8434563plr.6;
 Thu, 22 Sep 2022 03:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=GRf0QYK5avD46exX7JgJRqrhj6l0P79LD5unOaezZdU=;
 b=YiAulyOJ99+6TIzFjGs7qbyNZ08voN/OSmRc87+8zb+KvPCJIGWNadSKvlPrBlKdO2
 BGTNZ31GhlOa4POAPhfoxXaDu8nblXds1181+rTyf7wkFJ8M7zG5sJsghf5BJer5tkx+
 DVf/IEPUUG7Bn817FFrM6vcQ1/ZZ5oluJR6zBf7zvB8gdnu7ScM6YNKaU/mLVnVEqpkk
 VPWDeKNiA21PlB+GSaJ9JGNNqxXbRbFiyZN2EngcQhQMBC9M5nznne9RRcBfIpuz0mHg
 hVKE3kpuH2hVBjeVVvrrT6Vrr2+5MQEZRcT4vnWOipud5lKCf4EiW+ZbGBq63GDc8Jws
 FoPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=GRf0QYK5avD46exX7JgJRqrhj6l0P79LD5unOaezZdU=;
 b=5e9edQsbI+TlsqI+YD4ene2E537em+XW2HFDby1w6/Pcmri0s6XtNaaBkEy8CLVjY6
 6ItIvNI5YccUQpf+wGBegI8+T1cVFx3DzFMqr2P+20L+Gw1mNA4gY8TRyRaC3oXGGk7Y
 GKQz2l7tYS38xylReHI0J+0yMG2RHAEoOodFSzUKNlXY1dOlghqh+iiaN3aOQLOzW2V/
 RXPX/jYtHUc95dYiZsZFrZstBYCcX14lJDF02mM/wVUfcslmhyC2+fnPBf5ZqWpHtl83
 rJkPcmfiuP1PLJSfTttJ3H1iQEPJY3vcZmZ0fsH5aIRTaOGQEOxzl2TSjpUf5GIO3LWO
 FGLw==
X-Gm-Message-State: ACrzQf1kjn8C0+SjpFIijrAY61MqWqInAaetBeondE6QnFpZOgrrn3PT
 1TCNCz596jNruOgkf+guYOo=
X-Google-Smtp-Source: AMsMyM7NlkgEmbgyEQrlh4UKt7cb7S1F8Pq3QVG5ZASPlPMZF9RLk2a/+Bh7i4gBqXsHgmvwvtVFOA==
X-Received: by 2002:a17:902:c40b:b0:178:e34:efa9 with SMTP id
 k11-20020a170902c40b00b001780e34efa9mr2632721plk.10.1663844063357; 
 Thu, 22 Sep 2022 03:54:23 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a63e04f000000b0043b565cb57csm3568007pgj.73.2022.09.22.03.54.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 03:54:22 -0700 (PDT)
Message-ID: <451b5d11-ec06-83dc-c60b-4eb75d895a03@amsat.org>
Date: Thu, 22 Sep 2022 12:54:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v7 08/14] hw/ppc: set machine->fdt in
 pegasos2_machine_reset()
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org
References: <20220908194040.518400-1-danielhb413@gmail.com>
 <20220908194040.518400-9-danielhb413@gmail.com>
 <52281b60-27f-1eee-115-b4f8d2693d5d@eik.bme.hu>
In-Reply-To: <52281b60-27f-1eee-115-b4f8d2693d5d@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.702,
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

On 8/9/22 21:58, BALATON Zoltan wrote:
> On Thu, 8 Sep 2022, Daniel Henrique Barboza wrote:
>> We'll introduce a QMP/HMP command that requires machine->fdt to be set
>> properly.
>>
>> Cc: BALATON Zoltan <balaton@eik.bme.hu>
>> Cc: qemu-ppc@nongnu.org
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
> 
>> ---
>> hw/ppc/pegasos2.c | 4 ++++
>> 1 file changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

