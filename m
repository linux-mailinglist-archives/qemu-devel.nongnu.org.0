Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E43672FFF73
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 10:48:07 +0100 (CET)
Received: from localhost ([::1]:60128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2t31-0003oo-0T
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 04:48:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2t1I-0003JW-1i
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 04:46:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2t1E-0004l9-DV
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 04:46:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611308774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HFa+kjZCdJAZNtX8OqZ0dVSXMxf/2VBtV6Ai/fnLwas=;
 b=f8Yc9mAhFjQf4Y9uHY3tfdj+b94BR07CZGnGgQhgJA66uQkfbjBwn/kqCFbN3eK3/h058i
 Hn3Wj4Nwi2r+TWP3LcIXFMTl0qAL0MSn4tvjJUQWC2KmjopC+dAx+U8R7+vmSwDgG8qmWL
 tqa7BbxHcbG6YnSZ+kTOM5BUmsuZVjw=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-2S7D0-uRPkyUsvg3-CXphg-1; Fri, 22 Jan 2021 04:46:11 -0500
X-MC-Unique: 2S7D0-uRPkyUsvg3-CXphg-1
Received: by mail-oo1-f70.google.com with SMTP id 4so2262122ooc.21
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 01:46:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HFa+kjZCdJAZNtX8OqZ0dVSXMxf/2VBtV6Ai/fnLwas=;
 b=fx3axOd2WLrpGHui3L0elANaViN0R7+fMEWifX/2vgffuzeq7awpCQyl7pR/Mt5kbW
 wPXF0lmoJd33Hza4tjhjAyjm4fXybK/pmQ9cwoNj5T5lauJgjyrHOnmWixJkNLwiGAYo
 tzbIfJJAz6qC2i+kvH1WJb2FiYzA4cRn6BqozmPuTa+p7NaHG3hnjFviwJUS8oMk0/kp
 IVSybGLibw4lot8M69bviA1bd+w6dORcD2idoDWznYHaJtlyN+2xPO1sFPTnCE8vCbyl
 IP12un9P3pUGDciUxI1UP4jP2c6D6HT/HumKfA+gAYvbqhld701KOuYu1P/FGnPxKeTB
 espw==
X-Gm-Message-State: AOAM53230PS4E82F9Rg76o1FvNEq88j+b6DEvp4QoqXNstar46ERAJCr
 RpdsyW6kQT+o5UevRxAs5hp7bIjXZ4UN0yHTf+kRw7IWS92izT8niYm4IPp+Aco5kc/6+rdjZDI
 tMm/dqkpXCL3alML4pteNGUagZ5gDo/8=
X-Received: by 2002:a05:6830:1306:: with SMTP id
 p6mr2663775otq.244.1611308771234; 
 Fri, 22 Jan 2021 01:46:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9IN+Rs8K3b3DEC9DhP103qqDZJ7KmZ5Cvfwsxz7M0dN/BoPv669gWzWG0whVZbVpOMQCqF8OF/MkvMtJa/yE=
X-Received: by 2002:a05:6830:1306:: with SMTP id
 p6mr2663765otq.244.1611308771084; 
 Fri, 22 Jan 2021 01:46:11 -0800 (PST)
MIME-Version: 1.0
References: <20210122092205.1855659-1-philmd@redhat.com>
 <20210122092205.1855659-3-philmd@redhat.com>
 <b661e53c-8c3a-ae19-0250-400d9977dc76@redhat.com>
In-Reply-To: <b661e53c-8c3a-ae19-0250-400d9977dc76@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Fri, 22 Jan 2021 10:46:00 +0100
Message-ID: <CAP+75-WNPbyB6-qFd3o4QUGr0jhfhR-EvwsV9ToL4VRJY3uKug@mail.gmail.com>
Subject: Re: [PATCH 2/2] meson: Warn when TCI is selected but TCG backend is
 available
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 22, 2021 at 10:43 AM Thomas Huth <thuth@redhat.com> wrote:
> On 22/01/2021 10.22, Philippe Mathieu-Daud=C3=A9 wrote:
> > Some new users get confused with 'TCG' and 'TCI', and enable TCI
> > support expecting to enable TCG.
> >
> > Emit a warning when native TCG backend is available on the
> > host architecture, mentioning this is a suboptimal configuration.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> >   meson.build | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/meson.build b/meson.build
> > index 0a645e54662..7aa52d306c6 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -234,6 +234,9 @@
> >         error('Unsupported CPU @0@, try --enable-tcg-interpreter'.forma=
t(cpu))
> >       endif
> >     endif
> > +  if 'CONFIG_TCG_INTERPRETER' in config_host and cpu in supported_cpus
> > +    warning('Experimental TCI requested while native TCG is available =
on @0@, suboptimal performance expected'.format(cpu))
> > +  endif
> >     accelerators +=3D 'CONFIG_TCG'
> >     config_host +=3D { 'CONFIG_TCG': 'y' }
> >   endif
> >
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
>
> ... maybe you could also add some wording to the help text of the configu=
re
> script? Or maybe we could simply rename the "--enable-tcg-interpreter"
> option into "--enable-tci" to avoid confusion with the normal TCG ?

I also thought about renaming as --enable-experimental-tci but then doubt t=
hat
would help, some users just want to enable everything :)


