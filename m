Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 488C430FC74
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:22:01 +0100 (CET)
Received: from localhost ([::1]:32792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7kCW-00070n-A9
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:22:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7jf9-0005nT-QB
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:47:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7jf6-0000iq-9y
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:47:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612464446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wByFY0kwvNlhRPrKZVLBOl0S4foTNSWB3yIVdN3y5I4=;
 b=cUPP5yAWeVMt3nMv/gwz5tB7xdb75tfAis4n27HauQzMe2nM0ZwEtt5LeLABSmG4m6BFcS
 Qtafa+YgEoYNu1XaMLyMemYbqKCgqRD0Tkn9q6znPdrjgBDOExZgYKyIAXnijVHU3xNw4Y
 k3QmViFhNqq/uU8pEAd1IzFpM9Hfarg=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-p6gVvv-6OUKUuH5Wb0izIg-1; Thu, 04 Feb 2021 13:47:24 -0500
X-MC-Unique: p6gVvv-6OUKUuH5Wb0izIg-1
Received: by mail-pf1-f200.google.com with SMTP id z3so3069684pfj.3
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 10:47:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wByFY0kwvNlhRPrKZVLBOl0S4foTNSWB3yIVdN3y5I4=;
 b=q7fIpCjywJCyiF6QRKUDl96Cu8nIeCFkFjDQxwWCw8v3+0wUtuKFBjL9pxKpgyw6GM
 n7J37JYLFKDM84B5jSnaPbQqQF7dWS/hsUtvqQWpsB90OzkpgZeXGeHnmSOj3R+TUzJe
 uwtv4RdjKvqzRuLn4oqVRWa1GiHpVH9DjjCTPSoi/SbikY7PBZJJhFaB1SMiKotEgB9p
 f+OvO5VaQwGYvOfucKQb71KhloEgmqiTtNywAnor4sI2rmgvGVD45CPABNVpxVnf9bTD
 NI8iiiGwhijTIpCw1Nf22MfSRKOJJhS7eXAH7kSWhn8Bp0BA0qYwozSsJ3U+7eUUCLeG
 MS4A==
X-Gm-Message-State: AOAM531MNqmyjg8U9LO4boZJPzm8dccQ47RtCfJCezUvnJJdkRUnAXTa
 KCexJX3ziOd2813BhZkFxkkOcC2wfwpdBZ8IYktaBFAJMSGoguOMZ3hBrntxTjCClSjbR2w4XwX
 whuBgNkyPaNByod3WOhJnh1vYikDJbHM=
X-Received: by 2002:a63:215f:: with SMTP id s31mr387121pgm.146.1612464443680; 
 Thu, 04 Feb 2021 10:47:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJysg8UoVS4wyQmPAyHPqeZ6ppgtBEUqwZ0Wbe2sL3fuh4HbwQXLcjzcAYEpK5URUZ0xMAKNwOLJgqLP5RVUPVE=
X-Received: by 2002:a63:215f:: with SMTP id s31mr387090pgm.146.1612464443366; 
 Thu, 04 Feb 2021 10:47:23 -0800 (PST)
MIME-Version: 1.0
References: <20210204180328.1735105-1-f4bug@amsat.org>
 <0e3863f5-179c-7bb9-e5de-5a5a6d21c2c6@redhat.com>
 <CAAdtpL6+vkmJSPB39jww75CsFv6ZkTgfD+7yzUqBH+OX-uT4gQ@mail.gmail.com>
In-Reply-To: <CAAdtpL6+vkmJSPB39jww75CsFv6ZkTgfD+7yzUqBH+OX-uT4gQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 4 Feb 2021 19:47:11 +0100
Message-ID: <CABgObfbZYsjfmbO47-LmP6fzZaB3bQiYR3dM1qvXk0OpPbcK5A@mail.gmail.com>
Subject: Re: [PATCH] exec/cpu-defs: Remove TCG backends dependency
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000005c370705ba872232"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005c370705ba872232
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il gio 4 feb 2021, 19:41 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> ha
scritto:

> On Thu, Feb 4, 2021 at 7:19 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> > On 04/02/21 19:03, Philippe Mathieu-Daud=C3=A9 wrote:
> > > "exec/cpu-defs.h" contains common CPU definitions for
> > > accelerators, which is not related to the TCG backends.
> > > See tcg/README description:
> >
> > Most of the definitions are actually for TCG, not for all accelerators
> > (the TLB mostly).
>
> Ah ok. Richard, could you update the description or do you want
> me to respin?
>
> > However, they're indeed unrelated to the backends, so
> >
> > Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>
> Thanks, this avoids rebuilding the whole tree when doing a single change
> in these headers (I'll send a quick mail about it later, proven useful
> while
> bisecting).
>

You could respin and include this info as well.

Paolo


>

--0000000000005c370705ba872232
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il gio 4 feb 2021, 19:41 Philippe Mathieu-Daud=C3=A9 &=
lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; ha scritto:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">On Thu, Feb 4, 2021 at 7:19 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank" rel=
=3D"noreferrer">pbonzini@redhat.com</a>&gt; wrote:<br>
&gt; On 04/02/21 19:03, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt; &gt; &quot;exec/cpu-defs.h&quot; contains common CPU definitions for<b=
r>
&gt; &gt; accelerators, which is not related to the TCG backends.<br>
&gt; &gt; See tcg/README description:<br>
&gt;<br>
&gt; Most of the definitions are actually for TCG, not for all accelerators=
<br>
&gt; (the TLB mostly).<br>
<br>
Ah ok. Richard, could you update the description or do you want<br>
me to respin?<br>
<br>
&gt; However, they&#39;re indeed unrelated to the backends, so<br>
&gt;<br>
&gt; Acked-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</a>&gt;<br>
<br>
Thanks, this avoids rebuilding the whole tree when doing a single change<br=
>
in these headers (I&#39;ll send a quick mail about it later, proven useful =
while<br>
bisecting).<br></blockquote></div></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">You could respin and include this info as well.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><=
div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
</blockquote></div></div></div>

--0000000000005c370705ba872232--


