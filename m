Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AC826898F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 12:46:35 +0200 (CEST)
Received: from localhost ([::1]:32800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHm0I-0008O3-MS
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 06:46:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kHlzJ-0007ty-Ee
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 06:45:33 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20933
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kHlzH-0002v5-Vc
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 06:45:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600080331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ArXrzlNcrEidPRoErN/cEoWwaqD9zC/tfyObmnb5no=;
 b=jOqB2QGEbab4O+oR5iQ1RIwcH2gO7IpQhp/iZzF07YWCl1XYihlWNkFp6jDZF62rw268my
 NCK7bsrslck+Hfj3DMfW/bnkRK8sNMSKevENlcFuBcdigJMa8e+4qJpSTVjwlVrh1Axmm0
 DwCfhr8ieMCHpYkVn+caWcVq8jMH6bw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-FDTQjLn1M0-oaS0BWWUDOQ-1; Mon, 14 Sep 2020 06:45:28 -0400
X-MC-Unique: FDTQjLn1M0-oaS0BWWUDOQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4236F801FDB;
 Mon, 14 Sep 2020 10:45:27 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-134.ams2.redhat.com [10.36.112.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 052B65E1DF;
 Mon, 14 Sep 2020 10:45:25 +0000 (UTC)
Subject: Re: [PATCH] tests/check-block: Do not run the iotests with old
 versions of bash
To: luoyonggang@gmail.com
References: <20200912121412.10999-1-thuth@redhat.com>
 <CAE2XoE-RxwJ1ddAb_RzWHVYQFtkdy=d-1W0eFicMyJMyeP1LLA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <cf92f2c0-0740-9a20-f6b2-5eb9062ed86b@redhat.com>
Date: Mon, 14 Sep 2020 12:45:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE-RxwJ1ddAb_RzWHVYQFtkdy=d-1W0eFicMyJMyeP1LLA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 01:39:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.792,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-level <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/09/2020 11.36, 罗勇刚(Yonggang Luo) wrote:
> 
> 
> On Sat, Sep 12, 2020 at 8:16 PM Thomas Huth <thuth@redhat.com
> <mailto:thuth@redhat.com>> wrote:
>>
>> macOS is shipped with a very old version of the bash (3.2), which
>> is currently not suitable for running the iotests anymore. Add
>> a check to skip the iotests in this case - if someone still wants
>> to run the iotests on macOS, they can install a newer version from
>> homebrew, for example.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com <mailto:thuth@redhat.com>>
>> ---
>>  tests/check-block.sh | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/tests/check-block.sh b/tests/check-block.sh
>> index 8e29c868e5..bfe1630c1e 100755
>> --- a/tests/check-block.sh
>> +++ b/tests/check-block.sh
>> @@ -46,6 +46,11 @@ if ! command -v bash >/dev/null 2>&1 ; then
>>      exit 0
>>  fi
>>
>> +if bash --version | grep 'GNU bash, version [123]' > /dev/null 2>&1 ;
> then
>> +    echo "bash version too old ==> Not running the qemu-iotests."
>> +    exit 0
>> +fi
>> +
>>  if ! (sed --version | grep 'GNU sed') > /dev/null 2>&1 ; then
>>      if ! command -v gsed >/dev/null 2>&1; then
>>          echo "GNU sed not available ==> Not running the qemu-iotests."
>> --
>> 2.18.2
>>
>>
> Is that worth to convert the check-block.sh script to python script? so
> it can even running under msys2/mingw？

No, you need bash for the various iotest anyway.

 Thomas


