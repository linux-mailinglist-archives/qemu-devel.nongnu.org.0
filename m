Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C33A69188D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 07:34:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQMyc-0007WA-RF; Fri, 10 Feb 2023 01:33:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1pQMyb-0007UT-4n
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:33:41 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1pQMyZ-0007ny-1C
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:33:40 -0500
Received: by mail-oi1-x22d.google.com with SMTP id r28so3708718oiw.3
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 22:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7TMIMu9HUTnFvlEvA6lEwL3M7/2DqWQuVOGCnLzl8W4=;
 b=jse9Q9/+9v/N65tKQm0jUTwv/rxCDuR6f62BGmZcz7jMF+8D9Hi+EZhLNejJNfEZha
 aBLWyScF2fAMigwAEk0rE176HpJeBkcutwM35cTiBpku0R3y78JSOH5GWeKWAURe7doR
 yOI8BjjpsyzJdWjQ82AmXbpl+7NfjY/QUITY0naR6YgzQ7I8yrnrWTNBsVNg4FPWJupt
 q2RRArO+fuTMDSSJuUY2Q0XoJXCC3CwHh7fU6LQr2Dqls7oHTHm0Ub6zt+jR7K7NZUR1
 xtE14/W9Vy/gT/j/J+Bv2K6KhzdG3SQK3Afgqv+zqqfX/jAZoKDTGyQkGv369KDeRSOu
 0eHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7TMIMu9HUTnFvlEvA6lEwL3M7/2DqWQuVOGCnLzl8W4=;
 b=27iGP63220w4UwSndPr/xOLJ0niCvEdjPi+Gst1zm65NVt7pKSiqNjR+CwqRB/vS45
 dcnoqSp1rWLsMA9ZUTNVmCMA3/iii8/sdISjI9JxKlaI6Uh2cA2E6faiYkMkOrzYm+H2
 L5MldZlFJqk2pdqoPm+yT+Wqw6MdcsdyLMOK9n6oAKQ7sftHhgRMhdDf5wf6mLbsi3lj
 a48zeJGffz70f4FpD8GS7HlITiTe8IwQXc+MZo4p5Oi5G9cLtTHf/6lElO2Zh/AQe4WC
 bcWhDh50TTD1ReMHQpHyiEeq0Ke569u0DzI6WhBbSjOQKX7f4675x2TxM3Lr5VegZI5w
 3fbg==
X-Gm-Message-State: AO0yUKW8Dk1flDqXY6ukmSo2L3eQRoX5JNJcuK7ClceaW6KEphSHB1CY
 SOtj7tvy+AHdt6fzslLtUxNRR1dF5dU=
X-Google-Smtp-Source: AK7set812gcDieJLs7rkZipymNcqB22kauovAycZyhu06K9U1IQjT2wd7zOje6/sfSnujqG8eqnEWw==
X-Received: by 2002:a05:6808:434d:b0:367:7633:30dc with SMTP id
 dx13-20020a056808434d00b00367763330dcmr6328017oib.40.1676010817845; 
 Thu, 09 Feb 2023 22:33:37 -0800 (PST)
Received: from ?IPv6:2804:1b3:a800:9aa9:fdcb:7dec:9680:8417?
 ([2804:1b3:a800:9aa9:fdcb:7dec:9680:8417])
 by smtp.gmail.com with ESMTPSA id
 p125-20020acad883000000b003436fa2c23bsm1860355oig.7.2023.02.09.22.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 22:33:37 -0800 (PST)
Message-ID: <404e27a15df93b355f2058a0c0e6020bbd2f100d.camel@gmail.com>
Subject: Re: [PATCH v1 1/4] migration/multifd: Change multifd_load_cleanup()
 signature and usage
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Juan Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org
Date: Fri, 10 Feb 2023 03:33:33 -0300
In-Reply-To: <20230210063145.530952-1-leobras.c@gmail.com>
References: <20230210063145.530952-1-leobras.c@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=leobras.c@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Sent with the incorrect credentials. Sorry about the noise.
Will resend them correctly.


On Fri, 2023-02-10 at 03:31 -0300, Leonardo Bras wrote:
> Since it's introduction in commit f986c3d256 ("migration: Create multifd
> migration threads"), multifd_load_cleanup() never returned any value
> different than 0, neither set up any error on errp.
>=20
> Even though, on process_incoming_migration_bh() an if clause uses it's
> return value to decide on setting autostart =3D false, which will never
> happen.
>=20
> In order to simplify the codebase, change multifd_load_cleanup() signatur=
e
> to 'void multifd_load_cleanup(void)', and for every usage remove error
> handling or decision made based on return value !=3D 0.
>=20
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
>  migration/multifd.h   |  2 +-
>  migration/migration.c | 14 ++++----------
>  migration/multifd.c   |  6 ++----
>  3 files changed, 7 insertions(+), 15 deletions(-)
>=20
> diff --git a/migration/multifd.h b/migration/multifd.h
> index ff3aa2e2e9..9a7e1a8826 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -16,7 +16,7 @@
>  int multifd_save_setup(Error **errp);
>  void multifd_save_cleanup(void);
>  int multifd_load_setup(Error **errp);
> -int multifd_load_cleanup(Error **errp);
> +void multifd_load_cleanup(void);
>  bool multifd_recv_all_channels_created(void);
>  void multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
>  void multifd_recv_sync_main(void);
> diff --git a/migration/migration.c b/migration/migration.c
> index 7a14aa98d8..ce962ea577 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -543,13 +543,7 @@ static void process_incoming_migration_bh(void *opaq=
ue)
>       */
>      qemu_announce_self(&mis->announce_timer, migrate_announce_params());
> =20
> -    if (multifd_load_cleanup(&local_err) !=3D 0) {
> -        error_report_err(local_err);
> -        autostart =3D false;
> -    }
> -    /* If global state section was not received or we are in running
> -       state, we need to obey autostart. Any other state is set with
> -       runstate_set. */
> +    multifd_load_cleanup();
> =20
>      dirty_bitmap_mig_before_vm_start();
> =20
> @@ -649,9 +643,9 @@ fail:
>      migrate_set_state(&mis->state, MIGRATION_STATUS_ACTIVE,
>                        MIGRATION_STATUS_FAILED);
>      qemu_fclose(mis->from_src_file);
> -    if (multifd_load_cleanup(&local_err) !=3D 0) {
> -        error_report_err(local_err);
> -    }
> +
> +    multifd_load_cleanup();
> +
>      exit(EXIT_FAILURE);
>  }
> =20
> diff --git a/migration/multifd.c b/migration/multifd.c
> index b7ad7002e0..174726982c 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -1022,12 +1022,12 @@ static void multifd_recv_terminate_threads(Error =
*err)
>      }
>  }
> =20
> -int multifd_load_cleanup(Error **errp)
> +void multifd_load_cleanup(void)
>  {
>      int i;
> =20
>      if (!migrate_use_multifd() || !migrate_multi_channels_is_allowed()) =
{
> -        return 0;
> +        return;
>      }
>      multifd_recv_terminate_threads(NULL);
>      for (i =3D 0; i < migrate_multifd_channels(); i++) {
> @@ -1067,8 +1067,6 @@ int multifd_load_cleanup(Error **errp)
>      multifd_recv_state->params =3D NULL;
>      g_free(multifd_recv_state);
>      multifd_recv_state =3D NULL;
> -
> -    return 0;
>  }
> =20
>  void multifd_recv_sync_main(void)


