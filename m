Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1224EB81B
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 04:01:07 +0200 (CEST)
Received: from localhost ([::1]:53790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZNdx-0003ik-Ph
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 22:01:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@habkost.com>)
 id 1nZNcV-000340-HO
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 21:59:35 -0400
Received: from [2607:f8b0:4864:20::22a] (port=41885
 helo=mail-oi1-x22a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ehabkost@habkost.com>)
 id 1nZNcT-0001eB-R8
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 21:59:35 -0400
Received: by mail-oi1-x22a.google.com with SMTP id e189so20787175oia.8
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 18:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=habkost-com.20210112.gappssmtp.com; s=20210112;
 h=from:mime-version:references:in-reply-to:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ja3LmzE0pArtEScg2OwoJ/EWozXSTs2Ojpl0dUcnTp8=;
 b=Asfz84jHC696r13TZmEGTewwBhvwbbBHjo/v0GSnaX7e7aBePhMKo4fBMb0jgZFrTU
 pyzsLoWEweGjKQAwIN2nyMg9QH3RFrbENJFSK0I7WO5MRgpeHXHSxRHYVWo+UCzz9ySq
 O/bvBo0lLCHN4J1Bt632ZjlfKcdwd2t+7hn3NgA7XAwrhVAUk/P3+1zbgiHyMpUnTWPv
 P6fLPtcw49eU0qXFFyMTXW+Pvhot/oFHCXK2ECQQgDJXnGSRRJfVfeIoghJ/vxWsAHtv
 getRbu3+jI75bm0JSUQOFXXwRFnnXObCCRS92cNG7GuOH5x8BI8FBYp2B0tTPMWBM6Md
 h7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:mime-version:references:in-reply-to:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ja3LmzE0pArtEScg2OwoJ/EWozXSTs2Ojpl0dUcnTp8=;
 b=jp1bKnN+bEKeZEfoAmUEj67iXt5BTzGn/vf6pgIyuYX4d1eJxQaaKdwkv+DmcmecKe
 RcEGZhMQyUSrNpVcGCmKnLkYx2Foy4BSoYsp8t/ibgHjbXh5Hv86aYszpXh+ZgZdPJ+N
 bBqB9T2tlieEUV+I9xj9QRk6xk36eMqYr6SBgQ5At1w3eDTzGP6VvZZIjgZZw+Vd1n1S
 6SipqZuG8at0AdWiN7GDCo7UWauodnoyfuWW5dH/khjk9D84rDvwv81aDd8l50UYM0jP
 fcbghlbB2kSP6tptVAo03nx8YR9jXNrZ3LfMi5lJdIBhw6BORB4WVqDjTE5w4gH6TmTQ
 RJFA==
X-Gm-Message-State: AOAM5325JdcmdFDAu5nPJOXeJ4iowMyraZGVrUk68c0yZV6BrzHLe+sr
 S7SmjHo2MWmmk+0L1GJtti5e/Cn2g4UdFePO
X-Google-Smtp-Source: ABdhPJxyiGgu039ozbIBHSaV8c/qvTUqVaEDIjoiRDNZUKxHxOCa0+WmFkoVNBDoPaCxYGCRSFBGqw==
X-Received: by 2002:a05:6808:2383:b0:2ec:d08d:849d with SMTP id
 bp3-20020a056808238300b002ecd08d849dmr932006oib.100.1648605571613; 
 Tue, 29 Mar 2022 18:59:31 -0700 (PDT)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com.
 [209.85.160.54]) by smtp.gmail.com with ESMTPSA id
 s65-20020acac244000000b002ef4ee8c800sm9752675oif.13.2022.03.29.18.59.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 18:59:31 -0700 (PDT)
From: Eduardo Habkost <ehabkost@habkost.com>
X-Google-Original-From: Eduardo Habkost <eduardo@habkost.net>
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-d39f741ba0so20702398fac.13
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 18:59:30 -0700 (PDT)
X-Received: by 2002:a05:6870:40ce:b0:da:5b07:231c with SMTP id
 l14-20020a05687040ce00b000da5b07231cmr1143572oal.284.1648605570413; Tue, 29
 Mar 2022 18:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220325200438.2556381-1-jsnow@redhat.com>
 <20220325200438.2556381-4-jsnow@redhat.com>
In-Reply-To: <20220325200438.2556381-4-jsnow@redhat.com>
Date: Tue, 29 Mar 2022 21:59:10 -0400
X-Gmail-Original-Message-ID: <CAFszQJh6CX-FJsk_RXQ2nKu4EO8Sjs_BeC6-0pqXGzqNh0YJcg@mail.gmail.com>
Message-ID: <CAFszQJh6CX-FJsk_RXQ2nKu4EO8Sjs_BeC6-0pqXGzqNh0YJcg@mail.gmail.com>
Subject: Re: [PATCH 3/4] python/qmp-shell: relicense as LGPLv2+
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=ehabkost@habkost.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Daniel Berrange <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel developers <qemu-devel@nongnu.org>,
 Luiz Capitulino <lcapitulino@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <mlureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@habkost.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi!

On Fri, 25 Mar 2022 at 16:04, John Snow <jsnow@redhat.com> wrote:
>
> qmp-shell is presently licensed as GPLv2 (only). I intend to include
> this tool as an add-on to an LGPLv2+ library package hosted on
> PyPI.org. I've selected LGPLv2+ to maximize compatibility with other
> licenses while retaining a copyleft license.
>
> To keep licensing matters simple, I'd like to relicense this tool as
> LGPLv2+ as well in order to keep the resultant license of the hosted
> release files simple -- even if library users won't "link against" this
> command line tool.
>
> Therefore, I am asking permission from the current authors of this
> tool to loosen the license. At present, those people are:
>
> - John Snow (me!), 411/609
> - Luiz Capitulino, Author, 97/609
> - Daniel Berrang=C3=A9, 81/609
> - Eduardo Habkost, 10/609
> - Marc-Andr=C3=A9 Lureau, 6/609
> - Fam Zheng, 3/609
> - Cleber Rosa, 1/609
>
> (All of which appear to have been written under redhat.com addresses.)
>
> Eduardo's fixes are largely automated from 2to3 conversion tools and may
> not necessarily constitute authorship, but his signature would put to
> rest any questions.
>
> Cleber's changes concern a single import statement change. Also won't
> hurt to ask.
>
> CC: Luiz Capitulino <lcapitulino@redhat.com>
> CC: Daniel Berrange <berrange@redhat.com>
> CC: Eduardo Habkost <ehabkost@habkost.com>
> CC: Marc-Andr=C3=A9 Lureau <mlureau@redhat.com>
> CC: Fam Zheng <fam@euphon.net>
> CC: Cleber Rosa <crosa@redhat.com>
>
> Signed-off-by: John Snow <jsnow@redhat.com>

Acked-by: Eduardo Habkost <eduardo@habkost.net>

