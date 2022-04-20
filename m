Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53C6508B8C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:05:32 +0200 (CEST)
Received: from localhost ([::1]:50294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBta-0001zB-Ur
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nhBKb-0006SJ-8J
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:29:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nhBKY-0006Rp-TD
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:29:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650464958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AIVSEouzDpWJRopvc1tK/DYN9zbjFY7T0+aLzz4j8UE=;
 b=Y41iVyRVe0IVu9XBY1p1cWwtA3oMAluUJYVrhI7f7lExEomd3Zc3hyYVOicd6KsIOT98m7
 yF82WVGviqNrpRzNKpZ9anC/Hq7XxNjIwFUGDaQXIIfVdQFQs2TolkLkbBYFowRkj57ixR
 7TLa/CcVdhmYk8Vkq7WDt6riGWu8Tes=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-_RrNEecbPHSaWPCcaROYzQ-1; Wed, 20 Apr 2022 10:29:16 -0400
X-MC-Unique: _RrNEecbPHSaWPCcaROYzQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 j30-20020adfb31e000000b0020a9043abd7so450987wrd.12
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 07:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AIVSEouzDpWJRopvc1tK/DYN9zbjFY7T0+aLzz4j8UE=;
 b=TvnoaaG1AesR/brKnNzcSQiN9X+B9lyvmJ7jpAyl09U1stdEdXib/E0KSqoTp/On6S
 ASsPNhJxl/E1eKBAu4VxM1DUXYxeef4e4iAlBwfrXu56Oh9XjsaUPFzr3USMH3tatMEI
 kqBLc4YEgMzhFGqAdkCjLnGAuVgMaw73r+mC4xvY8TTHuDy2hCCJTDUb4PAf+ECM3w7+
 e6EU9XRrMBKdZuMvt7fcBuZC2WlHJXwLa8rqCfJzUWQIz86rMuxwQeat2yhC8LAX9vzH
 3EHUXSLuuCfozIIvcypqc0J+gfgSGdKMkSFa3xJ+zZtA+whGoIJRjum2huKNt6x23V3p
 a6AQ==
X-Gm-Message-State: AOAM5321zNQrtqMnMTMEuo+x06+5r4pC5CXh/cj5tAmhO5tyCdzC/hUp
 nPQj6kok8qb1gMNiZKyhv5w3a+Pmj4U1RBeP9KO+BxSQh+iUlaj2GqCUkwo9Met32h19xkupk53
 a1XBhazmfzNVew30=
X-Received: by 2002:a05:6000:156a:b0:20a:9c1b:6b1b with SMTP id
 10-20020a056000156a00b0020a9c1b6b1bmr10007831wrz.683.1650464955657; 
 Wed, 20 Apr 2022 07:29:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3rCfnMQNJ4q6poSXea49PhS0FzRdOzT38d+vM/uoYGsh9mSO/B2V3bGztnR+xP1leWureew==
X-Received: by 2002:a05:6000:156a:b0:20a:9c1b:6b1b with SMTP id
 10-20020a056000156a00b0020a9c1b6b1bmr10007822wrz.683.1650464955489; 
 Wed, 20 Apr 2022 07:29:15 -0700 (PDT)
Received: from [192.168.8.102]
 (dynamic-046-114-174-058.46.114.pool.telefonica.de. [46.114.174.58])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm20696wrq.97.2022.04.20.07.29.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 07:29:14 -0700 (PDT)
Message-ID: <4e89ac62-906a-84e3-a760-fbb73771766f@redhat.com>
Date: Wed, 20 Apr 2022 16:29:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 34/41] libqtest: split QMP part in libqmp
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-35-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220420132624.2439741-35-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/04/2022 15.26, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> This will help moving QAPI/QMP in a common subproject.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   tests/qtest/libqos/libqmp.h    |  50 +++++++
>   tests/qtest/libqos/libqtest.h  |  29 +----
>   tests/qtest/libqos/libqmp.c    | 230 +++++++++++++++++++++++++++++++++

Same problem as with libqtest: This should not reside in libqos, please put 
it one level higher instead.

  Thomas



