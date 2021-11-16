Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672A3452D9A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 10:10:41 +0100 (CET)
Received: from localhost ([::1]:37948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmuUC-0005w0-Iu
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 04:10:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmuSj-0005Dr-O4
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 04:09:09 -0500
Received: from [2a00:1450:4864:20::32c] (port=44580
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmuSi-0006i2-Bw
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 04:09:09 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso1801882wme.3
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 01:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZovObsGi85GcWAcqAI019DJscRWQ4tL4AoDMOlDTpJ8=;
 b=MC6ViXyUSDD895RQecvbBu6WnYo3gbQTPuG3wG7b+FAlJDCvcw/uV1hDUr5k/20ySZ
 pPiLibZIUWFpBfybKylQG4hARtxxsL9nQ726GaNahuI98oH6AThpQRhNtYezXQZvSLV4
 tUcANb7yEDVjoRomJ7V1g0rzYh1Zl63PONjn4hkyzxz3c5K6vUYHrDBO7ErgSwQ61a9T
 /U/rDsJR63arYDvkcbI3ln+uuzfIvfLec3+GQllPNeBS4ELM7EnfIQlKIZ0GpYPeRhpD
 LnK1KmJXm+4be2ncBX0bhIh2CZFRdLzIMvVyc4Ao0lFXedUTpDiTal9R/b4+OTwXArID
 0P9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZovObsGi85GcWAcqAI019DJscRWQ4tL4AoDMOlDTpJ8=;
 b=yL7osKT0opQEHNFOqyLlLrS4LqI1IN+e5tTFAx/WmnDpROSEa5vqPukWFwWoosY1Y4
 nxtVYWk643vbZ0j9Hoqc+cke+rx1ZUjeQ+xD3Pqehmm9zqld7V4hjFHab/FMOF2GFqj0
 7OOm+YQ93J703WK0q0iiwLvRqjm0nEN4RYwFxHlr4VjaAazS9oEKdiLcWF/vXcnweuLe
 1gTKMDSDliYQTq7rKOmweO3dC2tqsQikv9JOP24VtLuiY0uw37Ot/hMwNMy045S/CXs5
 89otDg+F0cEEaa45ITOARzyqxJ3w7CKku/O6TYR5gT3zCNKf2E/jgj3ddvp3BjfZBTmH
 jYmA==
X-Gm-Message-State: AOAM533jPL4s1ACE081roje9n/ab0kj4npe8BDxl59cqPFq75VTH65Ym
 0YK5cgfDYsnA9dPRYcjEfKjKKQ==
X-Google-Smtp-Source: ABdhPJzVZHvVCv0QYFT+Wen5K0oshU2BpYi++OQTrTSvaErUO0XziqPWcbPBBMf4O5WyhYCyX2bfhg==
X-Received: by 2002:a7b:c119:: with SMTP id w25mr5974998wmi.70.1637053747023; 
 Tue, 16 Nov 2021 01:09:07 -0800 (PST)
Received: from [192.168.8.105] (145.red-37-158-173.dynamicip.rima-tde.net.
 [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id k13sm12071219wri.6.2021.11.16.01.09.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 01:09:06 -0800 (PST)
Subject: Re: [PATCH v1 4/6] meson: remove useless libdl test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211115142915.3797652-1-alex.bennee@linaro.org>
 <20211115142915.3797652-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <58c1db3a-ffaa-1ca6-6f6b-8e6f4d82bfd8@linaro.org>
Date: Tue, 16 Nov 2021 10:09:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115142915.3797652-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.446,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/21 3:29 PM, Alex Bennée wrote:
> From: Paolo Bonzini<pbonzini@redhat.com>
> 
> dlopen is never used after it is sought via cc.find_library, because
> plugins use gmodule instead; remove the test.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> Message-Id:<20211110092454.30916-1-pbonzini@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   meson.build           | 8 +-------
>   accel/tcg/meson.build | 2 +-
>   2 files changed, 2 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

