Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9C332AC94
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 00:32:57 +0100 (CET)
Received: from localhost ([::1]:49500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHEVb-0006vs-5r
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 18:32:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHEUa-0006PC-Nf
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 18:31:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHEUX-0004k2-FY
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 18:31:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614727907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kQ3oj/ka+Fcyqv63yU6ePd8HB4PIFFLZQhHCvIoZZp0=;
 b=OVeTr0Wxy2zDY8ioEr2fKO8fo0joSFvWd+PJv3l68uz7JzROe307Q1o9YCa9erCCVoqTaU
 K3ubE6++59lRn3AXfdhD1l1eBzUumPHa5tmdKjKYD0RzkAH88rgtK10uNbgtZFqH7ASnkU
 OrFD0cA7WHMadLK79T+pn+1qoNhbRLQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-CnkRLCkNPbCGaVTFD1JkVA-1; Tue, 02 Mar 2021 18:31:45 -0500
X-MC-Unique: CnkRLCkNPbCGaVTFD1JkVA-1
Received: by mail-ed1-f72.google.com with SMTP id k8so2844617edn.19
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 15:31:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kQ3oj/ka+Fcyqv63yU6ePd8HB4PIFFLZQhHCvIoZZp0=;
 b=PG+WTBlM86rFrlO9XdYSal+TNnSyQiBxhVay/edjXnxndeXpqyNH8mj68kSN2+tKGA
 QpAw3oDQ33UnZEniklilQmfYBWG7ZhAYNhXLH747pFKWTIvA7xDQOIMqz4w1q3XXlNCz
 sp7jiLgDNg1RfEqaHCXvCSbsZVN3DT/Qlz925TQFLV6voJkvQSfO6htKjFbWKLl6TTc4
 5XOBYERsN3BawVwQcSgysXC2i4SAPMmzA3cfJC3RCW4HODtoMjznDVdFPuBfV0cpq4t+
 16TzvtgiNoz3dfq7w5K7gEZrZNoPJN0DuZfJ2Xzlcf57z1nq4QdA3KvFfhgNLcjZx6+A
 11eA==
X-Gm-Message-State: AOAM530KOcJWzRIIwQG8QfRmn9MKM6HKILuqI9OTvz3z1YG/GiImZUkK
 iAMLGmqzW2biJwEQ5LQBWrH6VRch1no1V86YaboXrsCvCcW4sS5VD20qFcHGJc/qk6xbqWnqnta
 xokei6Pimg7qWie0=
X-Received: by 2002:a17:906:5295:: with SMTP id
 c21mr14627988ejm.67.1614727904354; 
 Tue, 02 Mar 2021 15:31:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzk4wIaxO0XpJOSGJz1sPagauAa3c1yxAJ1AUDir/tPIsS/v8RJPaU/MNWJWWfEhgLqL1kZSg==
X-Received: by 2002:a17:906:5295:: with SMTP id
 c21mr14627967ejm.67.1614727904204; 
 Tue, 02 Mar 2021 15:31:44 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id jj15sm15028272ejc.99.2021.03.02.15.31.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 15:31:43 -0800 (PST)
Subject: Re: [PATCH v2 8/8] hw/vfio/pci-quirks: Replace the word 'blacklist'
To: Alex Williamson <alex.williamson@redhat.com>
References: <20210205171817.2108907-1-philmd@redhat.com>
 <20210205171817.2108907-9-philmd@redhat.com>
 <20210302145523.0c694e4d@omen.home.shazbot.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <01fb6834-ed0c-96e1-53c4-09e0f096c848@redhat.com>
Date: Wed, 3 Mar 2021 00:31:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302145523.0c694e4d@omen.home.shazbot.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Eduardo Otubo <otubo@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 10:55 PM, Alex Williamson wrote:
> On Fri,  5 Feb 2021 18:18:17 +0100
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> Follow the inclusive terminology from the "Conscious Language in your
>> Open Source Projects" guidelines [*] and replace the word "blacklist"
>> appropriately.
>>
>> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
>>
>> Reviewed-by: Alex Williamson <alex.williamson@redhat.com>
>> Acked-by: Alex Williamson <alex.williamson@redhat.com>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/vfio/pci.h        |  2 +-
>>  hw/vfio/pci-quirks.c | 14 +++++++-------
>>  hw/vfio/pci.c        |  4 ++--
>>  hw/vfio/trace-events |  2 +-
>>  4 files changed, 11 insertions(+), 11 deletions(-)
> 
> I thought someone might grab the whole series, but since that hasn't
> happened yet, I've queued this one.  Thanks,

Thanks :)


