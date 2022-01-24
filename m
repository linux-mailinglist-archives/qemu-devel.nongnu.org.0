Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A1C497D60
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 11:48:15 +0100 (CET)
Received: from localhost ([::1]:39964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBwtS-000679-D4
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 05:48:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nBwpp-0004qB-Bg
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 05:44:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nBwpn-0002Tp-BO
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 05:44:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643021066;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Y2deAZlK28VL311lL1EODbmbCKyN5uHsnw68K38SHMk=;
 b=RErvEJU8iI5QplFUyP3OfFojk/lm1e2HCxuMC50hB1OoFaP3aH/+Ge7fWOm3fQ1TB5tqv5
 y7zIbFwVKSormLuK5UPOXKkD4Lc3xsQr/mD4pxIZ1X2A1UWWjnyMMaTjn3Bj7+7Yce1vvh
 v7/DHzJCQT3HX70jLKoNpHF0puGUwdE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-8YfMc3a1MfmIErSTqPc6TA-1; Mon, 24 Jan 2022 05:44:23 -0500
X-MC-Unique: 8YfMc3a1MfmIErSTqPc6TA-1
Received: by mail-wr1-f69.google.com with SMTP id
 s25-20020adfa299000000b001d8d032255fso1687098wra.14
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 02:44:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=Y2deAZlK28VL311lL1EODbmbCKyN5uHsnw68K38SHMk=;
 b=md+j1KYoXr1C1dTOvvPYAdDPqRDIUhMZC7LbBtw0AqWvSu9LnKsQqe5Nafcg+QIilO
 NPcatt+k94pMOr/HVyC1liVQbiCl/pJnpRrVDblkNKn6Y2HRA9hmiLyTGH3KWRLuG4yC
 +23aetaD8SicYOg8FL3NPWWEkpOihJT+ZE0gYD3LHGxdUU2JZVsuHEiwIrtQfsxxH4TM
 r7R0bMlM8v1qrY6kKNbkMlqI8zvXbVMnuEn7ZJmlXmqBaKKREfSyEfJ2Qihx3/cAVZvv
 T5MrwwrfeI5CgyYLjZQD8Tcx8+oTVv5D1/TgxeRALYIj4x7aCqvgXgItbtsjWeEzYbSX
 R4VQ==
X-Gm-Message-State: AOAM53363ktFduyBITEr1u5NRKKZBSELbammv7SiMzx8cz2u6MfrinQR
 ZcxyIFLAI6/qIDgNhH5GBmPfG0xEUFGYBDkZw1DanGQrrnyQuL71pz6TZnpN/MkLljuCDH270AD
 U+ZSH3kV2s7932J4=
X-Received: by 2002:a05:600c:1e83:: with SMTP id
 be3mr1241458wmb.83.1643021060744; 
 Mon, 24 Jan 2022 02:44:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKWZFM4Pkdjg8GDBA9WSbCkV8km0xtL0kWoTgbgMIjFLuTfl0YFLQ8XsBGKrbKqL1y0kEWtA==
X-Received: by 2002:a05:600c:1e83:: with SMTP id
 be3mr1241440wmb.83.1643021060504; 
 Mon, 24 Jan 2022 02:44:20 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id 14sm8290342wrz.100.2022.01.24.02.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 02:44:19 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v6 20/33] block: rename bdrv_invalidate_cache_all,
 blk_invalidate_cache and test_sync_op_invalidate_cache
In-Reply-To: <20220121170544.2049944-21-eesposit@redhat.com> (Emanuele
 Giuseppe Esposito's message of "Fri, 21 Jan 2022 12:05:31 -0500")
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-21-eesposit@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 24 Jan 2022 11:44:19 +0100
Message-ID: <87r18x5s70.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Emanuele Giuseppe Esposito <eesposit@redhat.com> wrote:
> Following the bdrv_activate renaming, change also the name
> of the respective callers.
>
> bdrv_invalidate_cache_all -> bdrv_activate_all
> blk_invalidate_cache -> blk_activate
> test_sync_op_invalidate_cache -> test_sync_op_activate
>
> No functional change intended.

Reviewed-by: Juan Quintela <quintela@redhat.com>

In the sense that makes sense for this series.

But if you have to respin.

> diff --git a/migration/migration.c b/migration/migration.c
> index 0652165610..1f06fd2d18 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -499,7 +499,7 @@ static void process_incoming_migration_bh(void *opaque)
>              global_state_get_runstate() == RUN_STATE_RUNNING))) {
>          /* Make sure all file formats flush their mutable metadata.
>           * If we get an error here, just don't restart the VM yet. */
> -        bdrv_invalidate_cache_all(&local_err);
> +        bdrv_activate_all(&local_err);

I guess that we can change the comment here, it just looks weird the
comment saying flush() and the function nawed _activate()

> @@ -586,7 +586,7 @@ static void process_incoming_migration_co(void *opaque)
>      /* we get COLO info, and know if we are in COLO mode */
>      if (!ret && migration_incoming_colo_enabled()) {
>          /* Make sure all file formats flush their mutable metadata */
> -        bdrv_invalidate_cache_all(&local_err);
> +        bdrv_activate_all(&local_err);
>          if (local_err) {
>              error_report_err(local_err);
>              goto fail;


same here.

> diff --git a/migration/savevm.c b/migration/savevm.c
> index adb5fae9f1..3f4f924093 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1437,7 +1437,7 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>  
>      if (inactivate_disks) {
>          /* Inactivate before sending QEMU_VM_EOF so that the
> -         * bdrv_invalidate_cache_all() on the other end won't fail. */
> +         * bdrv_activate_all() on the other end won't fail. */
>          ret = bdrv_inactivate_all();
>          if (ret) {
>              error_report("%s: bdrv_inactivate_all() failed (%d)",

Here the comment makes sense.

> @@ -2007,7 +2007,7 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
>  
>      /* Make sure all file formats flush their mutable metadata.
>       * If we get an error here, just don't restart the VM yet. */
> -    bdrv_invalidate_cache_all(&local_err);
> +    bdrv_activate_all(&local_err);
>      if (local_err) {
>          error_report_err(local_err);
>          local_err = NULL;

Comment here is bad.

> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 14e3beeaaf..f97bf7ca77 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -144,7 +144,7 @@ void qmp_cont(Error **errp)
>       * If there are no inactive block nodes (e.g. because the VM was just
>       * paused rather than completing a migration), bdrv_inactivate_all() simply
>       * doesn't do anything. */
> -    bdrv_invalidate_cache_all(&local_err);
> +    bdrv_activate_all(&local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
>          return;

I don't understand the comment here.  And yes, I know, this was here before your change.


Thanks, Juan.


