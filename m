Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4202C53065E
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 23:59:31 +0200 (CEST)
Received: from localhost ([::1]:35978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nstbm-0000ot-CO
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 17:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nstZv-0007aF-76; Sun, 22 May 2022 17:57:35 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:47033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nstZt-0001b6-IA; Sun, 22 May 2022 17:57:34 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 v5-20020a17090a7c0500b001df84fa82f8so12002681pjf.5; 
 Sun, 22 May 2022 14:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Hc+g8ac3TQmsOzTPilqOfIqOO21J2GBuMXbOGTzqR/0=;
 b=XTD9FgoDCT0Euxq6EhfKilz4Xrxo/2NJsRTQ5H3xLDqTmbc7tIPP+McwhUEFoz5pbd
 RJGAI3Skan+ccugcuc7uc1sn1SmBVJiIC9DzaEMGwfj8Q7y8RMps+q2UYyfmP2x/g8no
 J7ajpnYqkh0ocB7A43dOxYdw5+R07lHTOVTnzvGyE4kutFijSlsdJkHKd9yNs2am8zYr
 1jPG6MjDhqcFa4N21eMOK92Ly8gr544nETDRmrSEX6xVJts8jdIN+HSErtJ7a26vPQE2
 v3V1ldjmV2F5OKfRwxz88ukRLzRDxuZe06ml0Rp80/Wfvfot18kDqQ9h0JZQGW9XyEMY
 2URA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Hc+g8ac3TQmsOzTPilqOfIqOO21J2GBuMXbOGTzqR/0=;
 b=gaaVvlKoFxFaGYqhSlE2nGxDkdqR47t68+R0cwy0tIu+ru/cvo5YAIiTX5w9TclWrl
 yv1pFhSlxTxWBzJ+RMiFJ2WJm9DF3ECbuO1ueHCLnpBfMWOLkPr3oYyQSkYJ6LaZNmSp
 aFzSq58Ckj6h/0hASDq8LioL8IbhDb6flx3Yc4QdfZ5klF7XAcJRv4MdXRI/5QvU/uK+
 GTAfHlYaeQIf22Zo/lfcC/RxD6sVfFl6Hgerkageno6Q5w5PQBQsxvShdkORtwVtfLEk
 9nmmfWePigi5feO3XLhj2JmUAxRbaLOdmWbEh05oTBdvQPKFkSCGWPgHRvbLYQKOU9KD
 3GyQ==
X-Gm-Message-State: AOAM5334vS7vbqW+uk1w3DvmOik/ajK6vQ+Nen6U4MiTPz38V2jhxAf7
 rI83L3sc2gYTlKxuNVRJ6LI=
X-Google-Smtp-Source: ABdhPJy1HQBpv/bFgZ63ksP4VPH1SrviSw0GbBS64fyzU6C4kzCON80C6ZRL0rGfeP6Rbh/itt6ruQ==
X-Received: by 2002:a17:902:f08d:b0:161:d786:8694 with SMTP id
 p13-20020a170902f08d00b00161d7868694mr19478770pla.77.1653256651722; 
 Sun, 22 May 2022 14:57:31 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a170903110500b0015e8d4eb1d9sm3571158plh.35.2022.05.22.14.57.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 May 2022 14:57:31 -0700 (PDT)
Message-ID: <6a53cb42-aed1-1245-480d-407bf84b5aa6@amsat.org>
Date: Sun, 22 May 2022 23:57:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v2 0/3] QOM improvements for rtc/mc146818rtc
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20220522204347.10438-1-shentey@gmail.com>
In-Reply-To: <20220522204347.10438-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
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

On 22/5/22 22:43, Bernhard Beschow wrote:
> v2:
> * Explicitly fail with &error_abort rather than NULL (Mark)
> * Explicitly fail with &error_abort rather than NULL in existing code (me)
> * Unexport rather than remove RTC_ISA_BASE (Mark)
> * Use object_property_get_*u*int() also for "iobase" (me)
> 
> v1:
> This little series enhances QOM support for mc146818rtc:
> * makes microvm-dt respect mc146818rtc's IRQ number set by QOM property and
> * adds an io_base QOM property similar to other ISA devices
> 
> Bernhard Beschow (3):
>    hw/i386/microvm-dt: Force explicit failure if retrieving QOM property
>      fails
>    hw/i386/microvm-dt: Determine mc146818rtc's IRQ number from QOM
>      property
>    rtc/mc146818rtc: QOM'ify io_base offset

In patch 3 "iobase" could be u16. Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


