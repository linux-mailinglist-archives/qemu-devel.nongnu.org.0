Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C34E73E1AB6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 19:46:38 +0200 (CEST)
Received: from localhost ([::1]:58914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBhS1-0003uH-9S
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 13:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBhPm-000227-Uh
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 13:44:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBhPl-0007re-H6
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 13:44:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628185456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kEfvl2mbytzUtv44BoTUbJ9T36rNoG30yEhqFmSv5Ec=;
 b=RiRVCnbhpmYZ/3Tiz4s1r3Qpt19WuWQ7fuIq2Uhvv5Jx1wK9yNb568zD6lMMnQRvSSCYPK
 4fhqXWNJlsUTTHVg3E+mTYtuU50csmMzdwbWUqDhOmzzDI9HR0CyZzrUwqoto7hS6IldAS
 FTGfIz1X3kTdIKMmyMhQLQu82xGv50I=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-U4uxFxv9Nl2UEs3JslWHtw-1; Thu, 05 Aug 2021 13:44:15 -0400
X-MC-Unique: U4uxFxv9Nl2UEs3JslWHtw-1
Received: by mail-oo1-f71.google.com with SMTP id
 f24-20020a4ada580000b029024abe096a35so2193981oou.12
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 10:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kEfvl2mbytzUtv44BoTUbJ9T36rNoG30yEhqFmSv5Ec=;
 b=bWtsj5PFSDuSWc/jFlT33kcJPNCLfxN3r8Xhp1fMG/FlRGmkANQdqMUnsadRtrmoSQ
 5VLEDSL2FOmyX+BJYIVwBnfAdX9yOVzLIl5SADzAtWhmElxiIpabNPc2H+JmNjYNuIvA
 /64cLRQEAjrVyaHvApbbpvZvPpGP8SnW/fYB2qWkrAuL7k6El4r6eZEcsmILrJQvwycC
 bMJb4gI61kcKng2OfCopnNA3oxe5+Lsj9617+zB+RduVAh1r2uongtRXsX/UiZc3FeUq
 l+Ec2VSo88S5Mr8SP8Th9cJjDJakiT78iQDjJ/PzY4OqWkGqhgdxb86X8KUlCbzShFHo
 frEQ==
X-Gm-Message-State: AOAM532tp2oCp/IdB6uF5BArucfp6p0ZMp91Rv8yir9CsThIOYhCjBZ2
 yV0ZJ96YrqIXRI4yTKtTTZ1YiGRHZQgKG/tbSpX8vdd1+DkfP/DZWgoLOeAUpS2ubunxc2v9Prk
 wfCinHFc8yGFOZVO3MGbJPb+HHZl8OwE=
X-Received: by 2002:a05:6830:1604:: with SMTP id
 g4mr4744079otr.45.1628185454336; 
 Thu, 05 Aug 2021 10:44:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwR6GIfrA/9nSSbgxPGfQEQR6l+BGN3sSi4vVIsiyP/H9b2aZWxjWlWumfiQWtMKgvlwqNWuK2GA1QYo6J3vV0=
X-Received: by 2002:a05:6830:1604:: with SMTP id
 g4mr4744068otr.45.1628185454208; 
 Thu, 05 Aug 2021 10:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210730201846.5147-1-niteesh.gs@gmail.com>
 <20210730201846.5147-4-niteesh.gs@gmail.com>
In-Reply-To: <20210730201846.5147-4-niteesh.gs@gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 5 Aug 2021 13:44:03 -0400
Message-ID: <CAFn=p-aJ54yJ9PB=ve-=TGzP+kAxo3C54NE4ahekz7Z3N6xmmw@mail.gmail.com>
Subject: Re: [PATCH v3 03/13] python: Add dependencies for AQMP TUI
To: G S Niteesh Babu <niteesh.gs@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a0777f05c8d37729"
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

--000000000000a0777f05c8d37729
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 30, 2021 at 4:19 PM G S Niteesh Babu <niteesh.gs@gmail.com>
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

--000000000000a0777f05c8d37729
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 30, 2021 at 4:19 PM G S Nitee=
sh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com">niteesh.gs@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add=
ed dependencies for the upcoming AQMP TUI under the optional<br>
&#39;tui&#39; group.<br>
<br>
The same dependencies have also been added under the devel group<br>
since no work around has been found for optional groups to imply<br>
other optional groups.<br>
<br>
Signed-off-by: G S Niteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com"=
 target=3D"_blank">niteesh.gs@gmail.com</a>&gt;<br></blockquote><div><br></=
div><div>Reviewed-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsn=
ow@redhat.com</a>&gt;</div></div></div>

--000000000000a0777f05c8d37729--


