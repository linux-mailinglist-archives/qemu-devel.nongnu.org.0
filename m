Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406D8347418
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 10:04:21 +0100 (CET)
Received: from localhost ([::1]:59092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOzR6-0000dy-18
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 05:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOzO3-0008K4-9g
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 05:01:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOzNz-000786-7t
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 05:01:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616576465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HNDY4WXuLZe/sm4MEyx/v56318FDX1SZmUmaWgh/TD0=;
 b=Gz7GXjaI1BOiNJAGSnzxah1prexwwLbIB2XIOzaNNSBHkUdqFgZ4A34Cf1mbd8MCyxVdGv
 9eqD/7oiD68bQax1vw/Yj5OAGbmx6hidAHk/9cXsrVqn5aVt33Cy2+ld1Bl4TY/hrrAtl0
 cjVh//kIwoChAEgyq8MNSS0KSqetdqk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-nZvQPC0NPlCXqz9bf8KLtg-1; Wed, 24 Mar 2021 05:01:03 -0400
X-MC-Unique: nZvQPC0NPlCXqz9bf8KLtg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7416E8189C7;
 Wed, 24 Mar 2021 09:01:02 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-47.ams2.redhat.com [10.36.112.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FF316A8FA;
 Wed, 24 Mar 2021 09:00:56 +0000 (UTC)
Subject: Re: [PATCH] qom: Fix default values in help
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210324084130.3986072-1-armbru@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <816e56bb-54d6-bafc-764d-983a1620941f@redhat.com>
Date: Wed, 24 Mar 2021 10:00:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210324084130.3986072-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
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
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 michael.roth@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/03/2021 09.41, Markus Armbruster wrote:
> Output of default values in device help is broken:
> 
>      $ ./qemu-system-x86_64 -S -display none -monitor stdio
>      QEMU 5.2.50 monitor - type 'help' for more information
>      (qemu) device_add pvpanic,help
>      pvpanic options:
>        events=<uint8>         -  (default: (null))
>        ioport=<uint16>        -  (default: (null))
>        pvpanic[0]=<child<qemu:memory-region>>
> 
> The "(null)" is glibc printing a null pointer.  Other systems crash
> instead.  Having a help request crash a running VM can really spoil
> your day.
> 
> Root cause is a botched replacement of qstring_free() by
> g_string_free(): to get the string back, we need to pass true to the
> former, but false to the latter.  Fix the argument.
> 
> Fixes: eab3a4678b07267c39e7290a6e9e7690b1d2a521
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   qom/object_interfaces.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
> index c3324b0f86..bd8a947a63 100644
> --- a/qom/object_interfaces.c
> +++ b/qom/object_interfaces.c
> @@ -159,7 +159,7 @@ char *object_property_help(const char *name, const char *type,
>       }
>       if (defval) {
>           g_autofree char *def_json = g_string_free(qobject_to_json(defval),
> -                                                  true);
> +                                                  false);
>           g_string_append_printf(str, " (default: %s)", def_json);
>       }
>   
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


