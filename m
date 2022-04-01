Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D294EF239
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 17:08:09 +0200 (CEST)
Received: from localhost ([::1]:57402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naIsi-0008CN-O0
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 11:08:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1naIn0-0006LW-S5; Fri, 01 Apr 2022 11:02:14 -0400
Received: from [2607:f8b0:4864:20::334] (port=40742
 helo=mail-ot1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1naImz-0005yc-4g; Fri, 01 Apr 2022 11:02:14 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 o20-20020a9d7194000000b005cb20cf4f1bso2289856otj.7; 
 Fri, 01 Apr 2022 08:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lrg9VgEDnKveU4lWcB9qmQYVU7T93V0GfdVuyZUOFrI=;
 b=L+XJcGvAp8e728ywopA/axAfmaWaQNcc98+vVfzn+LJu2lkC5gbdpb3aDkaILRkewH
 ss+brtVnZmeGxaB3/9q3VG+solfiFeh89Cis2yeLjms1PBLZmsm6t6pU/A4fam+n2oSX
 j75Qf72wCQ32fu02h1ykPd01ty04Nye1TnTwvYKtCWB9FkHh77r6OmZyN2CwopRYelDL
 AOJM2wxtXNrJLzRAgtX6Eaqcmi3+TvxKGLYsjtVwDgY7vZMknixHljlFTF8RIBHVc+U8
 rDLj4y4crZXJEA19p3pMdhLExtNOT6SttuVvw2Q2B2+ncRlDd3RxNlXPLnTe3mIwCoeH
 TZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lrg9VgEDnKveU4lWcB9qmQYVU7T93V0GfdVuyZUOFrI=;
 b=ZAjjvFNUfKbJR2HmRXcusIpPiVNV6ZIiguzMQqt2YHF8VpCPfA+018nQpa7nTurb4U
 KlsY1CD/5nbBGfd66i/54ESEVLMpPR7vcTQZUmFOqBmzwjxauslm6L2sacMppAta52+V
 HD+fy2GkWFjaT4Pm5az6KwK4DkSOxH09gnv3s1npSysNgazQxCQiaVFl3ClJ899PDvOe
 J8w3zRj732jKkGaqLKAb8vzksmpS0OuKvkhUcSFQD+92m2eu/5hsBfYwMb8oSVbJbAN+
 pJopbxpVkuCvtplodAK8RXKLgkcGitt1RE27eaVuMSO4NKLo6LNtsam5L6c/TzVCAzFO
 bZ6g==
X-Gm-Message-State: AOAM532QTNuB48q6meXwHG1YdEjwJ785FjILSEXAFh2wl8SMIAFnFoJt
 jbdo18DMTwXJ0z1pWppNDlwtsw8Bli2sl6Djhdo=
X-Google-Smtp-Source: ABdhPJwuC00cRUHDdOmIVazmUR4yGBTXT4xEk/6/ctNKk7I5mCXm0t7oYc0nBsbK4lwN//zF+Zx3DkYe7q5yDMoa1U0=
X-Received: by 2002:a9d:68cd:0:b0:5b2:361a:1f6c with SMTP id
 i13-20020a9d68cd000000b005b2361a1f6cmr7653725oto.7.1648825331596; Fri, 01 Apr
 2022 08:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220322000441.26495-1-dmiller423@gmail.com>
 <20220322000441.26495-11-dmiller423@gmail.com>
 <c3bb72da-c390-f9b5-5254-f8c16df21427@redhat.com>
 <6409f049-d938-0e06-3cea-5877b31fce00@redhat.com>
 <95ad366c-509d-d41f-209b-dc66054de4b8@redhat.com>
 <CAEgyohVUHa+yd-inLOv3zTf143-_2Z35+K_XatUz74bqxDK9CA@mail.gmail.com>
 <CAEgyohWR6C1z8OyuGwkv8LT-P5fR9eVsCFw4LmGUxZCDNszoSg@mail.gmail.com>
 <58110f3f-3190-7af4-6839-9a30fce05855@linux.ibm.com>
In-Reply-To: <58110f3f-3190-7af4-6839-9a30fce05855@linux.ibm.com>
From: David Miller <dmiller423@gmail.com>
Date: Fri, 1 Apr 2022 11:02:00 -0400
Message-ID: <CAEgyohUqmHrbQC5yqAtuhcqmnx-q5YxE+6xctbCVROGz+cqrqw@mail.gmail.com>
Subject: Re: [PATCH v4 10/11] tests/tcg/s390x: Tests for Vector Enhancements
 Facility 2
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::334
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=dmiller423@gmail.com; helo=mail-ot1-x334.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 farman@linux.ibm.com, cohuck@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vrr is almost a perfect match (it is for this, larger than imm4 would
need to be split).

.long : this would be uglier.
use enough to be filled with nops after ?
or use a 32b and 16b instead if it's in .text it should make no difference.


On Fri, Apr 1, 2022 at 2:42 AM Christian Borntraeger
<borntraeger@linux.ibm.com> wrote:
>
>
>
> Am 01.04.22 um 04:15 schrieb David Miller:
> > Hi,
> >
> > There is some issue with instruction sub/alt encodings not matching,
> > but I worked around it easily.
> >
> > I'm dropping the updated patch for the tests in here.
> > I know I should resend the entire patch series as a higher version
> > really, and will do so.
> > I'm hoping someone can tell me if it's ok to use .insn vrr  in place
> > of vri(-d) as it doesn't match vri.
> > [https://sourceware.org/binutils/docs-2.37/as/s390-Formats.html]
> >
> > .insn doesn't deal with sub encodings and there is no good alternative
> > that I know of.
> >
> > example:
> >
> >      /* vri-d as vrr */
> >      asm volatile(".insn vrr, 0xE70000000086, %[v1], %[v2], %[v3], 0, %[I], 0\n"
> >                  : [v1] "=v" (v1->v)
> >                  : [v2]  "v" (v2->v)
> >                  , [v3]  "v" (v3->v)
> >                  , [I]   "i" (I & 7));
> >
> > Patch is attached
>
> Yes, vri sucks and does not work with vrsd. Maybe just use .long which is probably
> better than using a "wrong" format.
> Opinions?

