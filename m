Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C195746E720
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 11:54:42 +0100 (CET)
Received: from localhost ([::1]:49548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvH4T-0000Oo-Bi
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 05:54:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mvH2l-0007xp-Dg
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 05:52:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mvH2h-0007HE-Mj
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 05:52:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639047170;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=CIwCr2MHW/0l8lq9akqHKinsqXyFyCl2MRisRquLY2E=;
 b=BiAxCsZkCbYnkO2VJMkdMBa29WBGC/dD+N4eaLzB0UnNm7Z8/3k+Ez+eeRqW3F45H1wNL9
 La4RX8v27a078BgeyPYo8aRreJgXPmIN3okhIvTFh6CFZmYevlWcsI7jHGTV3baj6D8qXg
 uxsGAYP2wedCdICVDNlrcMtOlTiQMwc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-0a0nkI2bNBe4ASdbMy6AwA-1; Thu, 09 Dec 2021 05:52:49 -0500
X-MC-Unique: 0a0nkI2bNBe4ASdbMy6AwA-1
Received: by mail-wr1-f70.google.com with SMTP id
 u4-20020a5d4684000000b0017c8c1de97dso1265159wrq.16
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 02:52:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=CIwCr2MHW/0l8lq9akqHKinsqXyFyCl2MRisRquLY2E=;
 b=U0IIYZxVA9gDnoAW7fflPEN/xRNaUqoVoScnq4nZ1HGMJxjk8HKU5Sba8MAqtr6nIs
 yBuET8Nso3GGxEAGLFuaqBjIsA7URlvajKOYc3iR623WPZ6/4EXDdBF1SLc64RoJ7FIb
 QccTT98pz3EL1y7IwIM4qbTTph5EIfjXeRbyVC99G8fHL4vjBLWmsdxuO6Vg0AFE8OXg
 dybuJMB1EhjUHgXZ0q5tmR4yRe3rdfBpK3+gcoAfs0ljMQzxLMIdb4Gak1ehkq/iPbha
 4BjhfFJw2ijEOJ0M3FFEWXmO9oCUWREuD6yxkcruSFdjp6zs38Eo9yRp0C4Y5zKt5dfr
 aoaA==
X-Gm-Message-State: AOAM5335uvdVkfg0hBgmH3G5E+slBl07xy72qeNonO8pIa2zDxLa8RB6
 3ZH4sqj+M47aTMlkBl3iajLAxjsQ+8vDQaEJgy0oxyh5UKWClXeKEjvQjhSVKEhqHMeJHZieJyL
 bmf5XpwYry55v+R4=
X-Received: by 2002:a05:600c:21c3:: with SMTP id
 x3mr6021211wmj.13.1639047168565; 
 Thu, 09 Dec 2021 02:52:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/IfyLdeS4gH5lcA2BQD38kJDv3EF2K/uo+x3UQfgBbOSDKLGLAnEyYKk+62d9yBIU/1qTRg==
X-Received: by 2002:a05:600c:21c3:: with SMTP id
 x3mr6021183wmj.13.1639047168320; 
 Thu, 09 Dec 2021 02:52:48 -0800 (PST)
Received: from localhost (static-174-144-85-188.ipcom.comunitel.net.
 [188.85.144.174])
 by smtp.gmail.com with ESMTPSA id az4sm8673026wmb.20.2021.12.09.02.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 02:52:47 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Li Zhang <lizhang@suse.de>
Subject: Re: [PATCH v2 1/1] multifd: Shut down the QIO channels to avoid
 blocking the send threads when they are terminated.
In-Reply-To: <20211203115533.31534-2-lizhang@suse.de> (Li Zhang's message of
 "Fri, 3 Dec 2021 12:55:33 +0100")
References: <20211203115533.31534-1-lizhang@suse.de>
 <20211203115533.31534-2-lizhang@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 09 Dec 2021 11:52:45 +0100
Message-ID: <87czm6dp8i.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, berrange@redhat.com, dgilbert@redhat.com,
 cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Li Zhang <lizhang@suse.de> wrote:
> When doing live migration with multifd channels 8, 16 or larger number,
> the guest hangs in the presence of the network errors such as missing TCP ACKs.
>
> At sender's side:
> The main thread is blocked on qemu_thread_join, migration_fd_cleanup
> is called because one thread fails on qio_channel_write_all when
> the network problem happens and other send threads are blocked on sendmsg.
> They could not be terminated. So the main thread is blocked on qemu_thread_join
> to wait for the threads terminated.
>
> (gdb) bt
> 0  0x00007f30c8dcffc0 in __pthread_clockjoin_ex () at /lib64/libpthread.so.0
> 1  0x000055cbb716084b in qemu_thread_join (thread=0x55cbb881f418) at ../util/qemu-thread-posix.c:627
> 2  0x000055cbb6b54e40 in multifd_save_cleanup () at ../migration/multifd.c:542
> 3  0x000055cbb6b4de06 in migrate_fd_cleanup (s=0x55cbb8024000) at ../migration/migration.c:1808
> 4  0x000055cbb6b4dfb4 in migrate_fd_cleanup_bh (opaque=0x55cbb8024000) at ../migration/migration.c:1850
> 5  0x000055cbb7173ac1 in aio_bh_call (bh=0x55cbb7eb98e0) at ../util/async.c:141
> 6  0x000055cbb7173bcb in aio_bh_poll (ctx=0x55cbb7ebba80) at ../util/async.c:169
> 7  0x000055cbb715ba4b in aio_dispatch (ctx=0x55cbb7ebba80) at ../util/aio-posix.c:381
> 8  0x000055cbb7173ffe in aio_ctx_dispatch (source=0x55cbb7ebba80, callback=0x0, user_data=0x0) at ../util/async.c:311
> 9  0x00007f30c9c8cdf4 in g_main_context_dispatch () at /usr/lib64/libglib-2.0.so.0
> 10 0x000055cbb71851a2 in glib_pollfds_poll () at ../util/main-loop.c:232
> 11 0x000055cbb718521c in os_host_main_loop_wait (timeout=42251070366) at ../util/main-loop.c:255
> 12 0x000055cbb7185321 in main_loop_wait (nonblocking=0) at ../util/main-loop.c:531
> 13 0x000055cbb6e6ba27 in qemu_main_loop () at ../softmmu/runstate.c:726
> 14 0x000055cbb6ad6fd7 in main (argc=68, argv=0x7ffc0c578888, envp=0x7ffc0c578ab0) at ../softmmu/main.c:50
>
> To make sure that the send threads could be terminated, IO channels should be
> shut down to avoid waiting IO.
>
> Signed-off-by: Li Zhang <lizhang@suse.de>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued for 7.0


