Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1036156D68E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 09:17:23 +0200 (CEST)
Received: from localhost ([::1]:50150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAnfV-0005tU-Vc
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 03:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oAnd6-0004MW-SK
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 03:14:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oAnd3-0006ot-Sj
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 03:14:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657523688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N6FnTRLk8k2t/W/sQZS8OeNezWkX3L3N9JflCIeZhP0=;
 b=HkDteuo/gbMPZUmMofjvZ7yf8ngYFDkkR29AcV2nJQU/1w30j0mw6l7q/aU5yK5PFaids/
 UnwAmnYGcMpst/t5tp2yj5aprI4rN2IFcxvhLA/zjNz9sKc+guF2zepityKARxr4FS3otH
 96J9QreizxLM1LLx+bpYd1FOF44ajL8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-gfcUfBkDN8SCNsdsmkp3IA-1; Mon, 11 Jul 2022 03:14:41 -0400
X-MC-Unique: gfcUfBkDN8SCNsdsmkp3IA-1
Received: by mail-qt1-f197.google.com with SMTP id
 h25-20020ac87779000000b0031ea852ca63so4298822qtu.11
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 00:14:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=N6FnTRLk8k2t/W/sQZS8OeNezWkX3L3N9JflCIeZhP0=;
 b=JVfHhfCu3XSQUuVTk0j289k9q/9bKcd6hpWQBGodUCdL5m+AI4XB2utOEQR7005s0D
 M67vsuBO8PdT5JsDNjiKl124pKEkyUQ1QK6FN2rg9i63f6JolGVPiPH9zeJV1A88gnZq
 9B52MY1ql+2VXNYaPfUfsf/qAgn/iiNK5niwHupmhtGR2TIcsDWFRyskoICb/YgFUYc+
 GyDuz0PGUyPK7GnXUV5RirlYmQyWVGxV0cd+y8oIM1+yIJWecY1NBve77/oFo/5jleL8
 1mw59N+DdGTW+nrUjKZo9kUugDaKbxWpiTPzNV5Jv69d+WsKyYEEb3UzyZJIPrc3US+C
 3kCA==
X-Gm-Message-State: AJIora/sB6XamHY13q9qWdRSENSIYFCR/msGuvD0n9MYBGDvvnHoqB6G
 ryGEvlDxfxAgn295rbmjrNFZRLBt/BDnZCjYR3t0WT5sw1OFImVM1tYR7RXnSBfgP4LBmR6LQpu
 EcZtV/SZs4d1tqNRjPbm9oY5NTyXZ69s=
X-Received: by 2002:ac8:5b51:0:b0:317:3513:cf60 with SMTP id
 n17-20020ac85b51000000b003173513cf60mr12870354qtw.495.1657523681267; 
 Mon, 11 Jul 2022 00:14:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uycCdxJGg2TIi5AdlnBkGBRMzxBKN2NHWSwkvil5Toas6PZWm6i4YkqxDmuCdI7r7E4EGsNxwCz+WE1O+f7jk=
X-Received: by 2002:ac8:5b51:0:b0:317:3513:cf60 with SMTP id
 n17-20020ac85b51000000b003173513cf60mr12870344qtw.495.1657523681032; Mon, 11
 Jul 2022 00:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-24-eperezma@redhat.com>
 <87ilo9igph.fsf@pond.sub.org>
 <CAJaqyWff6kfi6UAwvU64vj-q6CuncYBQnE4=P_3cGAGeL-rNVg@mail.gmail.com>
 <87let37op4.fsf@pond.sub.org>
In-Reply-To: <87let37op4.fsf@pond.sub.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 11 Jul 2022 09:14:08 +0200
Message-ID: <CAJaqyWdd61GxmkOT8BiL-Wc+vcP5QAN8VozXdkYrPOSJJg4bSA@mail.gmail.com>
Subject: Re: [RFC PATCH v9 23/23] vdpa: Add x-svq to NetdevVhostVDPAOptions
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eric Blake <eblake@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
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

On Fri, Jul 8, 2022 at 2:51 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Eugenio Perez Martin <eperezma@redhat.com> writes:
>
> > On Thu, Jul 7, 2022 at 8:23 AM Markus Armbruster <armbru@redhat.com> wr=
ote:
> >>
> >> Eugenio P=C3=A9rez <eperezma@redhat.com> writes:
> >>
> >> > Finally offering the possibility to enable SVQ from the command line=
.
> >>
> >> QMP, too, I guess.
> >>
> >
> > Hi Markus,
> >
> > I'm not sure what you mean. Dynamic enabling / disabling of SVQ was
> > delayed, and now it's only possible to enable or disable it from the
> > beginning of the run of qemu. Do you mean to enable SVQ before
> > starting the guest somehow?
>
> QMP command netdev_add takes a Netdev argument.  Branch 'vhost-vdpa' has
> member x-svq.  Are you telling me it doesn't work there?  Or only before
> the guest runs?
>

Oh, that's right, adding a device via QMP works as you describe.

Thanks!

> [...]
>


