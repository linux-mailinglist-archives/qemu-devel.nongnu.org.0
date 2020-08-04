Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168F023B6E8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Aug 2020 10:38:37 +0200 (CEST)
Received: from localhost ([::1]:47708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2sSy-0002PR-4i
	for lists+qemu-devel@lfdr.de; Tue, 04 Aug 2020 04:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1k2sRl-0001Wx-9g
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 04:37:21 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:56222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1k2sRj-00020f-Ay
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 04:37:21 -0400
Received: by mail-wm1-x342.google.com with SMTP id 9so1861165wmj.5
 for <qemu-devel@nongnu.org>; Tue, 04 Aug 2020 01:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=/nPyjZI9KV5I3szUDlWxSRO5+QFYlS+dHOy2SDtIKYI=;
 b=oXCdsQSipocZ1Yj1Isdzk6UckuRU8rqJ8m72XxMh7ClA1lkM7ZZ/YtrcvF+wSV2JA9
 tfvYAPBB3QCV1swMVvJcTmH4pzwPi3u1IL57yvrfuyBPhK7Atgx9l2DQCs5+67gy+yax
 MQqyOHDHEHyP1Eb1GfsYWjNqYl2rwQaBKpCdoxmLIv5Fy+RZ56CHnEnlY3EIa9nYuG0j
 xMISVEuZSlfzMjwK0R2+Vw19VyTukis4CZWYA9LTofVUwOEhYSFqTV129ahtxQoBe+dZ
 hOPA0SdI8aPTbYTO6vGyI766ZsiKzSXkuz3KjohPfirrSRvh7nb3Wnbgq//oIVc5jUbt
 k0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=/nPyjZI9KV5I3szUDlWxSRO5+QFYlS+dHOy2SDtIKYI=;
 b=hbw2KojMDN9T5Wd3bI1SnqmvijQnALiAznY1g+qoCfRx6Kuw/ThhbZfm2Blu50Yyq6
 7BArB+FU4ZU1o9I7R01aZinPb7Hp1v3mE6crYZvkVhv24ftKChcPrT/H24P+UT8vg1LX
 7x00fNiCO94Mn6YZfMoeijGFpoPk4fCQG45xYQazCjT3+sMWv/jfCpL2Z/ONK5lVkclt
 Ky+U7VDSLP2tfvH/nuJy4FanpCb5wuhLilX6CpWZZP2T3iwrDShgYi6lN0Kaj3I7nGAF
 iATudb8L/uylTd4JvY2ppFToZBkhIKA/33L93pKtq6PpT92Af9zz/XG+Fl+yHVEOz3oK
 CBJg==
X-Gm-Message-State: AOAM530fuyrLP3zol2ToNlBzgw5fA2t/GlgEW0xSjW/9ez6SFhbI/W1a
 ugqrSFq8XbZFtUz9uWIM2fI=
X-Google-Smtp-Source: ABdhPJzDapD/UdsRWGR4kmZkbCsJ5WPWtzEotAYMzUckkcs3AVBwHialxx4/CVNRuy1BJy6inh5O0Q==
X-Received: by 2002:a1c:80c1:: with SMTP id b184mr3197422wmd.121.1596530237540; 
 Tue, 04 Aug 2020 01:37:17 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id r22sm3644644wmh.45.2020.08.04.01.37.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Aug 2020 01:37:17 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20200804074930.13104-1-philmd@redhat.com>
 <20200804074930.13104-2-philmd@redhat.com>
 <001201d66a34$e82ec070$b88c4150$@xen.org>
 <56c70b44-2d5f-44fc-5d9a-535c3c5fca71@redhat.com>
In-Reply-To: <56c70b44-2d5f-44fc-5d9a-535c3c5fca71@redhat.com>
Subject: RE: [PATCH-for-5.1 v2 1/1] accel/xen: Fix xen_enabled() behavior on
 target-agnostic objects
Date: Tue, 4 Aug 2020 09:37:16 +0100
Message-ID: <001301d66a3a$75ac6c90$610545b0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQM/xXTZtf+c9Zv1otz4aIX099Jj8gDx5jXAAVRtvfwA7Pf4CaY7T1ag
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Cc: 'Peter Maydell' <peter.maydell@linaro.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Paul Durrant' <pdurrant@amazon.com>, 'Paolo Bonzini' <pbonzini@redhat.com>,
 'Anthony Perard' <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> -----Original Message-----
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Sent: 04 August 2020 09:35
> To: paul@xen.org; qemu-devel@nongnu.org
> Cc: 'Peter Maydell' <peter.maydell@linaro.org>; 'Anthony Perard' =
<anthony.perard@citrix.com>; 'Paolo
> Bonzini' <pbonzini@redhat.com>; 'Stefano Stabellini' =
<sstabellini@kernel.org>; xen-
> devel@lists.xenproject.org; 'Paul Durrant' <pdurrant@amazon.com>
> Subject: Re: [PATCH-for-5.1 v2 1/1] accel/xen: Fix xen_enabled() =
behavior on target-agnostic objects
>=20
> Hi Paul,
>=20
> On 8/4/20 9:57 AM, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> Sent: 04 August 2020 08:50
> >> To: qemu-devel@nongnu.org
> >> Cc: Peter Maydell <peter.maydell@linaro.org>; Anthony Perard =
<anthony.perard@citrix.com>; Paolo
> >> Bonzini <pbonzini@redhat.com>; Stefano Stabellini =
<sstabellini@kernel.org>; xen-
> >> devel@lists.xenproject.org; Paul Durrant <paul@xen.org>; Philippe =
Mathieu-Daud=C3=A9
> <philmd@redhat.com>;
> >> Paul Durrant <pdurrant@amazon.com>
> >> Subject: [PATCH-for-5.1 v2 1/1] accel/xen: Fix xen_enabled() =
behavior on target-agnostic objects
> >>
> >> CONFIG_XEN is generated by configure and stored in =
"config-target.h",
> >> which is (obviously) only include for target-specific objects.
> >> This is a problem for target-agnostic objects as CONFIG_XEN is =
never
> >> defined and xen_enabled() is always inlined as 'false'.
> >>
> >> Fix by following the KVM schema, defining CONFIG_XEN_IS_POSSIBLE
> >> when we don't know to force the call of the non-inlined function,
> >> returning the xen_allowed boolean.
> >>
> >> Fixes: da278d58a092 ("accel: Move Xen accelerator code under =
accel/xen/")
> >> Reported-by: Paul Durrant <pdurrant@amazon.com>
> >> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >>  include/sysemu/xen.h   | 18 ++++++++++++++----
> >>  accel/stubs/xen-stub.c |  2 ++
> >>  accel/xen/xen-all.c    |  7 +------
> >>  3 files changed, 17 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
> >> index 1ca292715e..2c2c429ea8 100644
> >> --- a/include/sysemu/xen.h
> >> +++ b/include/sysemu/xen.h
> >> @@ -8,9 +8,19 @@
> >>  #ifndef SYSEMU_XEN_H
> >>  #define SYSEMU_XEN_H
> >>
> >> -#ifdef CONFIG_XEN
> >> +#ifdef NEED_CPU_H
> >> +# ifdef CONFIG_XEN
> >> +#  define CONFIG_XEN_IS_POSSIBLE
> >> +# endif
> >> +#else
> >> +# define CONFIG_XEN_IS_POSSIBLE
> >> +#endif
> >>
> >> -bool xen_enabled(void);
> >> +#ifdef CONFIG_XEN_IS_POSSIBLE
> >> +
> >> +extern bool xen_allowed;
> >> +
> >> +#define xen_enabled()           (xen_allowed)
> >
> > Can this not move ahead of the #ifdef now (since xen_allowed is =
present in both xen-stub and xen-
> all)? I think this is what Peter was saying in his option '(2)'.
>=20
> I think I respected Peter's option '(2)', following how KVM does, this
> is the case with stub,

Ok, if it follows the KVM pattern then that's fine.

Reviewed-by: Paul Durrant <paul@xen.org>


