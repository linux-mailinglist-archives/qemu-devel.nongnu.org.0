Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C75C6FA307
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 11:11:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvwtR-0007Py-8J; Mon, 08 May 2023 05:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pvwt4-0007PZ-Dv
 for qemu-devel@nongnu.org; Mon, 08 May 2023 05:10:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pvwt2-0006ak-UB
 for qemu-devel@nongnu.org; Mon, 08 May 2023 05:10:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683537026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ePocs6Zock7wtpYGNrcwH0FyNbcnhjzKFqwYPjlUZ4=;
 b=TFoT3x87kTvQa2I7I/XW9UZ6XBsEsMyVKDw3021b0DN3LLoACH91EPtzo+uhTuzrrLbJHR
 +rRWbKNLRKRlomTln3maRLqDbqnQJFU2H2YaBttZRJjvN6qS6/MZaI8vvjj3Zr6ll1Co7M
 H22OTovSnW8wMfgMR4fA7eZ7ey+aGIw=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-R3TvTy5VOoeUJzU2cgaDEg-1; Mon, 08 May 2023 05:10:23 -0400
X-MC-Unique: R3TvTy5VOoeUJzU2cgaDEg-1
Received: by mail-yb1-f200.google.com with SMTP id
 3f1490d57ef6-ba22ced2e95so2424729276.1
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 02:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683537023; x=1686129023;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ePocs6Zock7wtpYGNrcwH0FyNbcnhjzKFqwYPjlUZ4=;
 b=OepvjdWoqo7mZtiYYBSnomTxmCxHGX1r/Frt0gRa24vF3DLxjGZK/KGLpqDqtA8xtu
 denM3hChJvdkf1jDKCPrM5CFhq8WOCWNS8CBAyaClFKC2fAMq4UwDtmIWnlQM1stS0Fp
 Ph0KneYDBR9vRXdw3zHeDqfS8qFMG6KzEtPk43ARkXw2dD8zfU6zNIsR0soVQ2y2u0ip
 hgd5JwJAkj60jQFhud4LdJWejEPjWMpuZlIuPZzFYS8t62cKxAgItO65wl24wBY23pgt
 8y68GDd4AeyaRYwAwDIQgQ2fQr701HwimcEC8DYA6ipC0Ox+sixPjeM5lLYGiJohg3TN
 vnog==
X-Gm-Message-State: AC+VfDxfSpNuMGZ9tdfWTaeSCPxurTKfm7TaFD7ytWaZpu6IwonM5HGC
 KfU7YCGY3H6yY0HGixGfOZ8aL58mr40opvqahfbJ+vwZfD4531XkBLsuSVT7nNgSaNlTKgfqaMz
 46X50dzORRNSWSMtfdCkHc1fzZQfGZP4=
X-Received: by 2002:a25:aa0c:0:b0:b9d:b5f0:3b33 with SMTP id
 s12-20020a25aa0c000000b00b9db5f03b33mr9896443ybi.58.1683537022788; 
 Mon, 08 May 2023 02:10:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5xO0lXxZRJXkO8EtKqk1f6xjidK0HORB/vU43Xa23cv5AXjYobPdHpv20E2yAGSJ9EdbDL1lVdKYXl0luPbZM=
X-Received: by 2002:a25:aa0c:0:b0:b9d:b5f0:3b33 with SMTP id
 s12-20020a25aa0c000000b00b9db5f03b33mr9896428ybi.58.1683537022487; Mon, 08
 May 2023 02:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230504101447.389398-1-eperezma@redhat.com>
 <1683339216.3364966-2-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1683339216.3364966-2-xuanzhuo@linux.alibaba.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 8 May 2023 11:09:46 +0200
Message-ID: <CAJaqyWfzs00bi5qDHnyHVnf0vEK02hSiC15uJpGVi_eoRTmg7Q@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: not enable vq reset feature unconditionally
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Lei Yang <leiyang@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, May 6, 2023 at 4:25=E2=80=AFAM Xuan Zhuo <xuanzhuo@linux.alibaba.co=
m> wrote:
>
> On Thu,  4 May 2023 12:14:47 +0200, =3D?utf-8?q?Eugenio_P=3DC3=3DA9rez?=
=3D <eperezma@redhat.com> wrote:
> > The commit 93a97dc5200a ("virtio-net: enable vq reset feature") enables
> > unconditionally vq reset feature as long as the device is emulated.
> > This makes impossible to actually disable the feature, and it causes
> > migration problems from qemu version previous than 7.2.
> >
> > The entire final commit is unneeded as device system already enable or
> > disable the feature properly.
> >
> > This reverts commit 93a97dc5200a95e63b99cb625f20b7ae802ba413.
> > Fixes: 93a97dc5200a ("virtio-net: enable vq reset feature")
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >
> > ---
> > Tested by checking feature bit at  /sys/devices/pci.../virtio0/features
> > enabling and disabling queue_reset virtio-net feature and vhost=3Don/of=
f
> > on net device backend.
>
> Do you mean that this feature cannot be closed?
>
> I tried to close in the guest, it was successful.
>

I'm not sure what you mean with close. If the device dataplane is
emulated in qemu (vhost=3Doff), I'm not able to make the device not
offer it.

> In addition, in this case, could you try to repair the problem instead of
> directly revert.
>

I'm not following this. The revert is not to always disable the feature.

By default, the feature is enabled. If cmdline states queue_reset=3Don,
the feature is enabled. That is true both before and after applying
this patch.

However, in qemu master, queue_reset=3Doff keeps enabling this feature
on the device. It happens that there is a commit explicitly doing
that, so I'm reverting it.

Let me know if that makes sense to you.

Thanks!


