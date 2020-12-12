Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 422222D8533
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 07:43:11 +0100 (CET)
Received: from localhost ([::1]:45524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knycX-0006q7-OQ
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 01:43:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hgcoin@gmail.com>) id 1knyYu-0005wL-0Z
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 01:39:25 -0500
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:38624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hgcoin@gmail.com>) id 1knyYp-0004kJ-4m
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 01:39:23 -0500
Received: by mail-il1-x130.google.com with SMTP id v3so10950694ilo.5
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 22:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:user-agent:in-reply-to:references:mime-version
 :content-transfer-encoding:subject:to:cc:from:message-id;
 bh=2A8Gvcs0ZfBxXhdP9NS8gJ1322/gHycBfScmYscfDVg=;
 b=Z/JNzSkxJZgQ3/zqMdnteiuzSfe/kFSi74VQQ5XIbChEe8wEdnFWPO+4XJUOds4vX5
 YRfkllSNPPB3Jo0OXwgaiIKWRHfJUhZHQsbffMET1gc2ykBOwEyM6LrSD/z1S+1u17lc
 rvbvHVAgliDWM9Q2Sp8S5a7BcqIrCD75zcqX53BkuUk/axDfg7Gz2iSYov02kS6iHO14
 kmB++/T7qLc/8VOnaiGyn+t/36tCeHbnUQGbhGWtihvHcAmGknfacrDwcS085y9ixr92
 FubDmMqyB4f8U02nbUk2rYgQZh4EEb+EODOcrugioKjBn+wgqQ3azKr0IR9pvfwXMEHl
 hE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:user-agent:in-reply-to:references
 :mime-version:content-transfer-encoding:subject:to:cc:from
 :message-id;
 bh=2A8Gvcs0ZfBxXhdP9NS8gJ1322/gHycBfScmYscfDVg=;
 b=BJulMeSmhqfPkjqtSQdqeoejPtlWkjaDyo86qjMF8kMJn/R7pw+XCYatGZKakVRVud
 ObMkAq3b6o+u8zcR2uWhgmufvCLFuVOVDyZfpmBK/tb+h5BT4lLImQh8V8xVPsLISRnR
 h26OTT6YfPPNxUI4uwu3y/dLLiYHh4iCRXCnA+DiKWLeKsqhc0MzQ1GScplR0uSFRYwb
 j8B/NYnqs4HSfK4OnmuUVFvXumVna9MdjTaZcWj8xQEa9iFNHyjy528JLBBJWPZHT2sm
 GKHdx0eMwVplMECPU7COd8rpoReYMIYY9sEh3t/cimwuXzunelM7gjiDeBO1gWSxJwAZ
 6KgA==
X-Gm-Message-State: AOAM533AzfwZiGzOK0LFW2dDtEI5JcunZuZDLoiKQgWYGVX9IwraB7EV
 02h5qab/rGA5vkghN3xZoC4=
X-Google-Smtp-Source: ABdhPJyzPfCoaAWGnUlAEcbHv3Ce9XPLjDkHjOPED36mrQzjAHzW2S8LkBDnHjsZmngaH915thf71A==
X-Received: by 2002:a92:874e:: with SMTP id d14mr20632839ilm.74.1607755150587; 
 Fri, 11 Dec 2020 22:39:10 -0800 (PST)
Received: from ?IPv6:2600:1008:b161:9035:e88d:da16:9afd:65ad?
 ([2600:1008:b161:9035:e88d:da16:9afd:65ad])
 by smtp.gmail.com with ESMTPSA id l13sm6670607ilf.79.2020.12.11.22.39.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Dec 2020 22:39:09 -0800 (PST)
Date: Sat, 12 Dec 2020 00:39:08 -0600
User-Agent: K-9 Mail for Android
In-Reply-To: <20201211110522.GB3380@work-vm>
References: <20201207183021.22752-1-vgoyal@redhat.com>
 <20201207183021.22752-4-vgoyal@redhat.com> <20201210200303.GN3629@work-vm>
 <20201210200931.GA185111@redhat.com>
 <97a0de57-8422-2fdc-e16e-0d6f133f615c@gmail.com>
 <20201211110522.GB3380@work-vm>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----YPVLCBTHDUOMGBKH79PEI6PNN1EFZM"
Content-Transfer-Encoding: 7bit
Subject: Re: ceph + freeipa ubuntu/fedora common small bug
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
From: Harry Coin <hgcoin@gmail.com>
Message-ID: <0E76031D-6231-40E8-A5CF-1829177BA5C7@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=hgcoin@gmail.com; helo=mail-il1-x130.google.com
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
Cc: virtio-fs@redhat.com, lersek@redhat.com, qemu-devel@nongnu.org,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------YPVLCBTHDUOMGBKH79PEI6PNN1EFZM
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

It's the latest ubuntu and fedora distros=2E


On December 11, 2020 5:05:22 AM CST, "Dr=2E David Alan Gilbert" <dgilbert@=
redhat=2Ecom> wrote:
>* Harry G=2E Coin (hgcoin@gmail=2Ecom) wrote:
>> FYI=2E=C3=82=C2=A0 Same thing we saw on Fedora installing freeipa, this=
 on ubuntu
>> with ceph=2E=C3=82=C2=A0 Identical bitmask report=2E
>>=20
>> =2E=2E=2E
>>=20
>> Fixing /var/run/ceph ownership=2E=2E=2E=2Edone
>>=20
>> Cannot set file attribute for '/var/log/journal', value=3D0x00800000,
>> mask=3D0x00800000, ignoring: Function not implemented
>>=20
>> Cannot set file attribute for
>> '/var/log/journal/fd007229322043ad8778c214d19ed3ac',
>value=3D0x00800000,
>> mask=3D0x00800000, ignoring: Function not implemented
>
>This looks like it comes out of systemd's  src/tmpfiles/tmpfiles=2Ec:
>
>        r =3D chattr_fd(procfs_fd, f, item->attribute_mask, NULL);
>        if (r < 0)
>log_full_errno(IN_SET(r, -ENOTTY, -EOPNOTSUPP) ? LOG_DEBUG :
>LOG_WARNING,
>                               r,
>"Cannot set file attribute for '%s', value=3D0x%08x, mask=3D0x%08x,
>ignoring: %m",
>                    path, item->attribute_value, item->attribute_mask);
>
>and it's chattr_fd is in it's src/basic/chattr-util=2Ec
>which is using FS_IOC_GET/SETFLAGS, which seems to be an older
>way of doing things=2E
>
>Now, is that supposed to promote itself to a newer call or is it OK?
>
>Dave
>
>> =2E=2E=2E
>>=20
>> Host has xattrs on, btrfs=2E
>>=20
>>=20
>>=20
>--=20
>Dr=2E David Alan Gilbert / dgilbert@redhat=2Ecom / Manchester, UK

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
------YPVLCBTHDUOMGBKH79PEI6PNN1EFZM
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body>It's the latest ubuntu and fedora distros=2E<br><b=
r><br><div class=3D"gmail_quote">On December 11, 2020 5:05:22 AM CST, "Dr=
=2E David Alan Gilbert" &lt;dgilbert@redhat=2Ecom&gt; wrote:<blockquote cla=
ss=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0=2E8ex; border-left: 1px s=
olid rgb(204, 204, 204); padding-left: 1ex;">
<pre class=3D"k9mail">* Harry G=2E Coin (hgcoin@gmail=2Ecom) wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex 0=2E8ex; border=
-left: 1px solid #729fcf; padding-left: 1ex;">FYI=2E=C3=82&nbsp; Same thing=
 we saw on Fedora installing freeipa, this on ubuntu<br>with ceph=2E=C3=82&=
nbsp; Identical bitmask report=2E<br><br>=2E=2E=2E<br><br>Fixing /var/run/c=
eph ownership=2E=2E=2E=2Edone<br><br>Cannot set file attribute for '/var/lo=
g/journal', value=3D0x00800000,<br>mask=3D0x00800000, ignoring: Function no=
t implemented<br><br>Cannot set file attribute for<br>'/var/log/journal/fd0=
07229322043ad8778c214d19ed3ac', value=3D0x00800000,<br>mask=3D0x00800000, i=
gnoring: Function not implemented<br></blockquote><br>This looks like it co=
mes out of systemd's  src/tmpfiles/tmpfiles=2Ec:<br><br>        r =3D chatt=
r_fd(procfs_fd, f, item-&gt;attribute_mask, NULL);<br>        if (r &lt; 0)=
<br>                log_full_errno(IN_SET(r, -ENOTTY, -EOPNOTSUPP) ? LOG_DE=
BUG : LOG_WARNING,<br>                               r,<br>                =
               "Cannot set file attribute for '%s', value=3D0x%08x, mask=3D=
0x%08x, ignoring: %m",<br>                               path, item-&gt;att=
ribute_value, item-&gt;attribute_mask);<br><br>and it's chattr_fd is in it'=
s src/basic/chattr-util=2Ec<br>which is using FS_IOC_GET/SETFLAGS, which se=
ems to be an older<br>way of doing things=2E<br><br>Now, is that supposed t=
o promote itself to a newer call or is it OK?<br><br>Dave<br><br><blockquot=
e class=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex 0=2E8ex; border-left: =
1px solid #729fcf; padding-left: 1ex;">=2E=2E=2E<br><br>Host has xattrs on,=
 btrfs=2E<br><br><br><br></blockquote>-- <br>Dr=2E David Alan Gilbert / dgi=
lbert@redhat=2Ecom / Manchester, UK<br><br></pre></blockquote></div><br>-- =
<br>Sent from my Android device with K-9 Mail=2E Please excuse my brevity=
=2E</body></html>
------YPVLCBTHDUOMGBKH79PEI6PNN1EFZM--

