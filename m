Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C16B33FA81
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 22:35:04 +0100 (CET)
Received: from localhost ([::1]:46504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMdok-000524-Rg
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 17:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lMdn1-00047h-By
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 17:33:15 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:33412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lMdmz-000522-RV
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 17:33:15 -0400
Received: by mail-qv1-xf32.google.com with SMTP id o19so2214720qvu.0
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 14:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iE+xGoqKvaQE9pmhZmaSG4av+1bMkr7lb2FxmtQxirs=;
 b=MSkEWUwU6dPzRpKY1GUJLrwhrNlNv9gn4W+uUEtO4xv3D8W3z+IJI3FLbVqzJbTVKq
 shlL2gbvsbS0Dg2J0KYzL0a0a6wAYWoA8TPAFnUUcbaPDGzRM0F4ZG4vdUXvTDfMYEM0
 GXkQOewJTfs7/ychaZzTBPTMvKEoflvPPw52OV/oSId8+sjmk+EHcMdVL4dktnlHjxN8
 rmFhruuMj2VdP7wL6M8IxpK0JYhA2bSnoa3lYgaA1s2dfMJZFKMCXzDYko64w8Fsi03Z
 sQnW2FJcEZOPZhTn2k+DtIMVMeRBJZ9iT1UDhN4fraPkVxSxoaRBELIR9XCg/lI6lysU
 0+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iE+xGoqKvaQE9pmhZmaSG4av+1bMkr7lb2FxmtQxirs=;
 b=cjAZSUvdLZO9rkBnWWLygwM0W6nNDxqDCEqlyi4LC9pdMs5INxNeYldx/7hFwsK3Vz
 PYZ5ziSCxMccKiZ65zKO0D+CoqdtBCqtPjc0cEGTgza/HfBIhYKIvdRrhA0BS8JKGbNe
 2ULqwxK9XnIBMglnZV3gHyuyP1oFGG7FLmDJtPfEA0U29kmpvhmnkzeJMAsa+B1eUxai
 TOQS0aCWTAFbmsIdpa5FY3dIT/PJFaECy7GYx2GOAgrx7Dy2S7JcxAS+6HMrDC+/1qA0
 Mrv/ztQ9pmBNjS6pcKQzuxgxCgqDxPSeq7IMoB7RKhQl1Deq6hL8/JG277YzlSaF5JZg
 S76Q==
X-Gm-Message-State: AOAM530ZZ9+lMsb0M9WN63yonKFyPY5h7YbdyswoIPU52ZgltZelTmQe
 Eo9Y3vj6ZZke0AelMlMDv8HfPYHXVB/GeG+HbyI=
X-Google-Smtp-Source: ABdhPJwQTqdpj82yQYd1XUhJv40Iem7Z17oX2k86SsOMw7PRfno3zcgRfFXip9zotvm/iO9w843FDie7swH16aHIbHY=
X-Received: by 2002:ad4:52c2:: with SMTP id p2mr1210612qvs.45.1616016792175;
 Wed, 17 Mar 2021 14:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <YFJjIq45ggSZz0CX@work-vm>
In-Reply-To: <YFJjIq45ggSZz0CX@work-vm>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Wed, 17 Mar 2021 23:32:36 +0200
Message-ID: <CAK4993j08YrWb4CFZ_rgiCdGQDcc7fCcL4O3VT9Zz3mGL=9+2Q@mail.gmail.com>
Subject: Re: of AVR target page size
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d9486d05bdc23af2"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=mrolnik@gmail.com; helo=mail-qv1-xf32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d9486d05bdc23af2
Content-Type: text/plain; charset="UTF-8"

Hi Dave.

What is the smallest supported page size?


On Wed, Mar 17, 2021 at 10:14 PM Dr. David Alan Gilbert <dgilbert@redhat.com>
wrote:

> Hi Michael,
>   I noticed your AVR code defines:
>
>   #define TARGET_PAGE_BITS 8
>
> and has an explanation of why.
>
> Note however that's not going to work with the current live
> migration/snapshotting code, since you're a couple of bits smaller
> than the smallest page size we had so far, and for many years
> the RAM migration code has stolen the bottom few bits of the address
> as a flag field, and has already used 0x100 up; see migration/ram.c
> RAM_SAVE_FLAG_*    - and it's actually tricky to change it, because if
> you change it then it'll break migration compatibility with existing
> qemu's.
>
> Hmm.
>
> Dave
>
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>
>

-- 
Best Regards,
Michael Rolnik

--000000000000d9486d05bdc23af2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Dave.<div><br></div><div>What is the smallest supported=
 page size?</div><div><br></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 17, 2021 at 10:14 PM Dr. David =
Alan Gilbert &lt;<a href=3D"mailto:dgilbert@redhat.com">dgilbert@redhat.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Hi Michael,<br>
=C2=A0 I noticed your AVR code defines:<br>
<br>
=C2=A0 #define TARGET_PAGE_BITS 8<br>
<br>
and has an explanation of why.<br>
<br>
Note however that&#39;s not going to work with the current live<br>
migration/snapshotting code, since you&#39;re a couple of bits smaller<br>
than the smallest page size we had so far, and for many years<br>
the RAM migration code has stolen the bottom few bits of the address<br>
as a flag field, and has already used 0x100 up; see migration/ram.c<br>
RAM_SAVE_FLAG_*=C2=A0 =C2=A0 - and it&#39;s actually tricky to change it, b=
ecause if<br>
you change it then it&#39;ll break migration compatibility with existing<br=
>
qemu&#39;s.<br>
<br>
Hmm.<br>
<br>
Dave<br>
<br>
-- <br>
Dr. David Alan Gilbert / <a href=3D"mailto:dgilbert@redhat.com" target=3D"_=
blank">dgilbert@redhat.com</a> / Manchester, UK<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Best Regards,<br>Michael Rolnik</div>

--000000000000d9486d05bdc23af2--

