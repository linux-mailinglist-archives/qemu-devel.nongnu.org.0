Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 892EA416E7C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:06:19 +0200 (CEST)
Received: from localhost ([::1]:57660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTh9u-0002hw-Ka
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTh6b-0008IO-P1
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:02:53 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTh6a-0000cE-Aq
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:02:53 -0400
Received: by mail-wr1-x431.google.com with SMTP id g16so25203208wrb.3
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ivcw1GM2GsrU7tBmtC91KdbI/2AzJd4TfD7zql0z9gk=;
 b=F4+9xL+shAyNJb8Kx4RJnEp21X/NiKIGrL6yAXzWYtc+qjraLJgakMUd9ple34rW3d
 I7cwpCvuNJ1RSpeoknCeGDWMQEKrakfSYrWQPkQoFYrDOvRl1+SxzcYpABPrHljGv0Mi
 OQ3RdkYvmJFVQ+cUxiYgXPXF/E9s1T9UTKxgj8TJuvy0ez9pEKDCdaXQ283pUhcBCsXd
 BSaScgfIhC6IaZ8XRq3bnMPu+yxmc0jWoMZMwYKuBBiBRMdMZcWoY6GUvtI8LXRKnvit
 CIFmy2cMSL5+83+1Q5zqH4HCFwMUkhwTfwSXLLYSTQBMPCJ0S5Op2CYt+TT9YgYlw0gD
 cgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ivcw1GM2GsrU7tBmtC91KdbI/2AzJd4TfD7zql0z9gk=;
 b=vEypbNpZ6JprnM4TGOrzqxV9iJbECglqFT9T5Nb3VHxRp/lRZGTmui08LX/I5Np0mc
 a37Ibim1gMKjYGNqjDkOrZNoYIHMDAzHFdYer6knfdfvUt6qZvt7tfK+j0pP3SByFOKd
 Ix9ibZpYEcZIB+GnJkGYYNPUwYujK2OayIl6e9GzwbJ/eFdk4r0HY211R6CRo9BMSaDz
 O1Mi37yEE//huMA4oEGzKYVhz+vezLqBqQdY5ky/DqjXjfano03EGZkE/9iaLHjc9qTT
 kXhM1idvx2Zrs0bdA885H3mL5EuFc78v1mfh2NkWr7gueie/9jvt1tpNTPN9+QdHlFKh
 3E4Q==
X-Gm-Message-State: AOAM531uP+Kaau4kPQ7NerGJkgSQHPSSAhhP5cqmwCjvkuWNQCPaUN3/
 iyN8vPdfGJWo2H0M0r+VB+fn68bhVGY=
X-Google-Smtp-Source: ABdhPJw2pcAct/q3bSqGhWQxN4cd8Qj4c1rL5KeBkVqrGvY80/mmnzFUkH72oUZT+pTnA9R+t2i+Lw==
X-Received: by 2002:a1c:7d4d:: with SMTP id y74mr851220wmc.181.1632474170889; 
 Fri, 24 Sep 2021 02:02:50 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id l7sm10852443wmp.48.2021.09.24.02.02.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 02:02:49 -0700 (PDT)
Message-ID: <1e8088e7-81a9-3ace-0ad1-06e06573ffee@amsat.org>
Date: Fri, 24 Sep 2021 11:02:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v6 05/20] nubus: move slot bitmap checks from NubusDevice
 realize() to BusClass check_address()
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210924073808.1041-1-mark.cave-ayland@ilande.co.uk>
 <20210924073808.1041-6-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210924073808.1041-6-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 09:37, Mark Cave-Ayland wrote:
> Allow Nubus to manage the slot allocations itself using the BusClass check_address()
> virtual function rather than managing this during NubusDevice realize().
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   hw/nubus/nubus-bus.c    | 29 +++++++++++++++++++++++++++++
>   hw/nubus/nubus-device.c | 21 ---------------------
>   2 files changed, 29 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

