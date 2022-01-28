Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1D649FCCE
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 16:29:15 +0100 (CET)
Received: from localhost ([::1]:56224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDTBa-0007fp-SJ
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 10:29:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDSrT-0003mK-Rh
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:08:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDSrS-0002yS-7e
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:08:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643382505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sqsCXaQnNIqp7kb5Hc/QhAK0z8dNVzwz2tz9pVIUTEg=;
 b=DlATvZqfPjEUO/W6NvYyD7PlNulfEn4Ez1qIsQIiBEMa58r3yPG8Ozbg66Ei1DT7WM9fGD
 yz+XoPYYxwhKHrIuRCXUw56K2VnAmBFiDdazm6siODmL/6K+Qa3aNrcPCI7RPlMd4oetkd
 390i0oDyFHYRWQ4JvHcaqweiq/vXJAE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-maXX6mNxNlqFYamIdBRMIg-1; Fri, 28 Jan 2022 10:08:19 -0500
X-MC-Unique: maXX6mNxNlqFYamIdBRMIg-1
Received: by mail-wr1-f70.google.com with SMTP id
 g6-20020adfbc86000000b001a2d62be244so2305254wrh.23
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:08:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sqsCXaQnNIqp7kb5Hc/QhAK0z8dNVzwz2tz9pVIUTEg=;
 b=UpMzdOq3ctJQdUUg35pSWtqlDtnpNH3MO4BTlFWmRByEVBOGtb44QEMj3DV2iKAlvp
 vaP0qLLNktNTYvGOsg8ieJDKwxk/VVOh6I3wf0L/1RU1OzYHX3+f5INiadLczrxb2SuT
 kMxD7yz0/GwqBPYiE71lA95SVFC/h8j/Xd8CStEvUuguXXF6mlb5nTSgWCnDXDMsWsFZ
 bCeAhbpg+0ozSy28ZiCoJY93HVA1GmUXtMUICY8M/d1C1NRyxv2LxXvZ/TF762WPLbo5
 5tMhMySZj7nJA2rsVfopfo10TqKiw4I6bzhNzbTN8+3SO71Sve2GhhS9/JE8YK5RzSKs
 tJ/w==
X-Gm-Message-State: AOAM533OOHMZeGkwT69+ocPqJ6mJwqefZzb7KM0x544zyU3NidsCl5/p
 wwSRo6Xl5a79Ak2A2A8qIdQmALQFcWT4Q7RnUV+n5eeLZ9o6t41MeRJ9ytFC9jinB0W9aBxOfci
 mw/PoGvae/ViRIas=
X-Received: by 2002:a7b:c40a:: with SMTP id k10mr7745492wmi.179.1643382498163; 
 Fri, 28 Jan 2022 07:08:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfIaq71SF9zD1Jwek1c23QiBEgyamN2aMPJvCrhAhyEWTbJ9W8Bf2IuG0H0mFD6shNB/5JEw==
X-Received: by 2002:a7b:c40a:: with SMTP id k10mr7745455wmi.179.1643382497849; 
 Fri, 28 Jan 2022 07:08:17 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id 44sm4819722wrm.103.2022.01.28.07.08.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jan 2022 07:08:17 -0800 (PST)
Message-ID: <c683711d-3d1a-6aa0-e629-b606d0abdb0c@redhat.com>
Date: Fri, 28 Jan 2022 16:08:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 25/33] block_int-common.h: split function pointers in
 BdrvChildClass
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-26-eesposit@redhat.com>
 <7d57ef24-25f9-da57-fb90-27783c9436ab@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <7d57ef24-25f9-da57-fb90-27783c9436ab@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 26/01/2022 13:42, Hanna Reitz wrote:
> On 21.01.22 18:05, Emanuele Giuseppe Esposito wrote:
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   include/block/block_int-common.h | 67 +++++++++++++++++++-------------
>>   1 file changed, 40 insertions(+), 27 deletions(-)
>>
>> diff --git a/include/block/block_int-common.h
>> b/include/block/block_int-common.h
>> index e007dbf768..cc8c8835ba 100644
>> --- a/include/block/block_int-common.h
>> +++ b/include/block/block_int-common.h
>> @@ -815,12 +815,16 @@ struct BdrvChildClass {
>>        */
>>       bool parent_is_bds;
>>   +    /*
>> +     * Global state (GS) API. These functions run under the BQL lock.
>> +     *
>> +     * See include/block/block-global-state.h for more information about
>> +     * the GS API.
>> +     */
>>       void (*inherit_options)(BdrvChildRole role, bool parent_is_format,
>>                               int *child_flags, QDict *child_options,
>>                               int parent_flags, QDict *parent_options);
>> -
>>       void (*change_media)(BdrvChild *child, bool load);
>> -    void (*resize)(BdrvChild *child);
>>         /*
>>        * Returns a name that is supposedly more useful for human users
>> than the
> 
> The method this comment belongs to is `.get_name()`.  It’s exposed
> through `bdrv_get_parent_name()`, which is called by
> `bdrv_get_device_name()` and `bdrv_get_device_or_node_name()` – so I
> think it should be classified as I/O.

Agree on this, and also on comment on patch 23 about bdrv_probe.
> 
>> @@ -837,6 +841,40 @@ struct BdrvChildClass {
>>        */
>>       char *(*get_parent_desc)(BdrvChild *child);
> 
> This function is very similar, so we might also want to reconsider
> classifying it as I/O.  There’s no need, because all of its callers do
> run in the main thread, but at the same time I don’t believe there’s
> anything stopping us (and it starts to sound to me like all functions of
> the “get name” kind perhaps should ideally be I/O, in that they
> shouldn’t require the GS context).
> 
> Up to you. O:)

I understand what you mean, but I would like to leave it in global
state. Seeing the assertion/definition as GS tells me that it is already
under BQL, and I should not worry about I/O in that function. If no such
assert was present, it would lead me to think that there might be I/O
concurrently using it, and complicate the logic of whatever I want to do
there.

Thank you,
Emanuele

> 
> (Rest of this patch looks good!)
> 
> Hanna
> 


