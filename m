Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8C930E3E9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 21:13:41 +0100 (CET)
Received: from localhost ([::1]:59794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7OWy-0003LK-S2
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 15:13:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7OVl-0002q6-D2
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 15:12:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7OVj-0005mM-1C
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 15:12:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612383141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TW01ceTOgXEbC28evSCUOw0jD6aK4nwP/3UvalmaHwE=;
 b=ZKGq4+8b9TTVyn/Cp9VZi0Es0U4LgC6J7S6l41/eT/XT+KMEmJdDyVdbRz/hUAJnFRq5eR
 VSNt3i2KLCPtOg2jGPSq6ZjFWhDzoT+Qvk2hW2YVas0IIFquGvry76peEq8tU8yJTxKkx6
 NT7/6hEnSBIDCj+F1x9T1pkcS4mgOPo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-frgG2HgRNxqTH2kiKcJ-bQ-1; Wed, 03 Feb 2021 15:12:17 -0500
X-MC-Unique: frgG2HgRNxqTH2kiKcJ-bQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0632F15725;
 Wed,  3 Feb 2021 20:12:16 +0000 (UTC)
Received: from work-vm (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10A9850DE3;
 Wed,  3 Feb 2021 20:12:13 +0000 (UTC)
Date: Wed, 3 Feb 2021 20:12:11 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH v4 14/18] migration/rdma: register memory for multifd
 RDMA channels
Message-ID: <20210203201211.GX2950@work-vm>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
 <1612339311-114805-15-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1612339311-114805-15-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yubihong@huawei.com, berrange@redhat.com, zhang.zhanghailiang@huawei.com,
 quintela@redhat.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Chuan Zheng (zhengchuan@huawei.com) wrote:
> Signed-off-by: Zhimin Feng <fengzhimin1@huawei.com>
> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>

This could do with a description in the commit message of the sequence;
I think you're waiting for the semaphore; doing the registratin, then
waiting again to say that everyone has finished???

> ---
>  migration/multifd.c |  3 ++
>  migration/rdma.c    | 92 +++++++++++++++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 93 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 919a414..1186246 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -537,6 +537,9 @@ void multifd_send_terminate_threads(Error *err)
>          qemu_mutex_lock(&p->mutex);
>          p->quit = true;
>          qemu_sem_post(&p->sem);
> +        if (migrate_use_rdma()) {
> +            qemu_sem_post(&p->sem_sync);
> +        }
>          qemu_mutex_unlock(&p->mutex);
>      }
>  }
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 1095a8f..c906cc7 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -3838,6 +3838,19 @@ static int rdma_load_hook(QEMUFile *f, void *opaque, uint64_t flags, void *data)
>          return rdma_block_notification_handle(opaque, data);
>  
>      case RAM_CONTROL_HOOK:
> +        if (migrate_use_multifd()) {
> +            int i;
> +            MultiFDRecvParams *multifd_recv_param = NULL;
> +            int thread_count = migrate_multifd_channels();
> +            /* Inform dest recv_thread to poll */
> +            for (i = 0; i < thread_count; i++) {
> +                if (get_multifd_recv_param(i, &multifd_recv_param)) {
> +                    return -1;
> +                }
> +                qemu_sem_post(&multifd_recv_param->sem_sync);
> +            }
> +        }
> +
>          return qemu_rdma_registration_handle(f, opaque);
>  
>      default:
> @@ -3910,6 +3923,24 @@ static int qemu_rdma_registration_stop(QEMUFile *f, void *opaque,
>          head.type = RDMA_CONTROL_RAM_BLOCKS_REQUEST;
>          trace_qemu_rdma_registration_stop_ram();
>  
> +        if (migrate_use_multifd()) {
> +            /*
> +             * Inform the multifd channels to register memory
> +             */
> +            int i;
> +            int thread_count = migrate_multifd_channels();
> +            MultiFDSendParams *multifd_send_param = NULL;
> +            for (i = 0; i < thread_count; i++) {
> +                ret = get_multifd_send_param(i, &multifd_send_param);
> +                if (ret) {
> +                    error_report("rdma: error getting multifd(%d)", i);
> +                    return ret;
> +                }
> +
> +                qemu_sem_post(&multifd_send_param->sem_sync);
> +            }
> +        }
> +
>          /*
>           * Make sure that we parallelize the pinning on both sides.
>           * For very large guests, doing this serially takes a really
> @@ -3968,6 +3999,21 @@ static int qemu_rdma_registration_stop(QEMUFile *f, void *opaque,
>                      rdma->dest_blocks[i].remote_host_addr;
>              local->block[i].remote_rkey = rdma->dest_blocks[i].remote_rkey;
>          }
> +        /* Wait for all multifd channels to complete registration */
> +        if (migrate_use_multifd()) {
> +            int i;
> +            int thread_count = migrate_multifd_channels();
> +            MultiFDSendParams *multifd_send_param = NULL;
> +            for (i = 0; i < thread_count; i++) {
> +                ret = get_multifd_send_param(i, &multifd_send_param);
> +                if (ret) {
> +                    error_report("rdma: error getting multifd(%d)", i);
> +                    return ret;
> +                }
> +
> +                qemu_sem_wait(&multifd_send_param->sem);
> +            }
> +        }
>      }
>  
>      trace_qemu_rdma_registration_stop(flags);
> @@ -3979,6 +4025,24 @@ static int qemu_rdma_registration_stop(QEMUFile *f, void *opaque,
>          goto err;
>      }
>  
> +    if (migrate_use_multifd()) {
> +        /*
> +         * Inform src send_thread to send FINISHED signal.
> +         * Wait for multifd RDMA send threads to poll the CQE.
> +         */
> +        int i;
> +        int thread_count = migrate_multifd_channels();
> +        MultiFDSendParams *multifd_send_param = NULL;
> +        for (i = 0; i < thread_count; i++) {
> +            ret = get_multifd_send_param(i, &multifd_send_param);
> +            if (ret < 0) {
> +                goto err;
> +            }
> +
> +            qemu_sem_post(&multifd_send_param->sem_sync);
> +        }
> +    }
> +
>      return 0;
>  err:
>      rdma->error_state = ret;
> @@ -4355,19 +4419,37 @@ static void *multifd_rdma_send_thread(void *opaque)
>  {
>      MultiFDSendParams *p = opaque;
>      Error *local_err = NULL;
> +    int ret = 0;
> +    RDMAControlHeader head = { .len = 0, .repeat = 1 };
>  
>      trace_multifd_send_thread_start(p->id);
>      if (multifd_send_initial_packet(p, &local_err) < 0) {
>          goto out;
>      }
>  
> +    /* wait for semaphore notification to register memory */
> +    qemu_sem_wait(&p->sem_sync);
> +    if (qemu_rdma_registration(p->rdma) < 0) {
> +        goto out;
> +    }
> +    /*
> +     * Inform the main RDMA thread to run when multifd
> +     * RDMA thread have completed registration.
> +     */
> +    qemu_sem_post(&p->sem);
>      while (true) {
> +        qemu_sem_wait(&p->sem_sync);
>          WITH_QEMU_LOCK_GUARD(&p->mutex) {
>              if (p->quit) {
>                  break;
>              }
>          }
> -        qemu_sem_wait(&p->sem);

Is this something where you put the line in just a few patches earlier -
if so, put it in the right place in the original patch.

Dave

> +        /* Send FINISHED to the destination */
> +        head.type = RDMA_CONTROL_REGISTER_FINISHED;
> +        ret = qemu_rdma_exchange_send(p->rdma, &head, NULL, NULL, NULL, NULL);
> +        if (ret < 0) {
> +            return NULL;
> +        }
>      }
>  
>  out:
> @@ -4406,14 +4488,20 @@ static void multifd_rdma_send_channel_setup(MultiFDSendParams *p)
>  static void *multifd_rdma_recv_thread(void *opaque)
>  {
>      MultiFDRecvParams *p = opaque;
> +    int ret = 0;
>  
>      while (true) {
> +        qemu_sem_wait(&p->sem_sync);
>          WITH_QEMU_LOCK_GUARD(&p->mutex) {
>              if (p->quit) {
>                  break;
>              }
>          }
> -        qemu_sem_wait(&p->sem_sync);
> +        ret = qemu_rdma_registration_handle(p->file, p->c);
> +        if (ret < 0) {
> +            qemu_file_set_error(p->file, ret);
> +            break;
> +        }
>      }
>  
>      WITH_QEMU_LOCK_GUARD(&p->mutex) {
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


