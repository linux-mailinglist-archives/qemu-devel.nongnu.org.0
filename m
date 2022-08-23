Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC6D59D6E3
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 11:58:27 +0200 (CEST)
Received: from localhost ([::1]:56456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQQfy-0004SX-AI
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 05:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQQdk-0007xW-8t
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 05:56:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQQde-0001or-N2
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 05:56:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661248561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pIDNux3g0dlTQPxmhg7sBUPZhbM42YS/XrOHfqSCuzM=;
 b=DtuUFALP42x0pYTExwU5xKlRN96A9MOPv1NubgRamIwh0yJMHzQ0FFIKrwu85kYkOBCmH2
 Y+JUtNLRqCdS1qRi3TET00XBpCaZVbVa00e7Q7SubEdfOr02HUNhtz6kZrBe4N+NK1WNeM
 dJKjB3745av1UiM+AS7DD0ljlGelVhc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-443-rSk46cz7NVmNI2BuTzuxjg-1; Tue, 23 Aug 2022 05:55:53 -0400
X-MC-Unique: rSk46cz7NVmNI2BuTzuxjg-1
Received: by mail-qv1-f72.google.com with SMTP id
 s5-20020ad45005000000b00496db0fd2eeso3379253qvo.23
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 02:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=pIDNux3g0dlTQPxmhg7sBUPZhbM42YS/XrOHfqSCuzM=;
 b=XG975fbSmo10GYa8oJV5BvLmqmq/PdMUhh1bA7WLWW+HCdiQ4m6B7h41J/RQ5PCsiA
 TQ3aq47qCOpMvJDx3v/3xaYQlWVOWcvJUGwyPrUcpNJM4a2L7QVacajWsbkWN6nSxQqs
 E/RX6TtusRq3ZzNh/+qAlOafKRJWzb3YDpHs2uLahajailEeqJWN4UapxfhKMmqrAINR
 7u9PQoh+m9gkk34Pre12jSUjZE6FmsjEteqTj4CIzV08bM+Fx+NtF7B3WpKKrNSuugLO
 69xRJ5xZy7Pti5F0IUlI+jD3IbaVde8cGuXA35A4kS0bXu7d1hyWNyyx5+HgDYQui20i
 sfMQ==
X-Gm-Message-State: ACgBeo109CwRiAsi9jYh4/NZ14FTqvuzvL/SoxiZ7HWDYd8xx6PbaJas
 mspeyTPKSjjVd2G4mNzmrZVfidzJpeDVMAIiPtXEhaZPpLcpixfhC0+BPQv4I5e7ucs/CPuVPrN
 vcfF1HxHs5uH3+45Er7hPtFqvN0JN44w=
X-Received: by 2002:a05:6214:238e:b0:470:8ee8:52e6 with SMTP id
 fw14-20020a056214238e00b004708ee852e6mr18556567qvb.45.1661248552568; 
 Tue, 23 Aug 2022 02:55:52 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5WvCSU6cMKTma7Tsbe7NX+CJVTKzKfYvJLA9lTIZpOLF3yJKPRoheWlbMucUzu85uTJRqj8o/Sl3BZk5qbWxA=
X-Received: by 2002:a05:6214:238e:b0:470:8ee8:52e6 with SMTP id
 fw14-20020a056214238e00b004708ee852e6mr18556557qvb.45.1661248552345; Tue, 23
 Aug 2022 02:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220819165357.3591965-1-eperezma@redhat.com>
 <20220819165357.3591965-4-eperezma@redhat.com>
 <5c31c89d-4235-c8aa-18f4-0556dc579849@redhat.com>
In-Reply-To: <5c31c89d-4235-c8aa-18f4-0556dc579849@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 23 Aug 2022 11:55:16 +0200
Message-ID: <CAJaqyWfhqOW3ju-weOicFRPZ-nCrd17QpBEbHBOOzqtCOM6c9g@mail.gmail.com>
Subject: Re: [PATCH 3/7] util: make a copy of iova_tree_remove_parameter
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Lei Yang <leiyang@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Aug 23, 2022 at 8:18 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/8/20 00:53, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > It's convenient to call iova_tree_remove from a map returned from
> > iova_tree_find or iova_tree_find_iova.
>
>
> The looks like a hint of the defect of current API.
>
>
> >   With the current code this is not
> > possible, since we will free it, and then we will try to search for it
> > again.
> >
> > Fix it making a copy of the argument. Not applying a fixes tag, since
> > there is no use like that at the moment.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   util/iova-tree.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/util/iova-tree.c b/util/iova-tree.c
> > index fee530a579..713e3edd7b 100644
> > --- a/util/iova-tree.c
> > +++ b/util/iova-tree.c
> > @@ -166,9 +166,11 @@ void iova_tree_foreach(IOVATree *tree, iova_tree_i=
terator iterator)
> >
> >   void iova_tree_remove(IOVATree *tree, const DMAMap *map)
> >   {
> > +    /* Just in case caller is calling iova_tree_remove from a result o=
f find */
> > +    const DMAMap needle =3D *map;
>
>
> Then let's simply make iova_tree_remove() accept const DMAMap instead of
> the pointer to it.
>

Do you mean to accept DMAMap by value, isn't it? (no need for const it
then, isn't it?).

>
> >       const DMAMap *overlap;
> >
> > -    while ((overlap =3D iova_tree_find(tree, map))) {
> > +    while ((overlap =3D iova_tree_find(tree, &needle))) {
> >           g_tree_remove(tree->tree, overlap);
> >       }
>
>
> So we had following in iova_tree_insert():
>
>      /* We don't allow to insert range that overlaps with existings */
>      if (iova_tree_find(tree, map)) {
>          return IOVA_ERR_OVERLAP;
>      }
>
> I wonder how overlap can happen?
>

I don't get this part. The problem is that iova_tree_find returns a
pointer to an internal structure, there is no need to insert multiple
times overlapping maps.

Thanks!


