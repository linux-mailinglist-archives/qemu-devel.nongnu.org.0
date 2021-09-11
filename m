Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5994075B3
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 11:10:38 +0200 (CEST)
Received: from localhost ([::1]:52786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOz1x-0006ET-FU
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 05:10:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mOz0o-0005YV-7D
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 05:09:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mOz0k-0005oD-RH
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 05:09:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631351361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NNr0d5p7tT8XEucI0S88XK6gapsZMkWDjTbtSQ3OldQ=;
 b=hw47leRiW3aiTak/YiwCKz8glbS0/k58JEebq1yCZX7CfgLc23HgQFwHyPMpQ+ItzCMIOv
 n4JZ+SMS20aND9/zQbnsVeVXtAld8KkoM0N2R7dPXQQcJCMRGU9Kb5AZh3cJ1ZUVe54JKv
 T7deXKHSifnmWCj/7q7fWtLm1M7x6XU=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-5UGp1uvNNjalu1M2P9nhUg-1; Sat, 11 Sep 2021 05:09:18 -0400
X-MC-Unique: 5UGp1uvNNjalu1M2P9nhUg-1
Received: by mail-pg1-f200.google.com with SMTP id
 w2-20020a63fb42000000b00255da18df0cso3468389pgj.9
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 02:09:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NNr0d5p7tT8XEucI0S88XK6gapsZMkWDjTbtSQ3OldQ=;
 b=dHxWgeA+VV1FGZHNMX9ETRxNjGf+tEdAyvMTBCfEzcq70NiyX4wSoQpNPnofSWOJQ/
 a+yStVYnIrvbv9pPGFBEfqe3GD+GgpqE9SQaq3wucH8WDcR4StPUz+R+y/Uwd6ojqdTI
 P3sKVna4IJ53IJWolSbDh8af4DwD6+xk1AbHqxJq3TGUaAMFooTD5h/SpA3f2whrmbgu
 RG7WOIviNSgizf0gN+wf0ryvO63T6R1ZlDbopyvrxJuEINuxcucnMN9++kr8G2N9loxR
 /AXdnBIAFBMp4jCqqEl6RrIitHMXWuKefc3N4IBvlk2OIKzw2eRB3Ks4T+sNKMCPSQ02
 ugIw==
X-Gm-Message-State: AOAM531AcrHtJnfbRatHHmAWhpxwS6nGFwSwJ7z7nKrrEd3ma7BMoQ5s
 YWLYDn9i2g+g0u5LTT7VO8bmx2LOLUIa/xrV1wc2lutMK6NW9+Vc9s40WhcPHOiqPYcrKfmtLUB
 egE6781Yt6y4RRcyeTYilq/afER8URvI=
X-Received: by 2002:a62:8415:0:b0:407:8998:7c84 with SMTP id
 k21-20020a628415000000b0040789987c84mr1715265pfd.71.1631351357188; 
 Sat, 11 Sep 2021 02:09:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMooYHlioXFyi+VK/HeMokwS3ZLJ6J9YDfhFU0y1ggk7PMSZbtNmuytcMCFUnWDmiYfgpqHJKDrPb5KahSjKc=
X-Received: by 2002:a62:8415:0:b0:407:8998:7c84 with SMTP id
 k21-20020a628415000000b0040789987c84mr1715238pfd.71.1631351356753; Sat, 11
 Sep 2021 02:09:16 -0700 (PDT)
MIME-Version: 1.0
References: <6755edb6-f953-4ca2-a4b6-31e4566e9842@zapateado.de>
 <af33f36e-e319-e95c-36bc-9c77f4ad81b8@redhat.com>
 <e7df1647-439a-9bda-5c7b-30ab0290d587@zapateado.de>
 <CABLmASEuNT2WVocMwakuhhYDvVBB0YdFueP24ULRFQ1Z35eKPg@mail.gmail.com>
In-Reply-To: <CABLmASEuNT2WVocMwakuhhYDvVBB0YdFueP24ULRFQ1Z35eKPg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 11 Sep 2021 11:09:04 +0200
Message-ID: <CABgObfY5UsGOCnQkhAY4+P3yevZe-nKHRFXj9fRrB0aWD5a5_w@mail.gmail.com>
Subject: Re: [qemu-web PATCH] Fix link to Windows page in Wiki
To: Howard Spoelstra <hsp.cat7@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000001fa7a305cbb49618"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Helge Konetzka <hk@zapateado.de>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001fa7a305cbb49618
Content-Type: text/plain; charset="UTF-8"

Il sab 11 set 2021, 10:43 Howard Spoelstra <hsp.cat7@gmail.com> ha scritto:

> I wrote those instructions as I obviously could not find a better way to
> get Qemu to cross-compile using MSYS2 in Windows.
>

But if you are using MSYS2, why do you need cross compilation and
--cross-prefix at all?

When you look at configure, you see that only adding the cross-prefix will
> not find the MSYS equivalents of some tools:
>
> ar="${AR-${cross_prefix}ar}"
> looks for x86_64-w64-mingw32-ar.exe and not (as it is named in MSYS2)
> x86_64-w64-mingw32-gcc-ar.exe
>

Yes, if the static linker is gcc-ar (I think that's only needed with
link-time optimization) you would need AR=. But if you don't need gcc-ar
you don't need to change the AR variable, and if you don't need a cross
prefix you can just set AR=gcc-ar.

Paolo

> Perhaps it would be better to fix configure for the MSYS2 case so the flags or the renaming are not required?
>
> Best,
> Howard
>
>

--0000000000001fa7a305cbb49618
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=
=3D"ltr" class=3D"gmail_attr">Il sab 11 set 2021, 10:43 Howard Spoelstra &l=
t;<a href=3D"mailto:hsp.cat7@gmail.com">hsp.cat7@gmail.com</a>&gt; ha scrit=
to:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"lt=
r">I wrote those instructions as I obviously could not find a better way to=
 get Qemu to cross-compile using MSYS2 in Windows.<br></div></div></blockqu=
ote></div><div dir=3D"auto"><br></div><div dir=3D"auto">But if you are usin=
g MSYS2, why do you need cross compilation and --cross-prefix at all?</div>=
<div dir=3D"auto"><br></div><div class=3D"gmail_quote" dir=3D"auto"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"></div><div dir=3D=
"ltr"><div class=3D"gmail_quote"><div>When you look at configure, you see t=
hat only adding the cross-prefix will not find the MSYS equivalents of some=
 tools:</div><div><br></div><div>ar=3D&quot;${AR-${cross_prefix}ar}&quot;</=
div><div><span style=3D"font-family:arial,sans-serif">looks for x86_64-w64-=
mingw32-ar.exe and not (as it is named in MSYS2) x86_64-w64-mingw32-gcc-ar.=
exe</span></div></div></div></div></blockquote></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Yes, if the static linker is gcc-ar (I think that&#=
39;s only needed with link-time optimization) you would need AR=3D. But if =
you don&#39;t need gcc-ar you don&#39;t need to change the AR variable, and=
 if you don&#39;t need a cross prefix you can just set AR=3Dgcc-ar.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div class=3D"gmail_=
quote" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div di=
r=3D"ltr"><div class=3D"gmail_quote"><div>
</div><div><pre><span style=3D"font-family:arial,sans-serif">Perhaps it wou=
ld be better to fix configure for the MSYS2 case so the flags or the renami=
ng are not required?
</span></pre>

</div><div>Best,<br></div><div>Howard<br><br></div></div></div>
</div>
</blockquote></div></div>

--0000000000001fa7a305cbb49618--


