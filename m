Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A150C452C2C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 08:48:49 +0100 (CET)
Received: from localhost ([::1]:38744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmtCy-0004UB-AF
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 02:48:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mmt83-00017q-FR
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 02:43:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mmt7p-0008O8-I0
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 02:43:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637048608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uSuss4UGCko6lF5nP4W2WfmXg7udn+RoG13bDWVqL7Y=;
 b=eAx1ga9ZrqudTfacGZHfK3KcYHpCOtdUaHqEI6F7CZqK58JR+6Gjpiw/GKwsfiR1ghdBPA
 voYurzE/76sQX41oxNkw9NtqKuim4eWz2I8arE+EpW1vof/ERrHxoZsv1CF6LBJCB/h2/2
 K7FCE9edRHOeWTK9E4DPGLAZNfet2/M=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-SmOYI5W9P2GhVVHIfq1hUw-1; Tue, 16 Nov 2021 02:43:26 -0500
X-MC-Unique: SmOYI5W9P2GhVVHIfq1hUw-1
Received: by mail-pl1-f200.google.com with SMTP id
 e4-20020a170902b78400b00143c2e300ddso2069213pls.17
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 23:43:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uSuss4UGCko6lF5nP4W2WfmXg7udn+RoG13bDWVqL7Y=;
 b=2d/BaZCWZguhHHGOgdSmPFaskHIblxkandumZb0FPsmyygpZPYpLluyTDe9yiRLpFe
 aXnD0EVuPT+0YiBRF0L4GcP5m21ECCjaD6pWsQ3L/FFmZQTFjKlc9WoJA3uB/2avaW8o
 auHTKsp41JV2IPa24BZnezCJarTUyKppjJw1TXTC5QMmqZrGWSJt3EjLAj0hfK0eINNI
 7EmeZVGroJQJcNboK9WD87oa/nk6zsKO0oV2s4JJqrxASAdTGq8iCYVSj6TMsEozhNSN
 HROkUhP+eAj2Nl3bAK2vPphRN8DoxN/rG7KZhlEtOc8428xpm+kQ0VoyH7AP1QGrY0p6
 N7ew==
X-Gm-Message-State: AOAM531gBQphV6DfXLM+FAoiKUNwdu4bHXW878DKSwLKTFRQjRPUd2Sa
 B0gh30UOLWF1zMiXmRRk1O+e7clYZkoDU602UAcLyWI76dQ2jz9T3j2e5dJxuxVWBsRwnK4z5Dh
 iPsd/Iv1Ax8Kt8+v8GQZZds/I0noE5uY=
X-Received: by 2002:a63:2c51:: with SMTP id s78mr3564784pgs.312.1637048605704; 
 Mon, 15 Nov 2021 23:43:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytnqVwKOt4W+Xc6VX6+8RPoR/r7Fj/eHFOcfGpM6DhhMVtSVBvYVxgBVgyaFX8BcIb9iZvuTCP1ctuLjvfHAI=
X-Received: by 2002:a63:2c51:: with SMTP id s78mr3564771pgs.312.1637048605441; 
 Mon, 15 Nov 2021 23:43:25 -0800 (PST)
MIME-Version: 1.0
References: <20211116032234.1775-1-peterx@redhat.com>
In-Reply-To: <20211116032234.1775-1-peterx@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 16 Nov 2021 11:43:14 +0400
Message-ID: <CAMxuvazMTD50=r9tab5sKMFLr07dDinmnNf64-VTtt7gntg6Gg@mail.gmail.com>
Subject: Re: [PATCH] dump-guest-memory: Use BQL to protect dump finalize
 process
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laszlo Ersek <lersek@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Tue, Nov 16, 2021 at 7:22 AM Peter Xu <peterx@redhat.com> wrote:
>
> When finalizing the dump-guest-memory with detached mode, we'll first set=
 dump
> status to either FAIL or COMPLETE before doing the cleanup, however right=
 after
> the dump status change it's possible that another dump-guest-memory qmp c=
ommand
> is sent so both the main thread and dump thread (which is during cleanup)=
 could
> be accessing dump state in paralell.  That's racy.

parallel

>
> Fix it by protecting the finalizing phase of dump-guest-memory using BQL =
as
> well.  To do that, we expand the BQL from dump_cleanup() into dump_proces=
s(),
> so we will take the BQL longer than before.  The critical section must co=
ver
> the status switch from ACTIVE->{FAIL|COMPLETE} so as to make sure there's=
 no
> race any more.
>
> We can also just introduce a specific mutex to serialize the dump process=
, but
> BQL should be enough for now so far, not to mention vm_start() in dump_cl=
eanup
> will need BQL anyway, so maybe easier to just use the same mutex.
>
> Reported-by: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  dump/dump.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 662d0a62cd..196b7b8ab9 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -96,13 +96,7 @@ static int dump_cleanup(DumpState *s)
>      g_free(s->guest_note);
>      s->guest_note =3D NULL;
>      if (s->resume) {
> -        if (s->detached) {
> -            qemu_mutex_lock_iothread();
> -        }
>          vm_start();
> -        if (s->detached) {
> -            qemu_mutex_unlock_iothread();
> -        }
>      }
>      migrate_del_blocker(dump_migration_blocker);
>
> @@ -1873,6 +1867,11 @@ static void dump_process(DumpState *s, Error **err=
p)
>      Error *local_err =3D NULL;
>      DumpQueryResult *result =3D NULL;
>
> +    /*
> +     * When running with detached mode, these operations are not run wit=
h BQL.
> +     * It's still safe, because it's protected by setting s->state to AC=
TIVE,
> +     * so dump_in_progress() check will block yet another dump-guest-mem=
ory.
> +     */
>      if (s->has_format && s->format =3D=3D DUMP_GUEST_MEMORY_FORMAT_WIN_D=
MP) {
>  #ifdef TARGET_X86_64
>          create_win_dump(s, &local_err);
> @@ -1883,6 +1882,15 @@ static void dump_process(DumpState *s, Error **err=
p)
>          create_vmcore(s, &local_err);
>      }
>
> +    /*
> +     * Serialize the finalizing of dump process using BQL to make sure n=
o
> +     * concurrent access to DumpState is allowed.  BQL is also required =
for
> +     * dump_cleanup as vm_start() needs it.
> +     */
> +    if (s->detached) {
> +        qemu_mutex_lock_iothread();
> +    }
> +
>      /* make sure status is written after written_size updates */
>      smp_wmb();
>      qatomic_set(&s->status,
> @@ -1898,6 +1906,10 @@ static void dump_process(DumpState *s, Error **err=
p)
>
>      error_propagate(errp, local_err);
>      dump_cleanup(s);
> +
> +    if (s->detached) {
> +        qemu_mutex_unlock_iothread();
> +    }
>  }
>
>  static void *dump_thread(void *data)
> --
> 2.32.0
>


