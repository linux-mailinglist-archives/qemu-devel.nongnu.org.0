Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A50E581C7F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 01:42:45 +0200 (CEST)
Received: from localhost ([::1]:41928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGUCK-0002gc-K7
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 19:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1oGU8l-0000Te-FX
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 19:39:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1oGU8W-0001VX-Dc
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 19:38:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658878722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qpyKdU0qBrvZylgNaWCEBqhwXt35sxkEy+VZYADXx58=;
 b=UQ6GGh4o0PmtWFUmCJipKJTdM/W6RG4tl7giy0wWyKkOYMqL9VpfD2ZXg5kZ+IZhv1ektZ
 76kQK9Y+NyH1uECL9RgTgEyJHTyqZ1VAIHI8o5sR0BcHWfbEK+SyMTZYfsi9UleAGf8QWH
 QyI8kO5kYIXMl0WuCH/yKQAUkSkPvak=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-IuEDS-ZJPOGb2UaQLx5sBQ-1; Tue, 26 Jul 2022 19:38:41 -0400
X-MC-Unique: IuEDS-ZJPOGb2UaQLx5sBQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 y10-20020a056402270a00b0043c0fed89b9so3939338edd.15
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 16:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qpyKdU0qBrvZylgNaWCEBqhwXt35sxkEy+VZYADXx58=;
 b=banjCxlFyy41XPlLWLz5XV7vv9jJLSKMopcD8iN8Icwx9RRvyh5pn131AJ+MH86NFL
 ibvjoG8sPFct5FEW3SxZbT6ce2dDZGRwIyrCCfaNC+7krHxCWZNHr9mHiO5FaonQaID4
 /oYd1J2zzfW9KUuFmEmSpZTJgIaSfAlkzCO/Bns2gsjl+5bqFCpDpzD0MJVKctLR8FfQ
 /G/QH0ajKMx6dBd/QT8zfIFDw6Jshz6IOyKQWLje8Z+3mMyOLllwrlRzHfm8ux8y9JKR
 i8lY7YRN5plV0MP0fM7uZgRJQHALyzNzgkqjtn/cB8vw3IyvLzEvk9RQ4NalhaN17So3
 FHjg==
X-Gm-Message-State: AJIora9RGfrR+1LAAEtgnebEyO8QBzVEz2aDbpZOVW0PQmIXEeIax3IQ
 gCdVtp3705mPYuOIB5kH7jinq0LsFz1gfJQxUg1bVAapLp2j8ue72QUEXABvTeYt81dP+HYlHT5
 DTKwKrQf8zGDikM/BRi2cs4yqJsHa87s=
X-Received: by 2002:a17:907:2d0e:b0:72b:4af7:7ccd with SMTP id
 gs14-20020a1709072d0e00b0072b4af77ccdmr15538585ejc.209.1658878720295; 
 Tue, 26 Jul 2022 16:38:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t3TW5iKaTxv8jVx76xa9LXNeWt4/hG34IWffYeV2tmmnMz+QaZtUSQoAyyXIgAvdzkWAvAedINGxbaHDcxXc8=
X-Received: by 2002:a17:907:2d0e:b0:72b:4af7:7ccd with SMTP id
 gs14-20020a1709072d0e00b0072b4af77ccdmr15538574ejc.209.1658878720035; Tue, 26
 Jul 2022 16:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220726010235.342927-1-leobras@redhat.com>
In-Reply-To: <20220726010235.342927-1-leobras@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Tue, 26 Jul 2022 20:38:29 -0300
Message-ID: <CAJ6HWG6PBV4mBFxbEw7190CATcj-VNr4RO6hKJuKtOO4oOPh8g@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] migration: add remaining params->has_* = true in
 migration_instance_init()
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Peter Xu <peterx@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Please include:

Fixes: 69ef1f36b0 ("migration: define 'tls-creds' and 'tls-hostname'
migration parameters")
Fixes: 1d58872a91 ("migration: do not wait for free thread")
Fixes: d2f1d29b95 ("migration: add support for a "tls-authz" migration
parameter")

On Mon, Jul 25, 2022 at 10:02 PM Leonardo Bras <leobras@redhat.com> wrote:
>
> Some of params->has_* = true are missing in migration_instance_init, this
> causes migrate_params_check() to skip some tests, allowing some
> unsupported scenarios.
>
> Fix this by adding all missing params->has_* = true in
> migration_instance_init().
>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  migration/migration.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index e03f698a3c..82fbe0cf55 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -4451,6 +4451,7 @@ static void migration_instance_init(Object *obj)
>      /* Set has_* up only for parameter checks */
>      params->has_compress_level = true;
>      params->has_compress_threads = true;
> +    params->has_compress_wait_thread = true;
>      params->has_decompress_threads = true;
>      params->has_throttle_trigger_threshold = true;
>      params->has_cpu_throttle_initial = true;
> @@ -4471,6 +4472,9 @@ static void migration_instance_init(Object *obj)
>      params->has_announce_max = true;
>      params->has_announce_rounds = true;
>      params->has_announce_step = true;
> +    params->has_tls_creds = true;
> +    params->has_tls_hostname = true;
> +    params->has_tls_authz = true;
>
>      qemu_sem_init(&ms->postcopy_pause_sem, 0);
>      qemu_sem_init(&ms->postcopy_pause_rp_sem, 0);
> --
> 2.37.1
>


