Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AED410D72
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 23:12:14 +0200 (CEST)
Received: from localhost ([::1]:46100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS46e-0003oK-6j
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 17:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS459-000328-2k
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 17:10:39 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS457-0001ph-KH
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 17:10:38 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d6so25051604wrc.11
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 14:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4AV/S4B7hk1Uckc0g58sIiwOXW0DWcdPixORFqykQh4=;
 b=AxXhNFXCqosDMMRghOUXj0bv2ujww9BZHSQAKTv89pfj7ZT9WwUTd7EGF+RBfEv4B9
 v5agdGiEH9EAd5XJ/2L8HtJQleUPBE6QkxExynbR4vHCJTsmaebSYXmqxldh6hqmiwNS
 s9xyqdOy2p3Y/D1twNLSkjV55UOFseXTZh9rH6xOB0cdZ1rOvtyHf98nnxG5IkF2Ke3j
 DABygfz2OrMi8tIE0x0wayaKKwogofry4V6fKxFxuodcIaZpEnQUJ+1b7Ij5/4Vctl2z
 TPy6UleVH9E+Wj4YzdeFeJE8YgxoSWQpCt+TCWsFZ6FTz72NNDF9kBPQOy2qlWrGgUDi
 xGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4AV/S4B7hk1Uckc0g58sIiwOXW0DWcdPixORFqykQh4=;
 b=XRkZJVrD1TtKrG07ajZCreY++fotiZIaQdhvoCCOynyekLLvDg64c1a5FetK/newAQ
 ATEzpwi+Z+CrKI2UeGwVhQaUH8fuBWofL0KqUdjpdGpqsJ2a5o6PxKmgdgOkJzX2HMsU
 GYzuxSFdJpPuwBdeZSHRHkLC+UzLQLaGqkgIRp73DIpG/SouoGNoyu/67g4cC+Wow6od
 r41edLBmfD6yphJcSpu8FsLt/JBVFXuUJ8KAKj1LPE8tcIouRI1TV2kQM0OShtMdBO6z
 QmcmTlHtJwa+IksgJLNbYnvcZKKEHioONb5fMTaNGkDzJRQlOjMT42pTE6N0NUbnY1g2
 ExAw==
X-Gm-Message-State: AOAM533ozf4oj5J/+rPESvBG0E6GGg8Skx2E9QvfhszveTad7Xhb+J/t
 yJNxUhAZ23T9Rybl7m8iQD4=
X-Google-Smtp-Source: ABdhPJwMhfQneAU/pHmPZeVwOZrIeCvmR4MDm9QbZlGkv+yUxN0v4pFPSTqPPwHpJ1VrqDcqAz2Stg==
X-Received: by 2002:adf:e40b:: with SMTP id g11mr24642292wrm.313.1632085835935; 
 Sun, 19 Sep 2021 14:10:35 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id 5sm8697715wmb.37.2021.09.19.14.10.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 14:10:35 -0700 (PDT)
Message-ID: <e01c06c2-2260-1229-f25d-f721b2438532@amsat.org>
Date: Sun, 19 Sep 2021 23:10:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 10/20] nubus-device: remove nubus_register_rom() and
 nubus_register_format_block()
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210916100554.10963-1-mark.cave-ayland@ilande.co.uk>
 <20210916100554.10963-11-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210916100554.10963-11-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/16/21 12:05, Mark Cave-Ayland wrote:
> Since there is no need to generate a dummy declaration ROM, remove both
> nubus_register_rom() and nubus_register_format_block(). These will shortly be
> replaced with a mechanism to optionally load a declaration ROM from disk to
> allow real images to be used within QEMU.

Nubus neophyte question: is it OK to load a device without
optional ROM nor dummy?

> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/nubus/nubus-device.c  | 143 ---------------------------------------
>  include/hw/nubus/nubus.h |  19 ------
>  2 files changed, 162 deletions(-)

