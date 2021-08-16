Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E48A43ECE21
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 07:48:10 +0200 (CEST)
Received: from localhost ([::1]:43574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFVTl-0004TC-Vm
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 01:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mFVQv-0002aV-EC
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 01:45:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mFVQp-0003wP-Ft
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 01:45:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629092706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nr0N/aikopkfCHWPOLkbdjgNx4tjERCybbyCFfjx4ek=;
 b=XkKiiyO7rM6EQ9fG7XkDh9qHnrY2wUcBz68XWGikf+0q7STxehSoJZVn5Mey2iW56f268B
 4GHdNCKvSFe6V1H3G9wtwBIChwgFr2ZafRY7YBqWgB/+ldaEtBODgb1xNZWv9jkprVm8o/
 V5MKFrgq46QVGi1WQyZBDcgJePpRx2c=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-vsVBlaBQO1ibyegiVDN8mQ-1; Mon, 16 Aug 2021 01:45:02 -0400
X-MC-Unique: vsVBlaBQO1ibyegiVDN8mQ-1
Received: by mail-lj1-f200.google.com with SMTP id
 k11-20020a2e92cb0000b02901b84fac891dso4813393ljh.6
 for <qemu-devel@nongnu.org>; Sun, 15 Aug 2021 22:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nr0N/aikopkfCHWPOLkbdjgNx4tjERCybbyCFfjx4ek=;
 b=qHxBFHZlXmqQwYOPUIxtCY25u0t2b84lsLIQ+ogCFT6eWk+cCskp7hwTQG/Sm8DoqS
 VxAqnqehechadBHw9jJmfVydPPtkIb+8DfhJ5myoLJL+EoujGuga1yQPo5TrmULztB+a
 tPelCcjBrxuHyuIiuXLHKvKXOWcezHhMhup07XGnuQ3kHR/7WaIX0ywPNg/aelsydAT4
 Se2OD0O9ZQOXgCF3z53RFw3j3yC/NkuiqzCTzjfogW+6TDwH8Vp/rJCneECCrllqXT1n
 /OR7xboRN3I9YXZalZJYEFT9PgGM7+B4JK+P9xAjKhqm3N2wxrLhi9YzNUmVvjTt8kWJ
 RGhQ==
X-Gm-Message-State: AOAM5300upvgDPyUMZ4Iv7qHRdqjNC6Ouh7kifvbaweh7DQFujmvOp7n
 4nMT4KjIjBSdL0T/+2yNfdR8IqhAI8kr84cr0ir9Uw9lbtZwtJL+4RUZ5hUJgu/Eqg7uPGNLJWm
 PjnLEROg1OXBaMRsOKe7HZMEMXHvd3Tg=
X-Received: by 2002:ac2:51c3:: with SMTP id u3mr3891029lfm.626.1629092701441; 
 Sun, 15 Aug 2021 22:45:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySLYHPwEONHNU2iU8js3ap+rtQ50i+4WkBTzRsGqmvIUlEbRBqo5w/XlahvGVGWsxpdS30LsW+9GUBIyrxdQE=
X-Received: by 2002:ac2:51c3:: with SMTP id u3mr3891013lfm.626.1629092701189; 
 Sun, 15 Aug 2021 22:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210804212724.07e411d6@gecko.fritz.box>
In-Reply-To: <20210804212724.07e411d6@gecko.fritz.box>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Mon, 16 Aug 2021 02:44:54 -0300
Message-ID: <CAJ6HWG6+OH4tsyybpaTF+kLhSu=DmH2+Gcrypa-WhzcXrXEqYw@mail.gmail.com>
Subject: Re: [PATCH] multifd: Implement yank for multifd send side
To: Lukas Straub <lukasstraub2@web.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Li Xiaohui <xiaohli@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Lukas,

On Wed, Aug 4, 2021 at 4:27 PM Lukas Straub <lukasstraub2@web.de> wrote:
>
> When introducing yank functionality in the migration code I forgot
> to cover the multifd send side.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---
>
> @Leonardo Could you check if this fixes your issue?

In the same scenario I was testing my previous patch,
(http://patchwork.ozlabs.org/project/qemu-devel/patch/20210730074043.54260-1-leobras@redhat.com/)
this patch also seems to fix the issue .
(https://bugzilla.redhat.com/show_bug.cgi?id=1970337).


>
>  migration/multifd.c | 6 +++++-
>  migration/multifd.h | 2 ++
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 377da78f5b..5a4f158f3c 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -546,6 +546,9 @@ void multifd_save_cleanup(void)
>          MultiFDSendParams *p = &multifd_send_state->params[i];
>          Error *local_err = NULL;
>
> +        if (p->registered_yank) {
> +            migration_ioc_unregister_yank(p->c);
> +        }
>          socket_send_channel_destroy(p->c);
>          p->c = NULL;
>          qemu_mutex_destroy(&p->mutex);
> @@ -813,7 +816,8 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
>                  return false;
>              }
>          } else {
> -            /* update for tls qio channel */
> +            migration_ioc_register_yank(ioc);
> +            p->registered_yank = true;
>              p->c = ioc;
>              qemu_thread_create(&p->thread, p->name, multifd_send_thread, p,
>                                     QEMU_THREAD_JOINABLE);
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 8d6751f5ed..16c4d112d1 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -85,6 +85,8 @@ typedef struct {
>      bool running;
>      /* should this thread finish */
>      bool quit;
> +    /* is the yank function registered */
> +    bool registered_yank;
>      /* thread has work to do */
>      int pending_job;
>      /* array of pages to sent */
> --
> 2.32.0


