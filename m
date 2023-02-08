Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090A368F0E1
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 15:33:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPlUq-0008ND-Jo; Wed, 08 Feb 2023 09:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pPlUn-0008Mx-Tn
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:32:25 -0500
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pPlUj-0002Oz-S5
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:32:24 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-52bf225460cso12698537b3.4
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 06:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0LLYngw8A+tTzU0eFFBQCDBl93nWuzAZ3a6Se7a+EcY=;
 b=ooPZlFVOdsGihFmB9TgJIYzcUnk8SrS3ehy3U4N+p2+pR3KmZUW6xlfjGltJXMiJnL
 TLYcI+HE/mBRbIGlYtU8ZuSudc7X1nredkFF8tE8xWUgdbV/M6ALfZrNlkFkZ4AF21F0
 PkPP2RrE4M17BUd8CelXkFKJ1PfJUpZ7qeeiKeOmfclfph9m+GvBixwmbtPvuwJ/rTpv
 iIecI43FHAT82Oh9Ukno39I+yXTV644BZFthzBGotmcteVXJTjtYTKvBzBdHSkMSdZAU
 EhUBOpRsIOQ9wREtUHEysRCwGw2HQAmgIHTsB0DA6gqcpP07PN7vc/RYUsoxTJY+RJtS
 8c1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0LLYngw8A+tTzU0eFFBQCDBl93nWuzAZ3a6Se7a+EcY=;
 b=SN8Ac96P+6h0htdIv1CrW4G3MysR7awzNdNyDj7Q1h/XJq0hAzbX80XKhH6/2RPNIm
 zfyGGEli/oaIJv3lEf2rRmLta6fbYEBYPwaYqRm/j8fWKYas3xf/CWarQf2pjyxLU7eU
 rGMaX5Wly+copnLKkG9H5E/3lec4MS4QaFUR8jZii+gKO7Bq56WROn1FQJrWer2AArxO
 t+umn+V4+nIVv7PCkisDOLP8xHjhqwRyc3s5GDpoY6OKcQUGy4X6DHGAiCJPxYNMlYt9
 eq2VDJodGDyZ7JRv5pee7JKkwyJ8LJtXS8DO9VWOrX6Z/TaUfkGXt085JGT8evET9dve
 RudA==
X-Gm-Message-State: AO0yUKUSVPOU3GKef8nvgxeKpBnd2Rnmkwu9U9IEdBZEe1j7+h7TYv03
 U15YmnEGgjkVZlfw8UiEwV4/o7qN4E2lpHqmMK8=
X-Google-Smtp-Source: AK7set+grd/nMETgKCxtRaF03q+oXoQY/rAyE939/MyI6GTel7vXEcebY5g+/5pZFDj16yoosY4N4yQfGOIm+qH+WD0=
X-Received: by 2002:a0d:f804:0:b0:527:ad38:2c5b with SMTP id
 i4-20020a0df804000000b00527ad382c5bmr1024673ywf.336.1675866737986; Wed, 08
 Feb 2023 06:32:17 -0800 (PST)
MIME-Version: 1.0
References: <fb523956-7a8c-608b-6db1-961686b73e9c@redhat.com>
 <CAJSP0QWnq6av7j6x_n-C2mLSPMYBhMeEthr6ayPN-cmsEB3UnA@mail.gmail.com>
 <f26dd5ed-fa02-faeb-fadb-0dbfbe7792d3@redhat.com>
 <CAJSP0QWA5j8J_nsUWwh5a18XsoJxjtRutLQzXT6JT1LwLbxCCA@mail.gmail.com>
In-Reply-To: <CAJSP0QWA5j8J_nsUWwh5a18XsoJxjtRutLQzXT6JT1LwLbxCCA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 8 Feb 2023 09:32:05 -0500
Message-ID: <CAJSP0QWh-4cYfKK3ea4qwcaGrmXpS0npxvhzr0JG7rNUjfrB=A@mail.gmail.com>
Subject: Re: vhost-user (virtio-fs) migration: back end state
To: Hanna Czenczek <hreitz@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Dave Gilbert <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1130.google.com
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

On Tue, 7 Feb 2023 at 07:29, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Tue, 7 Feb 2023 at 04:08, Hanna Czenczek <hreitz@redhat.com> wrote:
> > On 06.02.23 17:27, Stefan Hajnoczi wrote:
> > > On Mon, 6 Feb 2023 at 07:36, Hanna Czenczek <hreitz@redhat.com> wrote=
:
> > > Should we schedule a call with Jason, Michael, Juan, David, etc to
> > > discuss further? That way there's less chance of spending weeks
> > > working on something only to be asked to change the approach later.
> >
> > Sure, sounds good!  I=E2=80=99ve taken a look into what state we=E2=80=
=99ll need to
> > migrate already, but I=E2=80=99ll take a more detailed look now so that=
 it=E2=80=99s
> > clear what our requirements are.

Hi Hanna,
The next step is getting agreement on how the vhost-user device state
interface will work. Do you want to draft the new vhost-user protocol
messages and put together slides for discussion with Michael, Jason,
Juan, and David in the next KVM call? That might be the best way to
get agreement. Doing it via email is possible too but I guess it will
take longer.

If you don't want to design the vhost-user protocol changes yourself
then someone on this email thread can help with that.

Stefan

