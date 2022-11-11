Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B2C6252E8
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 06:00:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otM7m-00051x-7I; Thu, 10 Nov 2022 23:58:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1otM7k-00051i-M6
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:58:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1otM7i-0000EI-Qt
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:58:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668142717;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VqIDWdl0ScxTgA2BZ3axl8QvTwXdyWcFms0zMgUXm4Y=;
 b=b3DYKf/84gFaisD7a7RssnUW90brODLQfDEPavdGd2zv1IqmRrGwdnczciMF0RYKtYWFHy
 ppOdieJMblHJGF/nzPs+weP4yxejq0ggO7xrsgJOrUloRhlStGLp8JVjzRCEgdN/BGQbZF
 4+P4fyMxuroc65QxXzc2qJr4N63l7OU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-9ppnEcV7Plqnl037ZMxwnQ-1; Thu, 10 Nov 2022 23:58:31 -0500
X-MC-Unique: 9ppnEcV7Plqnl037ZMxwnQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E97AD1C05B03;
 Fri, 11 Nov 2022 04:58:30 +0000 (UTC)
Received: from [10.64.54.49] (vpn2-54-49.bne.redhat.com [10.64.54.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AA20492B1D;
 Fri, 11 Nov 2022 04:58:27 +0000 (UTC)
Subject: Re: [PATCH v3] qapi/qom: Memory backend property prealloc-threads doc
 fix
To: Zhenyu Zhang <zhenyzha@redhat.com>, qemu-devel@nongnu.org
Cc: armbru@redhat.com, philmd@linaro.org, shan.gavin@gmail.com,
 eric.auger@redhat.com, imammedo@redhat.com, lijin@redhat.com
References: <20221111030541.191186-1-zhenyzha@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <dc7f305b-5dc0-999f-8b58-a2c2a4b18828@redhat.com>
Date: Fri, 11 Nov 2022 12:58:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20221111030541.191186-1-zhenyzha@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Zhenyu,

On 11/11/22 11:05 AM, Zhenyu Zhang wrote:
> Commit ffac16fab3 "hostmem: introduce "prealloc-threads" property"
> (v5.0.0) changed the default number of threads from number of CPUs
> to 1.  This was deemed a regression, and fixed in commit f8d426a685
> "hostmem: default the amount of prealloc-threads to smp-cpus".
> Except the documentation remained unchanged.  Update it now.
> 
> Signed-off-by: Zhenyu Zhang <zhenyzha@redhat.com>
> ---
> 
> v3: Covers historical descriptions                  (Markus)
> v2: The property is changed to smp-cpus since 5.0   (Phild)
> 
> ---
>   qapi/qom.json | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

With the following comments addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

---

Please consider amending the commit log to something like below.

The default "prealloc-threads" value is set to 1 when the property is
added by commit ffac16fab33b ("hostmem: introduce "prealloc-threads"
property") in v5.0.0. The default value is conflicting with the sugar
property as the value provided by the sugar property is number of CPUs.
The conflict has been fixed by commit f8d426a6852c ("hostmem: default
the amount of prealloc-threads to smp-cpus"). However, 'qapi/qom.json'
was missed to be updated accordingly in the commit.

Update 'qapi/qom.json' to reflect the change in commit f8d426a6852c.

Signed-off-by: Zhenyu Zhang <zhenyzha@redhat.com>

When a specific commit is mentioned in the commit log, we usually have
fixed format like below.

commit ffac16fab33b ("hostmem: introduce "prealloc-threads" property")
commit f8d426a6852c ("hostmem: default the amount of prealloc-threads to smp-cpus")

> diff --git a/qapi/qom.json b/qapi/qom.json
> index 30e76653ad..dfd89bc6d4 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -576,7 +576,7 @@
>   #
>   # @prealloc: if true, preallocate memory (default: false)
>   #
> -# @prealloc-threads: number of CPU threads to use for prealloc (default: 1)
> +# @prealloc-threads: number of CPU threads to use for prealloc (default: number of CPUs) (since 5.0)
>   #
>   # @prealloc-context: thread context to use for creation of preallocation threads
>   #                    (default: none) (since 7.2)
> 

The line seems exceeding 80 characters. It'd better to limit each line in 75 characters.
So you probably need:

     # @prealloc-threads: number of CPU threads to use for prealloc (default: number of CPUs)
     #                    (since 5.0)

Thanks,
Gavin


