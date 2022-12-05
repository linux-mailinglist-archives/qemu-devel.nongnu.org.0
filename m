Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 563B3642685
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 11:15:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p28Db-0004Y9-63; Mon, 05 Dec 2022 04:56:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p28DX-0004Tb-8o
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:56:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p28DV-0007nj-7B
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:56:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670234212;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zIIhGLkTAu6ClR7YeoqlcUrXmblUdO5TWS3HNnwwmnY=;
 b=LX9ttwFi62A1z0tQ0PuwdOH48JMgJlhEIxFPp5OUbCcIbRIjpZpoAP0C/7GFMGDchw66zO
 YGCCjgK/ua+K5pXvAVCOCqkhME6btSKYniEpxWQ8WbzXRuMSZUKYWI7RAWmF7VoBEXd2WC
 STJVzj2J5a6bo3X7iwRDHojz3ukF7E4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-86-6wFdJFgLOBiLLOJ2RuibxA-1; Mon, 05 Dec 2022 04:56:50 -0500
X-MC-Unique: 6wFdJFgLOBiLLOJ2RuibxA-1
Received: by mail-wm1-f69.google.com with SMTP id
 v188-20020a1cacc5000000b003cf76c4ae66so8196846wme.7
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 01:56:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zIIhGLkTAu6ClR7YeoqlcUrXmblUdO5TWS3HNnwwmnY=;
 b=Q6z8uYFUk122eEJJm6J6rc3H5VbFHYQPB+eJCIvTxGzeYHZzDBusJpwWkEm8Byq4Dn
 5Jtnpu5Zo7s3SCS0fUsdJzg2KGwBYoyhMN1mxfSl5y2w9gzGaJhQalokZ1AW3+1Q6fkx
 t5NKE+WZGF2cAJlKSV9Ft2OQ9qII/Z+VorsVKqPpmxDeMqn3MBcIzPJjAlg6H8jhOIuD
 CXko/w+EB2YcKNaN7mnL5RwZoiTO7G2EmHL/7ITHZkBpHrSVRQ7Nk4h0/UGOJTPo2qUe
 piRWwgrkhkNM6q2Rzb1sVQcTckj6aOJ2XK7tQa/saepRh3YwwR7KLd+GwtShRXFroswu
 yY7A==
X-Gm-Message-State: ANoB5pmPmhZng2+zgc1Jl6iY00Jhtvy3jfxJt2wb1k107wm6m/i6Dg1P
 cobbPET44Ob2qyC+eanMIWl7Gss3sEf2xsFanF9X79POuFX15d8sae3qYrIvu3xaT4tFP7KlApV
 Lq7EiidQ0F9Dmui7b94oaRM4sEL8uxQJtIN7FR3xrmaytkDDUJj89wdG4Z+whERUSpsA=
X-Received: by 2002:a05:600c:414d:b0:3d0:878e:6fed with SMTP id
 h13-20020a05600c414d00b003d0878e6fedmr9425549wmm.150.1670234209337; 
 Mon, 05 Dec 2022 01:56:49 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7+3pNv/VpuE0YopoQFy8yYK2Mb03ckWR7iQ21tCcJylhaWwg4euGskUQt1xFJQBICo+wpg5Q==
X-Received: by 2002:a05:600c:414d:b0:3d0:878e:6fed with SMTP id
 h13-20020a05600c414d00b003d0878e6fedmr9425479wmm.150.1670234209006; 
 Mon, 05 Dec 2022 01:56:49 -0800 (PST)
Received: from redhat.com ([137.101.155.210]) by smtp.gmail.com with ESMTPSA id
 bg28-20020a05600c3c9c00b003cfa3a12660sm26793090wmb.1.2022.12.05.01.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 01:56:48 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>,  Thomas Huth <huth@tuxfamily.org>,  Viresh
 Kumar <viresh.kumar@linaro.org>,  Kevin Wolf <kwolf@redhat.com>,  Mathieu
 Poirier <mathieu.poirier@linaro.org>,  Laurent Vivier <laurent@vivier.eu>,
 Eric Blake <eblake@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Raphael Norwitz
 <raphael.norwitz@nutanix.com>,  Stefan Hajnoczi <stefanha@redhat.com>,
 virtio-fs@redhat.com,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Christian
 Borntraeger <borntraeger@linux.ibm.com>,  "Gonglei (Arei)"
 <arei.gonglei@huawei.com>,  qemu-block@nongnu.org,  Xiaojuan Yang
 <yangxiaojuan@loongson.cn>,  Thomas Huth <thuth@redhat.com>,  Ilya
 Leoshkevich <iii@linux.ibm.com>,  Eduardo Habkost <eduardo@habkost.net>,
 Gerd Hoffmann <kraxel@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Alex Williamson <alex.williamson@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,  Halil Pasic <pasic@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  Jason Wang <jasowang@redhat.com>,  Laurent
 Vivier <lvivier@redhat.com>,  Song Gao <gaosong@loongson.cn>,
 qemu-s390x@nongnu.org,  Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Klaus Jensen <its@irrelevant.dk>,  John Snow <jsnow@redhat.com>,  Michael
 Tokarev <mjt@tls.msk.ru>,  qemu-arm@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,  Keith
 Busch <kbusch@kernel.org>,  David Hildenbrand <david@redhat.com>,
 qemu-trivial@nongnu.org,  Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 00/51] migration patches for VFIO
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com> (Juan Quintela's
 message of "Mon, 5 Dec 2022 10:51:37 +0100")
References: <20221205095228.1314-1-quintela@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 05 Dec 2022 10:56:47 +0100
Message-ID: <87v8mqb2cg.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Juan Quintela <quintela@redhat.com> wrote:
> Hi

Nack myself

This patch series should be sent against my next-8.0 branch, not master.

Sorry for the noise.

Will resend.

>
> On this v2:
>
> - Remove the stop of the guest to calculate the size
> - Rebase on latest upstream.
>
> Please review.
>
> [v1/RFC]
> VFIO migration has several requirements:
> - the size of the state is only known when the guest is stopped
> - they need to send possible lots of data.
>
> this series only address the 1st set of problems.
>
> What they do:
> - res_compatible parameter was not used anywhere, just add that informati=
on to res_postcopy.
> - Remove QEMUFILE parameter from save_live_pending
> - Split save_live_pending into
>   * save_pending_estimate(): the pending state size without trying too ha=
rd
>   * save_pending_exact(): the real pending state size, it is called with =
the guest stopped.
> - Now save_pending_* don't need the threshold parameter
> - HACK a way to stop the guest before moving there.
>
> ToDo:
> - autoconverge test is broken, no real clue why, but it is possible that =
the test is wrong.
>
> - Make an artifact to be able to send massive amount of data in the save =
state stage (probably more multifd channels).
>
> - Be able to not having to start the guest between cheking the state pend=
ing size and migration_completion().
>
> Please review.
>
> Thanks, Juan.
>
> Alex Benn=C3=A9e (4):
>   tests/qtests: override "force-legacy" for gpio virtio-mmio tests
>   hw/virtio: add started_vu status field to vhost-user-gpio
>   hw/virtio: generalise CHR_EVENT_CLOSED handling
>   include/hw: VM state takes precedence in virtio_device_should_start
>
> Evgeny Ermakov (2):
>   target/arm: Set TCGCPUOps.restore_state_to_opc for v7m
>   hw/display/next-fb: Fix comment typo
>
> Gerd Hoffmann (2):
>   update seabios source from 1.16.0 to 1.16.1
>   update seabios binaries to 1.16.1
>
> Juan Quintela (9):
>   multifd: Create page_size fields into both MultiFD{Recv,Send}Params
>   multifd: Create page_count fields into both MultiFD{Recv,Send}Params
>   migration: Export ram_transferred_ram()
>   migration: Export ram_release_page()
>   migration: Remove res_compatible parameter
>   migration: No save_live_pending() method uses the QEMUFile parameter
>   migration: Split save_live_pending() into state_pending_*
>   migration: Remove unused threshold_size parameter
>   migration: simplify migration_iteration_run()
>
> Klaus Jensen (5):
>   hw/nvme: fix aio cancel in format
>   hw/nvme: fix aio cancel in flush
>   hw/nvme: fix aio cancel in zone reset
>   hw/nvme: fix aio cancel in dsm
>   hw/nvme: remove copy bh scheduling
>
> Paolo Bonzini (1):
>   target/i386: allow MMX instructions with CR4.OSFXSR=3D0
>
> Peter Xu (15):
>   migration: Take bitmap mutex when completing ram migration
>   migration: Add postcopy_preempt_active()
>   migration: Cleanup xbzrle zero page cache update logic
>   migration: Trivial cleanup save_page_header() on same block check
>   migration: Remove RAMState.f references in compression code
>   migration: Yield bitmap_mutex properly when sending/sleeping
>   migration: Use atomic ops properly for page accountings
>   migration: Teach PSS about host page
>   migration: Introduce pss_channel
>   migration: Add pss_init()
>   migration: Make PageSearchStatus part of RAMState
>   migration: Move last_sent_block into PageSearchStatus
>   migration: Send requested page directly in rp-return thread
>   migration: Remove old preempt code around state maintainance
>   migration: Drop rs->f
>
> Philippe Mathieu-Daud=C3=A9 (5):
>   hw/display/qxl: Have qxl_log_command Return early if no log_cmd
>     handler
>   hw/display/qxl: Document qxl_phys2virt()
>   hw/display/qxl: Pass requested buffer size to qxl_phys2virt()
>   hw/display/qxl: Avoid buffer overrun in qxl_phys2virt (CVE-2022-4144)
>   hw/display/qxl: Assert memory slot fits in preallocated MemoryRegion
>
> Richard Henderson (2):
>   replay: Fix declaration of replay_read_next_clock
>   target/i386: Always completely initialize TranslateFault
>
> Stefan Hajnoczi (2):
>   block-backend: avoid bdrv_unregister_buf() NULL pointer deref
>   Update VERSION for v7.2.0-rc3
>
> Stefano Garzarella (1):
>   vhost: enable vrings in vhost_dev_start() for vhost-user devices
>
> Thomas Huth (2):
>   tests/qtest/migration-test: Fix unlink error and memory leaks
>   target/s390x/tcg: Fix and improve the SACF instruction
>
> Xiaojuan Yang (1):
>   hw/loongarch/virt: Add cfi01 pflash device


