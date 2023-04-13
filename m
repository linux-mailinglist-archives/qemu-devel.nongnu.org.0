Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 924C46E0C11
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 13:08:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmuo2-0007V1-E4; Thu, 13 Apr 2023 07:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pmunz-0007UJ-Vp
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 07:07:55 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pmuny-0002B5-Hu
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 07:07:55 -0400
Received: by mail-yb1-xb34.google.com with SMTP id t16so1987357ybi.13
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 04:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681384073; x=1683976073;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=73UYQ+UOpa+vWsmo5S3WE7zaLxbDHpDjBT6uMvtzgCQ=;
 b=gt8nd+5enA1YjrS7mIRnGqBVonitlcfs5O64gAYyYuj5pJQgw6KrOo5XUsVT59oZRy
 FHsfV5g9x7xnx9dsQsJ9ZQeEKIOr5L9KhJ0wRaSVD9h4ndodpElMvkFJ7IRa7SUsa6oX
 Z86zeg1JEeKo+r2/GGDF8zLe/9GXZn1PvcNm4UX+W63kpDqbed+mbuhatNiIXPhs2FRq
 3ht1UY2ayRejTPodZKLEqB1rINWrUgdhjr5kPyEy6X6uiePznspDjPj76xQKhTOxzgHY
 kvawpgpF6eZ8+hxkq2/SVW8cv20v/lz+dLcPpBctfPOiz0Fcck96/AOFMzF0/sMhwXe3
 AAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681384073; x=1683976073;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=73UYQ+UOpa+vWsmo5S3WE7zaLxbDHpDjBT6uMvtzgCQ=;
 b=KttSOHBqlu6qW5otd+PDHSR7lURbn09NIcI1Ou13VQoiOmhL4DtK9DiatQbCRHVtPP
 2cSFoCd7G5VzcgcnCcU40WINpwhM4r34sAFlD4QD+x7bMTVF2syttuE3NIqApu7UxY83
 EVJlLQMGOHfTt2a1U+87+rv69jtWA5DR1mLnSgA8ch3wPL1RSBX+qk/p3fR142eTQqW7
 oycj9apeqHQO1Eh9YEUqhQMwCUZ303isJBmqv0jxtZQn6e55VYV92LVi2SEhry9jr9wQ
 i16Yd0lypEiCe0gwnAbNINYpAw8URTQwIQQbsTMFsdjU7umntzzOkDTyMhLTlqarxsyk
 v8Lg==
X-Gm-Message-State: AAQBX9fKImIGxuQOjeiPTp4F3hyXUrEwK3rqoIdACZJoralnExmxeAmp
 9DzbXrRC1GUx9nY0EpUYj+htARBFT5y5Y0a7spk=
X-Google-Smtp-Source: AKy350axoW7aU1v2Nc9OAhbCwAemN9LK18kBhyqjh1SkWKTWqlvmkLiiWG/I/uJfYlWOxYi+wM4dcOdna/w/Ss25GOg=
X-Received: by 2002:a25:d44a:0:b0:b77:676c:773c with SMTP id
 m71-20020a25d44a000000b00b77676c773cmr1218667ybf.2.1681384073486; Thu, 13 Apr
 2023 04:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-3-hreitz@redhat.com>
 <20230412210641.GC2813183@fedora>
 <CAJaqyWfm=g_hr9=WpsnwJ4hdpVb7K7p5rirWjvx=PxKYUp8trA@mail.gmail.com>
In-Reply-To: <CAJaqyWfm=g_hr9=WpsnwJ4hdpVb7K7p5rirWjvx=PxKYUp8trA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 13 Apr 2023 07:07:41 -0400
Message-ID: <CAJSP0QW8fEJKnHMGFk+UFU=-f=5nEvY_zoOM=9f2M5UO4FC=Xw@mail.gmail.com>
Subject: Re: [PATCH 2/4] vhost-user: Interface for migration state transfer
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Hanna Czenczek <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org, 
 virtio-fs@redhat.com, German Maglione <gmaglione@redhat.com>, 
 Anton Kuchin <antonkuchin@yandex-team.ru>, Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb34.google.com
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

On Thu, 13 Apr 2023 at 06:15, Eugenio Perez Martin <eperezma@redhat.com> wr=
ote:
> On Wed, Apr 12, 2023 at 11:06=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat=
.com> wrote:
> > On Tue, Apr 11, 2023 at 05:05:13PM +0200, Hanna Czenczek wrote:
> > (And I hope vDPA will import the device state vhost-user messages
> > introduced in this series.)
> >
>
> I guess they will be needed for vdpa-fs devices? Is there any emulated
> virtio-fs in qemu?

Maybe also virtio-gpu or virtio-crypto, if someone decides to create
hardware or in-kernel implementations.

virtiofs is not built into QEMU, there are only vhost-user implementations.

Stefan

