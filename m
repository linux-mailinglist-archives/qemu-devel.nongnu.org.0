Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9684632F9F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 23:15:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxF3i-0001rU-4O; Mon, 21 Nov 2022 17:14:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxF3f-0001nV-LM
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 17:14:31 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxF3e-0008Hh-5Y
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 17:14:31 -0500
Received: by mail-wr1-x42e.google.com with SMTP id s5so4762683wru.1
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 14:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZXAYK9EtPr0/HyGva/YHb1IHixGJ8pX9B9a7oCD6tMI=;
 b=m5uL5aE/upl+uLlSTN6ttjMCYV7tzH34UW4KFRZFlQJ2NhCF3tCBgriJ+9N11/YOfI
 vu8bxON/hVmCa2nG5aMM6UDxM7jXygzTNoRn3+bKDQFuRIXNi+y7jG9k2F9zQmrIN7ug
 0+eFlaLi3tF13u4I5OMzXsvNc8PV6eI3WnkC0tytQwbB/A7RntM+GqFcdBY6t9tPMAk3
 HUkLhe7K6ReVmBveMI5urASYr0JcrsjYIJmz0qGsjli4Fj32p5qn0o2gZmZX3v9YEW9s
 sEqkvzWsgMHK13HQwDXLHoRlZRShGK1l2Pj++pZIvmOTJuVSD3FH4iQUrpYpr/M2F1B3
 bwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZXAYK9EtPr0/HyGva/YHb1IHixGJ8pX9B9a7oCD6tMI=;
 b=hglsvEV3MWWA+LoBiVy298Tnjo8cDcAZJtMKS7iWiPZCqw7qLYOH6bdtJIwY1kOllp
 r+mtd/azue68KjFaXtzyNV66MpmOlra9/QkCBObc62FBEvj+XnjhJvZ2dCAcCC/+pzhs
 MIjeLGx4iaSwTfXz380EjwJjP3YO4Jy5rfc61yTa8/pXqQbHBbxQsH6mN4zKFGvsy/9Q
 rnBMGHSJ0/uO4NCM/XsMVjSjukGuo710iI0bnR8RUyphNvfB4YhOOCojIBK9NSDzh2ft
 B2dSulmcV4/0XtR+IEMVYCNQL4sGNh0VslmLHol/6++F2nIL4Yi0rj3iF++jaIKk2fDU
 lSKg==
X-Gm-Message-State: ANoB5pkk+4pRHudWFwayUTXJpcJPmYhe4djh6hHE24zjeovhqXfkeCKg
 CQph3tGkPL2/Rdr7RCCBdVjDuQ==
X-Google-Smtp-Source: AA0mqf4Lq9SLcX7pEptsxPCSgcboHP4HpXYMEmHxV6HaLy1m1gVWzC8JLdErzzmhzmukPCriAPsxfA==
X-Received: by 2002:a5d:4601:0:b0:241:bf7b:b2e5 with SMTP id
 t1-20020a5d4601000000b00241bf7bb2e5mr9121994wrq.626.1669068868476; 
 Mon, 21 Nov 2022 14:14:28 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a05600c1c9200b003b47b80cec3sm20987241wms.42.2022.11.21.14.14.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 14:14:27 -0800 (PST)
Message-ID: <0e954038-e3b4-f3dc-9e39-03ff20b2d557@linaro.org>
Date: Mon, 21 Nov 2022 23:14:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v5 14/20] hw/audio: explicitly set .requester_type for
 intel-hda
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, Gerd Hoffmann <kraxel@redhat.com>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-15-alex.bennee@linaro.org>
 <CAFEAcA9bYVODgATKULZTgnBoHtivGwOP37hxraeqWw2-NrT4Ag@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9bYVODgATKULZTgnBoHtivGwOP37hxraeqWw2-NrT4Ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/11/22 19:39, Peter Maydell wrote:
> On Fri, 11 Nov 2022 at 18:35, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> This is simulating a bus master writing data back into system memory.
>> Mark it as such.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   hw/audio/intel-hda.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>

> I wonder if stl_le_pci_dma() and friends should set the
> requester_id on the attrs that they are passed ?

Very good point!


