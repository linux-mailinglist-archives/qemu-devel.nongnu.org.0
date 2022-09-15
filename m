Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 800065B9613
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 10:18:37 +0200 (CEST)
Received: from localhost ([::1]:43618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYk4x-0002bA-Ft
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 04:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oYjTr-0002Q9-7U
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 03:40:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oYjTl-0001Sb-Np
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 03:40:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663227608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gk4SK7WSs3jRQTrDYCX9uiPdWZ7FlCKE+QmwflRxSsI=;
 b=YbI0qpMfnDVTR0wyeQLW5kJP0lS3pd2JqNQWl/Kxg5HsUNBb84bSe1RE8Waw0r1Ugc5Q75
 gQWxrHNiLsQv8rFQUQ+pBrrer7MfgbPb8ISeGkeVaJQKI/aTz0p8NV620+npj0BBUvQb0X
 gM3OEhTYwsKCBwQGGtfjy+/HV3GdFeE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-88-LxlmLF60MWKKMfq-JdcIuA-1; Thu, 15 Sep 2022 03:40:06 -0400
X-MC-Unique: LxlmLF60MWKKMfq-JdcIuA-1
Received: by mail-wr1-f70.google.com with SMTP id
 e15-20020adf9bcf000000b002285faa9bd4so4435533wrc.8
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 00:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=gk4SK7WSs3jRQTrDYCX9uiPdWZ7FlCKE+QmwflRxSsI=;
 b=AJpvB0cB1zwCMv4CpJBjqq4Su7N3z+qo52pCoxSqYujtuY0qn9wAMgoE7e66hd54u3
 iKADSJzUbw2PvOoOx4IJyulG6KzWN6Sxqmoj5JB0Y2Rhfm1m0iDwJ0ibLO+J9sjBqUiq
 CHYji+qIglhDi5WwDmSWhS/TLa2tJNeTw7PlVPmze3yKBSUOce5nROL1A5EYkCtxuvUa
 IWvh7dpHQdg1n3khi3P8U/eYMVAX+DPACG3rNplnXAYo0ebk72tDP9TrwUTjHHXph2ku
 LLdk2D9Hba4f8cZtiFtAEm7ZDFMi0u+F73UY3AjGpqgIwd46a4NnEQNT1rQHpezDP5ht
 PKiA==
X-Gm-Message-State: ACgBeo1XCTp29aOpWEzK7I49DEBCAyXeg4GKGKrd/tJ7nLHUXg+EUpCa
 UQUsaSn0ncDOMEK++kplb1/0Rl6n5URdLkE/q4+fz4DkoNoGOmT39rMmXX4m7DUUDvqwhgcZGGG
 ZBrjVmio7onnpfJs=
X-Received: by 2002:a5d:4d0c:0:b0:228:cd9f:5a4c with SMTP id
 z12-20020a5d4d0c000000b00228cd9f5a4cmr24452704wrt.138.1663227605660; 
 Thu, 15 Sep 2022 00:40:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR604AMQ0SxUIpeNIV1yjnihSnCWwz1NDc+pbgso+SYjUyGVToYlMLWhmQJSNn+d+IhJeqN13g==
X-Received: by 2002:a5d:4d0c:0:b0:228:cd9f:5a4c with SMTP id
 z12-20020a5d4d0c000000b00228cd9f5a4cmr24452678wrt.138.1663227605411; 
 Thu, 15 Sep 2022 00:40:05 -0700 (PDT)
Received: from [172.20.194.41] ([79.140.208.123])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c3b8f00b003b435c41103sm2312710wms.0.2022.09.15.00.40.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 00:40:04 -0700 (PDT)
Message-ID: <8518dd23-aa03-8969-a280-568c9637ad0b@redhat.com>
Date: Thu, 15 Sep 2022 08:40:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 15/30] tests/docker: remove tricore qemu/debian10
 dependency
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-16-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220914155950.804707-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.583, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 14/09/2022 16.59, Alex Bennée wrote:
> We missed removing this dependency when we flattened the build.
> 
> Fixes: 39ce923732 (gitlab: enable a very minimal build with the tricore container)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Fixes: 39ce923732 ("gitlab: enable a very minimal build with the tricore  container")
> Message-Id: <20220826172128.353798-11-alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/container-cross.yml | 1 -
>   tests/docker/Makefile.include    | 1 -
>   2 files changed, 2 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


