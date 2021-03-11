Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2465633710D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 12:20:33 +0100 (CET)
Received: from localhost ([::1]:32842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKJMm-0008T8-6Q
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 06:20:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lKJLJ-0007Wr-HX
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:19:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lKJLE-0000lM-Q9
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:19:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615461536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rEsbALAdL9OMTeZlyUvYfVfNPQUZ40lSm5u/fzZecyk=;
 b=IIpT5DFHdz+NUw4Qe8+0slv87jsOvGqsiSwVgAk4QrCKIs2qxx4SJUFiQIl0QwM4D2PtnM
 wk4syxeP3yOmo+SUJwCtbEl4NoZIz2G2SV2us/FDLwRggh41KVPy/lDb+6Yi2Gq7F+SjEv
 JdjZYGtCpkMEsoV76ED6AuKqK5s2rHM=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-Jao6aSuRM4eTzKlpIKwwVw-1; Thu, 11 Mar 2021 06:18:54 -0500
X-MC-Unique: Jao6aSuRM4eTzKlpIKwwVw-1
Received: by mail-io1-f72.google.com with SMTP id x9so12793376iob.5
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 03:18:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rEsbALAdL9OMTeZlyUvYfVfNPQUZ40lSm5u/fzZecyk=;
 b=KIim121Huk19WZG8yscsepcEiUvb7/46GwCMrMp5az/88gjMSlwUlR2xZuDPyqRDZP
 70YPTQHHqHbNFvvXAfbkH3EJYC6sPgk3vvpu0cp3P/uWuohoPQGI9MSC6hekxKusw8hR
 QpJ2o6/QFFLS26dTSzCRMie2a/heJxIAuukHGHHmz5INT4ZUexmVc5wtFEVhikMTVN47
 u6CANlZujuWr7THXGF72vmHmCAL2I72q2+vK4DG3LIBg0XlX/t1DUBwtVshXS0sZ5tNW
 faAnMJJoBcsARzceoxkOokj1Al7bmCEguNNjPxBTBZZJlpCR88ve5jP3ePNkRpW6fB08
 eKtg==
X-Gm-Message-State: AOAM533uASXlO+RqwkV2evY+AnfNVhmrIdHNvTJurUIbVz1GLks618vm
 Pat+e/G5XVD0S/bqqLzUTL3Xdga1gUue5TrORLBpW/wrsxwSj4zkH4DT2JdeR4FgvX6bmUZY2yT
 56Sv2ABhpn0rWRXbfdo7v/k2TZsT5IOk=
X-Received: by 2002:a92:ce02:: with SMTP id b2mr6801072ilo.182.1615461533636; 
 Thu, 11 Mar 2021 03:18:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQlqUsikj5vhyRYYq+5bH04TstgNN4ASw20F/JXY0/AA8whmjWOeqcJFbMxWIBCwSIy6gsQP7eqfLSIkEhBps=
X-Received: by 2002:a92:ce02:: with SMTP id b2mr6801052ilo.182.1615461533435; 
 Thu, 11 Mar 2021 03:18:53 -0800 (PST)
MIME-Version: 1.0
References: <20210311103250.532191-1-pbonzini@redhat.com>
 <CAMxuvaxwDujPJN=JjADGE+=wDiBWjhFX+omJ_D8bmXJMPxRaZA@mail.gmail.com>
 <4c5c32a6-a646-a6dd-f60d-6e7a831b674b@redhat.com>
In-Reply-To: <4c5c32a6-a646-a6dd-f60d-6e7a831b674b@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 11 Mar 2021 15:18:42 +0400
Message-ID: <CAMxuvazvBQryHEwOQqnbFZPo9f8NzK6M4Qq3aUV=sFvsd+sBkw@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] vhost: replace master/slave with more accurate
 wording
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000d95fb205bd40f2aa"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d95fb205bd40f2aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Mar 11, 2021 at 3:08 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 11/03/21 11:51, Marc-Andr=C3=A9 Lureau wrote:
> >
> >
> > What about renaming  VhostUserSlaveRequest too ?
> > (subprojects/libvhost-user/libvhost-user.h & hw/virtio/vhost-user.c)
> >
>
> I missed it in vhost-user.c (I did rename the values but not the enum),
> while in libvhost-user.h I'm keeping it for backwards compatibility as I
> don't want to break the API.
>
>
Keeping API stability is great and all, but libvhost-user never received an
official release, and isn't installed either.  We should be free to break
it atm imho.

--000000000000d95fb205bd40f2aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 11, 2021 at 3:08 PM Pao=
lo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 11/03/21 11:51, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; <br>
&gt; <br>
&gt; What about renaming=C2=A0 VhostUserSlaveRequest too ?<br>
&gt; (subprojects/libvhost-user/libvhost-user.h &amp; hw/virtio/vhost-user.=
c)<br>
&gt; <br>
<br>
I missed it in vhost-user.c (I did rename the values but not the enum), <br=
>
while in libvhost-user.h I&#39;m keeping it for backwards compatibility as =
I <br>
don&#39;t want to break the API.<br>
<br></blockquote><div><br></div><div>Keeping API stability is great and all=
, but libvhost-user never received an official release, and isn&#39;t insta=
lled either.=C2=A0 We should be free to break it atm imho.<br></div></div><=
/div>

--000000000000d95fb205bd40f2aa--


