Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FDF563CEF
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 02:08:13 +0200 (CEST)
Received: from localhost ([::1]:42214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7QgG-0004wx-4l
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 20:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o7QeD-00046i-HS
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 20:06:05 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:37418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o7QeA-00008O-Mq
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 20:06:05 -0400
Received: by mail-io1-f50.google.com with SMTP id h85so3721543iof.4
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 17:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h0ROZFXT7/VJfRItUj5yPJarBznwPC5VKPEFWip0VyA=;
 b=tUWyyjfFeVXo/ixBRlMkeTYAx35p1MlOkYi2NR/hCCLcjVKdsZweG1wsAX4QQMVTHc
 H6rAaQDqOKwg4wkjjAbE+4fKaR8Dk8C29PSbx6GKKgQwBbWes+dTP15aXWPHEu1VfFaG
 CA4GhJmMiC3H7+GsI3QzwguZh9RdDAdWeItEFe8BzcGex5FAnDVRodEKq9EWPpnXplrD
 Zzx8KepIt28IsNEx/HHpOZ+6rb+1JcPWQ6T4M8TeQDqJN5BoHpgxgWod2Yh2sps2eZLK
 d0zgIIbdoCg5XXUqZIIbk2rfVnb0q3wHWNau/4ILAi4Kz4SwM0Z3Ue07+2Va3/zEuApy
 Oh9A==
X-Gm-Message-State: AJIora+bZtp1mZrdAPDLQM/0S9zO26R0tegKkNPiN36F6bJO4XcvKiSA
 nOowzPstY+jr7MPkEWAy3afmbEESUb3gpG3L4es=
X-Google-Smtp-Source: AGRyM1swDAteNtyGJI2kXd3PbaYkDhqp3BA4Tk7mCKyX7EyQbpOo/hmacZthBv690+2XZ/cOyOmQkcYw/XGIrdB8BxE=
X-Received: by 2002:a5d:9850:0:b0:668:eb75:5898 with SMTP id
 p16-20020a5d9850000000b00668eb755898mr8596666ios.97.1656720358927; Fri, 01
 Jul 2022 17:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220628062551-mutt-send-email-mst@kernel.org>
 <1182d647-bef1-0a8a-a379-86f029af7ac6@redhat.com>
 <20220628070151-mutt-send-email-mst@kernel.org>
 <2c3bb7f4-45cb-9c13-4ecd-22de75eaa7d3@redhat.com>
 <CAARzgwx2x5UBvb9ihbvLRzUFNJ3reqDsU2EqL8aUjkjo8yvZGQ@mail.gmail.com>
 <YrspCYpLwFDHkaRv@redhat.com> <20220628135133-mutt-send-email-mst@kernel.org>
 <CAARzgwwoNUn2pN9uAn-sqrH42dsOW4WQyc6ZuewRPPovUqykMQ@mail.gmail.com>
 <e30713c5-eece-f54d-201e-6f99ae52e11e@redhat.com>
In-Reply-To: <e30713c5-eece-f54d-201e-6f99ae52e11e@redhat.com>
Date: Sat, 2 Jul 2022 02:05:47 +0200
Message-ID: <CAAdtpL5rgqBWHjGuFu8iCStFpEy_XuQV2asvhYTh1320WJGGaQ@mail.gmail.com>
Subject: Re: Why we should avoid new submodules if possible
To: Thomas Huth <thuth@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.166.50;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-io1-f50.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Fri, Jul 1, 2022 at 5:37 AM Thomas Huth <thuth@redhat.com> wrote:
> On 29/06/2022 08.28, Ani Sinha wrote:
> > On Tue, Jun 28, 2022 at 11:30 PM Michael S. Tsirkin <mst@redhat.com> wr=
ote:
> >> On Tue, Jun 28, 2022 at 05:15:05PM +0100, Daniel P. Berrang=C3=A9 wrot=
e:
> >>> FYI, the reason much of this is intentionally NOT under the /qemu-pro=
ject
> >>> gitlab namespace is that we did not want to be responsible for distri=
buting
> >>> arbitrary binary blobs/images. That in turn makes the QEMU project re=
sponsible
> >>> for license compliance, which is non-trivial todo correctly for much =
of this
> >>> stuff. As such it is highly desirable to delegate both the hosting th=
e
> >>> binaries and source to the third party who builds it.
> >>
> >> This might be understadable for random guest OS images which include t=
ons of stuff
> >> and are thus hard to audit.  But not to biosbits which has its own
> >> license (more or less bsd) + gpl for grub:
> >> https://github.com/biosbits/bits/blob/master/COPYING
> >
> > These are all the dependencies:
> > https://github.com/biosbits/bits/tree/master/deps
> >
> > We can go through the licenses for each and make a determination. The
> > audit would be lost easier because there is a bounded number of
> > dependencies for bits.
>
> That's quite a bit of dependencies already ... I don't think that we shou=
ld
> put the burden of keeping up with the licenses of those projects to the Q=
EMU
> project. So just make sure that the binaries are available somewhere and
> then include your test into the avocado framework or download via curl/wg=
et
> as suggested in other mails.

"available somewhere" until they get moved or deleted...

This happened a few times with archives/artifacts Avocado tests fetch.

We ended up committing one or a set of URLs pointing to a file, its
usual name and its hash.
If you downloaded the file in time and don't flush the Avocado cache,
you can keep testing.
If it is too late (the file disappeared) and you have time to dig for
such a file online, and are lucky because you found it and its hash
matches, then you can run some tests. As a maintainer I find this
feature useful, and find it worse to lose the ability to test
something that used to work.

My 2=C2=A2...

Phil.

