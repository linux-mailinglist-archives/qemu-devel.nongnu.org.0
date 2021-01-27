Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25768306360
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 19:32:33 +0100 (CET)
Received: from localhost ([::1]:60932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4pcD-0008Kf-R9
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 13:32:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1l4paT-0007or-6U
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 13:30:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1l4paN-0006BO-Ic
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 13:30:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611772231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V0sfrKKVRAlt2Fcffv14YshVsL3DWACc2Pf4RH70Tig=;
 b=FQ6LSGTbDHnOWpH+mST7RXDH/fKJnHQ2aEWDsgqPOZXza7hmjaGevEnlVYMr7++aTyNHjB
 iAtCp9+xMsfdiaXnMdJ5ayAi5E87lWZgTE9T4Q9X0lgNcke162z6rowjNFnhDU/GvONPyu
 2/KmWwoEgDDt7Qa/yJufBwvoyGoEZ5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-o0DlZkGQNzSQgXzPYxQlKQ-1; Wed, 27 Jan 2021 13:30:28 -0500
X-MC-Unique: o0DlZkGQNzSQgXzPYxQlKQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 080081922023;
 Wed, 27 Jan 2021 18:30:27 +0000 (UTC)
Received: from [10.40.194.186] (unknown [10.40.194.186])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1F7360854;
 Wed, 27 Jan 2021 18:30:25 +0000 (UTC)
Subject: Re: [PATCH v3] machine: add missing doc for memory-backend option
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <20210121161504.1007247-1-imammedo@redhat.com>
 <20210127104511.GF3653144@redhat.com> <20210127105436.GG3653144@redhat.com>
 <756c025a-3811-4a36-98a2-3a02bd756523@redhat.com>
 <20210127163522.5a8db09a@redhat.com> <20210127175645.GW3653144@redhat.com>
From: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <2714b6bd-00f5-6232-a602-f12ea2a4ede0@redhat.com>
Date: Wed, 27 Jan 2021 19:30:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210127175645.GW3653144@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: peter.maydell@linaro.org, pkrempa@redhat.com, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 6:56 PM, Daniel P. Berrangé wrote:
> On Wed, Jan 27, 2021 at 04:35:22PM +0100, Igor Mammedov wrote:
>> On Wed, 27 Jan 2021 15:24:26 +0100
>> Michal Privoznik <mprivozn@redhat.com> wrote:
>>
>>> On 1/27/21 11:54 AM, Daniel P. Berrangé wrote:
>>>> On Wed, Jan 27, 2021 at 10:45:11AM +0000, Daniel P. Berrangé wrote:
>>>>> On Thu, Jan 21, 2021 at 11:15:04AM -0500, Igor Mammedov wrote:
>>>
>>>
>>>>>
>>>>> How does a mgmt app know which machine types need to use this
>>>>> option ? The machine type names are opaque strings, and apps
>>>>> must not attempt to parse or interpret the version number
>>>>> inside the machine type name, as they can be changed by
>>>>> distros.  IOW, saying to use it for machine types 4.0 and
>>>>> older isn't a valid usage strategy IMHO.
>> it's possible (but no necessary) to use knob with new machine types
>> (defaults for these match suggested property value).
> 
> IIUC, this means that setting the property has no impact on
> migration ABI for new machine types > 4.0....
> 
>> Limiting knob usage to 4.0 and older would allow us to drop
>> without extra efforts once 4.0 is deprecated/removed.
> 
> ...so, even if we set the property unconditionally for *all*
> machine types, then we can still remove it in future, becuase
> its removal won't affect ABI of the 5.x, 6.x machine types.

Alright, so after all you agree with proposed patch? I'm a bit confused.

At any rate, we have patches for nearly all available options (if not 
all), and I'd like to get things moving because both qemu and libvirt 
were already released meanwhile and our upstreams are broken. Not to 
mention users that started domain with libvirt 7.0.0 - they will be 
unable to migrate to libvirt 7.1.0+ (or whatever version we fix this), 
because libvirt 7.0.0 did not set the x-something-something attribute.

Michal


