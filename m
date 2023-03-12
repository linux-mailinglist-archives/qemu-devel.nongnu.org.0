Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38766B6A9B
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 20:21:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbREf-0004k5-CR; Sun, 12 Mar 2023 15:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1pbREd-0004jw-Pg
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 15:19:59 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1pbREc-000870-1L
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 15:19:59 -0400
Received: by mail-ed1-x52a.google.com with SMTP id x3so40435141edb.10
 for <qemu-devel@nongnu.org>; Sun, 12 Mar 2023 12:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678648793;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MJEKeSIYKyykgRw4CZfpY5eGfPgAxkplhj2E6WMVV1Q=;
 b=d3UMIqu1gFdqkpcOaL0CtJ0IDQKL6YVoOMuAvAEA1b/gx2Zo38CpJ10edy5k2VgrXC
 HDLefI5ZKI0xvZVUrY8QnKsDY+UMcuw7u7A/G4PfqSgY8fChHfRQj+AlcNY0+fydAfDW
 ckw1cgdP5ToLZ4g3GAL4OYMt3ff6IlwJUiePRBVIAX3076BdgkPYEcpI4pu/cNvNk0zT
 reBMzAuaWaRKwmKJ9kgzqFwEtZoaUOS8F2Jlsp5jIWzziOZpEY7aTVvuUO+8Zc46YPMM
 +dL0aZq6amEqLmxZ5iG25PSwqO3jSdnPKZcGARBy16LQ2JgHKa8pan6XPzjacsS/mFRX
 9Jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678648793;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MJEKeSIYKyykgRw4CZfpY5eGfPgAxkplhj2E6WMVV1Q=;
 b=KSLDdRGopfwTZLdianRXoen+Xv/wNQyhYWXqDJ5EbuZ9cc9v1FjIDdr0XfwKblQhyI
 S4UvxF85X0Keo5HXQcZSm4c7M3pPtKGm6jNgygvILNb0Y9JytByLt5qxD4gFya1hF3e3
 97O/QMhh9lLHkaWYtin2yq0mdDjYgWmj688Vh/zHWAI/DBBnFG6Q7p0CrA4x5uXddqYk
 fCtEU8RSOA+6svKo0v19CE6u5JlGPE/jfUwMHDDalkVkrL09WogOT4cKv4hjGalpOMoH
 e36HpZiN1EqoTLDC8rAJ12dDrk2FsLI54/acCcoNBy3UO9peew0P3OuLlS4yr0FtkPfS
 snPQ==
X-Gm-Message-State: AO0yUKW9C7QnhaRnLPeavlMpE2VDSXonQ7h18NWtJ0NK5JihGmsZpRyI
 VaOmZckwwR0z5V5NU646XcMf6io+knaiJMMzovQ=
X-Google-Smtp-Source: AK7set8dnmTVNz6T7mJo/7smv9W9vr9SjD9KAt4fOB0jOB2d9b/ik2li4mdhw5IicbhGqZimXp4sSIqX2BoYZivmNKs=
X-Received: by 2002:a50:baa7:0:b0:4ac:b832:856c with SMTP id
 x36-20020a50baa7000000b004acb832856cmr17640466ede.1.1678648792731; Sun, 12
 Mar 2023 12:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230307182707.2298618-1-dwmw2@infradead.org>
 <20230307182707.2298618-14-dwmw2@infradead.org>
In-Reply-To: <20230307182707.2298618-14-dwmw2@infradead.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sun, 12 Mar 2023 15:19:40 -0400
Message-ID: <CAKf6xpuH2E=16s1jFvgL9J723wv0dhBD5aYWP2NBNj5rZio2jg@mail.gmail.com>
Subject: Re: [PULL 13/27] hw/xen: Add xenstore operations to allow redirection
 to internal emulation
To: David Woodhouse <dwmw2@infradead.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>, 
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com, 
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=jandryuk@gmail.com; helo=mail-ed1-x52a.google.com
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

On Tue, Mar 7, 2023 at 1:29=E2=80=AFPM David Woodhouse <dwmw2@infradead.org=
> wrote:
>
> From: Paul Durrant <pdurrant@amazon.com>
>
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
>  accel/xen/xen-all.c                 |  11 +-
>  hw/char/xen_console.c               |   2 +-
>  hw/i386/kvm/xen_xenstore.c          |   3 -
>  hw/i386/kvm/xenstore_impl.h         |   8 +-
>  hw/xen/xen-bus-helper.c             |  62 +++----
>  hw/xen/xen-bus.c                    | 261 ++++------------------------
>  hw/xen/xen-legacy-backend.c         | 119 +++++++------
>  hw/xen/xen-operations.c             | 198 +++++++++++++++++++++
>  hw/xen/xen_devconfig.c              |   4 +-
>  hw/xen/xen_pt_graphics.c            |   1 -
>  hw/xen/xen_pvdev.c                  |  49 +-----
>  include/hw/xen/xen-bus-helper.h     |  26 +--
>  include/hw/xen/xen-bus.h            |  17 +-
>  include/hw/xen/xen-legacy-backend.h |   6 +-
>  include/hw/xen/xen_backend_ops.h    | 163 +++++++++++++++++
>  include/hw/xen/xen_common.h         |   1 -
>  include/hw/xen/xen_pvdev.h          |   2 +-
>  softmmu/globals.c                   |   1 +
>  18 files changed, 525 insertions(+), 409 deletions(-)
>
> diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
> index e85e4aeba5..425216230f 100644
> --- a/accel/xen/xen-all.c
> +++ b/accel/xen/xen-all.c
> @@ -90,12 +90,15 @@ void xenstore_store_pv_console_info(int i, Chardev *c=
hr)
>  }
>
>
> -static void xenstore_record_dm_state(struct xs_handle *xs, const char *s=
tate)
> +static void xenstore_record_dm_state(const char *state)
>  {
> +    struct xs_handle *xs;
>      char path[50];
>
> +    /* We now have everything we need to set the xenstore entry. */
> +    xs =3D xs_open(0);
>      if (xs =3D=3D NULL) {
> -        error_report("xenstore connection not initialized");
> +        fprintf(stderr, "Could not contact XenStore\n");
>          exit(1);
>      }

This breaks dm_restrict=3D1 since the xs_open is not allowed by the time
this is called.  There are other evtchn errors before this as well:
# cat /var/log/xen/qemu-dm-debian.log
char device redirected to /dev/pts/8 (label serial0)
xen be core: can't open evtchn device
xen be core: can't open evtchn device
xen be core: can't open evtchn device
xen be core: can't open evtchn device
xen be core: can't open evtchn device
xen be core: can't open evtchn device
xen be core: can't open evtchn device
xen be core: can't open evtchn device
Could not contact XenStore

Ok, those "xen be core: can't open evtchn device" were there before
the recent changes and seem to be non-fatal.

Regards,
Jason

