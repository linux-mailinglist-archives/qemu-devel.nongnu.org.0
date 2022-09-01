Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F4C5AA38B
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 01:15:07 +0200 (CEST)
Received: from localhost ([::1]:57648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTtOs-0005ho-HR
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 19:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oTtMT-00048L-U2
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 19:12:38 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:35805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oTtMS-0003VH-34
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 19:12:37 -0400
Received: by mail-pl1-x632.google.com with SMTP id y1so251324plb.2
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 16:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=MWcWOsKvaKOwc+q6n9IOw5T14nz61qlH85BwUguXML4=;
 b=WDhtHQz0CY/DLl2eKUVXFQYvtP9xDL++79c/IMgCia7d+MWLWtFGP7PpVcsDFXVc/a
 M8uo5HK5aQSvLeJZkVC2WwB9fDkUdxpWvQSMygTX5JgLCDyNSoip9m2k94T/Rl+8qJRd
 ARhjSAkDCSrfiYanIfT6wCSs6n/Tjhb4eKQ27Xtb7oNBo6HESeEtz9pYU9xjaJcCGYvZ
 XsfTqPJJOW2D+BFjL+XoZvVFlD379ULTRZC4zqTny2+RVz0opg7+pMRb2ZKsr6IN35RE
 Xs6zxG5GHGMZUKiqhjzc3ImHScFxpfM4wNjoU5F+2QxiumYQy1FYMr9rwz8WCt3/HOxu
 WnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=MWcWOsKvaKOwc+q6n9IOw5T14nz61qlH85BwUguXML4=;
 b=ptB+b4awTlJHhAP7Q2UxujjUAnKQl479pR5+H7SchFPGYacEXE+VAMBiQl7b6n0Hkc
 l/mPVBuYCgUig8iPkBfiYmx7B/PCm9qNLUbjX/as/yqwRWyqCmFICtJrai5n+RBLIPXt
 8qs26oLv6w9UklVOa5EL/eRYto9Cey/uSP9HVfZxTm+deue7fR6aWKaS0Kburo8CuBzv
 /B3L1cco1tYg77fApH4zce/0jAyY0bbyzeP9MT2iThh1YnydCpvUcIBmDPw0Bz2DL47D
 oB9vHswJtkhKdPqOebc1+X6o3CgEYhvMYcOitO9q6ucdxipBRWrA+ArHI4hjLOJ3IEKU
 wTHA==
X-Gm-Message-State: ACgBeo0wgAU+1q68pQvZPFD3W3RyTNhiYqwBQy1UhI/Oppv2DKeH7nSr
 OAOWj6hNaUdam10fbjj2gUo=
X-Google-Smtp-Source: AA6agR5fHDT/140RpxvddtY2WGpa4zhGC21nwlk9QTca4fXp5vPGJmF9U60n2OM8ZgSvpIGM3JPNiw==
X-Received: by 2002:a17:903:120d:b0:171:4fa0:7b4a with SMTP id
 l13-20020a170903120d00b001714fa07b4amr32031567plh.45.1662073954628; 
 Thu, 01 Sep 2022 16:12:34 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a17090a2bcb00b001facb7bc1adsm3891813pje.26.2022.09.01.16.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 16:12:34 -0700 (PDT)
Message-ID: <180f2f90-d910-3185-d33f-6255b383dacb@amsat.org>
Date: Fri, 2 Sep 2022 01:12:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 13/42] hw/isa/piix3: Add size constraints to rcr_ops
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220901162613.6939-1-shentey@gmail.com>
 <20220901162613.6939-14-shentey@gmail.com>
In-Reply-To: <20220901162613.6939-14-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x632.google.com
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

On 1/9/22 18:25, Bernhard Beschow wrote:
> According to the PIIX3 datasheet, the reset control register is one byte in size.
> Moreover, PIIX4 has it, so add it to PIIX3 as well.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix3.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


