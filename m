Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF85574DC9
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 14:36:19 +0200 (CEST)
Received: from localhost ([::1]:49086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBy4o-0005WA-2a
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 08:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oBy2p-00045g-Sy
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 08:34:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oBy2j-0005VM-FQ
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 08:34:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657802047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=URXk43EWMkTEaSxDv7Hl4sxoY7k9pPxZv4iWWVAMviA=;
 b=VlE/62SRbO94xVNN0bPj2x7N03iU1DovBLkdLz4tGOmcILYW6kBZv4ZpYBxwyS/SFkAYEX
 yCpPhEkxeu6/Wnx/g8e6ZMUGROgxU0JPO9qh1IdenurDhu6GFsGSUX2vd7GYFFtGtjYPg9
 4VqB1G6wbfdRAYThp1Bb+fqopHNu4JM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-niHG0X-ZMXmA_DZgQ2X-mg-1; Thu, 14 Jul 2022 08:33:59 -0400
X-MC-Unique: niHG0X-ZMXmA_DZgQ2X-mg-1
Received: by mail-wm1-f70.google.com with SMTP id
 130-20020a1c0288000000b003a2fe999093so1705261wmc.6
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 05:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=URXk43EWMkTEaSxDv7Hl4sxoY7k9pPxZv4iWWVAMviA=;
 b=tQAfBNiEcCKuocqUdhi8iF6pU6+sw/wH3V1Q3neDJZ8Tg3CjulbsI5IcELJ/F9wkph
 biyXxZkeNGi0GqL93O0hhY36n8SluE0D/x5+yKFG1AotfvJKy9lXkjRcOP5r8ZNu0dWo
 zGAT6CB7IBVZu2jBH4dJ0VYWql+uQ4c9KrcbK1RuWxg50rchJqSAWB/16kEygD4MrJtU
 8H+PUN+RbO55xc5kFAlp2lfeIdRbG/HAHhSp9gQL8YVGHQJ13uvjogsb5PxCaFLqZDD2
 YMK4oyxLGIXJ/yKpOz6hMJivd06W43HFB9HlPKhWnrf7m07je48X7jnzmFUgHb6vYe7r
 +p8w==
X-Gm-Message-State: AJIora8okuAIcSXD3/LOpFy1J0TkNXZ+HT2NhcL1O8O0Ngf4pi2/yxrP
 4XihgjxW9C666hdtxapen+4+cUjCwxs9Cr9eDGuFt5TSlD/jkNwED6v2zojCP86NNtCEq+bP/Ux
 j4CJC6yMrPa2w8hU=
X-Received: by 2002:adf:e486:0:b0:21d:7f2a:6b67 with SMTP id
 i6-20020adfe486000000b0021d7f2a6b67mr8376547wrm.293.1657802038598; 
 Thu, 14 Jul 2022 05:33:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uYy5viI3yN1d982/vLjW+L4uipAALSTox2JW7vAAuFm7t3lwbVtSoXBXTmBjshTsEFvHzSog==
X-Received: by 2002:adf:e486:0:b0:21d:7f2a:6b67 with SMTP id
 i6-20020adfe486000000b0021d7f2a6b67mr8376519wrm.293.1657802038263; 
 Thu, 14 Jul 2022 05:33:58 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 r8-20020a5d52c8000000b0021d65e9d449sm1421116wrv.73.2022.07.14.05.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 05:33:56 -0700 (PDT)
Date: Thu, 14 Jul 2022 13:33:54 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v7 05/13] multifd: Count the number of bytes sent correctly
Message-ID: <YtANMrePKWQI6rnN@work-vm>
References: <20220531104318.7494-1-quintela@redhat.com>
 <20220531104318.7494-6-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531104318.7494-6-quintela@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> Current code asumes that all pages are whole.  That is not true for
> example for compression already.  Fix it for creating a new field
> ->sent_bytes that includes it.
> 
> All ram_counters are used only from the migration thread, so we have
> two options:
> - put a mutex and fill everything when we sent it (not only
> ram_counters, also qemu_file->xfer_bytes).
> - Create a local variable that implements how much has been sent
> through each channel.  And when we push another packet, we "add" the
> previous stats.
> 
> I choose two due to less changes overall.  On the previous code we
> increase transferred and then we sent.  Current code goes the other
> way around.  It sents the data, and after the fact, it updates the
> counters.  Notice that each channel can have a maximum of half a
> megabyte of data without counting, so it is not very important.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/multifd.h |  2 ++
>  migration/multifd.c | 14 ++++++--------
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 71f49b4063..8a45dda58c 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -102,6 +102,8 @@ typedef struct {
>      uint32_t flags;
>      /* global number of generated multifd packets */
>      uint64_t packet_num;
> +    /* How many bytes have we sent on the last packet */
> +    uint64_t sent_bytes;
>      /* thread has work to do */
>      int pending_job;
>      /* array of pages to sent.
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 166246b9b7..eef47c274f 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -394,7 +394,6 @@ static int multifd_send_pages(QEMUFile *f)
>      static int next_channel;
>      MultiFDSendParams *p = NULL; /* make happy gcc */
>      MultiFDPages_t *pages = multifd_send_state->pages;
> -    uint64_t transferred;
>  
>      if (qatomic_read(&multifd_send_state->exiting)) {
>          return -1;
> @@ -429,10 +428,10 @@ static int multifd_send_pages(QEMUFile *f)
>      p->packet_num = multifd_send_state->packet_num++;
>      multifd_send_state->pages = p->pages;
>      p->pages = pages;
> -    transferred = ((uint64_t) pages->num) * p->page_size + p->packet_len;
> -    qemu_file_update_transfer(f, transferred);
> -    ram_counters.multifd_bytes += transferred;
> -    ram_counters.transferred += transferred;
> +    ram_transferred_add(p->sent_bytes);
> +    ram_counters.multifd_bytes += p->sent_bytes;
> +    qemu_file_update_transfer(f, p->sent_bytes);

Note that got renamed in bc698c367d6fac15454ee3ff6bb168e43c151465
but other than that


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> +    p->sent_bytes = 0;
>      qemu_mutex_unlock(&p->mutex);
>      qemu_sem_post(&p->sem);
>  
> @@ -605,9 +604,6 @@ int multifd_send_sync_main(QEMUFile *f)
>          p->packet_num = multifd_send_state->packet_num++;
>          p->flags |= MULTIFD_FLAG_SYNC;
>          p->pending_job++;
> -        qemu_file_update_transfer(f, p->packet_len);
> -        ram_counters.multifd_bytes += p->packet_len;
> -        ram_counters.transferred += p->packet_len;
>          qemu_mutex_unlock(&p->mutex);
>          qemu_sem_post(&p->sem);
>  
> @@ -712,6 +708,8 @@ static void *multifd_send_thread(void *opaque)
>              }
>  
>              qemu_mutex_lock(&p->mutex);
> +            p->sent_bytes += p->packet_len;;
> +            p->sent_bytes += p->next_packet_size;
>              p->pending_job--;
>              qemu_mutex_unlock(&p->mutex);
>  
> -- 
> 2.35.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


