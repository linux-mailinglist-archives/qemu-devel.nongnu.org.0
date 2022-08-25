Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 253955A1343
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 16:18:21 +0200 (CEST)
Received: from localhost ([::1]:57720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRDga-0003yJ-4a
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 10:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oRDcq-000115-Ef; Thu, 25 Aug 2022 10:14:28 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:44577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oRDco-0001lA-6v; Thu, 25 Aug 2022 10:14:28 -0400
Received: by mail-pf1-x429.google.com with SMTP id f17so13749868pfk.11;
 Thu, 25 Aug 2022 07:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=fnh6jqTBXi5rT0LgKCkjhPhsKuta19Odxw7Fu8GiL2E=;
 b=T45v3dPBnvx8OTGGys1ZXQiS+hX9nzN88Ek5BT1Ib95jh7eKI7I+tY/AeM8WvTKUsi
 H91s2GZNTELcK7Z7BYF/NO4B3nuJdlpAi0a5WCdGt7xErr1gW/urChf5igAi4dNUfJl3
 XtL9iUrYZw5cn5VExp628iiFhDZWGA59UR0uLTCu/MZDXiFRxaFSF8Y21JVrVyT5Rq1m
 IsP6hICvWk9Yp2GZR2lE45DKQP32SeOCzjy7c0sptGCAU25WWYBpUe8UxxQuf1wk8mpE
 QWNo2y0LnxaKPpoHsAf/cuwDRL2QctiQIOU10q3CB9x2kB+Z5kxKA81qnHS+kCqLy0yI
 JZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=fnh6jqTBXi5rT0LgKCkjhPhsKuta19Odxw7Fu8GiL2E=;
 b=3F1mr+fv8eFNxwre7YTpRWpa2I3vr7sCTQVmJ1uRJQCnmt1u05GSkgH8352qvWWR9g
 58n63d00masGZ6TSYCx05zbDJgspVaa8A8XJId7tBhys7Iyfo9wAqrHY000G6GV2I5iJ
 pmrwsN9fV302XM9BPCtHwsG0hg7UhGYqQsk9G9xa8L0N2ASdp2n1vTh1ULK+BSddPrWK
 dG/RfIvx78xatGhrc5a8MEF3f2rn8EKMj4wi/9LDNUK9drOgk+a4AB/KPUHzmzexl/9m
 Vn+NITAQI2rTRk3bbWZp0C0fszZiwkIdaI9tRko7gU3TKW9rHgHct8LXnFdRK5qCP+wk
 Ky/A==
X-Gm-Message-State: ACgBeo03Kirp49svYEzzfZdnE/641eOENCfyPGfHGzOaQ7xTrTDbO2aA
 HU6tUZWU3OGeRWGmrXi7Z7Q=
X-Google-Smtp-Source: AA6agR6QYotCwIZqHA8ry5rxEssbwWxytDBQh6EILutUh9NmF3BRUaUYnNe+r7p1moN5Tyq+tyeapg==
X-Received: by 2002:a63:b95e:0:b0:41d:6498:2ad5 with SMTP id
 v30-20020a63b95e000000b0041d64982ad5mr3458727pgo.446.1661436863831; 
 Thu, 25 Aug 2022 07:14:23 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y66-20020a626445000000b00517c84fd24asm15781623pfb.172.2022.08.25.07.14.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 07:14:23 -0700 (PDT)
Message-ID: <94cd26fd-0231-1266-6934-594278901284@amsat.org>
Date: Thu, 25 Aug 2022 16:14:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 00/11] misc: Remove variable-length arrays on the stack
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org
References: <20220819153931.3147384-1-peter.maydell@linaro.org>
In-Reply-To: <20220819153931.3147384-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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

On 19/8/22 17:39, Peter Maydell wrote:
> This is a resend of a subset of patches from a series that
> Philippe sent out last year:
> https://patchew.org/QEMU/20210505211047.1496765-1-philmd@redhat.com/
> 
> Basically I just pulled out the patches which:
>   (1) trivially applied on a rebase
>   (2) had got a Reviewed-by: or at least an Acked-by:
> 
> since these should be good to just apply immediately
> (well, as soon as we reopen for 7.2 development).
> 
> Given they're a mixed bag, I propose to take these via
> the target-arm.next tree, unless anybody specifically
> wishes to grab specific patches via some other route.
> 
> I might come back and have another look at the other
> left-behind patches later, but this gets rid of more
> than half of the complaints that a -Wvla build reports.
> 
> thanks
> -- PMM

Thank you Peter!

