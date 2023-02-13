Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A3969404E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:03:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRUjf-0005lr-1H; Mon, 13 Feb 2023 04:02:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRUjI-0005kL-BI
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:02:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRUjE-0004k7-Vj
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:02:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676278945;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=H5GlmhZCN4Qk/Rzhx47oZmVKr/rd8NU799V/0WxZbro=;
 b=ILt/xgj3CvU4JwcPKqmfjhvtjdh10hLScsLK1Xnc0P1OBicK831sXx+u8a5oWn1Hp4Tfya
 glkHY9gjok9a29y8fK7asexHK/TKuHaIFpykUGySUqVcbgKv7Q/5e4FZu+8jCx3ZSHJtc4
 6W9ygX+bCfSMpA7r2UBYM4WVvGVa2xw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-185-1DvSYOjQPQGSyNU1o_riHw-1; Mon, 13 Feb 2023 04:02:24 -0500
X-MC-Unique: 1DvSYOjQPQGSyNU1o_riHw-1
Received: by mail-wm1-f69.google.com with SMTP id
 j37-20020a05600c1c2500b003deaf780ab6so6489999wms.4
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 01:02:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H5GlmhZCN4Qk/Rzhx47oZmVKr/rd8NU799V/0WxZbro=;
 b=JYd2o8ImkG2OavGv4lVVvnkAX2nz/lpzVUkEgQKW+bMeHlbQ1PZUoBRCWHTZOWutYo
 bfiUwnFen0sDn12HClrBGDuDS15T8+59hVjF7Q0DVA4yrpkKK3zAjy1Vkw+6EvV6cuBA
 +76OvF4Uy4hiA2AYDbqjoByzU4JBngRg9fTxe2n52j1yzpEdEHGa0kUO0EH0IzcepXzE
 ogNNv5TQtiffTUtBqhy74DvMAXUw/jVyCvZwfmjAoZ9k7SWbB+Kfvzk4oeNd1Yzx6712
 eyCcmwnwYikp5EPJpuN5OQF/Pkkf11tRiC2fasI7yI4tg5MtWTo9eBmZ1tOLQpJ424H2
 tq2A==
X-Gm-Message-State: AO0yUKWHhhWbv6oaLCa0UQLMC8eIwuIELBS/nQsgk+22lP7kZ/OSYko3
 s7FadS/RhqhyI0f7a5FwxvGsvnfshlgZP4TAB5jVdDmZSBDJOquIvL4gnj63uBOJQC5lBbkvxku
 szmmNcIsImTuE78HbkfxmRJnncY8cXk0yEtJZFJmmtXYdb8p6/aoUmsnTjVpso5gPkWGiBWougH
 M=
X-Received: by 2002:a05:600c:3ba6:b0:3df:f124:f997 with SMTP id
 n38-20020a05600c3ba600b003dff124f997mr5144461wms.19.1676278943105; 
 Mon, 13 Feb 2023 01:02:23 -0800 (PST)
X-Google-Smtp-Source: AK7set84fG7UjWRrSrxqdk6QhH2nMfUmArbLKjbK/O4ZLU3PQpH7U+WvQtwmhrslWvDiz7AayT2diQ==
X-Received: by 2002:a05:600c:3ba6:b0:3df:f124:f997 with SMTP id
 n38-20020a05600c3ba600b003dff124f997mr5144422wms.19.1676278942532; 
 Mon, 13 Feb 2023 01:02:22 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a05600c3b1100b003df5be8987esm17423034wms.20.2023.02.13.01.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 01:02:22 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,  Yanan Wang
 <wangyanan55@huawei.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Eric Blake
 <eblake@redhat.com>,  Markus Armbruster <armbru@redhat.com>,  Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v5 0/8] Eliminate multifd flush
In-Reply-To: <20230213085746.75586-1-quintela@redhat.com> (Juan Quintela's
 message of "Mon, 13 Feb 2023 09:57:38 +0100")
References: <20230213085746.75586-1-quintela@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 13 Feb 2023 10:02:20 +0100
Message-ID: <87mt5iym3n.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

nack.

Mail server is giving me a bad time, sorry.

>
> In this v5:
> - Remove RAM Flags documentation (already on PULL request)
> - rebase on top of PULL request.
>
> Please review.
>
> Based-on: <20230213025150.71537-1-quintela@redhat.com>
>           Migration 20230213 patches
>
> In this v4:
> - Rebased on top of migration-20230209 PULL request
> - Integrate two patches in that pull request
> - Rebase
> - Address Eric reviews.
>
> Please review.
>
> In this v3:
> - update to latest upstream.
> - fix checkpatch errors.
>
> Please, review.
>
> In this v2:
> - update to latest upstream
> - change 0, 1, 2 values to defines
> - Add documentation for SAVE_VM_FLAGS
> - Add missing qemu_fflush(), it made random hangs for migration test
>   (only for tls, no clue why).
>
> Please, review.
>
> [v1]
> Upstream multifd code synchronize all threads after each RAM section.  This is suboptimal.
> Change it to only flush after we go trough all ram.
>
> Preserve all semantics for old machine types.
>
> Juan Quintela (4):
>   ram: Document migration ram flags
>   multifd: Create property multifd-sync-after-each-section
>   multifd: Protect multifd_send_sync_main() calls
>   multifd: Only sync once each full round of memory
>
> Leonardo Bras (4):
>   migration/multifd: Change multifd_load_cleanup() signature and usage
>   migration/multifd: Remove unnecessary assignment on
>     multifd_load_cleanup()
>   migration/multifd: Join all multifd threads in order to avoid leaks
>   migration/multifd: Move load_cleanup inside incoming_state_destroy
>
>  qapi/migration.json   | 10 +++++++-
>  migration/migration.h |  1 +
>  migration/multifd.h   |  3 ++-
>  hw/core/machine.c     |  1 +
>  migration/migration.c | 29 ++++++++++++---------
>  migration/multifd.c   | 17 +++++++-----
>  migration/ram.c       | 60 ++++++++++++++++++++++++++++++++++---------
>  7 files changed, 89 insertions(+), 32 deletions(-)


