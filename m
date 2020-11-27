Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 792D42C649B
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 13:10:02 +0100 (CET)
Received: from localhost ([::1]:43464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kicZd-0001Hg-Ea
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 07:10:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kicYU-0000qE-Lh
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 07:08:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kicYN-00056s-QU
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 07:08:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606478922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cvJ8OZzUVzyUjKMZjn/f9BWfXkBfp/VXvbPYXEK61aY=;
 b=acm4GUfsP4L5rOUQ3nCcuWAEnpGMaqr78XmWk4rHF8YBrFCMivtNcjHRQyXKpUWgHz1B2y
 bqqxwYkzDaWe2rRPVB/6piIgXdFY2utOMAIV1c/zxKiMTQ3vD5unw5hh18HQszaYkIO5Sv
 Qa6YYUbhM6aPOCmOHla27SrCWE1hJB0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-bpsPhIcfN6aFBfiVwNor2g-1; Fri, 27 Nov 2020 07:08:40 -0500
X-MC-Unique: bpsPhIcfN6aFBfiVwNor2g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1AF210151E7;
 Fri, 27 Nov 2020 12:08:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CAB71A88B;
 Fri, 27 Nov 2020 12:08:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 11E6F113864E; Fri, 27 Nov 2020 13:08:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH for-6.0 2/6] qapi: Rename KvmInfo to AccelInfo
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-3-r.bolshakov@yadro.com>
 <20201127104012.GD2969@work-vm>
Date: Fri, 27 Nov 2020 13:08:38 +0100
In-Reply-To: <20201127104012.GD2969@work-vm> (David Alan Gilbert's message of
 "Fri, 27 Nov 2020 10:40:12 +0000")
Message-ID: <87pn3zq9x5.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * Roman Bolshakov (r.bolshakov@yadro.com) wrote:
>> There's nothing specific to KVM in the structure. A more generic name
>> would be more appropriate.
>> 
>> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
>
> For HMP:
>
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>
> Markus/Eric: Is it OK from QMP to change the type like that?

Type names are not part of the external interface, and can therefore be
changed freely.

>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index 11f364fab4..5648d8d24d 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -562,24 +562,24 @@
>>  { 'command': 'inject-nmi' }
>>  
>>  ##
>> -# @KvmInfo:
>> +# @AccelInfo:
>>  #
>> -# Information about support for KVM acceleration
>> +# Information about support for an acceleration

We might add accelerator information that isn't about "is this one
supported?", and then the description becomes misleading.

Suggest

    # Accelerator information

>>  #
>> -# @enabled: true if KVM acceleration is active
>> +# @enabled: true if an acceleration is active

Well, "an acceleration" is always active.  The flag tells us that *this*
accelerator is active.  Suggest

    # @enabled: whether this accelerator is active

>>  #
>> -# @present: true if KVM acceleration is built into this executable
>> +# @present: true if an acceleration is built into this executable

Suggest

    # @present: whether this accelerator is ...


>>  #
>>  # Since: 0.14.0
>>  ##
>> -{ 'struct': 'KvmInfo', 'data': {'enabled': 'bool', 'present': 'bool'} }
>> +{ 'struct': 'AccelInfo', 'data': {'enabled': 'bool', 'present': 'bool'} }
>>  
>>  ##
>>  # @query-kvm:
>>  #
>>  # Returns information about KVM acceleration
>>  #
>> -# Returns: @KvmInfo
>> +# Returns: @AccelInfo
>>  #
>>  # Since: 0.14.0
>>  #
>> @@ -589,14 +589,14 @@
>>  # <- { "return": { "enabled": true, "present": true } }
>>  #
>>  ##
>> -{ 'command': 'query-kvm', 'returns': 'KvmInfo' }
>> +{ 'command': 'query-kvm', 'returns': 'AccelInfo' }
>>  
>>  ##
>>  # @query-accel:
>>  #
>>  # Returns information about an accelerator
>>  #
>> -# Returns: @KvmInfo
>> +# Returns: @AccelInfo
>>  #
>>  # Since: 6.0.0
>>  #
>> @@ -608,7 +608,7 @@
>>  ##
>>  { 'command': 'query-accel',
>>    'data': { 'name': 'str' },
>> -  'returns': 'KvmInfo' }
>> +  'returns': 'AccelInfo' }
>>  
>>  ##
>>  # @NumaOptionsType:
>> -- 
>> 2.29.2
>> 

Adjust the comments, and you may add
Acked-by: Markus Armbruster <armbru@redhat.com>


