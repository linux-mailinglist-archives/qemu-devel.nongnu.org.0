Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35396347F58
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 18:30:35 +0100 (CET)
Received: from localhost ([::1]:40210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP7Kz-0001ig-Qu
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 13:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP7JH-0001HS-B7
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 13:28:47 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP7JF-0002Kn-AW
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 13:28:47 -0400
Received: by mail-wr1-x433.google.com with SMTP id j7so25286640wrd.1
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 10:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eCpzCnVJHHDu8Kyw0rgtYuPWkcvZmfLF+xpzO27ex34=;
 b=AnzvyMdlTwK29yraEcNbOoeRcYb/gUYR/5GPEBIslSR1/HxSFJ2+vDAwcZG1YIpt1f
 QAInQ1nkTPwCXexbuKNr5GPb2ZOIB6W1zIE15+8nLvflFKtF1Ibe4K+OuTCPkCI5x8I+
 W9W0MXrheC7Q6aTFNxSaI+Mubei9DyxLmb7eK1FKyPB32zZNW757xiK90doOQhvCQjCJ
 Esfq8uQDe712CtR8oCWos2TpI1t+zua92UXUBtB9Iuu5PP0/fHGJKq29RhFlivB6j8li
 /+FZiQmu8OITkA+v9JjQtvTqUHxphknQ4xUCepsL2MASUFWkmt0W16TePx2pyUwZsJfU
 5HvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eCpzCnVJHHDu8Kyw0rgtYuPWkcvZmfLF+xpzO27ex34=;
 b=SqL8eQJcTZKhxQGyVxd5JNr6cfbEkmOn/4M7y3PN9luWxtdg/vkfjhTrWPYqQZTTMw
 OaM8KAG4PYebkzwwY1DFTfDaUzVTxBz76js3ua0c36JEBDGKDk9e4MRw5Wrpb/HWyFJg
 +M3ogIbCB8bvMR32Pw7KfK6WVKIN5RptDcXpCuuu+X/4rAPIn/rKNTB92vuRacVaeBC7
 fHbLe6wUshqOqe2YmA8kZl3e8GiUkZ9aJf/E9cIJwY0Zp79NsEIwIncTPTz7lWdg+D9Q
 1FtvuFESvDeqioDEHokVpJNd5f+xh0dDIwOsG4DjhvKBXbTXPHcf8GrhXtop9+XXkSTi
 96+Q==
X-Gm-Message-State: AOAM5301hGF2+96x9HsrSIkaaz4TSRKGg/AcZadrC7TOEuSs9FyaFbFJ
 Kxqbt21NllMRJ8EpMT2ZUvM=
X-Google-Smtp-Source: ABdhPJz497adVvznyffCgGRctXMdFXhMbE0ySici8aEGXWUH1i+oTDXBMmEOlvAWRT1K/tBHzZ5Ekg==
X-Received: by 2002:a5d:4bce:: with SMTP id l14mr4663394wrt.99.1616606923800; 
 Wed, 24 Mar 2021 10:28:43 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id d204sm3382788wmc.17.2021.03.24.10.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 10:28:42 -0700 (PDT)
Subject: Re: [Bug 1909247] Re: QEMU: use after free vulnerability in
 esp_do_dma() in hw/scsi/esp.c
To: Bug 1909247 <1909247@bugs.launchpad.net>, qemu-devel@nongnu.org
References: <160882932286.4370.15587232403500958955.malonedeb@wampee.canonical.com>
 <161657946470.23746.4749601633753443746.malone@chaenomeles.canonical.com>
 <20210324155324.mfta6pfa573ms5vi@mozz.bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7cf68684-d214-38a2-4a92-87b381f06a5a@amsat.org>
Date: Wed, 24 Mar 2021 18:28:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210324155324.mfta6pfa573ms5vi@mozz.bu.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 4:53 PM, Alexander Bulekov wrote:
> Hi,
> I can still trigger stack-overflows, heap-UAFs and heap-overflows in the
> code, but Mark's patches fixed some of the issues. I didn't want to
> flood the issue-tracker with further problems in this code, since it
> isn't clear what the security expectations are for this device. Of
> course it is only a matter of time until someone sends more reports to
> qemu-security.

I'd expect qemu-security to have a template "Thank you for your bug
but this device is not within the 'security' boundary, we will forward
your report to the community".

> 
> Mark, do you want me to provide more reproducers for this device?

Surely Mark prefers you provide bugfixes instead :D

Phil.

