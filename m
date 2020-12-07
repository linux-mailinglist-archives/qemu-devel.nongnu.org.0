Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3912B2D0C21
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 09:54:23 +0100 (CET)
Received: from localhost ([::1]:48466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmCHm-0000Gv-9a
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 03:54:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmCGN-00088y-RO
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 03:52:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmCGL-00064q-Sc
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 03:52:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607331171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zVoY5lQPgWaWuAH+POdnr8PAv6pqZawAsiFIxFry3r4=;
 b=jCg6AHU3ctAN+rO8P+VbYKfJBzxthLX+bBalrc6s9jFf6I3DAbh2v5JwIq9GmRqkAMXkDD
 3ZyCz89s1Pb9JkkRf5oLIPAWOzzE6kNpp8jq1gwJdBE7O0cdE/Z009FqD10SAfotZo4Z3t
 Oz3W6rYGFPOhkWrBGPaQRCUieleb38k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-d86nbOk0OAOe3J_IK2Ug2Q-1; Mon, 07 Dec 2020 03:52:50 -0500
X-MC-Unique: d86nbOk0OAOe3J_IK2Ug2Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFACE107ACE8;
 Mon,  7 Dec 2020 08:52:48 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-85.ams2.redhat.com [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C4BC36FA;
 Mon,  7 Dec 2020 08:52:43 +0000 (UTC)
Subject: Re: [PATCH 09/13] u2f-passthru: put it into the 'usb' category
To: ganqixin <ganqixin@huawei.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-10-ganqixin@huawei.com>
 <49d4e8e3-7138-18cf-3972-c18e8275d3be@redhat.com>
 <A5B86EC83C48EF4CB2BC58BEF3A2F496065C27CD@DGGEMI525-MBS.china.huawei.com>
 <babff5a6-4c78-7d44-4d97-d095e627639d@redhat.com>
 <A5B86EC83C48EF4CB2BC58BEF3A2F496065E4158@DGGEMI525-MBS.china.huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <e97a996d-3f22-bf1d-15f4-f53247e0beb4@redhat.com>
Date: Mon, 7 Dec 2020 09:52:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <A5B86EC83C48EF4CB2BC58BEF3A2F496065E4158@DGGEMI525-MBS.china.huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/12/2020 09.05, ganqixin wrote:
>> -----Original Message-----
>> From: Philippe Mathieu-Daudé [mailto:philmd@redhat.com]
>> Sent: Friday, December 4, 2020 9:50 PM
>> To: ganqixin <ganqixin@huawei.com>; qemu-devel@nongnu.org;
>> qemu-trivial@nongnu.org
>> Cc: Chenqun (kuhn) <kuhn.chenqun@huawei.com>; Zhanghailiang
>> <zhang.zhanghailiang@huawei.com>; Gerd Hoffmann
>> <kraxel@redhat.com>; thuth@redhat.com
>> Subject: Re: [PATCH 09/13] u2f-passthru: put it into the 'usb' category
>>
>> On 11/17/20 2:37 PM, ganqixin wrote:
>>>> -----Original Message-----
>>>> From: Philippe Mathieu-Daudé [mailto:philmd@redhat.com]
>>>> Sent: Monday, November 16, 2020 10:05 PM
>>>> To: ganqixin <ganqixin@huawei.com>; qemu-devel@nongnu.org;
>>>> qemu-trivial@nongnu.org; Marc-André Lureau
>>>> <marcandre.lureau@redhat.com>; thuth@redhat.com
>>>> Cc: Chenqun (kuhn) <kuhn.chenqun@huawei.com>; Zhanghailiang
>>>> <zhang.zhanghailiang@huawei.com>; Gerd Hoffmann
>> <kraxel@redhat.com>;
>>>> Eduardo Habkost <ehabkost@redhat.com>
>>>> Subject: Re: [PATCH 09/13] u2f-passthru: put it into the 'usb'
>>>> category
>>>>
>>>> On 11/15/20 7:48 PM, Gan Qixin wrote:
>>>>> The category of the u2f-passthru device is not set, put it into the 'usb'
>>>>> category.
>>>>
>>>> I guess we discussed this with Thomas 1 or 2 years ago but I don't
>> remember.
>>>> I think it was about using set_bits() so devices can appear in
>>>> multiple categories.
>>>>
>>>> Gerd, do you know what is the point of the "usb" category for
>>>> management apps? This is a bus accepting multiple better categorized
>>>> devices (display, storage, input, network, sound).
>>>>
>>>> Unrelated but multiple devices are related to SECURITY.
>>>> Maybe it is time to introduce the DEVICE_CATEGORY_SECURITY?
>>>
>>> Hi, Philippe
>>> Thanks for your reply, but I'm not sure if it is appropriate to add a
>> security category to place this device.
>>> (Maybe it's because I don't know much about these device, I haven't
>>> find many safety-related devices in 'misc' category or uncategorized
>>> devices)
>>
>> What is the difference between 'misc' and 'uncategorized'?
> 
> In my opinion, devices that we forgot to classify will appear in "uncategorized" list, and devices that don't have a suitable category to choose will be put into "misc" category.

That's right. User-creatable devices should have a category, and the
uncategorized devices just have not been categorized yet.

So thanks for tackling this, Gan Qixin!

 Thomas


