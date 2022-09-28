Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EF45EE4B2
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 20:59:21 +0200 (CEST)
Received: from localhost ([::1]:48298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odcHB-0007lW-0f
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 14:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odcEN-0004H3-7b
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 14:56:27 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:40836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odcEK-0007h7-Hn
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 14:56:26 -0400
Received: by mail-ej1-x635.google.com with SMTP id l14so29039832eja.7
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 11:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=ZY2HNktMluQmsNvOy1Svrazl3wDZBz83ClQa6XKE/Pk=;
 b=EQWUoa3JktyoMDaSm0R9kHmF9LO00m9mptqUukQVVsowdJKFjoWApEe+shhC5q2EVg
 hvjc716SDry6+cazWICfXkLbxcRRb0CouTs1UpbK/XrAaJrIViDs6hMkfkXF7yOnchnJ
 mKpCWOiojhfgDkRe5hsVDHQY6qTZQ3bEJsan/2KkAa5erQEyp23E44QLoDSWxr5fAWpm
 RQbmxqYU+nPvGDuLoEBoFvqJkhPmFOvSCLGCGXf6BeOdpvA5VfDvs36Fffd54YyKf5LD
 NgzNJptpinjkngm/yONdmottotGAmzq6+8vopNMJca7brD6LB+9CwcAfK8AgbnVhdMxC
 3LDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ZY2HNktMluQmsNvOy1Svrazl3wDZBz83ClQa6XKE/Pk=;
 b=AIXbyKKhGAEIn2u7V/kv1vW0jQMcQjXCCWvl+naKeub+n83ocNspHZBonQXSPePA2j
 UaacujdjDrcrMuK2sQ3k7hPU+8R3gaPM9auvjNKl+daoUgKH37Zyruxi7lhF2H0XJiF8
 Go1TAvGU5krVRlhRjyRiWLeprsjkIJ9DjvHId6pkRFQC0km3BoTQxeYvXuQbG068o14L
 A95dTp0MfMpi0AHB4wTh+2g8AmIi5/uqf11cpl4wjDfc+fwgfhrjqRl2vLOoVhB18For
 g8EQx6NcsHh00CcFHyGGa/zO68P5572YODfNu/K7nfEB52oD9Ca0asJe4rJ7r31FmoKe
 GrwQ==
X-Gm-Message-State: ACrzQf1GA9E+tGqpYQKsamQbblJX7+AJ6ddxdEd84hhwB3S3Vv2ikFgn
 fUrutjNUDeYtzqlgwZghd/vbPDv6UidwrANaSzvvsw==
X-Google-Smtp-Source: AMsMyM7MzPu5T11FIlKx57fLw0gfd0u9zQL+jlmwi6zBBCV8XJkKv6lPqZjC/q/LxhmaGhoK6/TKIPZidkbEb7D7wJ0=
X-Received: by 2002:a17:906:730d:b0:782:a4e0:bb54 with SMTP id
 di13-20020a170906730d00b00782a4e0bb54mr24830530ejc.659.1664391382579; Wed, 28
 Sep 2022 11:56:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-2-alex.bennee@linaro.org>
 <769e0e8a-7787-b02b-9e26-87eca955666b@linaro.org>
In-Reply-To: <769e0e8a-7787-b02b-9e26-87eca955666b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Sep 2022 19:56:11 +0100
Message-ID: <CAFEAcA-0zoNS0nWrYu6hM1=8tG4i4GkjHLL2v4OMmJv5GaDAMg@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] hw: encode accessing CPU index in MemTxAttrs
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 28 Sept 2022 at 17:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/27/22 07:14, Alex Benn=C3=A9e wrote:
> > --- a/hw/misc/tz-msc.c
> > +++ b/hw/misc/tz-msc.c
> > @@ -137,11 +137,11 @@ static MemTxResult tz_msc_read(void *opaque, hwad=
dr addr, uint64_t *pdata,
> >           return MEMTX_OK;
> >       case MSCAllowSecure:
> >           attrs.secure =3D 1;
> > -        attrs.unspecified =3D 0;
> > +        attrs.requester_type =3D MTRT_CPU;
> >           break;
> >       case MSCAllowNonSecure:
> >           attrs.secure =3D 0;
> > -        attrs.unspecified =3D 0;
> > +        attrs.requester_type =3D MTRT_CPU;
> >           break;
>
> This is surely incomplete.  You can't just set "cpu" without saying where=
 it's from.
>
> Since this device is only used by the ARMSSE machine, I would hope that a=
ttrs.unspecified
> should never be set before the patch, and thus MTRT_CPU should be set aft=
erward.

The MSC is in the address map like most other stuff, and thus there is
no restriction on whether it can be accessed by other things than CPUs
(DMAing to it would be silly but is perfectly possible).

The intent of the code is "pass this transaction through, but force
it to be Secure/NonSecure regardless of what it was before". That
should not involve a change of the requester type.

thanks
-- PMM

