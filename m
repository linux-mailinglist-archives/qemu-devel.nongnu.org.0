Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A34F360830
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 13:23:30 +0200 (CEST)
Received: from localhost ([::1]:34412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX05p-0005Q2-AR
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 07:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lX04I-0004ru-RY
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 07:21:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lX04H-00082Y-8W
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 07:21:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618485712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=++vooHEEqdDwenShP0OPSKdSSOITe3bqBdKNNNUpgp8=;
 b=N+3EM6nTPyhoRbjJWwF+JEtiOEO4qf3/fa9cbL8ba3y5OdioHt1gb541VkfG8s1DSrDIm0
 joNbZt4e4fw/8fNqELKdZpFTSQhHNjo2TMhPZ7pajDWSlZIEs2aJLj3Lc6oqAkwgC2w+NI
 ymbEJX/9d9YdeShJDzKMRmGy9aiHpy8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-2VjpaRIQNRexH_5YuEbd-Q-1; Thu, 15 Apr 2021 07:21:50 -0400
X-MC-Unique: 2VjpaRIQNRexH_5YuEbd-Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 124D31006C81;
 Thu, 15 Apr 2021 11:21:49 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-39.ams2.redhat.com [10.36.112.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B49E62AF7;
 Thu, 15 Apr 2021 11:21:45 +0000 (UTC)
Subject: Re: [PATCH for-6.1 4/4] configure: Poison all current target-specific
 #defines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
References: <20210414112004.943383-1-thuth@redhat.com>
 <20210414112004.943383-5-thuth@redhat.com>
 <529f4022-aa17-2b41-294d-a293b0461690@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9c7313b0-2b5c-03e2-fe04-2f0bfa2f6470@redhat.com>
Date: Thu, 15 Apr 2021 13:21:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <529f4022-aa17-2b41-294d-a293b0461690@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/04/2021 10.34, Philippe Mathieu-Daudé wrote:
> +Richard/Claudio
> 
> On 4/14/21 1:20 PM, Thomas Huth wrote:
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
> 
> I know if we poison CONFIG_TCG, almost nothing build, but I fail to
> see how it is different from the other accelerators. 

You could argue that TCG is not specific to a target, i.e. it is either 
available for all targets, or it is disabled for all targets, so this is 
rather like a host config option than a target specific option.

>> diff --git a/configure b/configure
>> index 4f374b4889..a0f0601e7e 100755
>> --- a/configure
>> +++ b/configure
>> @@ -6440,6 +6440,11 @@ if test -n "${deprecated_features}"; then
>>       echo "  features: ${deprecated_features}"
>>   fi
>>   
> 
> Maybe a one line comment (but since it is obvious, I don't mind):
> 
>     # Filter out CONFIG_TCG and CONFIG_USER_ONLY which are special

Ok, makes sense, I can add that.

>> +sed -n -e '/CONFIG_TCG/d' -e '/CONFIG_USER_ONLY/d' \
>> +    -e '/^#define / { s///; s/ .*//; s/^/#pragma GCC poison /p; }' \
>> +    *-config-devices.h *-config-target.h | \
>> +    sort -u > config-poison.h
>> +
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks!

   Thomas


