Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478FD56AD52
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 23:18:05 +0200 (CEST)
Received: from localhost ([::1]:44734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Ysu-0003Un-Bw
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 17:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o9Yra-0001yU-8Q
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 17:16:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o9YrW-00089u-Dd
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 17:16:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657228597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eqvmCd1TX67k6XQscj/7HtU8gS4dXaCmWyaO6PUrsKU=;
 b=BacUlreJ5zWltumI7mH4Q5tn07flvcVRv8Qur3Z+D3fgUoVbA2YeAwc2TF70sWaIWv4FfQ
 xkB6Y9h0obwjV5MWeUbpxljtpxX9dXJMhJ2/yJ2kzMlomww/fHL5KgMjl7dR12XozM3ADR
 8uNNGKCLwkfIVV1ziMO1sPLGeFpzPPk=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-ma4uP7W3ONOQsyWVVMOnew-1; Thu, 07 Jul 2022 17:16:36 -0400
X-MC-Unique: ma4uP7W3ONOQsyWVVMOnew-1
Received: by mail-vk1-f197.google.com with SMTP id
 l19-20020ac5c353000000b0036c1d249b61so5771569vkk.12
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 14:16:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=eqvmCd1TX67k6XQscj/7HtU8gS4dXaCmWyaO6PUrsKU=;
 b=wYUYuX8zEvoaaXaLwUEWEvkAfTrCSUBdOIlxCuWyKGy9PjRTQYXl5LrmQOfMQNk0vd
 9ewg23wZen3XVy1NTJOx1fhmzqS6cGBF9oP2zk0SFXWiYS7tfhAptVCelt0/klNkbekv
 IkADZz01pTlGK6HXJ3Kce6ZWfj5fAFjC3edZ6NnnWUb2pNcLSp+76Vv2PK6OgG5oQQN4
 shXYkd/9ln+193Am77jW3lcDIGvIwz8AzUrcVi05hbhZwsr+KQvS4fRMPxJkU6Vf9AfV
 QwsxOYYlNrJdZvCFBgVo1pY9SrBzeKyuh5iUVFyXOf+ow68baVSwujd8g19BOSprtZxH
 o7PA==
X-Gm-Message-State: AJIora86Fwy4SnJPjZNCcox1xREW7u7ifY8A9/KcbNtL85zJuqrXamDa
 N3v4BOU1zziMM93SiPjObXbrd80Pc4CQF07dc3BqMZgw9GqMQ0IBCpsvMv1akr1qbya35an3MDK
 cWMFeTkdasIv+6cg=
X-Received: by 2002:a67:345:0:b0:356:2b49:75f8 with SMTP id
 66-20020a670345000000b003562b4975f8mr27287354vsd.49.1657228595549; 
 Thu, 07 Jul 2022 14:16:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tUKf3GODD3myMoMdHLPlUFQq7Sk3rGPnNPR2INMK46sqHKUMieQz8/NuZPZL5ZU9VKubCKVA==
X-Received: by 2002:a67:345:0:b0:356:2b49:75f8 with SMTP id
 66-20020a670345000000b003562b4975f8mr27287339vsd.49.1657228595355; 
 Thu, 07 Jul 2022 14:16:35 -0700 (PDT)
Received: from ?IPv6:2804:431:c7ec:44c:8a5c:6c79:3007:b149?
 ([2804:431:c7ec:44c:8a5c:6c79:3007:b149])
 by smtp.gmail.com with ESMTPSA id
 r23-20020ab03317000000b00370fe98f896sm11953987uao.7.2022.07.07.14.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 14:16:34 -0700 (PDT)
Message-ID: <05b5798177bcf5345c0a2d4f2586b037d80a2134.camel@redhat.com>
Subject: Re: [PATCH v3 2/3] Add dirty-sync-missed-zero-copy migration stat
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Juan
 Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Date: Thu, 07 Jul 2022 18:16:31 -0300
In-Reply-To: <Ysc6gFpbuxW0GQFI@xz-m1.local>
References: <20220704202315.507145-1-leobras@redhat.com>
 <20220704202315.507145-3-leobras@redhat.com> <Yscdy/YZZ6H1Qpr3@xz-m1.local>
 <CAJ6HWG7CDKKWfyiPQqRtUzEmnB5gTzHdOMJMTH1VvV1wG6LVoA@mail.gmail.com>
 <Ysc6gFpbuxW0GQFI@xz-m1.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
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

On Thu, 2022-07-07 at 15:56 -0400, Peter Xu wrote:
> On Thu, Jul 07, 2022 at 04:50:47PM -0300, Leonardo Bras Soares Passos wro=
te:
> > > I also think we should squash
> > > patch 2/3 as patch 3 only started to provide meaningful values.
> >=20
> > IIRC Previously in zero-copy-send implementation, I was asked to keep t=
he
> > property/capability in a separated patch in order to make it easier to
> > review.
> > So I thought it would be helpful now.
>=20
> Ah, that's fine then.
>=20
> > > > diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> > > > index ca98df0495..5f3be9e405 100644
> > > > --- a/monitor/hmp-cmds.c
> > > > +++ b/monitor/hmp-cmds.c
> > > > @@ -307,6 +307,10 @@ void hmp_info_migrate(Monitor *mon, const QDic=
t
> > > > *qdict)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 monitor_printf(mon, "postcopy ram: %" PRIu64 " kbytes\n",
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 info->ram->postcopy_bytes >> 10);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (info->ram->dirty_sy=
nc_missed_zero_copy) {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 monitor_printf(mon, "missed zero-copy on: %" PRIu64 "
> > > > iterations\n",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 info->ram->dirty_sync_missed_zero_copy);
> > >=20
> > > I suggest we don't call it "iterations" because it's not the generic =
mean
> > > of iterations.
> >=20
> > Yeah, I thought that too, but I could not think on anything better.
> > What do you suggest instead?
>=20
> "Zero-copy-send fallbacks happened: xxx times\n"?

Oh, yeah, that will work.
I was thinking on keeping the pattern and ended up thinking what was the co=
rrect
unit. But this is much simpler and work better.

Best regards,
Leo

>=20


