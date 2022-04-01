Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA404EE5F6
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 04:17:56 +0200 (CEST)
Received: from localhost ([::1]:46046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na6rL-0001FZ-9u
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 22:17:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1na6pd-0007xh-0i; Thu, 31 Mar 2022 22:16:09 -0400
Received: from [2607:f8b0:4864:20::c34] (port=45007
 helo=mail-oo1-xc34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1na6pb-00030h-6r; Thu, 31 Mar 2022 22:16:08 -0400
Received: by mail-oo1-xc34.google.com with SMTP id
 i8-20020a4a6f48000000b00324ada4b9d9so292934oof.11; 
 Thu, 31 Mar 2022 19:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FhpxQvLzXLQY1VoIHqs5QrHoV6fee7uKj/oSfVxMuGg=;
 b=RUfG2taIYAf8wprxFvSaOpUGd3w6qyIcvWHtB8+e4s2ZYHQQqExmi6eCp0rckU+sfR
 4fkfIpe47dJYqG5ysyZ4ZeMsR8GaqTGuPgD4As59JBTcKVCoGYCQhsRK1/h92u4JuCAh
 OWU2DSmnfOuaT51ldmdRdaE8SHl8csFoG21Siwae6DMNRJBFs8ZHa8SvkZ/+u0IIXdgE
 Za6x0V2xFEP10HjRN5gfTq3bd8rf96cKjEQVvArj5SWAW7GBkO9TT3GdV7mb0GXa1hNW
 ll9ZnPVUdUi+qjB9bQKjT71EMiuGtgWdq4ayHbPjZ/NXHROsWnLymp5ERf7a8sxiyiqC
 RkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FhpxQvLzXLQY1VoIHqs5QrHoV6fee7uKj/oSfVxMuGg=;
 b=jwnlQ91WJmLvX0WAh9Ux4P3q7+UeUOmMGgTrvibg6/Xs+IhtdJOnSfGUpyOQ5TGGMf
 G0kE+oHWW56ydt/WH2kQP7kmbaFqdHkr38N8TKL4PD420wwOXPpyoRff0W2K5jLBPcsN
 6HySaGvwuvmVMPrz9dvSsXDanjmiPIX6RYtJ8LrG+n7hOuis72lrBf+I6egi0N3HY3sQ
 NzAXQfn/q9O5Z+lOviw9tRFRoHH19a2l/7gLxPjBfT+2Hckh60yxfOQ08wzx4FUv7cmF
 xoAXmEtXT4nPCDQaQsK9OyLHKqRLade7GZFX9fMkl/NZNvBy4m1JrHOe6uGZCNyk+07L
 MOfA==
X-Gm-Message-State: AOAM530QwyDr+B7Y+7TJdZF+9XIh3BYqyPfVFqiJGvRSbb8n1T8PinPG
 zIyHa7Tav2gol9BY2ZtYDm1UMiD5uXMLfF26TfE=
X-Google-Smtp-Source: ABdhPJztXnSTfvpkTZGRhQxHJr7cnywFSfrabCEDSU4ye+3DmwKVqWX2VAfDSoWz3OhP2pWveku3eRIHlVz9CdfIjNU=
X-Received: by 2002:a4a:5b83:0:b0:324:4866:4f6e with SMTP id
 g125-20020a4a5b83000000b0032448664f6emr6168232oob.61.1648779365557; Thu, 31
 Mar 2022 19:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220322000441.26495-1-dmiller423@gmail.com>
 <20220322000441.26495-11-dmiller423@gmail.com>
 <c3bb72da-c390-f9b5-5254-f8c16df21427@redhat.com>
 <6409f049-d938-0e06-3cea-5877b31fce00@redhat.com>
 <95ad366c-509d-d41f-209b-dc66054de4b8@redhat.com>
 <CAEgyohVUHa+yd-inLOv3zTf143-_2Z35+K_XatUz74bqxDK9CA@mail.gmail.com>
In-Reply-To: <CAEgyohVUHa+yd-inLOv3zTf143-_2Z35+K_XatUz74bqxDK9CA@mail.gmail.com>
From: David Miller <dmiller423@gmail.com>
Date: Thu, 31 Mar 2022 22:15:54 -0400
Message-ID: <CAEgyohWR6C1z8OyuGwkv8LT-P5fR9eVsCFw4LmGUxZCDNszoSg@mail.gmail.com>
Subject: Re: [PATCH v4 10/11] tests/tcg/s390x: Tests for Vector Enhancements
 Facility 2
To: Thomas Huth <thuth@redhat.com>
Content-Type: multipart/mixed; boundary="00000000000065f71e05db8e5c60"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=dmiller423@gmail.com; helo=mail-oo1-xc34.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: farman@linux.ibm.com, David Hildenbrand <david@redhat.com>,
 cohuck@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000065f71e05db8e5c60
Content-Type: text/plain; charset="UTF-8"

Hi,

There is some issue with instruction sub/alt encodings not matching,
but I worked around it easily.

I'm dropping the updated patch for the tests in here.
I know I should resend the entire patch series as a higher version
really, and will do so.
I'm hoping someone can tell me if it's ok to use .insn vrr  in place
of vri(-d) as it doesn't match vri.
[https://sourceware.org/binutils/docs-2.37/as/s390-Formats.html]

.insn doesn't deal with sub encodings and there is no good alternative
that I know of.

example:

    /* vri-d as vrr */
    asm volatile(".insn vrr, 0xE70000000086, %[v1], %[v2], %[v3], 0, %[I], 0\n"
                : [v1] "=v" (v1->v)
                : [v2]  "v" (v2->v)
                , [v3]  "v" (v3->v)
                , [I]   "i" (I & 7));

Patch is attached


Thanks
- David Miller


On Thu, Mar 31, 2022 at 2:26 PM David Miller <dmiller423@gmail.com> wrote:
>
> Sorry,
>    Didn't notice this, as it was on v4 patch emails.
> I assume since there is no other follow up after a week,
>  CI jobs are not being updated and I should change samples to use .insn.
> I will try to get this out tomorrow.
>
> Thanks,
> - David Miller
>
> On Wed, Mar 23, 2022 at 1:13 PM Thomas Huth <thuth@redhat.com> wrote:
> >
> > On 22/03/2022 11.31, Thomas Huth wrote:
> > > On 22/03/2022 09.53, David Hildenbrand wrote:
> > >> On 22.03.22 01:04, David Miller wrote:
> > > [...]
> > >>> diff --git a/tests/tcg/s390x/Makefile.target
> > >>> b/tests/tcg/s390x/Makefile.target
> > >>> index 8c9b6a13ce..921a056dd1 100644
> > >>> --- a/tests/tcg/s390x/Makefile.target
> > >>> +++ b/tests/tcg/s390x/Makefile.target
> > >>> @@ -16,6 +16,14 @@ TESTS+=shift
> > >>>   TESTS+=trap
> > >>>   TESTS+=signals-s390x
> > >>> +VECTOR_TESTS=vxeh2_vs
> > >>> +VECTOR_TESTS+=vxeh2_vcvt
> > >>> +VECTOR_TESTS+=vxeh2_vlstr
> > >>> +
> > >>> +TESTS+=$(VECTOR_TESTS)
> > >>> +
> > >>> +$(VECTOR_TESTS): CFLAGS+=-march=z15 -O2
> > >>
> > >> @Thomas, will that survive our test framework already, or do we have to
> > >> wait for the debain11 changes?
> > >
> > > Alex' update to the container has already been merged:
> > >
> > > https://gitlab.com/qemu-project/qemu/-/commit/89767579cad2e371b
> > >
> > > ... and seems like it's working in Travis on s390x, too:
> > >
> > > https://app.travis-ci.com/github/huth/qemu/jobs/564188977#L12797
> > >
> > > ... so it seems like it should be OK now (considering that we drop support
> > > for the old Ubuntu version 18.04 in QEMU 7.1, too).
> >
> > Looks like I spoke a little bit too soon - some of the CI pipelines are
> > still using Debian 10 for running the TCG tests, and they are failing with
> > these patches applied:
> >
> > https://gitlab.com/thuth/qemu/-/jobs/2238422870#L3499
> >
> > Thus we either need to update the CI jobs to use Debian 11, or use
> > handcrafted instruction opcodes here again...
> >
> >   Thomas
> >

--00000000000065f71e05db8e5c60
Content-Type: image/png; name="image.png"
Content-Disposition: attachment; filename="image.png"
Content-Transfer-Encoding: base64
Content-ID: <f_l1fr8vu00>
X-Attachment-Id: f_l1fr8vu00

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
--00000000000065f71e05db8e5c60--

