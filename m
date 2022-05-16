Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF585284D6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:58:57 +0200 (CEST)
Received: from localhost ([::1]:36310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqaJM-0002Om-Kb
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nqYh3-00060e-Sp
 for qemu-devel@nongnu.org; Mon, 16 May 2022 07:15:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nqYgz-0003QZ-N2
 for qemu-devel@nongnu.org; Mon, 16 May 2022 07:15:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652699713;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=9P5BVKAH/IuBhFq/36IrCod8XHDU3JRC2TqdhV/wgYY=;
 b=A8t4y21syFX/uMwjBHrs8r5R41HnX0+h8ef+mPz+IN+eT5+CG1YyFY7xo7fKEYvJkB5UL9
 pOP9+bxk55DLh9sVFgCBKJoduE7MenmAPNRwsmfHLx9EYLmJni+bddlxfpvODCHTl0to8n
 wDy5kPEPhTwH49wM4KKQ1wRzz1pIFaQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-b0WNETr8MeunEP26XiVfVw-1; Mon, 16 May 2022 07:15:11 -0400
X-MC-Unique: b0WNETr8MeunEP26XiVfVw-1
Received: by mail-wm1-f69.google.com with SMTP id
 s14-20020a05600c29ce00b00394611a8059so10193421wmd.4
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 04:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=9P5BVKAH/IuBhFq/36IrCod8XHDU3JRC2TqdhV/wgYY=;
 b=HfA3LSPyBMsh/HmMtZE4M1UwkZFmGE8PNm/6Rx5hb9i2nb7doBGjqAOAtkVpsBp2Bu
 kjTjyPi0yhBbcKyD7lUMsO6MyZo5jsvX1dggK2pA9CXySMfFjFZjzKDmFnXe27HWJxYb
 MNQe0JialIvUGmq9GGL7FFbbm9Dnx/sZAlNJ7I+HJqtKSku5571I4wvsGfLFJjrfMJZh
 2F4GowlDLA7+Kvrj5D+wqYtrv8u9nBH7G81+7gVbDtUDQ5fLmabcq1lVyoX7APRwqfM6
 sd0l871kW5u5zHXs6rirHZC8G7CtEHRRUgzJo/HBbZ4y7/wqsIPO5ETUmpkeHYVJDNd7
 8xNw==
X-Gm-Message-State: AOAM532g/w/cIp84MEkbLe97L5sQcV41a10zzWoUti3aiqDhjjmQAcrT
 ku2SwTnC3LnFR7ToHzsTCkLVZLKQ/D/8jZ32dDhLvGmC3vzM8uISTHiAXxFrmkUam9T19EwhwAq
 bHHs0RKlINJbDjdE=
X-Received: by 2002:a05:600c:4f52:b0:394:63eb:ad27 with SMTP id
 m18-20020a05600c4f5200b0039463ebad27mr16552817wmq.35.1652699710118; 
 Mon, 16 May 2022 04:15:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkqo1ZHUluuzMR/agYTNQDBj5oZvKIa4NUJA7QycN6ekuaM5QR1Xm8opDTbN5DCMoOp7SSIQ==
X-Received: by 2002:a05:600c:4f52:b0:394:63eb:ad27 with SMTP id
 m18-20020a05600c4f5200b0039463ebad27mr16552804wmq.35.1652699709946; 
 Mon, 16 May 2022 04:15:09 -0700 (PDT)
Received: from localhost (static-211-115-85-188.ipcom.comunitel.net.
 [188.85.115.211]) by smtp.gmail.com with ESMTPSA id
 k8-20020adfb348000000b0020d07d90b71sm3267876wrd.66.2022.05.16.04.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 04:15:09 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>,  "Michael S . Tsirkin" <mst@redhat.com>,
 "Cornelia Huck" <cohuck@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  "Alex Williamson" <alex.williamson@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,  Yishai Hadas
 <yishaih@nvidia.com>,  Jason Gunthorpe <jgg@nvidia.com>,  "Mark Bloch"
 <mbloch@nvidia.com>,  Maor Gottlieb <maorg@nvidia.com>,  Kirti Wankhede
 <kwankhede@nvidia.com>,  Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH 3/9] vfio/migration: Fix NULL pointer dereference bug
In-Reply-To: <20220512154320.19697-4-avihaih@nvidia.com> (Avihai Horon's
 message of "Thu, 12 May 2022 18:43:14 +0300")
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-4-avihaih@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 16 May 2022 13:15:08 +0200
Message-ID: <87lev1sp8j.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avihai Horon <avihaih@nvidia.com> wrote:
> As part of its error flow, vfio_vmstate_change() accesses
> MigrationState->to_dst_file without any checks. This can cause a NULL
> pointer dereference if the error flow is taken and
> MigrationState->to_dst_file is not set.
>
> For example, this can happen if VM is started or stopped not during
> migration and vfio_vmstate_change() error flow is taken, as
> MigrationState->to_dst_file is not set at that time.
>
> Fix it by checking that MigrationState->to_dst_file is set before using
> it.
>
> Fixes: 02a7e71b1e5b ("vfio: Add VM state change handler to know state of VM")
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> ---
>  hw/vfio/migration.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 835608cd23..21e8f9d4d4 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -744,7 +744,9 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
>           */
>          error_report("%s: Failed to set device state 0x%x", vbasedev->name,
>                       (migration->device_state & mask) | value);
> -        qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
> +        if (migrate_get_current()->to_dst_file) {
> +            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
> +        }
>      }

Reviewed-by: Juan Quintela <quintela@redhat.com>

I mean that the change is right.

But I am not so sure about using qemu_file_* operations outside of the
migration_thread.  I *think* that everything else that uses qemu_file_*
functions is operating inside the migration_thread, and this one don't
look like it.  Furthermore, a fast look at qemu source, I can't see
anyplace where we setup an error in a vmstate_change.

Later, Juan.

>      vbasedev->migration->vm_running = running;
>      trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),


