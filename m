Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EBC2B248E
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 20:34:40 +0100 (CET)
Received: from localhost ([::1]:46922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdeqF-000329-C8
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 14:34:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdeoM-0002Ky-Bb
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 14:32:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdeoH-0000I6-CJ
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 14:32:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605295955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tD+hIRJwAqUQ8+0eGS20lhNxCBzUbPKDJmHbw/IbpuA=;
 b=IiOIJV9Ga+toVJqPLtg+7T24mLvH2Q/M6I2393bK7HQC296M6f4NYGUCeYJoGTqEaBUA+f
 HJqBQC4Qcu8iftbRnmjexFmDbdr/rWE/HV8Tk6h3rD8fHGWmqSzJtfxLSm7o8QLugJsG59
 DfTsDzSZer6P+Ir8MxT1TXxdVdFp0Zc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-IRvTeL3IOFunW5soEFiZDg-1; Fri, 13 Nov 2020 14:32:32 -0500
X-MC-Unique: IRvTeL3IOFunW5soEFiZDg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0C9F5F9E2;
 Fri, 13 Nov 2020 19:32:30 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-96.ams2.redhat.com
 [10.36.114.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10DBE1002382;
 Fri, 13 Nov 2020 19:32:24 +0000 (UTC)
Subject: Re: [PATCH v7 21/21] scripts/simplebench: add bench_prealloc.py
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201021145859.11201-1-vsementsov@virtuozzo.com>
 <20201021145859.11201-22-vsementsov@virtuozzo.com>
 <7ac2a1e3-19a3-5d84-49fc-369f8ac2b696@redhat.com>
 <6ecf486b-3faa-c940-5923-746f71a5cd29@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <1198adee-f7b7-79b2-904c-39d16f290547@redhat.com>
Date: Fri, 13 Nov 2020 20:32:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <6ecf486b-3faa-c940-5923-746f71a5cd29@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, den@virtuozzo.com, qemu-devel@nongnu.org,
 armbru@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.11.20 19:00, Vladimir Sementsov-Ogievskiy wrote:
> 13.11.2020 19:24, Max Reitz wrote:
>> On 21.10.20 16:58, Vladimir Sementsov-Ogievskiy wrote:
>>> Benchmark for new preallocate filter.
>>>
>>> Example usage:
>>>      ./bench_prealloc.py ../../build/qemu-img \
>>>          ssd-ext4:/path/to/mount/point \
>>>          ssd-xfs:/path2 hdd-ext4:/path3 hdd-xfs:/path4
>>>
>>> The benchmark shows performance improvement (or degradation) when use
>>> new preallocate filter with qcow2 image.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   scripts/simplebench/bench_prealloc.py | 132 ++++++++++++++++++++++++++
>>>   1 file changed, 132 insertions(+)
>>>   create mode 100755 scripts/simplebench/bench_prealloc.py
>>
>> Reviewed-by: Max Reitz <mreitz@redhat.com>
>>
> 
> 
> Thanks for reviewing! Could you take this all through you tree?

Sure, if you can live with the fact that I’ll be on PTO for the next two 
weeks :)

(Shouldn’t matter for block-next, as 5.2 won’t be released until December.)

Max


