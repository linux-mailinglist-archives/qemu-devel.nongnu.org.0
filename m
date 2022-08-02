Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 601E3587CFA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 15:22:40 +0200 (CEST)
Received: from localhost ([::1]:46758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIrr5-0002IB-0t
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 09:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIrlw-0006Si-HI
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:17:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIrlu-0001Mn-Bl
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:17:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659446237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hiZwybefKDNN0TR7hVOeBaQUNaHdwuAKx3xBVfhz1lw=;
 b=dsa8bpx70A757G0zHzmnAETRtTPCDu37VwoGdSAORHGdqybw0squDbzT4jp2/A51HkjEeh
 6uzt6aAg+KzIpZ28lgKkMex33Kg8ohNjHaeQ2jNO/C/YSBc/dSLnw/fhWWv4qNuYrd0kh5
 2b8MpXVgzUFQPYzjT60cTXM4KPRWpSI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-M9w-SJX7NUuluY3qVfFRlA-1; Tue, 02 Aug 2022 09:17:14 -0400
X-MC-Unique: M9w-SJX7NUuluY3qVfFRlA-1
Received: by mail-qt1-f199.google.com with SMTP id
 u12-20020a05622a010c00b0031ef5b46dc0so8972009qtw.16
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 06:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hiZwybefKDNN0TR7hVOeBaQUNaHdwuAKx3xBVfhz1lw=;
 b=pgbjgMxq7ygPOdjrvzcUxdtYoTehImDhf2MF+eqnCO4rtezYou+YXXM3hgm42dAcYA
 L54ryNdOFR5LL6RyqTDvjWAqyBvRfYNJ0SHblNB//NqSIxv0QMcmP8Zygbc+a5XwFUH+
 Aqn+05E6DCA1Bk3Ce3BVKOAAuoYYxKQc1ki47CgNyZlCNMhhgpjH+b5T1xRLsQSddE1K
 lcxM2L9QkTWTrlt/v7H3X/raDGqv6zDeoeyFkQi0X5g0TS1HrjZNs8Hc6HewKLvbm0SU
 etTSSSijEEcvuVcTUrAkbPtrTlhvoNuan3MYOxmF4EqdTKe/DETFbaOUss3HJayQX7AT
 ZFVw==
X-Gm-Message-State: ACgBeo0NmxY1nnM9UVgFQJt9XD8bIvrqLG61sGkMxDqVkbpM7UGBxz1M
 GlVGvf1Mr6+0/gJkwbRqhjrBmWs7oj10jLDkaRR8/9oIcSBdfkqSxkpRQAKaBE3nWyLcQeGd86m
 Y1SZrb3S1owcsxA+ZB3i+9a1zDw7KesU=
X-Received: by 2002:a0c:be91:0:b0:474:1d6:b1a4 with SMTP id
 n17-20020a0cbe91000000b0047401d6b1a4mr18379897qvi.108.1659446233689; 
 Tue, 02 Aug 2022 06:17:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR48mrnT3TwAxwefVrUkKBLsVx+MwDJ653wHhL9LHoG/k7Do6Oy5YI/IeUBuh2qEtDHkr9Sefrb6BZeeuUgIeK8=
X-Received: by 2002:a0c:be91:0:b0:474:1d6:b1a4 with SMTP id
 n17-20020a0cbe91000000b0047401d6b1a4mr18379881qvi.108.1659446233467; Tue, 02
 Aug 2022 06:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220802112447.249436-1-eperezma@redhat.com>
 <20220802112447.249436-3-eperezma@redhat.com>
 <72375be5-36d8-155c-9df8-da76c1d820c0@redhat.com>
 <20220802085655-mutt-send-email-mst@kernel.org>
 <ef5bcff0-a297-2173-40ce-6b8070ea9b3c@redhat.com>
 <20220802090938-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220802090938-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 2 Aug 2022 15:16:37 +0200
Message-ID: <CAJaqyWd9_ffdsiGP_NNpmZZQ_soJfMdD7UwhmFCAuyyVpAWiFQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] vdpa: Merge all net_init_vhost_vdpa error goto
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-level <qemu-devel@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org, 
 Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, Aug 2, 2022 at 3:10 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Aug 02, 2022 at 02:58:36PM +0200, Laurent Vivier wrote:
> > On 02/08/2022 14:57, Michael S. Tsirkin wrote:
> > > On Tue, Aug 02, 2022 at 02:10:43PM +0200, Laurent Vivier wrote:
> > > > On 02/08/2022 13:24, Eugenio P=C3=A9rez wrote:
> > > > > Few steps allocate new resources, and all of the allocated can be
> > > > > checked to avoid trying to free an invalid one.
> > > > >
> > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > >
> > >
> > > qemu-trivial too I guess then?
> >
> > For 7.1 or later?
> >
> > Thanks,
> > Laurent
>
> I don't really care. Since you are merging this you get to decide.
>

In my opinion it's better to leave that for a later revision.

I sent it to trivial because it only touches a few lines of code and
it's easy to review even without knowledge of net or vdpa subsystem,
but if it's not appropriate I can send future patches like this out of
trivial.

Thanks!

> > >
> > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > >
> > > > > ---
> > > > >    net/vhost-vdpa.c | 6 ++----
> > > > >    1 file changed, 2 insertions(+), 4 deletions(-)
> > > > >
> > > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > > index 303447a68e..ac1810723c 100644
> > > > > --- a/net/vhost-vdpa.c
> > > > > +++ b/net/vhost-vdpa.c
> > > > > @@ -588,8 +588,7 @@ int net_init_vhost_vdpa(const Netdev *netdev,=
 const char *name,
> > > > >        queue_pairs =3D vhost_vdpa_get_max_queue_pairs(vdpa_device=
_fd, features,
> > > > >                                                     &has_cvq, err=
p);
> > > > >        if (queue_pairs < 0) {
> > > > > -        qemu_close(vdpa_device_fd);
> > > > > -        return queue_pairs;
> > > > > +        goto err;
> > > > >        }
> > > > >        if (opts->x_svq) {
> > > > > @@ -604,7 +603,7 @@ int net_init_vhost_vdpa(const Netdev *netdev,=
 const char *name,
> > > > >            if (invalid_dev_features) {
> > > > >                error_setg(errp, "vdpa svq does not work with feat=
ures 0x%" PRIx64,
> > > > >                           invalid_dev_features);
> > > > > -            goto err_svq;
> > > > > +            goto err;
> > > > >            }
> > > > >            vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range)=
;
> > > > > @@ -640,7 +639,6 @@ err:
> > > > >            }
> > > > >        }
> > > > > -err_svq:
> > > > >        qemu_close(vdpa_device_fd);
> > > > >        return -1;
> > > >
> > > > Reviewed-by: Laurent Vivier <lvivier@redhat.com>
> > >
>


