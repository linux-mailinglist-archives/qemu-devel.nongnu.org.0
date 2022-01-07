Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DA94875E3
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 11:49:10 +0100 (CET)
Received: from localhost ([::1]:58652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5mo1-0003il-3J
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 05:49:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5mmP-0002HB-O9; Fri, 07 Jan 2022 05:47:29 -0500
Received: from [2a00:1450:4864:20::42f] (port=33446
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5mmN-0006wA-U8; Fri, 07 Jan 2022 05:47:29 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r9so8503168wrg.0;
 Fri, 07 Jan 2022 02:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+rpevh8hCCH7axW/ayttXoGcQqm7Sf0yTrPLakfEztY=;
 b=hy1Q6YLxuw/ZbggGM3D4z/1zmw+LEVOP7lCPxr0Ud9kuGi94DcaTdj1KFO/yuIA7ZR
 TT1gQK14Elr+4RPQXas45mNElSa/KQ3Po45GluV2MDwNg4blRj6O4Tv/4+eJ1kxzbY98
 rfxKpNlOIf8o/+4GEH9EdCsy/AhjRJRWGNe6CAi6pu/d7NIGCZIJAtmlwbXpA61owDVh
 wbxKB4eOBibtRCNu8OeEMiqMKx3OxMOI0NzpIqGSw9dkhJxfpm0JuxC3seOyhh3FR19U
 5IiK5q7jG57qhulq7rCVP522jZUhWe6UhfJ/XNJZB/x1CmyqWQqWQq8/gSlZlPguNJoU
 wOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+rpevh8hCCH7axW/ayttXoGcQqm7Sf0yTrPLakfEztY=;
 b=fQ03JiqAlqYlFrESh2JFzZn4KkP1C4136WkxzVVCwFSt/Sut6bwwqqrDm8WF9HSIS/
 JA3OYrO4BzipeUxah1iX9pZtoxeiy7iQCBufTLFII7lWUIGp0mv8GMzaPwyQtm3H09k3
 4aEoi2McE93RwbGFJyjzhGFSy1rKwuGhgDWWqiCSsayY1r5DJ2vlMf4vlFuH+nacL+jm
 E9RO4kAWffgk/VC2CQUOOujaOuHm0Eqa2I6QVZgofYScaDbUHefw+9S2QAv+4SSrDqmk
 GcGncwgEHnzTMokK/df4zOwP0LvWFRTf5Q5HsjDFbwVVSV2/fOc8IJXce9FNguAWsKfM
 KtVg==
X-Gm-Message-State: AOAM531CvhsW3oTdQy6yeYISE2axsgN5wudvQQIwZ1D+Pq68QPGl7Ps+
 jC+dD674Ztc3RF5J6AWkBTU=
X-Google-Smtp-Source: ABdhPJzfrF0Zir8Q0S6bUuNHL2gZnL6uWWckgSR73HpyHPcFCRFnTmiV7UOj8jk3/T8cqXwgYjeHgQ==
X-Received: by 2002:a05:6000:1c15:: with SMTP id
 ba21mr4853292wrb.302.1641552444516; 
 Fri, 07 Jan 2022 02:47:24 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id r9sm9277220wmq.18.2022.01.07.02.47.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 02:47:24 -0800 (PST)
Message-ID: <ac04ee31-0a12-2529-6b0b-6ec961da9e66@amsat.org>
Date: Fri, 7 Jan 2022 11:47:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/2] qemu-storage-daemon: Add vhost-user-blk help
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
References: <20211223101426.3143647-1-philmd@redhat.com>
 <20211223101426.3143647-2-philmd@redhat.com>
 <20220106221515.5rbkgsxbt6glw7np@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220106221515.5rbkgsxbt6glw7np@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qing Wang <qinwang@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/6/22 23:15, Eric Blake wrote:
> On Thu, Dec 23, 2021 at 11:14:25AM +0100, Philippe Mathieu-Daudé wrote:
>> Add missing vhost-user-blk help:
>>
>>   $ qemu-storage-daemon -h
>>   ...
>>     --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,
>>              addr.type=unix,addr.path=<socket-path>[,writable=on|off]
>>              [,logical-block-size=<block-size>][,num-queues=<num-queues>]
>>                            export the specified block node as a
>>                            vhosts-user-blk device over UNIX domain socket
> 
> Why 'vhosts-' here instead of 'vhost'?

Oops, I copy/pasted from qemu-storage-daemon.rst.

>>     --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,
>>              fd,addr.str=<fd>[,writable=on|off]
>>              [,logical-block-size=<block-size>][,num-queues=<num-queues>]
>>                            export the specified block node as a
>>                            vhosts-user-blk device over file descriptor
> 
> here too.
> 
>>   ...
>>
>> Fixes: 90fc91d50b7 ("convert vhost-user-blk server to block export API")
>> Reported-by: Qing Wang <qinwang@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  storage-daemon/qemu-storage-daemon.c | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
>> index 52cf17e8ace..0c19e128e3f 100644
>> --- a/storage-daemon/qemu-storage-daemon.c
>> +++ b/storage-daemon/qemu-storage-daemon.c
>> @@ -104,6 +104,19 @@ static void help(void)
>>  "                         export the specified block node over FUSE\n"
>>  "\n"
>>  #endif /* CONFIG_FUSE */
>> +#ifdef CONFIG_VHOST_USER_BLK_SERVER
>> +"  --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,\n"
>> +"           addr.type=unix,addr.path=<socket-path>[,writable=on|off]\n"
>> +"           [,logical-block-size=<block-size>][,num-queues=<num-queues>]\n"
>> +"                         export the specified block node as a\n"
>> +"                         vhosts-user-blk device over UNIX domain socket\n"
> 
> This...
> 
>> +"  --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,\n"
>> +"           fd,addr.str=<fd>[,writable=on|off]\n"
>> +"           [,logical-block-size=<block-size>][,num-queues=<num-queues>]\n"
>> +"                         export the specified block node as a\n"
>> +"                         vhosts-user-blk device over file descriptor\n"
> 
> ...and this line would need the same tweak.
> 
> If you agree that it's a typo, then let's fix it, and you can have
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>

Yes (I will also update qemu-storage-daemon.rst). Thank you!

Phil.

