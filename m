Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7509F4EE0D3
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 20:43:07 +0200 (CEST)
Received: from localhost ([::1]:44780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZzlC-0002fj-HN
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 14:43:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nZzVl-0000wC-Bd; Thu, 31 Mar 2022 14:27:09 -0400
Received: from [2607:f8b0:4864:20::231] (port=46689
 helo=mail-oi1-x231.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nZzVj-0003tr-Pp; Thu, 31 Mar 2022 14:27:09 -0400
Received: by mail-oi1-x231.google.com with SMTP id b188so359276oia.13;
 Thu, 31 Mar 2022 11:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iVV8+P8y7audTdIIzhobVGfaTDqvJWqIcHp40sYWw0s=;
 b=epmYl9gt61K9SxZ68smeu2OLpxSWRRLlECcxyW6u3FzPRwCuiBNY7t3a+gOSowkVae
 ztD7HIKfeOivNU7VqfNmHFDqwwKnwjs6nQJtN/TzcUVDhcsn40J/zYltGbuY8qBaq/2V
 jy90C2We7f0RQnx4Sh659QvpplfEjz91KCBxw8PnFvQAByOaPCkoLimQS1o8l5HhUNlV
 PO1HRIE4sj3oZZzAv4ECwWYrX92RwM644X8J2NXMrFSVM3E8FosnBBsJunFJF1fSWgCW
 ow4edR+FtUEQfrWgcaYBgS5zdJ69zXN/AleQ5qirocf9oZnO+YusIth+JOnVuXNowhA0
 FgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iVV8+P8y7audTdIIzhobVGfaTDqvJWqIcHp40sYWw0s=;
 b=GnXEpDWGSL/edxcButODLswh8SeNEljgnjqGwitTNi1ffxTTvXt0ntTT/Ml9ZfIh9L
 8rY1dOvXRoT0lj25JavxYLO3Fy+9jBOXgnARh4CBYokfkOIOiHI5gC5iVmD7HrdrM/h9
 ZIRUKArnwND2I3u3irfA9trF4vpGndCRI8NP5Z5IEZWsEG1A3dtQL+KQenpEjkrJ2UiJ
 A2rrHU6dkcA/+4Zv7plLInLCfgrHQHdbw32LrzGce8Zou8JqNeGDa80nz6kXfvuVB9sH
 ers9yNTynYCUQ0SnO5thvmMWY45jFmhaleg9gr2obYTSLYMCqUf0mNhfAEfxa1BL3jx7
 gQ3g==
X-Gm-Message-State: AOAM531Tso4/4ORUTC7N+SscU3bw1wcCy3PbkEBoPS0vIocu9TG0EwgZ
 HX3EAutUuQ38frG/+rqvWDCt0UKZeir9MYGthWs=
X-Google-Smtp-Source: ABdhPJyhgljz84Oov9BrAi2Y/aylYPyprdprYFAD+c4Vapfklm+bt6Or0HDvIsVMB4jwGJeo+45u8UtjiLSNX3c0zIM=
X-Received: by 2002:aca:2b14:0:b0:2ef:89b7:a885 with SMTP id
 i20-20020aca2b14000000b002ef89b7a885mr3193218oik.16.1648751225894; Thu, 31
 Mar 2022 11:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220322000441.26495-1-dmiller423@gmail.com>
 <20220322000441.26495-11-dmiller423@gmail.com>
 <c3bb72da-c390-f9b5-5254-f8c16df21427@redhat.com>
 <6409f049-d938-0e06-3cea-5877b31fce00@redhat.com>
 <95ad366c-509d-d41f-209b-dc66054de4b8@redhat.com>
In-Reply-To: <95ad366c-509d-d41f-209b-dc66054de4b8@redhat.com>
From: David Miller <dmiller423@gmail.com>
Date: Thu, 31 Mar 2022 14:26:55 -0400
Message-ID: <CAEgyohVUHa+yd-inLOv3zTf143-_2Z35+K_XatUz74bqxDK9CA@mail.gmail.com>
Subject: Re: [PATCH v4 10/11] tests/tcg/s390x: Tests for Vector Enhancements
 Facility 2
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::231
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=dmiller423@gmail.com; helo=mail-oi1-x231.google.com
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

Sorry,
   Didn't notice this, as it was on v4 patch emails.
I assume since there is no other follow up after a week,
 CI jobs are not being updated and I should change samples to use .insn.
I will try to get this out tomorrow.

Thanks,
- David Miller

On Wed, Mar 23, 2022 at 1:13 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 22/03/2022 11.31, Thomas Huth wrote:
> > On 22/03/2022 09.53, David Hildenbrand wrote:
> >> On 22.03.22 01:04, David Miller wrote:
> > [...]
> >>> diff --git a/tests/tcg/s390x/Makefile.target
> >>> b/tests/tcg/s390x/Makefile.target
> >>> index 8c9b6a13ce..921a056dd1 100644
> >>> --- a/tests/tcg/s390x/Makefile.target
> >>> +++ b/tests/tcg/s390x/Makefile.target
> >>> @@ -16,6 +16,14 @@ TESTS+=shift
> >>>   TESTS+=trap
> >>>   TESTS+=signals-s390x
> >>> +VECTOR_TESTS=vxeh2_vs
> >>> +VECTOR_TESTS+=vxeh2_vcvt
> >>> +VECTOR_TESTS+=vxeh2_vlstr
> >>> +
> >>> +TESTS+=$(VECTOR_TESTS)
> >>> +
> >>> +$(VECTOR_TESTS): CFLAGS+=-march=z15 -O2
> >>
> >> @Thomas, will that survive our test framework already, or do we have to
> >> wait for the debain11 changes?
> >
> > Alex' update to the container has already been merged:
> >
> > https://gitlab.com/qemu-project/qemu/-/commit/89767579cad2e371b
> >
> > ... and seems like it's working in Travis on s390x, too:
> >
> > https://app.travis-ci.com/github/huth/qemu/jobs/564188977#L12797
> >
> > ... so it seems like it should be OK now (considering that we drop support
> > for the old Ubuntu version 18.04 in QEMU 7.1, too).
>
> Looks like I spoke a little bit too soon - some of the CI pipelines are
> still using Debian 10 for running the TCG tests, and they are failing with
> these patches applied:
>
> https://gitlab.com/thuth/qemu/-/jobs/2238422870#L3499
>
> Thus we either need to update the CI jobs to use Debian 11, or use
> handcrafted instruction opcodes here again...
>
>   Thomas
>

