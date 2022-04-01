Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 583014EF790
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 18:16:08 +0200 (CEST)
Received: from localhost ([::1]:40218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naJwV-0008C5-2c
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 12:16:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naJvE-0007V2-Qv
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 12:14:48 -0400
Received: from [2607:f8b0:4864:20::112c] (port=40802
 helo=mail-yw1-x112c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naJvD-0000UB-2p
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 12:14:48 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2e5e9025c20so38378717b3.7
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 09:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hM+lLyyq/1PweNHE6epEjgJ4puRtDRVWjvAIYETNWak=;
 b=vSEdnCVDhsctRIRfGf0WQF0GkfSPSXP2H/AYrrUQyun42RJPPiqMd51Q7paRy1pL9O
 tsoZADK/OR4kR8KRGSi/IvQ8+Lufd7hmRNiCxzEGGHADy4zIvnaLOceUirOBEAl9pDeB
 alJZuq2HoTvqoequvl5c4vxF/qNhNGDlmumk/GITO+XPnb8ZOLEaBUUglU0EXosDaqtA
 SPj1djxW4vtuys8HnohfjY7DTSlTfq7o7qLwVlRTOXOqfWKAZboSIGsLYbbFhRySLo14
 ny+Wv1cupl+PX9I8jcgx94iH4SNf54rI/+EhaEb6NsbsRekVqGF5X5nw+hZNtqNqR86h
 RoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hM+lLyyq/1PweNHE6epEjgJ4puRtDRVWjvAIYETNWak=;
 b=PfJLBx7R7Ssq5sPysOF8qdyCiKJ0DAJ9GmAd6LOxUi5us0jiFSak/4/kC0hLVH/JvN
 BoyEphrXuMJCVYsUQ9Eq4toejECSbY+oGPsb1C29oFg+UvGk++DreDgg8ulQ3ZMIF7/z
 3e8jLkbQ2OQefj+ZRbRAfv0WWa0DhiqXrqt8hDDNITSKWxPybOK6aKEGW3Q7DdWp9vLo
 LfgblO7yvLh5q5CV78wxy7MkjWWgrf62BiipCCnoS8QyErmzA/mrBD9P092/mRfuica5
 kGAQpv/Fv6LKVaI/TQjAoE2vr7fmiomEg0n+Z1VXt9IQx/2tQIJeDX/McTx+BQgRUi5B
 sGDw==
X-Gm-Message-State: AOAM5326SRSVZyYQklkgliSjHBoNH/m9HMcdTtxIjBKdhK2v/c1YH0rW
 EoVL6y4boWlnfLxcjbZPOSalUAg4NZYkMJKYu0yD/w==
X-Google-Smtp-Source: ABdhPJy8/lljuFL25m8CYG9KqMm8gBySfhbeQqFCLtFfUn5QgKIcvsn/k+94qVsjHvQTUSdVhwnmUqBqtGVfNckTI3k=
X-Received: by 2002:a81:db05:0:b0:2ea:2b92:c317 with SMTP id
 u5-20020a81db05000000b002ea2b92c317mr11017752ywm.329.1648829686113; Fri, 01
 Apr 2022 09:14:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_17Mzz7AiQd+1z50Jp-wWhfChCVi=8kjWCU6daUVqV_Q@mail.gmail.com>
 <YkXzToltd73X4WgY@xz-m1.local>
 <CACGkMEs41rX5FqtKst4qZc1QXyY1VvMK_GMo_4NRD45zh9VSHg@mail.gmail.com>
 <633f66f9-2a86-6d52-15de-d0c557412bf7@amd.com>
In-Reply-To: <633f66f9-2a86-6d52-15de-d0c557412bf7@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Apr 2022 17:14:35 +0100
Message-ID: <CAFEAcA9KogtFm0g1+T40Kfz4GDRMtfhDeJ0jTb5dfax5E4voMQ@mail.gmail.com>
Subject: Re: who's maintaining amd_iommu.c these days?
To: Wei Huang <wei.huang2@amd.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 1 Apr 2022 at 17:11, Wei Huang <wei.huang2@amd.com> wrote:
>
>
>
> On 3/31/22 21:09, Jason Wang wrote:
> > On Fri, Apr 1, 2022 at 2:30 AM Peter Xu <peterx@redhat.com> wrote:
> >>
> >> On Thu, Mar 31, 2022 at 05:01:52PM +0100, Peter Maydell wrote:
> >>> (4) The claimed bit layout of the event structure doesn't
> >>> match up with the one in the spec document I found. This
> >>> could be because I found a document for some other bit
> >>> of hardware, of course.
> Could you elaborate? Are you referring to amdvi_setevent_bits(evt, info,
> 55, 8)?

https://www.amd.com/system/files/TechDocs/48882_IOMMU.pdf
was the spec I found through random googling, but the event
structure layouts in chapter 2.5 of that document aren't
at all like the one that amdvi_encode_event() is using.
Maybe that's the wrong spec, as I say.

thanks
-- PMM

