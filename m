Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E28D493F73
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 18:59:27 +0100 (CET)
Received: from localhost ([::1]:54012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAFF0-0000oM-6f
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 12:59:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nAF9S-0003Yu-MT
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:53:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nAF9R-0002zy-7d
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:53:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642614817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v35bLi2ZFmq9uH1xf/kyHNNSeC+97nresOlLSQQFfNw=;
 b=heu4ef73sWp/v61+ZbZihouyLc6V4GyzBy4g9Vl53i+2sN1dyJ9Ty3YIccdrEhG2iChrKg
 Gw5CgQARgcIRyyv6sTp6ne8hn/nCDicQxWP+dNVb7LyQnkhGQSuTGbKJGx9ede9Ig0nygr
 jZT/UOBliTwgmL0A2F87M1mrOepNZMg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-8biSzv5UM-K658g_jasU9g-1; Wed, 19 Jan 2022 12:53:35 -0500
X-MC-Unique: 8biSzv5UM-K658g_jasU9g-1
Received: by mail-ed1-f69.google.com with SMTP id
 h21-20020aa7c955000000b0040390b2bfc5so3336058edt.15
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 09:53:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v35bLi2ZFmq9uH1xf/kyHNNSeC+97nresOlLSQQFfNw=;
 b=3pIfbMy6b/LvTYrF8Z/jyMmlgzbVuGjr6IfGhYo2LNI9DbAvBzPL7bpgVb1KF94vPi
 0hP6iuKWEBXNAmIKa3SbHti9jD4y09krfn2grosrFl0/hYYyXIYt6Wkn/234PNbAmOef
 31HXxcw0qFeZYBeBeyuDyeL7Pq7c5azxS0747GhzhPXZuYkuJ4B5cSfKHqOOEhp45afZ
 GjsjjBwx5re0xsd+B8OUTbIrsFCqYJXOnFaFqG+J/EK2sbJAACutAq5zTZwtvPviBK9e
 167qxs4E/HiXptTvkEYckwzrQlq/U9PaFV8DZdIlusC9Ow30dEYoAh1JagRhPSrNv42q
 +Ppg==
X-Gm-Message-State: AOAM5301fAKW5cJ5NeQmIaVMGyHz9AWtgnH+p/VhgziJ8MyU/joOLxLr
 /ppa7TQF0SUTMeKobAH7Ya42N2owMuvzfH2yfZpn4ZxjMP0gTUpg7BLV6BG6jiiuylxW8Sog3j+
 AioMktMrHvTd1G2vXRG+VDWOy46dhiEM=
X-Received: by 2002:ac2:5b9e:: with SMTP id o30mr28158656lfn.473.1642614814656; 
 Wed, 19 Jan 2022 09:53:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyk3gfMx1tKOW5Q6afnS5/tRUrGzeETBKo06q+dO5lW4f0X2v+OE82cZ/b1v7krtcjxnBmthh/Vpoz2xfeiPPs=
X-Received: by 2002:ac2:5b9e:: with SMTP id o30mr28158635lfn.473.1642614814386; 
 Wed, 19 Jan 2022 09:53:34 -0800 (PST)
MIME-Version: 1.0
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-4-leobras@redhat.com>
 <Yd/OAt8z35orDwOM@xz-m1.local>
In-Reply-To: <Yd/OAt8z35orDwOM@xz-m1.local>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 19 Jan 2022 14:53:23 -0300
Message-ID: <CAJ6HWG6+Sr1gfM9dvadLCK5Hv=3Gr0n1Na1ebXgPGaSUwcVJ1g@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] migration: Add zero-copy parameter for QMP/HMP for
 Linux
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Peter,

On Thu, Jan 13, 2022 at 4:00 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Thu, Jan 06, 2022 at 07:13:40PM -0300, Leonardo Bras wrote:
> > Add property that allows zero-copy migration of memory pages,
> > and also includes a helper function migrate_use_zero_copy() to check
> > if it's enabled.
> >
> > No code is introduced to actually do the migration, but it allow
> > future implementations to enable/disable this feature.
> >
> > On non-Linux builds this parameter is compiled-out.
>
> I feel sad every time seeing a new parameter needs to be mostly duplicated 3
> times in the code. :(
>
> > diff --git a/migration/socket.c b/migration/socket.c
> > index 05705a32d8..f7a77aafd3 100644
> > --- a/migration/socket.c
> > +++ b/migration/socket.c
> > @@ -77,6 +77,11 @@ static void socket_outgoing_migration(QIOTask *task,
> >      } else {
> >          trace_migration_socket_outgoing_connected(data->hostname);
> >      }
> > +
> > +    if (migrate_use_zero_copy()) {
> > +        error_setg(&err, "Zero copy not available in migration");
> > +    }
>
> I got confused the 1st time looking at it..  I think this is not strongly
> needed, but that's okay:

The idea is to avoid some future issues on testing migration while bisecting.

>
> Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks Peter!

>
> Thanks,
>
> --
> Peter Xu
>


