Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD29388BE7
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 12:45:35 +0200 (CEST)
Received: from localhost ([::1]:43548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljJhm-0004SI-Qc
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 06:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljJff-0002Vw-KF
 for qemu-devel@nongnu.org; Wed, 19 May 2021 06:43:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljJfd-0007pQ-Qr
 for qemu-devel@nongnu.org; Wed, 19 May 2021 06:43:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621421001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=asFSmI9k+vznSYfkcCDfNO4ATvifr5H9mkVoxVzZV/M=;
 b=Z0nhVYUx80g1+QaFkiXzru6mMrO7hcRQHDsMUPBiUj4k/BiKRmOQkqZC2NJtkyVv9TescB
 ZDGEAIMil4U/3JJHEqHviJj4k0nEMWV14CaF1hlduSmEyHmQChjhipUQTI6pB3Mc5/clIQ
 D036d5WN2TL+xKWd+c5dHo4LRPFILf4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-OonZO9RQOcSSLijct_1Hqg-1; Wed, 19 May 2021 06:43:18 -0400
X-MC-Unique: OonZO9RQOcSSLijct_1Hqg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 463D46414C;
 Wed, 19 May 2021 10:43:17 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-85.ams2.redhat.com [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BB115D6D5;
 Wed, 19 May 2021 10:43:15 +0000 (UTC)
Subject: Re: [PULL 17/20] configure: Poison all current target-specific
 #defines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20210514121518.832729-1-thuth@redhat.com>
 <20210514121518.832729-18-thuth@redhat.com>
 <5d6e779f-1bd8-8e71-860d-a3dccb55e7e8@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4f340f62-9d76-f202-c8ef-26c2514c86b8@redhat.com>
Date: Wed, 19 May 2021 12:43:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <5d6e779f-1bd8-8e71-860d-a3dccb55e7e8@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/05/2021 22.58, Philippe Mathieu-Daudé wrote:
> On 5/14/21 2:15 PM, Thomas Huth wrote:
>> We are generating a lot of target-specific defines in the *-config-devices.h
>> and *-config-target.h files. Using them in common code is wrong and leads
>> to very subtle bugs since a "#ifdef CONFIG_SOMETHING" is not working there
>> as expected. To avoid these issues, we are already poisoning many of the
>> macros in include/exec/poison.h - but it's cumbersome to maintain this
>> list manually. Thus let's generate an additional list of poisoned macros
>> automatically from the current config switches - this should give us a
>> much better test coverage via the different CI configurations.
>>
>> Note that CONFIG_TCG (which is also defined in config-host.h) and
>> CONFIG_USER_ONLY are special, so we have to filter these out.
>>
>> Message-Id: <20210414112004.943383-5-thuth@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   Makefile              | 2 +-
>>   configure             | 7 +++++++
>>   include/exec/poison.h | 2 ++
>>   3 files changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/Makefile b/Makefile
>> index bcbbec71a1..4cab10a2a4 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -213,7 +213,7 @@ qemu-%.tar.bz2:
>>   
>>   distclean: clean
>>   	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean -g || :
>> -	rm -f config-host.mak config-host.h*
>> +	rm -f config-host.mak config-host.h* config-poison.h
>>   	rm -f tests/tcg/config-*.mak
>>   	rm -f config-all-disas.mak config.status
>>   	rm -f roms/seabios/config.mak roms/vgabios/config.mak
>> diff --git a/configure b/configure
>> index f05ca143b3..0e4233fd8a 100755
>> --- a/configure
>> +++ b/configure
>> @@ -6473,6 +6473,13 @@ if test -n "${deprecated_features}"; then
>>       echo "  features: ${deprecated_features}"
>>   fi
>>   
>> +# Create list of config switches that should be poisoned in common code...
>> +# but filter out CONFIG_TCG and CONFIG_USER_ONLY which are special.
>> +sed -n -e '/CONFIG_TCG/d' -e '/CONFIG_USER_ONLY/d' \
>> +    -e '/^#define / { s///; s/ .*//; s/^/#pragma GCC poison /p; }' \
>> +    *-config-devices.h *-config-target.h | \
>> +    sort -u > config-poison.h
> 
> In my --disable-system builds I'm getting:
> 
> sed: can't read *-config-devices.h: No such file or directory

Confirmed. It also complains about missing *-config-target.h files when only 
building the tools ... I'll try to cook a patch to silence those messages...

  Thanks,
   Thomas


