Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3842535106A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 09:54:59 +0200 (CEST)
Received: from localhost ([::1]:46436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRsAM-0003ZZ-AA
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 03:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRs99-0002dq-6q
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 03:53:43 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRs97-0003Ac-M7
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 03:53:42 -0400
Received: by mail-wr1-x435.google.com with SMTP id v4so798625wrp.13
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 00:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+4IPyPjYPx3UwgoakiaIDpHjPZ/MjugBnT4GC1jxOE8=;
 b=J4xNwwSNo15j/5Xvhk7Kwj1c9HBgmCcK5hVlxNi4xGoT1Mtky+mgJu/p7rT6QvRJB1
 EJAjDUGbbXlUcSn9DGaVk0CTeOderAWkTO5JHTKiWZ22A8OA5bMlFoj6eGnDPbkXIAcN
 m6L3x3DzsnyTqwYYR5xo7hSMqLMiKpbOK9lhOT3TBdsK3UMtTEASJ70kDUsN36PqMAKb
 gkz9nJK5Ht8OtAtC6/tgAJpioyZ0vTQquxq6MCOLQuJlEixCsAGzYWxL5dQ5xN4ig6e9
 12zGsVsXd19JXvlqebLoZnVuUtuUovE5SxjYDccY45ubIrBcc18vyjM1ho6fJqF5KkBF
 Sj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+4IPyPjYPx3UwgoakiaIDpHjPZ/MjugBnT4GC1jxOE8=;
 b=byOMKmqfv5LXv1eVQc3VRu3da98GK7UWnwCwnHlgwDbggcghiXLH6tkUoQWXv0+1A3
 uAktr9eYRDJ7yekuAHwm84lcgceFxLOKz8LoJY8MkFD6RCHihKpnLpASO9QT7I4sI4yo
 G2tACz6bp3TN5jcpxU7oatWL7EbnO2c5vOv11NkP5NHwKN5NSAzvCgpa2uWjNUEhzN2p
 c7PzgYv7rNt0Yb23eB4N9VWuEl7lPQzVCEhu5E+zyxHRrvyM6Az48llYpbP6GwVUEMFX
 V0FYCzwENNFG4F3SBBROHIcmWMO+LSzbQSga8OB6mdi0Dv+dKT/ytqgdoh/P3De3JFjX
 fQDQ==
X-Gm-Message-State: AOAM531Fvh5tbhwonYRp06aTWSwrJY8RSSTsNwhZSn31WIqoYEBZx9Fi
 nab495RNe7dJMfhvdX/g43A=
X-Google-Smtp-Source: ABdhPJzPDQoHFedgiblwe/Y4DxvwLEd2jwHtE+MIfy69xiLZJ0PcyZ0Qit0PRCjMkevLfjAB9KU+ZQ==
X-Received: by 2002:a5d:6c62:: with SMTP id r2mr8450781wrz.62.1617263620089;
 Thu, 01 Apr 2021 00:53:40 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 13sm7032462wmw.5.2021.04.01.00.53.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 00:53:39 -0700 (PDT)
Subject: Re: Status update for maintainers file
To: Sarah Harris <seh53@kent.ac.uk>, QEMU Developers <qemu-devel@nongnu.org>
References: <20210331184221.d81b4ffed7c7c733c33f8c66@kent.ac.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2a6c50f1-4067-21ff-f92f-66cbb1023d9d@amsat.org>
Date: Thu, 1 Apr 2021 09:53:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210331184221.d81b4ffed7c7c733c33f8c66@kent.ac.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/21 7:42 PM, Sarah Harris wrote:
> Hi all,
> 
> I was added as a reviewer (in MAINTAINERS) for the AVR target for the duration of my research work using it.
> The funding for my project expires in the middle of April, so I will not be able to provide time for reviewing patches from that point.

Thank you Sarah for your AVR reviews the last years, they
have been of great value for the project and community.

Best regards,

Phil.

