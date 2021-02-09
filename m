Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F05D315713
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:47:59 +0100 (CET)
Received: from localhost ([::1]:34968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9YzO-000652-Ip
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:47:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l9Yjp-00056T-03
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:31:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l9Yjl-0002X3-Mh
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:31:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612899108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UQWsL0BsDowXISw+W5X6vhjACUEJEcxxrcFPPM9Uz+s=;
 b=dF/5BtW7au/FnabHRXVz25DXkAgDxNMGp6KkPYspjlxkSWR2id52XrElq/rWnyxLMHu18H
 ARWN3o732e5QsLNUvHSMhdRtQRRnQtSmmTV61vY6XUhhxOPtrcA/ja50xzMM2ydlZPkK3N
 D8wo8oDzbPHYwPsis8A2o6ZXm96Fvj4=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-uWhVV0_wO_6BXezXMkJ8Lw-1; Tue, 09 Feb 2021 14:31:44 -0500
X-MC-Unique: uWhVV0_wO_6BXezXMkJ8Lw-1
Received: by mail-pl1-f198.google.com with SMTP id w21so4461853plb.11
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 11:31:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UQWsL0BsDowXISw+W5X6vhjACUEJEcxxrcFPPM9Uz+s=;
 b=TLls9g0qrLC4FB5ofQyMKyLiC8Oe0y/cF6+v0RFKVx0sTA8eT62NY4ZX7rfk3M5wfG
 IVXtWnuXsdevSUrQfnOT9LplCetxGJA92lXZjcbi3U9QYU5HIRrj5Tg5DSt+JKQRtNx/
 IGEjptGFJycwSyItcOuTnXtcJv6qnpnD2AkSWsbYHbg3lOYLAmXBOBWl//+Gq/S48NSN
 GzEW6EORiWSUMncmpr/G36RO3Gqca9nKFKRWjMXucT4vGH/DgTwZkXhXinY36He0IQS7
 MtNiZUWUxXpAGDkw0B0tYODZQgEGGZGdh12Ihk404BpTxOyXb/9LvSPUrywEokWLGH1z
 dtAw==
X-Gm-Message-State: AOAM531htHxydCM0drlokmf86gYLVf1ubTHk/KWaFgg6l2JXG6e/cibz
 7VLFxXa9D83LKGCgxDfpkPge6Dw5omuyrFm61l6a+39634/j+Ql7bONPYmTJVq6tt3sUQcO0DRQ
 RURz7XbpmR58VMTDotZfIw/0QESjW47M=
X-Received: by 2002:a17:90a:4611:: with SMTP id
 w17mr5835031pjg.122.1612899102908; 
 Tue, 09 Feb 2021 11:31:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5LounPqvxD8pGt14QD2n2vGntxUgVjeJlMYdOEhfEXtsK/6ur2G1pZOUtojQFWa/cAftNzYBaCeLzApJWxmE=
X-Received: by 2002:a17:90a:4611:: with SMTP id
 w17mr5835016pjg.122.1612899102658; 
 Tue, 09 Feb 2021 11:31:42 -0800 (PST)
MIME-Version: 1.0
References: <4b64cbcd-0982-9251-b3c4-d82287df139b@suse.de>
In-Reply-To: <4b64cbcd-0982-9251-b3c4-d82287df139b@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 9 Feb 2021 20:31:30 +0100
Message-ID: <CABgObfZKeSCWHGfpEUXs02m_794e12q4xNT9_tWCkHd_-94Bbg@mail.gmail.com>
Subject: Re: meson: why no target_user_arch in target/xxx/meson.build ?
To: Claudio Fontana <cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000012a1ab05baec564c"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000012a1ab05baec564c
Content-Type: text/plain; charset="UTF-8"

Because nobody needed it so far. All targets need softmmu-specific files,
at least machine.c which (for weird reasons) has the migration code for CPU
objects.

Paolo

Il mar 9 feb 2021, 20:24 Claudio Fontana <cfontana@suse.de> ha scritto:

> Hi Paolo,
>
> I am looking at arm code right now in target/
>
> and I would like to build some separate helper-user.c and helper-softmmu.c
> .
>
> I'd like then to include only the right one depending on CONFIG_SOFTMMU
> and CONFIG_USER_ONLY.
>
> Any reason why there is no equivalent of target_softmmu_arch called
> target_user_arch to use for this?
>
> Thanks,
>
> Claudio
>
> --
> Claudio Fontana
> Engineering Manager Virtualization, SUSE Labs Core
>
> SUSE Software Solutions Italy Srl
>
>

--00000000000012a1ab05baec564c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Because nobody needed it so far. All targets need softmmu=
-specific files, at least machine.c which (for weird reasons) has the migra=
tion code for CPU objects.<div dir=3D"auto"><br></div><div dir=3D"auto">Pao=
lo</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">Il mar 9 feb 2021, 20:24 Claudio Fontana &lt;<a href=3D"mailto:cfon=
tana@suse.de">cfontana@suse.de</a>&gt; ha scritto:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">Hi Paolo,<br>
<br>
I am looking at arm code right now in target/<br>
<br>
and I would like to build some separate helper-user.c and helper-softmmu.c =
.<br>
<br>
I&#39;d like then to include only the right one depending on CONFIG_SOFTMMU=
 and CONFIG_USER_ONLY.<br>
<br>
Any reason why there is no equivalent of target_softmmu_arch called target_=
user_arch to use for this?<br>
<br>
Thanks,<br>
<br>
Claudio<br>
<br>
-- <br>
Claudio Fontana<br>
Engineering Manager Virtualization, SUSE Labs Core<br>
<br>
SUSE Software Solutions Italy Srl<br>
<br>
</blockquote></div>

--00000000000012a1ab05baec564c--


