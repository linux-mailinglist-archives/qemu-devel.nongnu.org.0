Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78711388CDF
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 13:33:56 +0200 (CEST)
Received: from localhost ([::1]:36118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljKSZ-00065i-3I
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 07:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljKQm-0005Dc-P7
 for qemu-devel@nongnu.org; Wed, 19 May 2021 07:32:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljKQh-0002op-OK
 for qemu-devel@nongnu.org; Wed, 19 May 2021 07:32:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621423918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SI1A1WRhMP+jJGawxsaFOcEIHLq4d7JsXco03lkbKf0=;
 b=Zp2aTSQvhPE+Rl9oTuwG6vq3xBLjeLY5qOihDu+G+8PqnAofrpc6+RQIqVZOXvyXGYGy9k
 hInFovf2H7ndPR0DPX94uqGrb7pew9E7gJQA7tMpoW1Uqhg+nzWt3/V2mI02dal8aW6cTP
 D/qal0j3JxRh+yI1+woauHryUDZOTgo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-96lf8a57NeepQX20dDIXXw-1; Wed, 19 May 2021 07:31:56 -0400
X-MC-Unique: 96lf8a57NeepQX20dDIXXw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86341E7B40;
 Wed, 19 May 2021 11:31:55 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-85.ams2.redhat.com [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F7DF5D9CC;
 Wed, 19 May 2021 11:31:54 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210519105719.290435-1-thuth@redhat.com>
 <acfb4c5c-e491-f4f9-942d-f6d400372927@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] configure: Avoid error messages about missing
 *-config-*.h files
Message-ID: <3172d6a4-5255-e02f-0434-cdc750df1a26@redhat.com>
Date: Wed, 19 May 2021 13:31:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <acfb4c5c-e491-f4f9-942d-f6d400372927@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/05/2021 13.08, Philippe Mathieu-Daudé wrote:
> On 5/19/21 12:57 PM, Thomas Huth wrote:
>> When compiling with --disable-system there is a harmless yet still
>> annoying error message at the end of the "configure" step:
>>
>>   sed: can't read *-config-devices.h: No such file or directory
>>
>> When only building the tools or docs, without any emulator at all,
>> there is even an additional message about missing *-config-target.h
>> files.
>>
>> Fix it by checking whether any of these files are available before
>> using them.
>>
>> Fixes: e0447a834d ("configure: Poison all current target-specific #defines")
>> Reported-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   configure | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/configure b/configure
>> index 963e35b9a7..a8a9e78c61 100755
>> --- a/configure
>> +++ b/configure
>> @@ -6458,10 +6458,14 @@ fi
>>   
>>   # Create list of config switches that should be poisoned in common code...
>>   # but filter out CONFIG_TCG and CONFIG_USER_ONLY which are special.
>> -sed -n -e '/CONFIG_TCG/d' -e '/CONFIG_USER_ONLY/d' \
>> -    -e '/^#define / { s///; s/ .*//; s/^/#pragma GCC poison /p; }' \
>> -    *-config-devices.h *-config-target.h | \
>> -    sort -u > config-poison.h
>> +target_configs_h=$(ls *-config-devices.h *-config-target.h 2>/dev/null)
>> +if test -n "$target_configs_h" ; then
>> +    sed -n -e '/CONFIG_TCG/d' -e '/CONFIG_USER_ONLY/d' \
>> +        -e '/^#define / { s///; s/ .*//; s/^/#pragma GCC poison /p; }' \
>> +        $target_configs_h | sort -u > config-poison.h
>> +else
>> +    touch config-poison.h
> 
>    :> config-poison.h is safer.

True, I'll send a v2.

  Thomas


