Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7C02692AB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 19:12:32 +0200 (CEST)
Received: from localhost ([::1]:43622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHs1n-0005wg-SJ
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 13:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kHqUW-0006SI-2c
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 11:34:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kHqUT-0004Gv-Cl
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 11:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600097640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fdXP/nPprIAmMsECG5ihIzNeSMJYhkJX2MLqg0zrmG8=;
 b=BWsGL8TGqXDsDkpjalrTSUYFQNEgpXSOqIsQKUMubk3vkYiTSqHJm/9yaEpRCXNKRP3kWX
 kFpwwWhNAwHxrDuyePqtFenl7T0qBR2CojJN7P5CnEgu6vN0y8nVqXEUCBmGFs0bcZigYP
 lrKdZ/PMlxEJwWv9A/KsVpBwlQQqkR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-4wXFksTZNHaCARXylzDjfg-1; Mon, 14 Sep 2020 11:33:56 -0400
X-MC-Unique: 4wXFksTZNHaCARXylzDjfg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A19780ED8E;
 Mon, 14 Sep 2020 15:33:55 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-134.ams2.redhat.com [10.36.112.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 375D268433;
 Mon, 14 Sep 2020 15:33:54 +0000 (UTC)
Subject: Re: [PATCH] tests/check-block: Do not run the iotests with old
 versions of bash
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
References: <20200912121412.10999-1-thuth@redhat.com>
 <80c1a6a5-df83-8f48-309a-4dc8d3982a43@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ea934211-75d3-456d-1456-3aba3689db68@redhat.com>
Date: Mon, 14 Sep 2020 17:33:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <80c1a6a5-df83-8f48-309a-4dc8d3982a43@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 02:10:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.792,
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/09/2020 17.03, Eric Blake wrote:
> On 9/12/20 7:14 AM, Thomas Huth wrote:
>> macOS is shipped with a very old version of the bash (3.2), which
>> is currently not suitable for running the iotests anymore. Add
>> a check to skip the iotests in this case - if someone still wants
>> to run the iotests on macOS, they can install a newer version from
>> homebrew, for example.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   tests/check-block.sh | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/tests/check-block.sh b/tests/check-block.sh
>> index 8e29c868e5..bfe1630c1e 100755
>> --- a/tests/check-block.sh
>> +++ b/tests/check-block.sh
>> @@ -46,6 +46,11 @@ if ! command -v bash >/dev/null 2>&1 ; then
>>       exit 0
>>   fi
>>   +if bash --version | grep 'GNU bash, version [123]' > /dev/null 2>&1
>> ; then
> 
> We're already running bash - why do we need to spawn another bash and a
> grep, when we can just check $BASH_VERSION?

tests/check-block.sh uses "#!/bin/sh", so it could be running with a
different kind of shell, I think.

 Thomas


