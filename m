Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFFB5173EA
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 18:11:55 +0200 (CEST)
Received: from localhost ([::1]:59676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlYeQ-0007fa-Q1
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 12:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nlYZC-0001Y2-Nj; Mon, 02 May 2022 12:06:35 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:46133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nlYZA-0006kh-U0; Mon, 02 May 2022 12:06:30 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-d39f741ba0so14676057fac.13; 
 Mon, 02 May 2022 09:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FbouXDvBCVVnXkz0RFcnJK5xDP2HUl5g+NU1RgwvkrY=;
 b=HEHgryAyfLxI9UAR4TzoB1hJuH0sgzheV9KgDNIUd8idq30o2RD4Uy0P7Ayp29t+g6
 AvMwabndKZ6Ov5czrzMZu4izzJHPKMuNex0HkPMITjmA+5y7WfCcCmYG7GzQr5R9aQQv
 jYwer0fex17R+1HB3bnCwbZzDgEP+ViuuZK/bQ0J85ORlOPbU+AR2TaPReI2VJDOhYe+
 iJ8ViH0KBvOQUhciXkK/rR7CLLXHxK8sAe1op5tTNBVIfJ3mb3yWCOoFA9Pi8lRTzV8U
 SLlgEYis/3amNohMqs0GjAYt4/B2zoDoMeKdZlK0/zOVbLLRSV2LsjzzFki8wvQgvm5y
 50zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FbouXDvBCVVnXkz0RFcnJK5xDP2HUl5g+NU1RgwvkrY=;
 b=ZBHuXFgq+3xVSUQmGGVOENzwAQ/SEtiW7hv0Zh8JvsduX/LVA61Ds807J0TpoA5iwk
 z8U/9WImQNvFO2nw08TZmCy37ZlvcZxs6d8acTFs2MVWakTEWpGvIg5h7nzcAP+ZqgiQ
 S9SjIx3L+3VeV7Qj8eah/NBz2VLT7hkYcfb+RIISX5Sxztr2tgfWQQv9HvwETqLjWfun
 PRm6j1X9tw/vyY/YSBeEXIiQdiPuniNlKmzq6yqC/S26Ef67Y2oh8H0Q5vcpCSwwu6Lv
 7DeJ6bMTemA4T7z8LOv8hq225vbtQCyGurTLyCODHMvUa6jZLaPcqYYnz45Y/uuVz5eO
 2Psw==
X-Gm-Message-State: AOAM531flCHtPdDKmBlTK7Fafg+gurz91jLQL0KoeHdWUWHR4PqHP0qp
 e1PrRC/suKG0QQCxLUj8/TNIeDzWNDV1th4kYQU=
X-Google-Smtp-Source: ABdhPJwUIT35Ep/lxNDUTAJS2+qr3FDuTRU4u9y1rXd6L7YZdcpkIWuxexoZd+QMu0Eyw1CzegUZRVWBxX+6OTRUBMs=
X-Received: by 2002:a05:6870:d68c:b0:dd:e6e1:2c9f with SMTP id
 z12-20020a056870d68c00b000dde6e12c9fmr6333067oap.100.1651507586809; Mon, 02
 May 2022 09:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220428094708.84835-1-david@redhat.com>
 <97f9be15-4ccd-505b-a35e-8d95823df03a@redhat.com>
 <85dffe1d-a6d2-9e93-749b-29febb0b6dc5@redhat.com>
In-Reply-To: <85dffe1d-a6d2-9e93-749b-29febb0b6dc5@redhat.com>
From: David Miller <dmiller423@gmail.com>
Date: Mon, 2 May 2022 12:06:48 -0400
Message-ID: <CAEgyohV9kjXUW_LMQM7YryQL1=0VW3pSCbffG2uFG7d5vNo5iw@mail.gmail.com>
Subject: Re: [PATCH v6 00/13] s390x/tcg: Implement Vector-Enhancements
 Facility 2
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=dmiller423@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There was also the patch that had them as .insn in the other series of emails.

On Mon, May 2, 2022 at 11:52 AM David Hildenbrand <david@redhat.com> wrote:
>
> On 02.05.22 09:20, Thomas Huth wrote:
> > On 28/04/2022 11.46, David Hildenbrand wrote:
> >> Implement Vector-Enhancements Facility 2 for s390x
> >>
> >> resolves: https://gitlab.com/qemu-project/qemu/-/issues/738
> >>
> >> implements:
> >>      VECTOR LOAD ELEMENTS REVERSED               (VLER)
> >>      VECTOR LOAD BYTE REVERSED ELEMENTS          (VLBR)
> >>      VECTOR LOAD BYTE REVERSED ELEMENT           (VLEBRH, VLEBRF, VLEBRG)
> >>      VECTOR LOAD BYTE REVERSED ELEMENT AND ZERO  (VLLEBRZ)
> >>      VECTOR LOAD BYTE REVERSED ELEMENT AND REPLICATE (VLBRREP)
> >>      VECTOR STORE ELEMENTS REVERSED              (VSTER)
> >>      VECTOR STORE BYTE REVERSED ELEMENTS         (VSTBR)
> >>      VECTOR STORE BYTE REVERSED ELEMENTS         (VSTEBRH, VSTEBRF, VSTEBRG)
> >>      VECTOR SHIFT LEFT DOUBLE BY BIT             (VSLD)
> >>      VECTOR SHIFT RIGHT DOUBLE BY BIT            (VSRD)
> >>      VECTOR STRING SEARCH                        (VSTRS)
> >>
> >>      modifies:
> >>      VECTOR FP CONVERT FROM FIXED                (VCFPS)
> >>      VECTOR FP CONVERT FROM LOGICAL              (VCFPL)
> >>      VECTOR FP CONVERT TO FIXED                  (VCSFP)
> >>      VECTOR FP CONVERT TO LOGICAL                (VCLFP)
> >>      VECTOR SHIFT LEFT                           (VSL)
> >>      VECTOR SHIFT RIGHT ARITHMETIC               (VSRA)
> >>      VECTOR SHIFT RIGHT LOGICAL                  (VSRL)
> >
> > Thanks, queued to my s390x-next branch now:
> >
> >   https://gitlab.com/thuth/qemu/-/commits/s390x-next/
> >
> Thanks for fixing up. At this point I would have suggested to exclude
> the tests for now.
>
> --
> Thanks,
>
> David / dhildenb
>

