Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAC83F2CD6
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 15:08:55 +0200 (CEST)
Received: from localhost ([::1]:44102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH4GU-0002gC-6V
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 09:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH4Ep-0000j3-7B
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 09:07:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH4Em-0007Sc-Jv
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 09:07:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629464827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jJqm+pEuD8Q2NSc5IJcGSIVSRU/r4d1/O5cZTk6RQgo=;
 b=NZ+PDI9a9CCT38SEmqLawrxm1fFDyyff2eWayCT2+LwnmADYlIy8vbXu3YFnBUAmFge4k+
 6vgSImJJgo0V+5awyf8PGiASwp3W0ncqNz1WTQFgEQTn8oCK+q5A8XMXm4u6Ca64VAlWos
 P1SQp5tgtwWI9Tki1fWsDZon17P10Fk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-zo_Fgp_hNiOZmGe-zwdHLQ-1; Fri, 20 Aug 2021 09:07:06 -0400
X-MC-Unique: zo_Fgp_hNiOZmGe-zwdHLQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 u14-20020a7bcb0e0000b0290248831d46e4so2402078wmj.6
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 06:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jJqm+pEuD8Q2NSc5IJcGSIVSRU/r4d1/O5cZTk6RQgo=;
 b=g3yAxKTGdjP3RmqNDgIVL59o1W6cPSXLDtzqWkJVSj5xU1tolSODW6+TwAaUVzLKkC
 kd0heQzNstZ2cL6Nxj7uwII7XqCuhSrHZv6kGV6NGWdw57UPPR31zKb+KmcCCcCXIYzb
 A4UZOUB09wM9GXDulbruCE7WaYLOJEuJiwLUv+b9uJsCQzJXYl67mBfL8ei6WBH57Je6
 AeiaJCt1Y2aniki2+FruGn147nxHFuWDw2DgrpTNuIp50XGiWNX9v0FvZZkhuLPfzgCE
 AByMzfb1yax6kmYPDn28qtWCgJe0Ie0l5C1krvWlrEIIGovOgQjzTYEgJ6oDeYV5Vpcx
 7LlA==
X-Gm-Message-State: AOAM532uNujYsA8XxKouwpOOJKaAJ0nHwOPkVZpQJV5N18PP8nEWre28
 Kb7X36T2lNWUyUnrGVsQouPO3YDKfkt0zcQT1n8R8hfLUDLptctbHxhMPBKJsLi/R1cslRCeBzE
 wQn0NG3f/1QX398iPGbgKZZiH2QXBFu92Ztc80sBjlSMXBLKI5439YuVrgVubRvEO
X-Received: by 2002:a5d:62cb:: with SMTP id o11mr1702682wrv.216.1629464825290; 
 Fri, 20 Aug 2021 06:07:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVaWbEarGnFVrJZXOGkHID5+D30ayZvTI7wRqBe82PpqL3rUt6QyuGPKagmHlQuqFf5s13cw==
X-Received: by 2002:a5d:62cb:: with SMTP id o11mr1702645wrv.216.1629464824973; 
 Fri, 20 Aug 2021 06:07:04 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id g6sm5604513wmq.14.2021.08.20.06.07.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 06:07:04 -0700 (PDT)
Subject: Re: [PATCH 0/1] uas: add stream number sanity checks (maybe 6.1)
To: Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>
References: <20210818120505.1258262-1-kraxel@redhat.com>
 <CAFEAcA_-wCZQv8bSpUoROzJCz5ND6_5DG-FKOXDSOhEcptqF0Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <de938d0f-7de6-d34e-5f48-c4b6346545f4@redhat.com>
Date: Fri, 20 Aug 2021 15:07:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_-wCZQv8bSpUoROzJCz5ND6_5DG-FKOXDSOhEcptqF0Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.49, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Mauro to double-check.

On 8/20/21 2:12 PM, Peter Maydell wrote:
> On Wed, 18 Aug 2021 at 13:10, Gerd Hoffmann <kraxel@redhat.com> wrote:
>>
>> Security fix.  Sorry for the last-minute patch, I had completely
>> forgotten this one until the CVE number for it arrived today.
>>
>> Given that the classic usb storage device is way more popular than
>> the uas (usb attached scsi) device the impact should be pretty low
>> and we might consider to not screw up our release schedule for this.
> 
> What's the impact if the bug is exploited ?

Bug class: "guest-triggered user-after-free".

Being privileged (root) in the guest, you can leak some data from
the host process then DoS the host or potentially exploit the
use-after-free to execute code on the host.


