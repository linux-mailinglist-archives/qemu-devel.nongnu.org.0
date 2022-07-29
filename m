Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6835A585151
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 16:11:47 +0200 (CEST)
Received: from localhost ([::1]:49356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHQiO-0007fs-4C
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 10:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oHQg2-0005Dq-0J
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 10:09:18 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:36811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oHQfz-00013W-3Z
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 10:09:17 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-31e7ca45091so52500487b3.3
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 07:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=EsSPF4qb9+9nnV5gJrpJhXXezcnCV0Ei9+zolWKfMd8=;
 b=IG1suOXT+aDs5cnJmtUf+fFTi+dAq5y9woitbYcFwOYfjEfeNUsCYA0je6NDH5tBcN
 qAJiCsmESxt34oxb0M4Roy/QqY9LUCMUH97oZ38tVaBsdB4i9xYgAJBW4D3jGTKJJD1q
 jbr/P7pMI2WoXQ9dtEKwrjm+30Srju5hmZx5RZLmeosW0ZpFWDQr9KaVwGCHDTx3myfM
 diroeYsphZf9WVQ9ClumRlAKxyqDKjDBSKpXUSGme8p3LwxApD43jP+4s3EJZiQiNcSW
 UP/CzC9vF569oTCshajD1t3FCD0hNaRBRVkmju9te4o0JGv+Gs4GOpQVHDKMqK+ALCgP
 dUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=EsSPF4qb9+9nnV5gJrpJhXXezcnCV0Ei9+zolWKfMd8=;
 b=JtRuNL4eHUCYvxUrTOKMZcMNAX74hsnSojarTumGz14VoMkKFDFJiTr+LACQbQ8NHY
 Jid/JqgWQ1XYt83A7LJBtSGM9QzPS52LUYZuPNe92P/pljl7YK4KPcIbemu/2w8LxKJY
 4p5DoEej47nEjvHo2bV06pbj089FMwb/Uxna1mDa6jpOOn8om8DficdgeYbrqUfaQqsf
 qI/KjKt4jWW/Q7hTaEw54FdL16OpzGMv1rZoBx/ocxGu2Kn4gSJxwc0V2NTALItE8YUh
 2p90YiJLFN5s1Ezmx7do0p7k9TZ57QJUb/fzzQMNABs33QzY7wQE/SMERO/pgwopypdG
 phUQ==
X-Gm-Message-State: ACgBeo3uQLZ7sY7RK94wwT2ndl7lAZYJp/+bmMwe+/rTadJvciRwqSms
 HVb4tPNI/NICrQkW0VxgSU6M6qNluj5L2BtQOyvfHA==
X-Google-Smtp-Source: AA6agR5evp9USWPBAMAUpePiSoozAHBzZq+pHvOXRc6kuRS3OWmnJCcLBl7b0FE4PZi/DhI0eQLk9G2WMpYwX7RPzBg=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr3216700ywb.257.1659103753707; Fri, 29 Jul
 2022 07:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220720090313.55169-1-jasowang@redhat.com>
 <20220720090313.55169-20-jasowang@redhat.com>
In-Reply-To: <20220720090313.55169-20-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jul 2022 15:08:33 +0100
Message-ID: <CAFEAcA8UZcOLTpLUutMFeaugZwm2vAKTGZgLkcHAG3B2BHYtUA@mail.gmail.com>
Subject: Re: [PULL V2 19/25] vdpa: Extract get features part from
 vhost_vdpa_get_max_queue_pairs
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, 20 Jul 2022 at 10:04, Jason Wang <jasowang@redhat.com> wrote:
>
> From: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
> To know the device features is needed for CVQ SVQ, so SVQ knows if it
> can handle all commands or not. Extract from
> vhost_vdpa_get_max_queue_pairs so we can reuse it.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> Acked-by: Jason Wang <jasowang@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>

Hi; this change introduces a resource leak in the new
error-exit return path in net_init_vhost_vdpa(). Spotted
by Coverity, CID 1490785.

> @@ -517,10 +521,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, const=
 char *name,
>                          NetClientState *peer, Error **errp)
>  {
>      const NetdevVhostVDPAOptions *opts;
> +    uint64_t features;
>      int vdpa_device_fd;
>      g_autofree NetClientState **ncs =3D NULL;
>      NetClientState *nc;
> -    int queue_pairs, i, has_cvq =3D 0;
> +    int queue_pairs, r, i, has_cvq =3D 0;
>
>      assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
>      opts =3D &netdev->u.vhost_vdpa;
> @@ -534,7 +539,12 @@ int net_init_vhost_vdpa(const Netdev *netdev, const =
char *name,
>          return -errno;
>      }
>
> -    queue_pairs =3D vhost_vdpa_get_max_queue_pairs(vdpa_device_fd,
> +    r =3D vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
> +    if (unlikely(r < 0)) {
> +        return r;

At this point in the code we have allocated the file descriptor
vdpa_device_fd, but this return path fails to close it.

> +    }
> +
> +    queue_pairs =3D vhost_vdpa_get_max_queue_pairs(vdpa_device_fd, featu=
res,
>                                                   &has_cvq, errp);
>      if (queue_pairs < 0) {
>          qemu_close(vdpa_device_fd);

Compare this pre-existing error-exit path, which correctly
calls qemu_close() on the fd.

Related question: is this function supposed to return -1 on
failure, or negative-errno ? At the moment it has a mix
of both. I think that the sole caller only really wants "<0 on
error", in which case the error-exit code paths could probably
be tidied up so that instead of explicitly calling
qemu_close() and returning r, queue_pairs, or whatever
they got back from the function they just called, they
could just 'goto err_svq' which will do the "close the fd
and return -1" work. Better still, by initializing 'i'
to 0 at the top of the function (and naming it something
clearer, ideally), all the code paths after the initial
qemu_open() succeeds could be made to use 'goto err'
for the error-exit case.

thanks
-- PMM

