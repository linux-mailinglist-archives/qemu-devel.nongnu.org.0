Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F270937FD27
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 20:18:41 +0200 (CEST)
Received: from localhost ([::1]:40246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhFuy-0001DJ-KX
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 14:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhFt5-0000SE-Tp
 for qemu-devel@nongnu.org; Thu, 13 May 2021 14:16:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhFst-0006VB-MT
 for qemu-devel@nongnu.org; Thu, 13 May 2021 14:16:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620929790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dkk9TPM4W9PwS5nD868TPiq9GwqyQYl64fkkjFdB3A0=;
 b=RAgfh3mcSH8D0KzADaSY+oZshx6TURUk14QW2Qx6XY3bZGEVANNNKhNQaFk4OvgPDJSAfd
 fA0ph05Y/9PODV6PCjYGZcD5J0qJFOrs+fQIZAkQeTR5jIM4BUlMCJPsXXeJXtU0Bgs2IY
 +CepxI2L3avbt/yqV6tzEZGM0AxiSFU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-OLIUrVO8OkqswGgTEGEKrA-1; Thu, 13 May 2021 14:16:26 -0400
X-MC-Unique: OLIUrVO8OkqswGgTEGEKrA-1
Received: by mail-ej1-f71.google.com with SMTP id
 gy20-20020a170906f254b02903cc7a4500bfso3465502ejb.4
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 11:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dkk9TPM4W9PwS5nD868TPiq9GwqyQYl64fkkjFdB3A0=;
 b=UsQS8b/IZd+5sKpYvdJrYtoVSaRmjHrpwPQe5W+zH9l+vC9f2rv9Ojh7IMq73xPw2f
 L0V0LmyQNOTpiMn6rcKppKFPJXHVzoWYuZJZhzEuVTnzGdG47xmEdShe5JXjNljomiTx
 pf2myxug74XahqvLOUs4Z9pd0F5S3qerIq4Zgphhxgmg46sZJQFWl1LZofCZ0VwGz4xA
 xRRMrQvWNoeGTv68z6Ji2k6BzjvqH3gz/71faEubQ6W5bHwxEvRwdBKrpQWQYezl8dCo
 jDedmnJ/LYMqlHL593Sn/tR0prNY3wj/zQprT9tx8l8oVezt838ycPd3GccnBlfzJMn4
 tmGA==
X-Gm-Message-State: AOAM530BS5K+GrutLcJhoYsxJigPzmYH914Ye+LyeCWr4PYDDDJ9G4Ph
 qMNN3Jlqtb/aEZjKKr8QEIXkaqFdkFvLZ5mg9s7q8yia74VVhoK03K/EqxxrPYSF25467TOGDHM
 WXDoGq/giDYxf1AQ=
X-Received: by 2002:a05:6402:2044:: with SMTP id
 bc4mr5922802edb.282.1620929785674; 
 Thu, 13 May 2021 11:16:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzikNPEsoHkHtzmCh1zODBGtGdStrgCokrZ9U6E9kxfjS1JeL4mt9nkgqKo10G9nSB6FOhboA==
X-Received: by 2002:a05:6402:2044:: with SMTP id
 bc4mr5922781edb.282.1620929785436; 
 Thu, 13 May 2021 11:16:25 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id wn14sm2202656ejb.28.2021.05.13.11.16.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 11:16:24 -0700 (PDT)
Subject: Re: [PATCH 10/10] default-configs/devices: Clarify
 ARM_COMPATIBLE_SEMIHOSTING is required
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210513163858.3928976-1-philmd@redhat.com>
 <20210513163858.3928976-11-philmd@redhat.com>
 <3da616d1-bfe7-e7fc-644d-fb530d6d50ef@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <839b65a7-6e41-6862-09a9-37697f506c1a@redhat.com>
Date: Thu, 13 May 2021 20:16:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <3da616d1-bfe7-e7fc-644d-fb530d6d50ef@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/21 7:58 PM, Paolo Bonzini wrote:
> On 13/05/21 18:38, Philippe Mathieu-Daudé wrote:
>> ARM_COMPATIBLE_SEMIHOSTING is not optional on these targets.
>> Move the variable assignment out of the block documented with
>> "Uncomment the following lines to disable these optional devices".
> 
> Can you document why it is always required in the commit message?

OK, basically SEMIHOSTING is not a device but an architectural thing.
Maybe we are mixing various things, like a semihosting console (yes,
a device) and the architectural part, I will discuss that with Alex.

> I suppose you cannot move it to default-configs/targets/ because you
> want to have CONFIG_SEMIHOSTING selected automatically (patch 9).

That and other things. This is annoying me since more than 1 year.
I'm waiting Claudio's ARM KVM/TCG series get merged before getting
my hands dirty with meson.build. Let's postpone this patch (and the
previous one) for now.

Thanks for the review,

Phil.


