Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00366456E3F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 12:33:25 +0100 (CET)
Received: from localhost ([::1]:33070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo28y-00052M-Dk
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 06:33:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mo23W-000389-2b
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 06:27:47 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:44140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mo23Q-0005Ex-Re
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 06:27:45 -0500
Received: from [192.168.12.10] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 55ED520896;
 Fri, 19 Nov 2021 11:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1637321251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WxMvJLlaSyZuu01QiAEru9yMasylabLZBzvJr/jJ4S4=;
 b=08D9TlqVwrU25PVsTqsDvmmtqOTptfPK91EAjCOcMcKA2UnXFzwIrs7WRFGz/uXaRccwoQ
 FtczgLjZLQve/fOIcQg4neGRtB96hq4qwAu/WoV8ZiSitFmS0FObeSRORQyK66g5nnvZu8
 fQdTouK2OLgy4/9l04CTkQJaZl4TyKk=
Message-ID: <062ebe36-0b8c-2b73-6a5a-db7d2c7e98b7@greensocs.com>
Date: Fri, 19 Nov 2021 12:27:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 3/5] hw/core: Remove uses of QERR_DEVICE_NO_HOTPLUG
Content-Language: en-US-large
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20211029230147.2465055-1-philmd@redhat.com>
 <20211029230147.2465055-4-philmd@redhat.com>
 <87zgq0r1yq.fsf@dusky.pond.sub.org>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <87zgq0r1yq.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.727,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/19/21 09:20, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> QERR_DEVICE_NO_HOTPLUG definition is obsolete since 2015 (commit
>> 4629ed1e989, "qerror: Finally unused, clean up"). Replace the two
>> uses and drop the definition.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   include/qapi/qmp/qerror.h | 3 ---
>>   hw/core/qdev.c            | 3 ++-
>>   softmmu/qdev-monitor.c    | 2 +-
>>   3 files changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
>> index 596fce0c54e..f49ae01cdb0 100644
>> --- a/include/qapi/qmp/qerror.h
>> +++ b/include/qapi/qmp/qerror.h
>> @@ -26,9 +26,6 @@
>>   #define QERR_DEVICE_IN_USE \
>>       "Device '%s' is in use"
>>   
>> -#define QERR_DEVICE_NO_HOTPLUG \
>> -    "Device '%s' does not support hotplugging"
>> -
>>   #define QERR_FEATURE_DISABLED \
>>       "The feature '%s' is not enabled"
>>   
>> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
>> index 7f06403752d..14375861c36 100644
>> --- a/hw/core/qdev.c
>> +++ b/hw/core/qdev.c
>> @@ -734,7 +734,8 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
>>       static int unattached_count;
>>   
>>       if (dev->hotplugged && !dc->hotpluggable) {
>> -        error_setg(errp, QERR_DEVICE_NO_HOTPLUG, object_get_typename(obj));
>> +        error_setg(errp, "Device '%s' does not support hotplugging",
>> +                   object_get_typename(obj));
>>           return;
>>       }
>>   
>> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
>> index 4851de51a5c..35a885a6623 100644
>> --- a/softmmu/qdev-monitor.c
>> +++ b/softmmu/qdev-monitor.c
>> @@ -896,7 +896,7 @@ void qdev_unplug(DeviceState *dev, Error **errp)
>>       }
>>   
>>       if (!dc->hotpluggable) {
>> -        error_setg(errp, QERR_DEVICE_NO_HOTPLUG,
>> +        error_setg(errp, "Device '%s' does not support hotplugging",
>>                      object_get_typename(OBJECT(dev)));
>>           return;
>>       }
> 
> When the same error is detected in multiple places, I like to ask myself
> whether the code calls for a refactoring.  But I can't see a useful one
> here.
> 

Since the realize check will catch more case (devices created 
recursively by a command or simply by C code), we could remove the 
softmmu/qdev-monitor.c check and rely on realize catching that just after.
In theory failing during realize should have the same result as "not 
trying to create the device in the first place".

--
Damien



