Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F9F3BD916
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 16:52:55 +0200 (CEST)
Received: from localhost ([::1]:37302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0mRR-0005Kw-RK
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 10:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0mQG-0004Qt-6L; Tue, 06 Jul 2021 10:51:40 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:52799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0mQE-0006CI-JF; Tue, 06 Jul 2021 10:51:39 -0400
Received: by mail-wm1-x333.google.com with SMTP id g10so7921648wmh.2;
 Tue, 06 Jul 2021 07:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BEJp0TISYVu0JuDYCxLPKlT0FeibnwjPK9OCXGU6RXc=;
 b=fa/qlLQDZvfs162oZMv97Si8iDufKQfGIeL80pAQ3Ql4R32Zr3W8/0tr/kbi7Y0s46
 +1QjxOS56Lp5VxDvst6d66SZQmdizs+qKo9R1Hzh4dTqgJmUg8neX8c7FUWkofjUc4Rz
 K+9TFiquPZCzqH725uzk8iq65tOqUJnwconEVs7QWJIoFd0EKtdgkO7uamrbLpkUgkkC
 dEyS0CmJgEFEYX5eOozYR3bI72iR/vcXb3oP5UgIr5znXQfJm36UpcjrZv9v0Fiq2YHG
 eTfeptqCWjTc+X1cNLbY1mK9En1eYaVCy5REQ/QqTrH/vG257jAKltGeOU2xwXiys1xw
 aXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:cc:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BEJp0TISYVu0JuDYCxLPKlT0FeibnwjPK9OCXGU6RXc=;
 b=XcpLkq/ikazCVFhpDWxT2zz7jIl7b1QprH7vC5StKmAh9bwNZBVcWYKmTkqfnJW4ul
 j8Ks8UDwWADLIBfNVBHKKGGI9hMgADB9HQjbtBDyiIZ00J1w9UowBT0ZDAlyDxbkX4uU
 SPzhmG2PV/XDjkAl3bTmMX/X/B+G0WRGC8kwYhqT159zYUR2YxO+vzxy87Z6rJYcaafl
 0+kZosF53lZmry+ZGXre6LhsJT7GuzygyERKECBssDDBd8VFjT7s63NnWEvo0cbJdvhC
 qlL7pek3NW5BcFP4aInkJrn2dQYYFxRXi6A53YmCQ6jl9OCClsg7+H17Wx7ID6PWK++B
 IvOQ==
X-Gm-Message-State: AOAM530h69ZSKRwYDX++RuST5IJUbYbmB50X5PPV0HnZOOxNB1xXi//3
 bvNUnhccpsF2/cqKAqxYgdcIL3kvI1Y=
X-Google-Smtp-Source: ABdhPJxdtk9boDHHVlKwmQUQYTUGHM0NesdO0ZxAdB1pQmGBCXlwCtuD3QyYyVAdZ4n+b26Ult9bug==
X-Received: by 2002:a7b:cf2f:: with SMTP id m15mr303502wmg.33.1625583095357;
 Tue, 06 Jul 2021 07:51:35 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id r4sm18026139wre.84.2021.07.06.07.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 07:51:34 -0700 (PDT)
Subject: Re: support for raspberry3/3B/4B
To: =?UTF-8?B?5q635Yas?= <yindongbest@126.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <4417b006.b29.17a79788175.Coremail.yindongbest@126.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <16a7ca76-531a-39a4-36e2-dce5995e29aa@amsat.org>
Date: Tue, 6 Jul 2021 16:51:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4417b006.b29.17a79788175.Coremail.yindongbest@126.com>
Content-Type: text/plain; charset=gbk
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: 9
X-Spam_score: 0.9
X-Spam_bar: /
X-Spam_report: (0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 7/6/21 3:39 AM, Òó¶¬ wrote:
> Hi team of qemu
> I see the qemu6.0 has supported for raspberryPick 2B. but i want use it
> for raspberrypi 3/3B/4B. So can you tell me about raspberrypi 3/3B/4B plan ?

The raspi3 is supported (since QEMU v2.12):

$ qemu-system-aarch64 -M help | fgrep raspi3
raspi3ap             Raspberry Pi 3A+ (revision 1.0)
raspi3b              Raspberry Pi 3B (revision 1.2)
raspi3               Raspberry Pi 3B (revision 1.2) (alias of raspi3b)

See https://qemu-project.gitlab.io/qemu/system/arm/raspi.html


The raspi emulation is mostly contributed by hobbyist, so there
are no precise plan, it depends of their time / motivation.

What would be your use case?

By the way anybody is welcome to contribute patches :)

Regards,

Phil.

