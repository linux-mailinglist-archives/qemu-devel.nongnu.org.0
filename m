Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBE8433228
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 11:24:29 +0200 (CEST)
Received: from localhost ([::1]:56962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mclMC-0006on-Iz
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 05:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mclKw-00068f-9o
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:23:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mclKt-0000IX-Qt
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:23:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634635386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5dOMAmjJ1NmVLkZXWpPR0rfcH1eaWxoEb1OmyD2mhGA=;
 b=byCWqFxYWcujIBQGvBRh0zBo7A/YMRxebIYu8wGb+t95t3LSuaYUUItErwRzhs4PpAvfAj
 nwSNh44z4KtjdNcg7ScDYihDn89En00E/c9q6h1HISdksEmuvyJ4QcfV80SfNFuluiELW9
 rQo1jVb8Jcj6Z6J1CuVw6fG+HO1wWjE=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-zu2CivSLPuu5OfvCbOqh_w-1; Tue, 19 Oct 2021 05:23:05 -0400
X-MC-Unique: zu2CivSLPuu5OfvCbOqh_w-1
Received: by mail-lf1-f70.google.com with SMTP id
 i19-20020a0565123e1300b003fdc4e26333so1183853lfv.12
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 02:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=5dOMAmjJ1NmVLkZXWpPR0rfcH1eaWxoEb1OmyD2mhGA=;
 b=wJ1J/54FtTMIc4v2GDvhDC89wtNggzI1NIEoWzXEGcaKUVvtUq/YbEo2Ggph8t65S7
 zlwAydwVpQV48fVyM7Z06oQTa7gVeogwPsI6DaaN+CuoMjk2U93DvpKnGe6Ozx2kPHl2
 g4ZmpNGB10zVpYjvmGig+MSZS5Ur9j2n76iV28OyBbJHrDFKxJf3xS70y0plum3Girgs
 aW2A19EcSBO+pCYW5kAysMwZRaGvGt9MgYAwEVzoTX1FCu+N88sAs1LtYH4H/skiThOy
 u2iKM6eCLUPHM9mNsNiz7/afGe/d471wym7no6dzoMfbMl+KrKvmWqkfO+n+hzYM3AUF
 KXyQ==
X-Gm-Message-State: AOAM533W65qz6PgUGX2ws4YjgturLXIpqeR4kqC7UY+YOsiS+Df9gCqs
 dghTVWI/p7zTM5JxLgb+sY1LM7XgCg+hM/o97tEHWtCEVp8vuPZ5oCPud/o/rNaptL1n44a5/TQ
 wDOJlo/tLHayE3jKjnz+CRCkg8lg237I=
X-Received: by 2002:a2e:7105:: with SMTP id m5mr3003615ljc.420.1634635383976; 
 Tue, 19 Oct 2021 02:23:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywmj1zDZGpW2nMZTfi4AsIUthGwNh7DxWEWiKM/pjCud25XABUSqBdWaoGQsSZq793VRSGoEmBZ91HxBPzs+c=
X-Received: by 2002:a2e:7105:: with SMTP id m5mr3003596ljc.420.1634635383728; 
 Tue, 19 Oct 2021 02:23:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-19-eperezma@redhat.com>
 <79905c11-e313-ad60-17dc-1a47d35f12cc@redhat.com>
In-Reply-To: <79905c11-e313-ad60-17dc-1a47d35f12cc@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 19 Oct 2021 17:22:52 +0800
Message-ID: <CACGkMEtc6tw5xauzw=1zSFUfC0oSRfokZbA6QsR7nEe5T7-4_A@mail.gmail.com>
Subject: Re: [RFC PATCH v4 18/20] vhost: Add VhostIOVATree
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 4:32 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:06, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > This tree is able to look for a translated address from an IOVA address=
.
> >
> > At first glance is similar to util/iova-tree. However, SVQ working on
> > devices with limited IOVA space need more capabilities, like allocating
> > IOVA chunks or perform reverse translations (qemu addresses to iova).
>
>
> I don't see any reverse translation is used in the shadow code. Or
> anything I missed?

Ok, it looks to me that it is used in the iova allocator. But I think
it's better to decouple it to an independent allocator instead of
vhost iova tree.

Thanks


