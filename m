Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16933529AB5
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 09:25:33 +0200 (CEST)
Received: from localhost ([::1]:52412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqraF-00036f-H7
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 03:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nqrTI-00013C-Eu
 for qemu-devel@nongnu.org; Tue, 17 May 2022 03:18:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nqrTF-0006Z7-Sg
 for qemu-devel@nongnu.org; Tue, 17 May 2022 03:18:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652771896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ha/ePhOZ8urYNmIcXmIT1vWBQ1QLpeOHcxmnM5Wymn4=;
 b=Vztt83rGR8kOLP+a0FeUBEtIm6sFW6XE2GwI+y88fFpL2RlZpg/cc1EPGn6BWDk0q5sPeG
 giqE/RSh9UZU2bi5FEZohF6CDI+qrmVPT2QndtrkBkUItnV5lElRGJ2cPYTmxwzB1U2d8p
 0krmsVnylgq7Yo286MD2vvJrMdQbvKo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-SsUJcmnsOVa3_SLkYjplNg-1; Tue, 17 May 2022 03:18:15 -0400
X-MC-Unique: SsUJcmnsOVa3_SLkYjplNg-1
Received: by mail-wm1-f71.google.com with SMTP id
 bi5-20020a05600c3d8500b0039489e1d18dso872503wmb.5
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 00:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ha/ePhOZ8urYNmIcXmIT1vWBQ1QLpeOHcxmnM5Wymn4=;
 b=x8TdnJg72K1qBDy/KwQiztRSGBsHFNPBKoiPcNKJnh+2gY/dxwjSvZXB6yyCXnjgew
 TFWONChOj7U7ZAdmjIlgTaIwTMVQL5FQUL5KCeAKOcOzqi8FU/2/mfqaz9GnLJW1cydA
 fbazsV7bB5CPw+C+Kgsp8tvOpzkr+np7VGz7DY2YJyLBlghtHnZMAdlqV2Q7rTuWg7CB
 TO0EKIOHJrlCk/9Q+SVEUhhVDdkVCGxcBX/W96j/5e5uKLmBA+Oh8S34q59UGl0IGrjY
 ZFtxWDRsRDdcUonW1b0XlR+AdhsBpWMR2sbFojvvnsNHFvmhbAVlqq3xAlCMv30dTNVM
 AmXg==
X-Gm-Message-State: AOAM530axr10JyPuEaWURujq7LSa5vG4Ui3ercrgt+X8X35QUUqHaRSV
 D4+dFsO2G3UDvWG3CPAPBh1mlP/gesJ3ZW7RHksxjgp8XAPlBWA1tKFQfTZUJ9cr9TAwzbKPjvB
 K4pOuxFMga74QKJ4=
X-Received: by 2002:a05:600c:35c6:b0:394:856d:fb07 with SMTP id
 r6-20020a05600c35c600b00394856dfb07mr20360685wmq.131.1652771894125; 
 Tue, 17 May 2022 00:18:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5pKDRlWB/KNU0PdLVuoC7IjnD05/HKr+zbAQirjMwZMcIqxnH19cbPYyWsv9FyRn6DL8dqQ==
X-Received: by 2002:a05:600c:35c6:b0:394:856d:fb07 with SMTP id
 r6-20020a05600c35c600b00394856dfb07mr20360671wmq.131.1652771893914; 
 Tue, 17 May 2022 00:18:13 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 j15-20020adfb30f000000b0020d042efd11sm6720399wrd.61.2022.05.17.00.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 00:18:13 -0700 (PDT)
Message-ID: <444414ba-6ca8-c22f-601f-498f06c83d80@redhat.com>
Date: Tue, 17 May 2022 09:18:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Capstone for MIPS (was: Re: [RFC PATCH 0/3] Remove some of the old
 libopcode based disassemblers)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
References: <20220412165836.355850-1-thuth@redhat.com>
 <2af15d6d-ad10-2f98-fb0a-37d0125044ca@amsat.org>
 <a8a7b68e-6fb9-e329-5c88-99a1fa5da75b@redhat.com>
 <43860dbe-5cf8-91ef-2bba-8da631154b3b@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <43860dbe-5cf8-91ef-2bba-8da631154b3b@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 09/05/2022 15.42, Philippe Mathieu-Daudé wrote:
> On 9/5/22 15:18, Thomas Huth wrote:
[...]
>> By the way, what about MIPS? Could MIPS be switched to Capstone, too, so 
>> that we could finally remove disas/mips.c ? (We're not using capstone 
>> there yet, and MIPS has so many flavours, big and little endian, 32- and 
>> 64-bit ... so that I'm unsure whether there was a reason for not using 
>> Capstone there, or whether it just hasn't been tried out yet?)
> 
> Last I remember is Richard saying "the capstone backend for mips is not
> in terribly good shape":
> https://lore.kernel.org/qemu-devel/0c7827df-c9d4-8dad-a38c-4881ce7dd22b@linaro.org/ 

That was in 2017, in the Capstone 3.x days ... maybe the situation has 
improved nowadays?

  Thomas


