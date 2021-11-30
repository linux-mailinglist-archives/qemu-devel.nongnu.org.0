Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4A8463E56
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 20:02:05 +0100 (CET)
Received: from localhost ([::1]:34842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms8OB-0006mO-Mc
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 14:02:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1ms8Mf-0005ZY-8Y
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 14:00:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1ms8Mc-0001w1-5H
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 14:00:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638298824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8dKxiaRSHkSyL0dFGmBNL+Hdm30qocVr3AnGaYhzgRc=;
 b=gGLTdGdtTqMmwsh/yulTGlZe6BFMOEfDt0U1r0MwUlf2YLy45clQKcm2EDsGyNVZ5llcwG
 xE9njoN18L7YnfPYTjyiBdrNmLuk62DJ3I9iJQHah/wWxqYMnad9UxKNgxc0GmYGdWA61s
 bHPmEUNrPpYw00cDttJTWGj+L0ZwW2M=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-PAySKqlfNjC_ZwUTv8Yu9w-1; Tue, 30 Nov 2021 14:00:22 -0500
X-MC-Unique: PAySKqlfNjC_ZwUTv8Yu9w-1
Received: by mail-lj1-f199.google.com with SMTP id
 p1-20020a2e7401000000b00218d0d11e91so7864895ljc.15
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 11:00:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8dKxiaRSHkSyL0dFGmBNL+Hdm30qocVr3AnGaYhzgRc=;
 b=Sb4gUkfZT2LPnyRXHe7Xf0xvnJBy/gJdt+x6AGqIfCY/SAPSQK4Dox6CqNff8HYOCh
 gVsko/ZW+uFVOkeQqKB8fuc7nqMR0/v3Vt6Y+ZVJRNyCcZAcnvlRlv05ho3EL1AR49fe
 OyE5mUheVjDApftwXl1ngqeMgLuSMFe+nQWSIiLc7rM2ZnqOSH6wgvhMQ6Cgmtjwdsdh
 xdMHw55AIqTzDAnFACDfWOXlewxR6lMGdPtgKqw1WMteIfmnm9WXpmAxGJjotMGGZcAf
 Rxbdl5P7dkcBiWY9g11SczkmFuf2QP2SF3JTsM6oEdGUW+LWfKbqa0FGJVB+2oS+LClf
 QXGw==
X-Gm-Message-State: AOAM533IIYM5QjamQnr1ldQcKPkXc+9WeQM9ZOPDJkbIgUjPJFmqKTml
 cHgl7MuHRZotxnqgAY6FEBoHIHtErEqVOSUpqamRamKmALolAVJh+buUhqwYikd/TwjifSVTAEq
 gvzbcloomLoOmeRMzAPrpwz+bUAYxtVo=
X-Received: by 2002:a2e:a176:: with SMTP id u22mr823533ljl.116.1638298821169; 
 Tue, 30 Nov 2021 11:00:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrwldigKG9oFCXaxOL+vF8kDE0RPxPnFJLhypTOCUe6h/DRtIHEIkgfOAt0LCAJOhw/0lhqe66FE2s5GIeiNs=
X-Received: by 2002:a2e:a176:: with SMTP id u22mr823504ljl.116.1638298820955; 
 Tue, 30 Nov 2021 11:00:20 -0800 (PST)
MIME-Version: 1.0
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-6-leobras@redhat.com>
 <87r1blvdn2.fsf@secure.mitica>
In-Reply-To: <87r1blvdn2.fsf@secure.mitica>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Tue, 30 Nov 2021 16:00:09 -0300
Message-ID: <CAJ6HWG6bDWEcN_2tmcsDkWa0fbyqzE=O5JMK5xdU6obP4g8bDQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] migration: Add migrate_use_tls() helper
To: Juan Quintela <quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000042600b05d2062bb5"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000042600b05d2062bb5
Content-Type: text/plain; charset="UTF-8"

Hello Juan,

Thanks for reviewing!

Best regards,
Leo

On Fri, Nov 12, 2021 at 8:04 AM Juan Quintela <quintela@redhat.com> wrote:

> Leonardo Bras <leobras@redhat.com> wrote:
> > A lot of places check parameters.tls_creds in order to evaluate if TLS is
> > in use, and sometimes call migrate_get_current() just for that test.
> >
> > Add new helper function migrate_use_tls() in order to simplify testing
> > for TLS usage.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
>
>

--00000000000042600b05d2062bb5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,sa=
ns-serif;font-size:small">Hello Juan,</div><div class=3D"gmail_default" sty=
le=3D"font-family:arial,sans-serif;font-size:small"><br></div><div class=3D=
"gmail_default" style=3D"font-family:arial,sans-serif;font-size:small">Than=
ks for reviewing!</div><div class=3D"gmail_default" style=3D"font-family:ar=
ial,sans-serif;font-size:small"><br></div><div class=3D"gmail_default" styl=
e=3D"font-family:arial,sans-serif;font-size:small">Best regards,</div><div =
class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-size:sma=
ll">Leo<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Fri, Nov 12, 2021 at 8:04 AM Juan Quintela &lt;<a href=
=3D"mailto:quintela@redhat.com">quintela@redhat.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Leonardo Bras &lt;<a hre=
f=3D"mailto:leobras@redhat.com" target=3D"_blank">leobras@redhat.com</a>&gt=
; wrote:<br>
&gt; A lot of places check parameters.tls_creds in order to evaluate if TLS=
 is<br>
&gt; in use, and sometimes call migrate_get_current() just for that test.<b=
r>
&gt;<br>
&gt; Add new helper function migrate_use_tls() in order to simplify testing=
<br>
&gt; for TLS usage.<br>
&gt;<br>
&gt; Signed-off-by: Leonardo Bras &lt;<a href=3D"mailto:leobras@redhat.com"=
 target=3D"_blank">leobras@redhat.com</a>&gt;<br>
<br>
Reviewed-by: Juan Quintela &lt;<a href=3D"mailto:quintela@redhat.com" targe=
t=3D"_blank">quintela@redhat.com</a>&gt;<br>
<br>
</blockquote></div>

--00000000000042600b05d2062bb5--


