Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511074D2EFF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 13:22:42 +0100 (CET)
Received: from localhost ([::1]:54888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRvKx-0000fk-Ao
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 07:22:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRvJi-0008EM-40
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 07:21:22 -0500
Received: from [2607:f8b0:4864:20::62d] (port=34318
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRvJg-0001lv-Lc
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 07:21:21 -0500
Received: by mail-pl1-x62d.google.com with SMTP id r12so1784807pla.1
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 04:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iFp46hXhr510QrB6HKt6X06W7IFpKiGqQrDjMRD5pbM=;
 b=VLRFhkTbqsGx4RSIdYLLkIXlqw9ZNiKnVTUy9rvE8XS99HPqzXbhraoA6L+WcoXiL+
 eqtfIEEYplaLTz3ZeTsuwr+DzxslmkqpaNXZTFq0dGLWBxCFRbGIat+wq6Hs/vaqr/ab
 o+bglei9V+jPxLGjYLsAHOYLK+U8xdnxocm7jLe2xY8u1gHdlu4ttVxx0dvs43ZVUyY5
 pSq33N+BqInioOUCJfiWb9i3/3WFEsq8DmJQHbehCw9bhVWtvd7BMw37yPcV7NFvHZZQ
 QLpLY+yPGXG1VSbWrB3QrzHdSk1gR3BYd/EYiQGHI1sqSXv9rXtJ4qx799j+MgwpiJjV
 UaoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iFp46hXhr510QrB6HKt6X06W7IFpKiGqQrDjMRD5pbM=;
 b=XXYi/bkW2/7XaBzwq8gziEX0UNpjAPapfO200N0CNsYoViHamgjvoFE3x8FBECXrLX
 1qmTKFH+1nHF9iSgzURrh+0JtwB5iAvikmJkoYqvlJ4yb+5XaIAwo/p8YRumgcpHvpgt
 NjtVLv/Mc2tVBr43RGy39Y7/Ni6X/3iLauwdgnMQcfer30b+uXbpN6Hd7xgH6LROnHyJ
 /LyW1/6LASWfvM4+wCu7uQaDFpEFp5Ooh23nmw0nRiyOebb3mFrj/YIbkp3JSLajQF5z
 kP1qhgkymyqZzodmcOraluwPXWnN5J0ZuTngN5M5S0avD+nH/bnXoz8TErYNoq6gpOdO
 +YPA==
X-Gm-Message-State: AOAM533bAUB0FnGAwTrrbt2MY1KG1DIFmKADhYEjsGOWJfgUDo0W8I90
 btuRgw/Ss5yNXr5OuEuLCSk=
X-Google-Smtp-Source: ABdhPJyTXeWRKZ8PEqtdZBWW6ImzBuULkLJ+R22YSqVSWIs6HkdCakOCufnQbg5+jF03987dk9Ydaw==
X-Received: by 2002:a17:90a:7d10:b0:1be:ef04:43ce with SMTP id
 g16-20020a17090a7d1000b001beef0443cemr9971465pjl.225.1646828479238; 
 Wed, 09 Mar 2022 04:21:19 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 j13-20020a056a00130d00b004f1025a4361sm3201835pfu.202.2022.03.09.04.21.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 04:21:18 -0800 (PST)
Message-ID: <aab02374-474b-a9a6-e493-6ecc5550a24f@gmail.com>
Date: Wed, 9 Mar 2022 13:21:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 05/11] edk2: add microvm build
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20220308145521.3106395-1-kraxel@redhat.com>
 <20220308145521.3106395-6-kraxel@redhat.com> <87mthz5oes.fsf@linaro.org>
 <20220309121240.dccpwmjno45hdcrc@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220309121240.dccpwmjno45hdcrc@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/22 13:12, Gerd Hoffmann wrote:
> On Wed, Mar 09, 2022 at 11:55:26AM +0000, Alex Bennée wrote:
>>
>> Gerd Hoffmann <kraxel@redhat.com> writes:
>>
>>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>>
>> Out of interest how do you usually trigger these builds?
> 
> make -C roms efi
> 
> (try "make -C roms help" for all firmware build targets).

See also the 'build-edk2' job in .gitlab-ci.d/edk2.yml.


