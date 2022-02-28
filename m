Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DE14C71EB
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 17:47:12 +0100 (CET)
Received: from localhost ([::1]:45292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOjB1-0004Mn-HC
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 11:47:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOj8w-0002uo-Gp
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 11:45:02 -0500
Received: from [2607:f8b0:4864:20::b36] (port=37544
 helo=mail-yb1-xb36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOj8t-0005MX-V3
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 11:45:02 -0500
Received: by mail-yb1-xb36.google.com with SMTP id y189so21750475ybe.4
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 08:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EbJfHGzoZQeg7a5CN9erGDGktU6Fs4TMP9QwCSsLMt8=;
 b=GB9qlwPMkbTRue72qK/f2OZrx9qzepJmGSq732yBPQayAKjWsv52w3x0FN0lV+Akgb
 83JqMt3nPsSahdV7Uu0JN+59Y1ZFGqj7/hdIeJ+xmHBSjdhkRuuFWC4vxTK/XZaJlxVC
 s/PaA9ReP/5C00OJDNdXYOIBvwk42qLeF51n22eWxpNkW9EkR9PpDnTdA6Q+6GdKhS6N
 jf6/mmX0H3xZa+Hwuym78OrVr/T1J1mw2ZJqWtEFbox45ImRFOgkWhf8E8ymmMwtQHNH
 xS+WUlfba3EHDqmM+dtJp40I4DPXAO0jVtdH+kapf7scPsdoUmow5EgDKJcbqwZohMN7
 sfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EbJfHGzoZQeg7a5CN9erGDGktU6Fs4TMP9QwCSsLMt8=;
 b=a08CjiQbLPyzr5MQURCvjlmsZi6Wtak0sTp7SMrlJX8tVzV6bQwKQE+msXzMvLC7Xi
 BLDid/zwL0kN+EMX8F5W7ynunhWx3cbSIP05zfllXPKjgVsDaCWguMM7RgAE5yER7MCq
 lwNWz/80P4+EYFaLzCDp8hHxjn7jGvCzrRGxmGJKkD+wNzAMnZZwSuSKr/B+yZz9/qX2
 zNSWdGAoHsIuYGd9+aijvJVDmgu7Nykgum4rVquyPOdZRJ8VmiiF2E/81ImThROD29tp
 5sqWVTvdmzugeHFkkCSaOcVVQ73m7Q+fWPUK/SVxr0A1gEGcriFB5amHQWwn84OquBmY
 Fc8w==
X-Gm-Message-State: AOAM533F+ToQksBqoOSor7JqcxPjy5A7oDADgQGV6L7DP5LUmFzJ3qFp
 Rt2jFLx4yoEf/mRD2aHYyA7qA+ZFV5FO75KGXTaAQg==
X-Google-Smtp-Source: ABdhPJzzTn4AYR2LLmvREDrZC4NFEa1wixZXLEvDkKVKrR5dVFvJu3hzZPSWhGu0S8cH0wk/JXZb1xdD9AZmtKIP4fQ=
X-Received: by 2002:a25:8084:0:b0:5fe:cadd:2532 with SMTP id
 n4-20020a258084000000b005fecadd2532mr19886651ybk.193.1646066699038; Mon, 28
 Feb 2022 08:44:59 -0800 (PST)
MIME-Version: 1.0
References: <87ee3q3mos.fsf@linaro.org> <87a6ee3l5e.fsf@linaro.org>
 <YhzWMMLTZY1e24Uh@stefanha-x1.localdomain> <87mtiblzsc.fsf@linaro.org>
In-Reply-To: <87mtiblzsc.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Feb 2022 16:44:47 +0000
Message-ID: <CAFEAcA8UzTJ7tze8mWdK_aO_vrnnXeUu6YjLDiiBJj-9v3_huw@mail.gmail.com>
Subject: Re: What is the correct way to handle the VirtIO config space in
 vhost-user?
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Feb 2022 at 16:32, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Stefan Hajnoczi <stefanha@redhat.com> writes:
> > On Fri, Feb 25, 2022 at 05:32:43PM +0000, Alex Benn=C3=A9e wrote:
> >> (aside: this continues my QOM confusion about when things should be in=
 a
> >> class or instance init, up until this point I hadn't needed it in my
> >> stub).
> >
> > Class init is a one-time per-class initializer function. It is mostly
> > used for setting up callbacks/overridden methods from the base class.
> >
> > Instance init is like an object constructor in object-oriented
> > programming.
>
> I phrased my statement poorly. What I meant to say is I sometimes find
> QEMUs approach to using class over instance initialisation inconsistent.
> I think I understand the "policy" as use class init until there is a
> case where you can't (e.g. having individual control of each instance of
> a device).

Do you have examples of inconsistency? (I'm sure there are some,
we're inconsistent about almost everything...)

In principle though I think the class-init vs instance-init split
is mostly fairly clear: if something changes per-instance then
it needs to be in the object state structure and set up in
instance_init. If it is a property of all instances of the
object then it goes in the class struct and is set up in the
class init function. As Stefan says, mostly that is setting up
the equivalent of method pointers and static class data.
It's more straightforward than instance-init vs realize, at
least :-)

-- PMM

