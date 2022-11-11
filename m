Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F382F62540B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 07:48:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otNpB-0006bl-Ok; Fri, 11 Nov 2022 01:47:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1otNp8-0006aF-V8
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 01:47:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1otNox-0008F7-2G
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 01:47:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668149241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NR3q19qDc/4TsmqFhHYRgTEw4LR//Ld/pGYM842OGsU=;
 b=IGK1bzD8tpWs7/h3Q/yFlAKrPfwI1lpiX/wFNYKWMNjGvZl7m3+YsboHE8P36qJ9mesiME
 nSpxMcv/8mu/dEPXXV1cwPDpcwjh1qJKQA4Y4FHnFuJoxLAQ20tHXf2D73RKjwBW6gaTvb
 HdyuU8SMRfZS/OiV7W3PzbB8qfkFU+E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-zD9L_OAyOVCc12SvGNAgGQ-1; Fri, 11 Nov 2022 01:47:17 -0500
X-MC-Unique: zD9L_OAyOVCc12SvGNAgGQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81F1085A5A6;
 Fri, 11 Nov 2022 06:47:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 50103140EBF5;
 Fri, 11 Nov 2022 06:47:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2F4B521E6921; Fri, 11 Nov 2022 07:47:16 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Zhenyu Zhang <zhenyzha@redhat.com>,  qemu-devel@nongnu.org,
 philmd@linaro.org,  shan.gavin@gmail.com,  eric.auger@redhat.com,
 imammedo@redhat.com,  lijin@redhat.com
Subject: Re: [PATCH v3] qapi/qom: Memory backend property prealloc-threads
 doc fix
References: <20221111030541.191186-1-zhenyzha@redhat.com>
 <dc7f305b-5dc0-999f-8b58-a2c2a4b18828@redhat.com>
Date: Fri, 11 Nov 2022 07:47:16 +0100
In-Reply-To: <dc7f305b-5dc0-999f-8b58-a2c2a4b18828@redhat.com> (Gavin Shan's
 message of "Fri, 11 Nov 2022 12:58:24 +0800")
Message-ID: <87bkpedm2z.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Gavin Shan <gshan@redhat.com> writes:

> Hi Zhenyu,
>
> On 11/11/22 11:05 AM, Zhenyu Zhang wrote:
>> Commit ffac16fab3 "hostmem: introduce "prealloc-threads" property"
>> (v5.0.0) changed the default number of threads from number of CPUs
>> to 1.  This was deemed a regression, and fixed in commit f8d426a685
>> "hostmem: default the amount of prealloc-threads to smp-cpus".
>> Except the documentation remained unchanged.  Update it now.
>> Signed-off-by: Zhenyu Zhang <zhenyzha@redhat.com>
>> ---
>> v3: Covers historical descriptions                  (Markus)
>> v2: The property is changed to smp-cpus since 5.0   (Phild)
>> ---
>>   qapi/qom.json | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>
> With the following comments addressed:
>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
>
> ---
>
> Please consider amending the commit log to something like below.
>
> The default "prealloc-threads" value is set to 1 when the property is
> added by commit ffac16fab33b ("hostmem: introduce "prealloc-threads"
> property") in v5.0.0. The default value is conflicting with the sugar
> property as the value provided by the sugar property is number of CPUs.

What is the sugar property?  Can you explain the conflict in a bit more
detail?

> The conflict has been fixed by commit f8d426a6852c ("hostmem: default
> the amount of prealloc-threads to smp-cpus"). However, 'qapi/qom.json'
> was missed to be updated accordingly in the commit.
>
> Update 'qapi/qom.json' to reflect the change in commit f8d426a6852c.
>
> Signed-off-by: Zhenyu Zhang <zhenyzha@redhat.com>
>
> When a specific commit is mentioned in the commit log, we usually have
> fixed format like below.
>
> commit ffac16fab33b ("hostmem: introduce "prealloc-threads" property")
> commit f8d426a6852c ("hostmem: default the amount of prealloc-threads to smp-cpus")

This is certainly a common format, but the other one is also in use.

>> diff --git a/qapi/qom.json b/qapi/qom.json
>> index 30e76653ad..dfd89bc6d4 100644
>> --- a/qapi/qom.json
>> +++ b/qapi/qom.json
>> @@ -576,7 +576,7 @@
>>   #
>>   # @prealloc: if true, preallocate memory (default: false)
>>   #
>> -# @prealloc-threads: number of CPU threads to use for prealloc (default: 1)
>> +# @prealloc-threads: number of CPU threads to use for prealloc (default: number of CPUs) (since 5.0)
>>   #
>>   # @prealloc-context: thread context to use for creation of preallocation threads
>>   #                    (default: none) (since 7.2)
>> 
>
> The line seems exceeding 80 characters. It'd better to limit each line in 75 characters.
> So you probably need:
>
>     # @prealloc-threads: number of CPU threads to use for prealloc (default: number of CPUs)
>     #                    (since 5.0)

Still exceeds :)

I suggested

      # @prealloc-threads: number of CPU threads to use for prealloc
      #                    (default: number of CPUs) (since 5.0)


