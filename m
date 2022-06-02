Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DE253C134
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 01:02:51 +0200 (CEST)
Received: from localhost ([::1]:49852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwtq6-0006dJ-81
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 19:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nwt6M-0004jA-0O
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 18:15:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nwt6I-0006Uk-KM
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 18:15:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654208128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ciPwEqi8TPTKxYt3Ur7kt71PXiifF18NxP3XMpPpYxU=;
 b=d1Gj5e/4HKkZuqD9bUx7qDrGMjDhEKFBgRsBAyoe+UyEhtLdlik8FCG+JHNztJ0vqwjgcH
 gyulS5JefgV6G+IXeYLuwgS7+Zyweqx77Q18kYaWBlR3AUo7g06Nj8hZTnSgVxCAPUsbpW
 AgZVPqNaSkhRFfXkuy8QFVmyfpj6xjc=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-fZE_2smLPk-QEKInhIAxvQ-1; Thu, 02 Jun 2022 18:15:23 -0400
X-MC-Unique: fZE_2smLPk-QEKInhIAxvQ-1
Received: by mail-il1-f198.google.com with SMTP id
 q15-20020a056e0220ef00b002d15dcd2750so4158455ilv.1
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 15:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=ciPwEqi8TPTKxYt3Ur7kt71PXiifF18NxP3XMpPpYxU=;
 b=D1ZufYoIU4NsO4XEFnV5jR+E+Ij87nxyDnL9Pn4JiOHWFoB7h1PwSwMAZotRLc2zmZ
 9hNMJiOgNMWaEnKEFqaXKtmqN9K6ul5kPqINxoxa806+SspCs7jBt45Vz+xnximuSdf0
 N7lLYsJcxZ9eKFAAK3Ml+yoZ/ymmDGO9VUNbv7TI6YD+ZxDne57Ve20tFUrirA3yGcwi
 Zr8ymRm5Pocb1K+Tjv6Jgsrepbq7lx2oDApnS+VyMhJwcFJZGrWMrHHq3E5vS2Zoh7Tk
 9ASPr3sAy+niv4ZhReukEi4JoKp9KXaAJqCQ+dQMzGXX1AB76VVz1xfBmBidMdFsN4Fj
 +yjw==
X-Gm-Message-State: AOAM530ObVwNNgGJgrMikZBtqkH+laG+gDb75gszbqjQMhJIO51xta5O
 LhDGVUYsUSHdQuup1MbqZbhgkUwOj5a1+E2ykpn2lFu1ffEFgh4azSEwWlvyYN7uGP7GPNDoRJy
 99i3DNv5g1U+84TQ=
X-Received: by 2002:a05:6e02:1c89:b0:2d1:b0ae:88a1 with SMTP id
 w9-20020a056e021c8900b002d1b0ae88a1mr4198915ill.311.1654208122543; 
 Thu, 02 Jun 2022 15:15:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwd+fh5sILfKFHAqlLUkzTYDzO2LisLhzgi96fLQd3+xfdgF7yUW5irkzRm782QU9IuI/xpvA==
X-Received: by 2002:a05:6e02:1c89:b0:2d1:b0ae:88a1 with SMTP id
 w9-20020a056e021c8900b002d1b0ae88a1mr4198903ill.311.1654208122252; 
 Thu, 02 Jun 2022 15:15:22 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 g14-20020a92520e000000b002d3ba224e25sm1921494ilb.10.2022.06.02.15.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 15:15:21 -0700 (PDT)
Date: Thu, 2 Jun 2022 16:15:20 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Eric Auger
 <eric.auger@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 qemu-devel@nongnu.org, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>
Subject: Re: [PULL 0/2] VFIO fixes 2022-02-03
Message-ID: <20220602161520.10930abf.alex.williamson@redhat.com>
In-Reply-To: <20220602153138.1624ddb5.alex.williamson@redhat.com>
References: <164392758602.1683127.4327439310436541025.stgit@omen>
 <CAFEAcA-CX6hPOEEr_Yjcd1=4AHfkYgnkQ_ruUJ4mFwBYz1fLQA@mail.gmail.com>
 <20220207085045.1de46df1.alex.williamson@redhat.com>
 <6ae31bd1-2890-968c-a9b3-5ad4633d8bfd@redhat.com>
 <20220602153138.1624ddb5.alex.williamson@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, 2 Jun 2022 15:31:38 -0600
Alex Williamson <alex.williamson@redhat.com> wrote:

> On Mon, 7 Feb 2022 17:20:02 +0100
> Thomas Huth <thuth@redhat.com> wrote:
>=20
> > On 07/02/2022 16.50, Alex Williamson wrote: =20
> > > On Sat, 5 Feb 2022 10:49:35 +0000
> > > Peter Maydell <peter.maydell@linaro.org> wrote:
> > >    =20
> > >> On Thu, 3 Feb 2022 at 22:38, Alex Williamson <alex.williamson@redhat=
.com> wrote:   =20
> > >>>
> > >>> The following changes since commit 8f3e5ce773c62bb5c4a847f3a9a5c98b=
bb3b359f:
> > >>>
> > >>>    Merge remote-tracking branch 'remotes/hdeller/tags/hppa-updates-=
pull-request' into staging (2022-02-02 19:54:30 +0000)
> > >>>
> > >>> are available in the Git repository at:
> > >>>
> > >>>    git://github.com/awilliam/qemu-vfio.git tags/vfio-fixes-20220203=
.0
> > >>>
> > >>> for you to fetch changes up to 36fe5d5836c8d5d928ef6d34e999d6991a2f=
732e:
> > >>>
> > >>>    hw/vfio/common: Silence ram device offset alignment error traces=
 (2022-02-03 15:05:05 -0700)
> > >>>
> > >>> ----------------------------------------------------------------
> > >>> VFIO fixes 2022-02-03
> > >>>
> > >>>   * Fix alignment warnings when using TPM CRB with vfio-pci devices
> > >>>     (Eric Auger & Philippe Mathieu-Daud=C3=A9)   =20
> > >>
> > >> Hi; this has a format-string issue that means it doesn't build
> > >> on 32-bit systems:
> > >>
> > >> https://gitlab.com/qemu-project/qemu/-/jobs/2057116569
> > >>
> > >> ../hw/vfio/common.c: In function 'vfio_listener_region_add':
> > >> ../hw/vfio/common.c:893:26: error: format '%llx' expects argument of
> > >> type 'long long unsigned int', but argument 6 has type 'intptr_t' {a=
ka
> > >> 'int'} [-Werror=3Dformat=3D]
> > >> error_report("%s received unaligned region %s iova=3D0x%"PRIx64
> > >> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >> ../hw/vfio/common.c:899:26:
> > >> qemu_real_host_page_mask);
> > >> ~~~~~~~~~~~~~~~~~~~~~~~~
> > >>
> > >> For intptr_t you want PRIxPTR.   =20
> > >=20
> > > Darn.  Well, let me use this opportunity to ask, how are folks doing
> > > 32-bit cross builds on Fedora?  I used to keep an i686 PAE VM for this
> > > purpose, but I was eventually no longer able to maintain the build
> > > dependencies.  Looks like this failed on a mipsel cross build, but I
> > > don't see such a cross compiler in Fedora.  I do mingw32/64 cross
> > > builds, but they leave a lot to be desired for code coverage.  Thanks=
,   =20
> >=20
> > The easiest way for getting more test coverage is likely to move your q=
emu=20
> > repository from github to gitlab - then you get most of the CI for free=
,=20
> > which should catch such issues before sending pull requests. =20
>=20
> Well, it worked for a few months, but now pushing a tag to gitlab runs
> a whole 4 jobs vs the 124 jobs that it previously ran, so that's
> useless now :(  Thanks,

And Richard has now sent me the link to your announcement, including
the git push variables to get things back to normal:

https://lists.nongnu.org/archive/html/qemu-devel/2022-06/msg00256.html

Thanks,
Alex


