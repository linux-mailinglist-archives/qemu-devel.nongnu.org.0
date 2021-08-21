Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4803F3C53
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 21:56:54 +0200 (CEST)
Received: from localhost ([::1]:37116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHX6X-00080n-9w
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 15:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mHX4u-0006ej-MP
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 15:54:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mHX4r-00010K-8c
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 15:54:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629575687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZVG97vXDLBAiuYorE7Lx7KklCWfi/sU5Oecj8wD2Z54=;
 b=F6pEqGHNywr9oHCCOEEdDRhiELyIJgP+DExsSVejdhem38gC9oU7qjWtyujvtMmxlqp+P+
 urGNm6D+bG2RRIJkcXDaeAUuRepTBN8LuPYWZzKXWM7fnd6CCknhiP10gvFRQFZrviUlAL
 nfqy+hP20Npw0kh1HHq4++3iPu0IK/E=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-utctTrwON9STYdR64YA3CQ-1; Sat, 21 Aug 2021 15:54:45 -0400
X-MC-Unique: utctTrwON9STYdR64YA3CQ-1
Received: by mail-ot1-f69.google.com with SMTP id
 c88-20020a9d27e1000000b0051abe1bcbb9so5749510otb.1
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 12:54:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZVG97vXDLBAiuYorE7Lx7KklCWfi/sU5Oecj8wD2Z54=;
 b=avbdCpJAzEQU/Hva0KULcmhNmnnS+r6ehwZgp+64xquDHPzfISVpMuvt80PAupWm20
 XZPj87d8RPKVlbRcNFw9IKgLDgUYk9Y7KXFXAuTF2Z6dANS+2AEg3LMAA1EDIuM7pUH8
 JeVWfA6LvOUHXjVO+kneDnFro7CnYPZA+mwfW99ciouSecZSP6dndX8hLnXg7dditM2k
 h3Z35GdNBi5b6cHAZd/RsISk6PCPQT1UeDlZGDJuXBnKBZXnaNGoLklMKHT5ABOZHkc9
 +1bBNgTuO0jVNbJFHP51lQ0912iYkbIrkb6ux73gSsZaV2/FYfjf39maHVxi8xKtMHLP
 Xo9w==
X-Gm-Message-State: AOAM533EEDhVAM4/cX3surl4cFfxVeCkNa0aq6ktvDoFT/LzBsp9o8D8
 oaiiR9QX6pheUeTFkjiHSZhq0jvbvpRIZp1/1cyS8KO7/MwadKmwPXK22xeFMZ6ln4FnpgRLMbC
 VU120UmDPeOP7svaFm97vhG/SXk7SHUc=
X-Received: by 2002:a9d:5d01:: with SMTP id b1mr4411662oti.263.1629575684951; 
 Sat, 21 Aug 2021 12:54:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkI5CjlWKI++ZSvnnadlP1ZDo4aDzGmh743nF+Mt4Getn4gJxb32UU4yxdYHKTAoMFEmH5snI2WrxbrqjAHEk=
X-Received: by 2002:a9d:5d01:: with SMTP id b1mr4411648oti.263.1629575684786; 
 Sat, 21 Aug 2021 12:54:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210819173831.23515-1-niteesh.gs@gmail.com>
 <20210819173831.23515-3-niteesh.gs@gmail.com>
In-Reply-To: <20210819173831.23515-3-niteesh.gs@gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Sat, 21 Aug 2021 15:54:34 -0400
Message-ID: <CAFn=p-aOwoF78aiM4XMt4cCCaYQi+f75SC=9N1izN9KCKOgUxA@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] python: Add dependencies for AQMP TUI
To: G S Niteesh Babu <niteesh.gs@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000d39df005ca17270a"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d39df005ca17270a
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 19, 2021 at 1:39 PM G S Niteesh Babu <niteesh.gs@gmail.com>
wrote:

> Added dependencies for the upcoming AQMP TUI under the optional
> 'tui' group.
>
> The same dependencies have also been added under the devel group
> since no work around has been found for optional groups to imply
> other optional groups.
>
> Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
>

Reviewed-by: John Snow <jsnow@redhat.com>

--000000000000d39df005ca17270a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 19, 2021 at 1:39 PM G S N=
iteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com">niteesh.gs@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Added dependencies for the upcoming AQMP TUI under the optional<br>
&#39;tui&#39; group.<br>
<br>
The same dependencies have also been added under the devel group<br>
since no work around has been found for optional groups to imply<br>
other optional groups.<br>
<br>
Signed-off-by: G S Niteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com"=
 target=3D"_blank">niteesh.gs@gmail.com</a>&gt;<br></blockquote><div><br></=
div><div>Reviewed-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsn=
ow@redhat.com</a>&gt;<br></div><div>=C2=A0</div></div></div>

--000000000000d39df005ca17270a--


