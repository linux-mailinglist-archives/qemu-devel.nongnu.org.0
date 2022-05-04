Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1369519A0F
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 10:39:32 +0200 (CEST)
Received: from localhost ([::1]:57320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmAXj-0001dV-NP
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 04:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmANS-00054P-FI
 for qemu-devel@nongnu.org; Wed, 04 May 2022 04:28:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmANQ-0000Vc-1N
 for qemu-devel@nongnu.org; Wed, 04 May 2022 04:28:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651652931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=la87yxmq2FStYM4j1RWvxQPBtd1a9wUi3mfw5hOXQqo=;
 b=PtJtOypn33mhy1hW3WxTEIOIOof8sF8TqSNp7APs2DBcru4GPYmF9FqYZQ3P/zcG0v1AUI
 kih0ILYoLgwiKi3ye1wwwnnJsBNH+9pHS/UFrZbROSz0j/lZGGoOddr6r3kfGV1siLo242
 5zWOT8NSx3HZoK/eOKhTiPkq/+J8N1A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-rPnG2q1dNsSx-Qeno6An0w-1; Wed, 04 May 2022 04:28:50 -0400
X-MC-Unique: rPnG2q1dNsSx-Qeno6An0w-1
Received: by mail-wm1-f70.google.com with SMTP id
 v184-20020a1cacc1000000b00393e492a398so2675081wme.5
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 01:28:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=la87yxmq2FStYM4j1RWvxQPBtd1a9wUi3mfw5hOXQqo=;
 b=2nTpMSSjbOJ5Bpj8YyqXXAKnxdl3s7tVaWaX2rS5w+tcQk2eBNaRx/cr0pAtMwVQdS
 s2raYaedQg70ozHWaxQbIntzOJIGbFx/dwQri2sh9LYy0xYUw6t8ed6wc8TjyboecBcY
 bhvc16la5FixMR7K1YvBAnvNjScmwzVlgfaDQeReBZqBcD2NNQS8HzQJBC71yMBrXecZ
 pZ9m60l8eTyW3Bi2LziHSqIuXBFmqbENVgBRRvSA85oXbOn26y0xNSbhRX36F4MJSjZd
 JuvVxcrgp7cOvSGdrmX3olwQrCJjHx4ofNBgSyc0bbS9Juz8VHkn9fUZ7EtgsRWOB+uJ
 znWg==
X-Gm-Message-State: AOAM532yKkOqzPnS3KR+KwnSA7Oz6RdRh8nRi2SWBPlurP46FPGFEXK6
 uyyAKjGLhBiKLJrve/sG804k7YKQfqsSxgFzsuMn1N4tNmvCRdF9qRIQ1oUCDt/Mk1CgGwlDmX5
 tB+6rNyuAgxi8zp8=
X-Received: by 2002:a05:6000:144f:b0:20c:6090:3040 with SMTP id
 v15-20020a056000144f00b0020c60903040mr10449283wrx.479.1651652929152; 
 Wed, 04 May 2022 01:28:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyM3zSMbckePCjw7CQcmBUGBjLKCXp8+Jy2NfU7HAKTO0foHoOW/0uso2xT7umQExec0+Aa0Q==
X-Received: by 2002:a05:6000:144f:b0:20c:6090:3040 with SMTP id
 v15-20020a056000144f00b0020c60903040mr10449271wrx.479.1651652928907; 
 Wed, 04 May 2022 01:28:48 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-177-80.web.vodafone.de.
 [109.43.177.80]) by smtp.gmail.com with ESMTPSA id
 r8-20020a05600c320800b003942a244ec1sm3268621wmp.6.2022.05.04.01.28.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 01:28:48 -0700 (PDT)
Message-ID: <146dfa10-295e-0d8e-4f28-7e4c84fb18f5@redhat.com>
Date: Wed, 4 May 2022 10:28:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 00/13] s390x/tcg: Implement Vector-Enhancements
 Facility 2
Content-Language: en-US
To: David Miller <dmiller423@gmail.com>
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
References: <20220428094708.84835-1-david@redhat.com>
 <97f9be15-4ccd-505b-a35e-8d95823df03a@redhat.com>
 <85dffe1d-a6d2-9e93-749b-29febb0b6dc5@redhat.com>
 <CAEgyohV9kjXUW_LMQM7YryQL1=0VW3pSCbffG2uFG7d5vNo5iw@mail.gmail.com>
 <348d3383-0bd4-1f18-2d14-08962be66c32@redhat.com>
 <CAEgyohUw8GBMaoKpVB4D0GCbKVQ1NTaT9px6LBX1BsS-ex-nxg@mail.gmail.com>
 <CAEgyohUk3cX32XXrecAKNbSxd9R8H-dvmesnAPPdW=Mz5Xi+7w@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAEgyohUk3cX32XXrecAKNbSxd9R8H-dvmesnAPPdW=Mz5Xi+7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 03/05/2022 16.57, David Miller wrote:
> It looks like google killed allowing password access early, nothing
> makes it work anymore.

Uh, that's ugly! I hope you'll figure out a way to work-around that problem!

> They had plans to disable 'less secure app' in may,  but it thought it
> was the end of the month.
> I'll try copy/paste as plain text as well though I Know it will likely
> screw it up..

Yup, that plain text patch didn't apply anymore - so I went for the 
attachment from your previous mail this time instead (hoping that you'll 
find another way for using git-send-email again in the future).

  Thomas


