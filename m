Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C455AA114
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 22:55:40 +0200 (CEST)
Received: from localhost ([::1]:52828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTrDv-0000NF-4Z
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 16:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oTrBn-0006Dk-02
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 16:53:27 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:37489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oTrBl-0000RD-C4
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 16:53:26 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 i5-20020a17090a2a0500b001fd8708ffdfso3591953pjd.2
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 13:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=Xu3+korlEW3Hykm0eDkiKxC9QuY3dpYO6qQV/IQVZKs=;
 b=LUUUbLsbft7JKbh2tvjbMMfOfJPgTZoNkstJg63wHhZQ48h8fjLN5EjMXqNC8G6JFp
 oxVQcl81g53uQdyc38KVtcNDsz8e+DJpSBdmaefle535sSfWw2U3ImNg7Y5QyGuR1V6j
 FbtRUVZoFtEPwXgnP76i1TwXttbngUsI0/XqEh8KAhJSwBH27LO13hU+LmGBU+TZWA2N
 v7mkn9GCi27vl7WXLBSi+JjdsKR4PJDF0QyXRqBM7VB1r0ouL0WkLmpCJON4BnkSOzDG
 gw1mpjkLAKp8kIuCu2q6SljJ1yg4l6deuUAtoGJmqX1GqoX3tGbXEMyDgFMVp76ozKfo
 sElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=Xu3+korlEW3Hykm0eDkiKxC9QuY3dpYO6qQV/IQVZKs=;
 b=NdPIoDnriHPkzEtWOCF8WJXA8UUAMmJuyUBjAk2sSe9tdCGaHrtKwCOdYKfcO7jwgH
 /VXidmGQqpW+HEBfC3Xulyriy1JTi04uecU7r246KIPc2fhUJQxE454iVyx+aF7Uusfm
 4G2hCLeUAYlDBidfrRzABL4B/CEoStdAyzBBQVPwWd4euH9iIHqXkWMwznw4xk4JUCIn
 OO9HdeXebAfiFR8sZbvHPoVb+AUNp2VugXh5TbXxMKcWy/0HCe3jEcl5mAmFtxWW6N1N
 cCkdSlGf2SZGAWv3gMyIqnbWhonlSo06pcS2v+RU3sxAQkHr8oAByQ9fA3IvbOB4z44p
 ELbw==
X-Gm-Message-State: ACgBeo2krPtErtWwboygtxjWQ6TEHpY5DUgUg+BhGxvQmgOeui3+75lv
 EwpfeNpzJ47xwMEhCO+Pjek=
X-Google-Smtp-Source: AA6agR7SCwzpiMMu37N/eJ/9meMLt7+EBLoLIDzinv0MyStx8NkPjwKHq4of2VfR/cxqOUR2w+82mg==
X-Received: by 2002:a17:902:e94c:b0:171:3d5d:2d00 with SMTP id
 b12-20020a170902e94c00b001713d5d2d00mr31762231pll.2.1662065602958; 
 Thu, 01 Sep 2022 13:53:22 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 205-20020a6217d6000000b0053818255880sm14229pfx.193.2022.09.01.13.53.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 13:53:22 -0700 (PDT)
Message-ID: <ec60174b-0d7c-5c3a-6224-cb05d9987957@amsat.org>
Date: Thu, 1 Sep 2022 22:53:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 22/42] hw/mips/malta: Reuse dev variable
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
 <20220901162613.6939-23-shentey@gmail.com>
In-Reply-To: <20220901162613.6939-23-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1029.google.com
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
> While at it, move the assignments closer to where they are used.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/mips/malta.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

