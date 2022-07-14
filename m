Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4B95740EB
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 03:22:32 +0200 (CEST)
Received: from localhost ([::1]:48476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBnYl-0003Ab-6J
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 21:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBnUB-0001N6-Ni
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 21:17:47 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:53110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBnUA-0005Ae-61
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 21:17:47 -0400
Received: by mail-pj1-x102b.google.com with SMTP id fz10so932003pjb.2
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 18:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uTJq7DeubfQMH138S5dsqp7qB/rda5+/6bhkF89hZ08=;
 b=VZ7sq279gK2ImKBYTa0rUAmB+c3T5U73HZMgu3mgVn3qy51k+Q4cOk2C0IzD6iaZ29
 8GF6p6VajlXEKpPgA9pbSK7Gv716asnYcV2GgTsaUYpn4M1h4VsjMxpc+sc6Bx7T8oWW
 qaWXDD+dh9BmPhuT+TUk0MC9S9TN/RObIdFxtWtxR9koZZnqosSJPKLMq+Pqx1jkahoW
 OjKqBcpbCEfVvFVaUg7+KGhYDsGXGPEux94PRL/5LMHPUYarHlJTqOcrHFMcAr5w+LXh
 pQ1EkpI3bjYn7s1E/I/6ArkUbWXSwXjSsNxKk07+BvGUwh/H5kNSh9glRsjKMSQV+GO2
 Mlyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uTJq7DeubfQMH138S5dsqp7qB/rda5+/6bhkF89hZ08=;
 b=Fg6CR8+Az9gmJ8iOaAkLEQ8F31z2pmJ94L929BMG17sGqbzUJL82ObqMfzr098PG+0
 yATjMA1gUSharV1UK6uDwHfW7m37YQLY5IzDhntPCGWq0WWH/qLDCtm41Qi6dktX9aqZ
 UbjPPBL1Yeq4dS9t0kJRsQ53Urcc/lnMN3ot0kl+66Hvl/fz7CrIBbj6Qg77MYzse9bt
 tW1gB7t0JJwkTBfcnDAgUKZ2LgQNOr5CXJyESdQdYz7ejfjHA+QcUK/+afvOehvY7k7J
 7nW7mLOSdBgZTSvkKo5WMFNTT2D2Q+9GISqx/WpztDKk7DW/+gkSxlv/8G5xoU4psdPh
 yWYQ==
X-Gm-Message-State: AJIora9SbWHL6cAVfgArhRaC59P9pKnpGNOHp7PJ/6haVTOlqr3lqsun
 4VFKi+yoQP5f6uw6ECMeJX8FCA==
X-Google-Smtp-Source: AGRyM1tCBSo6bdsEte6jrJiOmNxKrb7flzy4oTjZ9b1VmsBKcEvMFCsfRipO16tQDBmqwX9M06T7XA==
X-Received: by 2002:a17:90a:408f:b0:1e3:23a:2370 with SMTP id
 l15-20020a17090a408f00b001e3023a2370mr6724421pjg.84.1657761464244; 
 Wed, 13 Jul 2022 18:17:44 -0700 (PDT)
Received: from [192.168.138.227] ([202.124.167.115])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a1709026b0500b0016be5ed14d5sm72282plk.40.2022.07.13.18.17.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jul 2022 18:17:43 -0700 (PDT)
Message-ID: <1e7d6f3f-fffd-83da-628f-95e0eaead2eb@linaro.org>
Date: Thu, 14 Jul 2022 06:47:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/3] tests/tcg/s390x: test signed vfmin/vfmax
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220713182612.3780050-1-iii@linux.ibm.com>
 <20220713182612.3780050-4-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220713182612.3780050-4-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 7/13/22 23:56, Ilya Leoshkevich wrote:
> Add a test to prevent regressions. Try all floating point value sizes
> and all combinations of floating point value classes. Verify the results
> against PoP tables, which are represented as close to the original as
> possible - this produces a lot of checkpatch complaints, but it seems
> to be justified in this case.
> 
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   tests/tcg/s390x/Makefile.target |   7 +
>   tests/tcg/s390x/vfminmax.c      | 411 ++++++++++++++++++++++++++++++++
>   2 files changed, 418 insertions(+)
>   create mode 100644 tests/tcg/s390x/vfminmax.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

