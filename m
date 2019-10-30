Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA17E9CA4
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Oct 2019 14:50:12 +0100 (CET)
Received: from localhost ([::1]:40620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iPoMV-0002sV-Af
	for lists+qemu-devel@lfdr.de; Wed, 30 Oct 2019 09:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51045)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iPoKo-00022Q-UO
 for qemu-devel@nongnu.org; Wed, 30 Oct 2019 09:48:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iPoKn-0004xd-R4
 for qemu-devel@nongnu.org; Wed, 30 Oct 2019 09:48:26 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:43548)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1iPoKn-0004uW-Lo
 for qemu-devel@nongnu.org; Wed, 30 Oct 2019 09:48:25 -0400
Received: by mail-ot1-x32a.google.com with SMTP id b19so2119316otq.10
 for <qemu-devel@nongnu.org>; Wed, 30 Oct 2019 06:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=2zh8JjZPUctX/SZScHGxXckuRmiT2URzg8kX6f7h5Zs=;
 b=TkizCbrja8yiZjZYG9BbSpwCdbZLjnf5jrKGwxMj14zBgxLDjry03D04XI2sSI4cde
 mokB7IAGdZP03u4Rvm95x/gqUof3U4I2inNtpo/XU7X4XDtjA5O3P/WKVDU4xw7rn+Yz
 osvioVyRO8lUxreLTKiCTjrfWyvV5NzonSD1Aec7mblUV3KyFKZy0hNrb91IiS/wxUqd
 /lnurAScjVGaosCgteA9S74g7fKUJv8LBju+gewT4hRHtmrzLi42oKTtKnrArmJGozaH
 wi/LsKW2lyev9Igk8pi0GxG1vD9zr1of0QcR6EakaeTwPjh8OTwtsFb3yZH82rVNFAyb
 bnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=2zh8JjZPUctX/SZScHGxXckuRmiT2URzg8kX6f7h5Zs=;
 b=i1QsSZKKC7WdV5NzqhDQJo8qWiGJVQJi895KbngkeOu48lhwxp6twxdBx6MQ4HZz+w
 TV5WCRXFAsgX/+0O3QRN8ZOmLJuxLGuX501kIhAtq/7VZS5nZlpDwo22G2+ke2Hk88kR
 EWhhr1gRKimQsL+lQg6lkjROs3tbnMkjBRLojGinC8oVdeCs6UbxXcZab0VT/0FWfkZt
 DMMnI++zIb2mQBlLlIG4WkCTFlp9+Z4nmD5ZDFDd/3OM0goX+C4odP0Me8xbmJtTJhHN
 LkOOaH1CKZysAG9TKxk7QflqGAdm3Z90CgF2IMzAKsxbjjdP7PCunZYjazRv6tB6MYDF
 EwUw==
X-Gm-Message-State: APjAAAWr0uzW6ei/o4kHIAI54J3HszK0dJ22KHDeyjwVHBMvv/Tnm0TV
 hdBudECHT8aKeCsb579qlupGL0Q8FnLvFfpS8FU=
X-Google-Smtp-Source: APXvYqyQY4D4xeq3ZoY3WkfJp3BcfqIWFqjjXyVnVd3NmRm58FKZQbPX+HbNYDiRgWOcTeKXDfDVtAB6oJc04gvI89A=
X-Received: by 2002:a9d:5914:: with SMTP id t20mr5359504oth.306.1572443304744; 
 Wed, 30 Oct 2019 06:48:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Wed, 30 Oct 2019 06:48:24
 -0700 (PDT)
In-Reply-To: <a635330c-0ef0-b4e1-53ff-b5bca3d2ffa0@redhat.com>
References: <20191026180143.7369-1-philmd@redhat.com>
 <CAL1e-=jW0Jmk=Y9o_UpdeOo6vfTm-qXyPVtk4O+RLOUN_5Y_cw@mail.gmail.com>
 <a635330c-0ef0-b4e1-53ff-b5bca3d2ffa0@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Wed, 30 Oct 2019 14:48:24 +0100
Message-ID: <CAL1e-=hxzXNxFXj_9HD-zs2xHgEvKSmkC354i5Ar030VFUr=qw@mail.gmail.com>
Subject: Re: [PATCH v3 00/20] hw/i386/pc: Split PIIX3 southbridge from i440FX
 northbridge
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000009bdb32059620fc59"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32a
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009bdb32059620fc59
Content-Type: text/plain; charset="UTF-8"

>
> In case you, for any reason, can't complete this by softfreeze, I advice
>> you not to rush, and postpone the integration to 5.0.
>>
>
> This series doesn't provide any useful feature, it is a simple cleanup,
> posted and reviewed before soft freeze, so we still have 1 week (until
> hard freeze) to have it merged, or postpone. No need to stress out for
> a cleanup ;)
>
>
I sounded too tight, and I apologize.

You submitted the pull request before softfreeze, so, in my understanding,
it should be merged, after some integration hickups are resolved. And I am
positive you will resolve them.

By 'completing' I meant 'sending the pull request', so you are on time in
my book.

Take it easy, and I welcome this fine work of yours to be integrated.

Aleksandar



> Regards,
>
> Phil.
>

--0000000000009bdb32059620fc59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
In case you, for any reason, can&#39;t complete this by softfreeze, I advic=
e you not to rush, and postpone the integration to 5.0.<br>
</blockquote>
<br>
This series doesn&#39;t provide any useful feature, it is a simple cleanup,=
<br>
posted and reviewed before soft freeze, so we still have 1 week (until<br>
hard freeze) to have it merged, or postpone. No need to stress out for<br>
a cleanup ;)<br>
<br></blockquote><div><br></div><div>I sounded too tight, and I apologize.<=
/div><div><br></div><div>You submitted the pull request before softfreeze, =
so, in my understanding, it should be merged, after some integration hickup=
s are resolved. And I am positive you will resolve them.</div><div><br></di=
v><div>By &#39;completing&#39; I meant &#39;sending the pull request&#39;, =
so you are on time in my book.</div><div><br></div><div>Take it easy, and I=
 welcome this fine work of yours to be integrated.</div><div><br></div><div=
>Aleksandar</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
Regards,<br>
<br>
Phil.<br>
</blockquote>

--0000000000009bdb32059620fc59--

