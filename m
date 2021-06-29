Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74ACF3B7775
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 19:54:29 +0200 (CEST)
Received: from localhost ([::1]:60458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyHwK-0007YK-H0
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 13:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lyHpe-0003Mw-BZ
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 13:47:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lyHpc-0007ZU-Ii
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 13:47:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624988852;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=LqGhpDdzK2Yv+uQHXjzAfoMLFUWKeAsGzRMM//AjHhE=;
 b=iJF3+zawKS5C7GolJw1jnSiXtadbvuj6Vt9uWZvluPp6dczk8WYDicRIrvbyQkj/e1cH/n
 NBiGmXvGNdInA6oKpFMB2hxYtaKV0Hm+Zl2u/9nvj3wx7sJVZt7tctp0OJsxpqxNVEHFay
 Mi/auu8MtRxFZqg/AIOwLzmFRUS+r38=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-kWblKdmwNpOGYzV9GVqExA-1; Tue, 29 Jun 2021 13:47:30 -0400
X-MC-Unique: kWblKdmwNpOGYzV9GVqExA-1
Received: by mail-wm1-f69.google.com with SMTP id
 j38-20020a05600c1c26b02901dbf7d18ff8so1582532wms.8
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 10:47:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=LqGhpDdzK2Yv+uQHXjzAfoMLFUWKeAsGzRMM//AjHhE=;
 b=ELSBocDAhyaiiOxHnnw7WjyVN0Hq6xRxM1HiS4n+pMgUprwVkTXhSqBqb3gYIwJ5sz
 Lsrrcvz8e1CqUBHOrS7wjlGo5l0GGBcTa+8fg1abB/0Yz0jxhJ3bNIgRiDGms2Vy/8/5
 aGK6i3U1K25I5LxY1MJ0WSKaO4U/lbtL8LvhvDNEdGOecMhl11wOhD2NTGhOmUxjQvw4
 7OZOYuGkGjHHZqf5hTrUOkGfQYbp+oaVdB4/6TYXi6EEJgxovb3NMtAiLXP0niOU1R//
 6EP6BuuO6zze3No6EO2EF1LmrX3K0FPT5c7p4Vb7SKaOGQCcvM5bZI1Mp1gSDVD7+450
 lSmg==
X-Gm-Message-State: AOAM531PHAIcyNf2pWzt+DoqqSp83UQeouTX1U7ByPgg+RFiTZ59cJik
 e79a8KfFYnVEIdeYr1Y+ZwLHWLlorpaVnoryuQX/YaNJLD4s+OrZRwQdnOO1Vr1hzUNxlyixGKR
 8hVR6P2VJKpN5L9E=
X-Received: by 2002:adf:d082:: with SMTP id y2mr34875659wrh.285.1624988849476; 
 Tue, 29 Jun 2021 10:47:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJ5iaeqMmU/dfkopcazVjlLGdKTQZ7Tma9gDNC87nTsi90jzCRucF+fkaZMOa5XiJZOLW4dw==
X-Received: by 2002:adf:d082:: with SMTP id y2mr34875644wrh.285.1624988849349; 
 Tue, 29 Jun 2021 10:47:29 -0700 (PDT)
Received: from localhost (62.83.194.64.dyn.user.ono.com. [62.83.194.64])
 by smtp.gmail.com with ESMTPSA id y66sm18235944wmy.39.2021.06.29.10.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 10:47:28 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 1/2] migration: move wait-unplug loop to its own function
In-Reply-To: <20210629155007.629086-2-lvivier@redhat.com> (Laurent Vivier's
 message of "Tue, 29 Jun 2021 17:50:06 +0200")
References: <20210629155007.629086-1-lvivier@redhat.com>
 <20210629155007.629086-2-lvivier@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Tue, 29 Jun 2021 19:47:28 +0200
Message-ID: <87mtr8k1fz.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Reply-To: quintela@redhat.com
Cc: Jens Freimann <jfreimann@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier <lvivier@redhat.com> wrote:
> The loop is used in migration_thread() and bg_migration_thread(),
> so we can move it to its own function and call it from these both places.
>
> Moreover, in migration_thread() we have a wrong state transition from
> SETUP to ACTIVE while state could be WAIT_UNPLUG. This is correctly
> managed in bg_migration_thread() so use this code instead.
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

If you have to repost:


> +/*
> + * if failover devices are present, wait they are completely
> + * unplugged
> + */
> +
> +static void qemu_savevm_wait_unplug(MigrationState *s, int old_state,
> +                                    int new_state)

old_state and new state are always the same. SETUP -> ACTIVE.  I think
we can hardcode them.


> +{
> +    if (qemu_savevm_state_guest_unplug_pending()) {
> +        migrate_set_state(&s->state, old_state, MIGRATION_STATUS_WAIT_UNPLUG);
> +
> +        while (s->state == MIGRATION_STATUS_WAIT_UNPLUG &&
> +               qemu_savevm_state_guest_unplug_pending()) {
> +            qemu_sem_timedwait(&s->wait_unplug_sem, 250);

I still don't understand why are we using a semaphore when we just want
a timer :-(

Yes, this is independent of this patch.


