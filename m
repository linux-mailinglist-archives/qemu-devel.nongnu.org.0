Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C483E1C45
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 21:16:47 +0200 (CEST)
Received: from localhost ([::1]:39416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBirG-0001Bg-Hq
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 15:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBiox-0007Nc-N9
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:14:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBiov-0004FN-17
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:14:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628190860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j5dZkIBmPHIibfpqvzTivxFZe7OBjU7XgpQUAlAdfeQ=;
 b=L1wAdnF+FDb+PUwBuEoLBpy3igsSsktdXe2pmVMZ1NzwY3AnUbnH424GejnyNMaFoyCQen
 8q48V1ypXwWzd3OeIPsXBSy5U6ozAIvoUMEZd7TKXVeWp6eeFhHCgL9rIkna1mXO7cBymr
 Ejt/K4uzE9FADHzFTyPeSUNpn1ytj/w=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-c1WYSIKQMyGwS4wqn18ygQ-1; Thu, 05 Aug 2021 15:14:18 -0400
X-MC-Unique: c1WYSIKQMyGwS4wqn18ygQ-1
Received: by mail-ot1-f70.google.com with SMTP id
 b1-20020a0568301041b02904d0a18787d4so2505925otp.5
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 12:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j5dZkIBmPHIibfpqvzTivxFZe7OBjU7XgpQUAlAdfeQ=;
 b=jMvaeb4ValhvP/iaOFK8vMAGw78H78IcYIeCGSIgBjxbL3rbmFctemyXm+Xx5UofiF
 id4ZHN4YM7J9iJFW+8U2LcerYKeWaTHSK6QQTR+Op3uhvCaUAlhrIJfLbUPebCmTzkTc
 agF5LeVsjzk7MAvvKPGbUpj+Yyf7EnbY/VLyXolSMRau8cywPVD6T0AAbRc1aYcYqwt7
 oLR/BY/v+0PamnvNgmXg4FuaedGJHKjHXgN5x/cgJ9r8xf4twbnAZUSqvzHLnRphbX4L
 zv2pXDkKQCKFsh7BiC1CiNWpkVYC/jRYN6N3qnHD3PdbzPZHjOcA6sIlXFuA6DYH/tmg
 1j7A==
X-Gm-Message-State: AOAM5339WSFXiL3ZFPU/wknS2VDsl1CQVNHEfOTiL86U4Jy9uGf9Vsid
 KRcSDdUaHR59XZUrhZAtGjFZz3t3zauTmdXiNIfRcORbZPz4ihPDTusijNtUiEN6JSOXjGGY8iF
 ++hlT3/g3Yq8LIfbKdn6KpMcWlxz3y60=
X-Received: by 2002:a9d:2782:: with SMTP id c2mr4894433otb.323.1628190857858; 
 Thu, 05 Aug 2021 12:14:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyB34YJuwHhX4bWvM8b8IEdUOvySe493UeDBu7tNG65JrCX32RP17qaiDhnqwRoMF8P/wHMj2h/T/E4yBvDJg=
X-Received: by 2002:a9d:2782:: with SMTP id c2mr4894417otb.323.1628190857728; 
 Thu, 05 Aug 2021 12:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210730201846.5147-1-niteesh.gs@gmail.com>
 <20210730201846.5147-6-niteesh.gs@gmail.com>
In-Reply-To: <20210730201846.5147-6-niteesh.gs@gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 5 Aug 2021 15:14:07 -0400
Message-ID: <CAFn=p-bcrx6Aoeq1waZ639Nxxfdd-qtzvEDm08Pk0LiNcHPT5Q@mail.gmail.com>
Subject: Re: [PATCH v3 05/13] python: add entry point for aqmp-tui
To: G S Niteesh Babu <niteesh.gs@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b3a7f605c8d4b9fa"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b3a7f605c8d4b9fa
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 30, 2021 at 4:19 PM G S Niteesh Babu <niteesh.gs@gmail.com>
wrote:

> Add an entry point for aqmp-tui. This will allow it to be run from
> the command line using "aqmp-tui localhost:1234"
> More options available in the TUI can be found using "aqmp-tui -h"
>
> Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
>

Reviewed-by: John Snow <jsnow@redhat.com>

--000000000000b3a7f605c8d4b9fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 30, 2021 at 4:19 PM G S N=
iteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com">niteesh.gs@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Add an entry point for aqmp-tui. This will allow it to be run from<br>
the command line using &quot;aqmp-tui localhost:1234&quot;<br>
More options available in the TUI can be found using &quot;aqmp-tui -h&quot=
;<br>
<br>
Signed-off-by: G S Niteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com"=
 target=3D"_blank">niteesh.gs@gmail.com</a>&gt;<br></blockquote><div><br></=
div><div>Reviewed-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsn=
ow@redhat.com</a>&gt;</div></div></div>

--000000000000b3a7f605c8d4b9fa--


