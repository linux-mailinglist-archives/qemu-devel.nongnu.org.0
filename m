Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7811C3140DC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:48:51 +0100 (CET)
Received: from localhost ([::1]:58788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9DSi-0005k0-VL
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:48:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l97Re-0000dJ-Q6
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 09:23:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l97RR-0007ZA-QZ
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 09:23:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612794181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o7zE2QaiNgYk3fGJN6QxqJNP61X2mV6Qi6nRX32k3nE=;
 b=HRVPo5XvNXGFKBmhb0OT4nDSUvoptq1I3APzLtGJ6KuI0dMkOSJivYD1K5WE91dRSptKgh
 cEVqGKxavkAnIGgiAYixWQevweKii4pFydI8tZl17KGn7DjuJ/FXanJVUM0HqgtrGDBTZe
 zglr7/3ErMcUF9HGSdruyoe4EL1WWKA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-uCGQmh5NOeaZIEWdGbalqA-1; Mon, 08 Feb 2021 09:22:57 -0500
X-MC-Unique: uCGQmh5NOeaZIEWdGbalqA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E192A91282;
 Mon,  8 Feb 2021 14:22:55 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF75C60C5B;
 Mon,  8 Feb 2021 14:22:54 +0000 (UTC)
Subject: Re: [PATCH 1/9] tests/qtest/arm-cpu-features: Remove Cortex-A15 check
To: Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-2-f4bug@amsat.org>
 <20210205145938.dvjk7jsfatgm56cy@kamzik.brq.redhat.com>
 <83662416-8eb6-eab9-fe90-c70daad29e44@amsat.org>
 <20210205153357.q73y2xo6oazheyma@kamzik.brq.redhat.com>
 <7173ad26-fc28-171e-b159-4b777fbaeb3a@amsat.org>
 <20210206104048.wavdqfi3zps377yf@kamzik.brq.redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <b8f61ba3-e4d4-a81c-a8f9-baafe8fab901@redhat.com>
Date: Mon, 8 Feb 2021 09:22:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210206104048.wavdqfi3zps377yf@kamzik.brq.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/6/21 5:40 AM, Andrew Jones wrote:
>> BTW is there some easy way to dump QMP traffic on stdio?
> You can use scripts/qmp/qmp-shell to manually test stuff.
> 
> Thanks,
> drew
> 

If you enable debug logging in python too, it'll print to STDERR. This 
may or may not be useful depending on how the library is getting used 
and by whom.

(For iotests, you used to be able to engage this mode by passing -d. I 
don't know if the new test runner has changed this behavior. I'm sure 
avocado has something similar, somewhere, too.)

Otherwise, the runes are something like:

```
import logging

logging.basicConfig(level=logging.DEBUG)
```

but this only works once per process; the iotests entry point already 
has a call like this. To override it:

```
import logging

logging.getLogger().setLevel(logging.DEBUG)
```

There are other, more complex incantations; you can read 
https://docs.python.org/3/howto/logging.html if you'd like; the logger 
we care about is "QMP" (for QMP instances created without a 'nickname') 
and "QMP.{nickname}" for ones that were. So you can do this:

logging.getLogger("QMP").setLevel(logging.DEBUG)

but you might need to adjust other settings to get it to appear on 
STDERR (I don't remember), like setting handler propagation settings and 
so on.

--js


