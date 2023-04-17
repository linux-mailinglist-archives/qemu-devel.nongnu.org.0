Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41F26E5127
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 21:48:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poUoS-0006F0-4p; Mon, 17 Apr 2023 15:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1poUoN-0006Er-OU
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 15:46:52 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1poUoL-0006GX-A2
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 15:46:51 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-54c12009c30so537219287b3.9
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 12:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681760808; x=1684352808;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FKHXwNARlsRi35vcdu0ezOn03tM3Qp2/K3mhoGWYg1k=;
 b=Zm06VW90kt13iB2tnPHAvQp5K8lIlftHAfhJRN1aIgU4c9nIzND/TKQmgbHQwK0gIF
 NgA2dcbW3dnPCZZdD7HA7YQ0kBsLk1HLYB+AJ6imAuOpJuTPe+AbgyN4NajIBv/9q0+0
 L1/f9ZvBsu8scPzxs8iiQ9vdTPlvFsGunn0HomxvQQGH0jvfGKKY/aS5JZIRBL1E6rgE
 MUi6goxPEAqkIL1p/4JFgt5aes6NVnKjoTjQT+mj7eWGYIz5MRrbSWM8oxoszm3+Yq6T
 RYN4V+TvA/ddiaXqLNiAsLAXyZ0Eeo1//cuJdiZaIdh2PRRkf9bCR5RLOMXwEXIIYEvt
 gbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681760808; x=1684352808;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FKHXwNARlsRi35vcdu0ezOn03tM3Qp2/K3mhoGWYg1k=;
 b=Y4uPkvrvn+y5HzmXarTKmJEW5KIBi4LVBYaJhMCgcl2czLT3OH8u6QDNi9niG7JKlQ
 YPaNScD2/llnCqV7yPykynR59Teq3X4X64EKqd8tuYFCti5LpGBXVxncOFVGrZDRIWmt
 ny0coTOnJ32kq+UY1yQKOjACicsSg37Ne2pRFV/FGrtDcCldm+ZoeIiCCyfFAFO+2LTA
 Vxhsmpf6FtVh8456CH5TaEapzsbN/TTZAaTCigbDI/eXVN7HjTdm63hOVy0suRZkPz0k
 h6lykqsQ8bNS7YuwDYC69lrXM3XgLP7DCnx2uY5K7fttjjAIDX7UTSraB9MSSH/nzUBs
 am/g==
X-Gm-Message-State: AAQBX9dzp/huYnjYXGeAbyF/6TZjcM9uk6Gc7OB82+0wTYUuVdabuC+n
 G4WQ3KA0BkjZES1aN4vMPopBNzCCeiUsg3C5xbo=
X-Google-Smtp-Source: AKy350YAinaCL9wjscBc9mLyRZSU9713Ku14yvJePy35xhhg9EnEXYkI5n68Ei7iuh7FlfThSRq+Ukyited8BpCHXt8=
X-Received: by 2002:a0d:ec47:0:b0:54e:e490:d190 with SMTP id
 r7-20020a0dec47000000b0054ee490d190mr10097802ywn.4.1681760807995; Mon, 17 Apr
 2023 12:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-3-hreitz@redhat.com>
 <20230412210641.GC2813183@fedora>
 <246691c3-2287-7472-3615-7ec0f074445c@redhat.com>
 <CAJSP0QU-iDTT+xtkZ_xRf4vX+hM0WY+H1SXSuyS+cjiogz3A_A@mail.gmail.com>
 <b0cd4f54-94ed-09a4-cec2-e81f36da4008@redhat.com>
 <CAJaqyWegMfuc8s6bKdxdM4uVixmhy-F3xUUyOCYS1yGDXoiVZA@mail.gmail.com>
 <20230417151840.GD3852722@fedora>
 <CAJaqyWeTBXStyxty4G5qpiG=UoZkmOmr75hHaC3H21kJfK=idg@mail.gmail.com>
 <CAJSP0QWmFgJvVPLDo2eoFapj8GCmDjaaEygAaywZwHuH=_q=rQ@mail.gmail.com>
 <CAJaqyWd122pfv4XMzQhju7a5DV3FwbXvbedh1Z9s6T5Pw4a0GQ@mail.gmail.com>
In-Reply-To: <CAJaqyWd122pfv4XMzQhju7a5DV3FwbXvbedh1Z9s6T5Pw4a0GQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 17 Apr 2023 15:46:35 -0400
Message-ID: <CAJSP0QWhivOnFmmkBoZkxui6xbUVjs3oEUc3-QwPN2V3d7t9rg@mail.gmail.com>
Subject: Re: [PATCH 2/4] vhost-user: Interface for migration state transfer
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Hanna Czenczek <hreitz@redhat.com>,
 qemu-devel@nongnu.org, 
 virtio-fs@redhat.com, German Maglione <gmaglione@redhat.com>, 
 Anton Kuchin <antonkuchin@yandex-team.ru>, Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Mon, 17 Apr 2023 at 15:12, Eugenio Perez Martin <eperezma@redhat.com> wr=
ote:
>
> On Mon, Apr 17, 2023 at 9:08=E2=80=AFPM Stefan Hajnoczi <stefanha@gmail.c=
om> wrote:
> >
> > On Mon, 17 Apr 2023 at 14:56, Eugenio Perez Martin <eperezma@redhat.com=
> wrote:
> > >
> > > On Mon, Apr 17, 2023 at 5:18=E2=80=AFPM Stefan Hajnoczi <stefanha@red=
hat.com> wrote:
> > > >
> > > > On Fri, Apr 14, 2023 at 05:17:02PM +0200, Eugenio Perez Martin wrot=
e:
> > > > > On Thu, Apr 13, 2023 at 7:55=E2=80=AFPM Hanna Czenczek <hreitz@re=
dhat.com> wrote:
> > > > > >
> > > > > > On 13.04.23 13:38, Stefan Hajnoczi wrote:
> > > > > > > On Thu, 13 Apr 2023 at 05:24, Hanna Czenczek <hreitz@redhat.c=
om> wrote:
> > > > > > >> On 12.04.23 23:06, Stefan Hajnoczi wrote:
> > > > > > >>> On Tue, Apr 11, 2023 at 05:05:13PM +0200, Hanna Czenczek wr=
ote:
> > > > > > Basically, what I=E2=80=99m hearing is that I need to implement=
 a different
> > > > > > feature that has no practical impact right now, and also fix bu=
gs around
> > > > > > it along the way...
> > > > > >
> > > > >
> > > > > To fix this properly requires iterative device migration in qemu =
as
> > > > > far as I know, instead of using VMStates [1]. This way the state =
is
> > > > > requested to virtiofsd before the device reset.
> > > >
> > > > I don't follow. Many devices are fine with non-iterative migration.=
 They
> > > > shouldn't be forced to do iterative migration.
> > > >
> > >
> > > Sorry I think I didn't express myself well. I didn't mean to force
> > > virtiofsd to support the iterative migration, but to use the device
> > > iterative migration API in QEMU to send the needed commands before
> > > vhost_dev_stop. In that regard, the device or the vhost-user commands
> > > would not require changes.
> > >
> > > I think it is convenient in the long run for virtiofsd, as if the
> > > state grows so much that it's not feasible to fetch it in one shot
> > > there is no need to make changes in the qemu migration protocol. I
> > > think it is not unlikely in virtiofs, but maybe I'm missing something
> > > obvious and it's state will never grow.
> >
> > I don't understand. vCPUs are still running at that point and the
> > device state could change. It's not safe to save the full device state
> > until vCPUs have stopped (after vhost_dev_stop).
> >
>
> I think the vCPU is already stopped at save_live_complete_precopy
> callback. Maybe my understanding is wrong?

Agreed, vCPUs are stopped in save_live_complete_precopy(). However,
you wrote "use the device iterative migration API in QEMU to send the
needed commands before vhost_dev_stop". save_live_complete_precopy()
runs after vhost_dev_stop() so it doesn't seem to solve the problem.

Stefan

