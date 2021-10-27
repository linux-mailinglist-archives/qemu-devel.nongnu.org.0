Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB2143C80D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 12:49:49 +0200 (CEST)
Received: from localhost ([::1]:34010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfgVA-0001gs-Et
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 06:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfgTi-0000oS-2R; Wed, 27 Oct 2021 06:48:18 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfgTf-0003wp-QR; Wed, 27 Oct 2021 06:48:17 -0400
Received: by mail-wr1-x431.google.com with SMTP id m22so3457045wrb.0;
 Wed, 27 Oct 2021 03:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q8gn/Q8hzJFWe4jP5yygDi9A/MevQqgG8xFD8TOwZHM=;
 b=AFBSZc1A+AB9Q5OYURHNwG6nR78aIKV2DIREfNzc2k4EofKbWFISzoqnEobycFp9cZ
 DCFfZPiBg++aCB99o6hyirwbviyn5dvYudonQ4gScmxuQxlCe21zP9eqy+hd/F7pmNeh
 1Pdfswcb9cHn5yT+rzttutMT5rWkhahVjnezUcQwcR9r8NvlKckGu+pDOED7FV118gX4
 2ZUIgycXhHkSCt9LtmXEajP0RyUMZPbDEQkBX6XPv91SEOWhaVPMwaXLZk4vlu1sxkgk
 elAMoz2CAjDPLrwbTQnkWD9ot2adXdbpdiL1WrG8mWaoZsEElqnMkQsblKca6CuIRZa2
 DuWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q8gn/Q8hzJFWe4jP5yygDi9A/MevQqgG8xFD8TOwZHM=;
 b=y4MDR81UTFNfXRTICHJMiEiBBx42GgbZQE0efjG/OknYoOF2nfl65uoFepjB/XOw/e
 ioy8wgJTFrNj7uvTFKcG8FF5KUyq+b+tea/FTHH/s3OE3BY4SJv5ZkTTcsht0jlLwVyb
 4BbUDwStbCx4wK3siizpBSxLNGz58UFC1lA04xgz7WCAuDi0GAihtrbdyKExE/wB1XOR
 ZsmJ9ifp/CjYjaAgmwtalLgChJxZkgS2k7YN870roOEqEpKgygegy8UCGLrDgIVuiuZ2
 636J08jssq0hOS51SQbhF0LyW5B6gCmzu/ctNXdN3Z07q8kF87fcS4vtNFUBdo0EHN/0
 Nu8Q==
X-Gm-Message-State: AOAM530Lx/A+NjIPO7DPXi2Blj+WY1Fvf+bDWANCDBt49hsa8xuwf4E/
 QEohzzVBYspRhr+a793bFHs=
X-Google-Smtp-Source: ABdhPJyseZS91NsQWor399HtOhIH0bnB6ynpLn8BfvqEts+UuvteXB90RN6Emg43pYGMbfWNtOBcBA==
X-Received: by 2002:a5d:6e8c:: with SMTP id k12mr38563355wrz.401.1635331693840; 
 Wed, 27 Oct 2021 03:48:13 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id k37sm816291wms.21.2021.10.27.03.48.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 03:48:13 -0700 (PDT)
Message-ID: <47019433-0ff2-2535-139a-257e09ecd1d9@amsat.org>
Date: Wed, 27 Oct 2021 12:48:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
 <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com> <YVug7l8LWl3e+DN5@yekko>
 <9aeb7010-0a17-864a-cfac-ea5d90356085@csgroup.eu>
 <YVwRfETMFxFKuXO1@redhat.com>
 <268ffea6-9a3e-fcba-6722-7d1f24cf5794@amsat.org>
 <YVx7YGqUENP83vNF@redhat.com>
 <125ddbae-7855-d42d-9156-e8bbe7e21e56@amsat.org>
 <3d8f2a41-a52f-db25-fdc9-c631952369a3@kaod.org>
 <543407cd-c077-a670-da21-5a4d57d7f35f@csgroup.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <543407cd-c077-a670-da21-5a4d57d7f35f@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 dbarboza@redhat.com, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 12:42, Christophe Leroy wrote:
> Le 27/10/2021 à 10:40, Cédric Le Goater a écrit :
>>>>> I am raising this because the nanoMIPS support is in deprecated state
>>>>> since more than 2 releases, but it is still in-tree and I try to keep
>>>>> it functional. However, since no toolchain reached mainstream GCC/LLVM
>>>>> it is not easy to maintain. By keeping it in that state we give some
>>>>> time to other communities to have their toolchain upstreamed / merged.
>>>>
>>>> If you're trying to keep it functional and aren't going to remove
>>>> it, then it shouldn't be marked deprecated.
>>>
>>> OK, I'll move it back to Odd-fixes.
>>
>> The ppc405 boards are still in pretty bad shape. We need a patched
>> u-boot,
>> a patched QEMU and a patched Linux and still, we do not reach user space
>> without some sort of crash.
>>
> 
> I guess Philippe was talking about the nanoMIPS here.

Yes, I was following the deprecation thread, sorry for the confusion.

