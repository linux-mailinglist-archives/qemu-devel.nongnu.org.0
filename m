Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FA82D5ECC
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:59:46 +0100 (CET)
Received: from localhost ([::1]:46552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knNQ1-0001U0-P1
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:59:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1knNNS-0007J9-UJ
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:57:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1knNNR-0000m7-Ek
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:57:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607612224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JXqyrvdOJb2ioK7+vOVVst13JBAIvCX7ELMPyGaGrxc=;
 b=I0lfrheSPqu6tv4AJijdNDtV76CNhf/PA+NuUFLXl/S6HegtODw/r2ygmrS4bT/ufuYvoq
 i8+jJgqVJSaJMCtDKYd4KFpY/oPUgnN17lo0/g3NoMu97VDqlVEUfsgTUhEXUxMhFR1YVZ
 xUHr9yrN3jWcgvd2w/7N4+0kBKIbD1E=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-HF8jKGD0PRu76vuc04KQxw-1; Thu, 10 Dec 2020 09:57:02 -0500
X-MC-Unique: HF8jKGD0PRu76vuc04KQxw-1
Received: by mail-io1-f71.google.com with SMTP id c7so4064052iob.10
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 06:57:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JXqyrvdOJb2ioK7+vOVVst13JBAIvCX7ELMPyGaGrxc=;
 b=ZNyjxBamScpzkBX97+n0O2k/2lD1Hgn017rnDmBjewyKVF3IrzQSV4yErk4GKa3x7c
 XyGL7UWpX6KFzQIiIHjNM6OfdZ410rSZjvBoOqD2XSs2LezsQ0AtBxs0BEutTQygjs8J
 rju9QB5m9o2wksW3HLxaSYAg4XTd0yGd1HWYCNyyRs6JnvWUwz1cSTdDkQlg07eThTnp
 bBftSmPt3KWQcuf3O2mHBsIbvV+Ak6ll8yMCVNIbNcDD7t5xEskcFw6l/W+gGoBGg8QF
 AtqKfcyXczk/LOH5/k52hvX7uqQ3UfMlnsRaDoVNYIKNcOd+a/8Si2yzUQqsp12wcYON
 UZrw==
X-Gm-Message-State: AOAM532BirDU690lvy4EzjNtYc8uWzQcwzuOtS8Q7LvgXV0yDS7XzhdL
 ykAEA7/zXFOVw9Aa1MU2xuzVnifZ7mQ2zKP+SgmfLQ+SRMhI77El2Wdud3wcZwBFzuceE2oTMEK
 sZXBkV7ehcQRHEHXGglEvFmkHr/VLgV8=
X-Received: by 2002:a92:c26c:: with SMTP id h12mr3441185ild.165.1607612221487; 
 Thu, 10 Dec 2020 06:57:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTp0xzsbwNTZrcPB5s1KuzFnilNq6cZjoRe/XflqmlO4DDt1OBf1aX0Z0sIhLZJ0uGd19w3g9P9yy6kBEvWm4=
X-Received: by 2002:a92:c26c:: with SMTP id h12mr3441180ild.165.1607612221323; 
 Thu, 10 Dec 2020 06:57:01 -0800 (PST)
MIME-Version: 1.0
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-9-marcandre.lureau@redhat.com>
 <a162ec7c-4dc3-5784-866e-dc95f6919b1f@redhat.com>
 <CAFEAcA_xbEm+DmP5hixtkzWJK1fi8X7wZh+eGKmDneZv_=-xbA@mail.gmail.com>
 <ac25b79a-c22a-04ab-f125-873710ef9f6d@redhat.com>
In-Reply-To: <ac25b79a-c22a-04ab-f125-873710ef9f6d@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 10 Dec 2020 18:56:49 +0400
Message-ID: <CAMxuvay1DzS=GzW+0g3x0BgTC850zuqsQ_3tVZ-Fu7Nxz+vLYw@mail.gmail.com>
Subject: Re: [PATCH v3 08/13] audio: remove GNUC & MSVC check
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Thu, Dec 10, 2020 at 6:35 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 12/10/20 3:27 PM, Peter Maydell wrote:
> > On Thu, 10 Dec 2020 at 14:26, Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com> wrote:
> >>
> >> On 12/10/20 2:47 PM, marcandre.lureau@redhat.com wrote:
> >>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>>
> >>> QEMU requires either GCC or Clang, which both advertize __GNUC__.
> >>> Drop MSVC fallback path.
> >>>
> >>> Note: I intentionally left further cleanups for a later work.
> >>>
> >>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>> ---
> >>>  audio/audio.c | 8 +-------
> >>>  1 file changed, 1 insertion(+), 7 deletions(-)
> >>>
> >>> diff --git a/audio/audio.c b/audio/audio.c
> >>> index 46578e4a58..d7a00294de 100644
> >>> --- a/audio/audio.c
> >>> +++ b/audio/audio.c
> >>> @@ -122,13 +122,7 @@ int audio_bug (const char *funcname, int cond)
> >>>
> >>>  #if defined AUDIO_BREAKPOINT_ON_BUG
> >>>  #  if defined HOST_I386
> >>> -#    if defined __GNUC__
> >>> -        __asm__ ("int3");
> >>> -#    elif defined _MSC_VER
> >>> -        _asm _emit 0xcc;
> >>> -#    else
> >>> -        abort ();
> >>> -#    endif
> >>> +      __asm__ ("int3");
> >>
> >> This was 15 years ago... Why not simply use abort() today?
> >
> > That's what I suggested when I looked at this patch in
> > the previous version of the patchset, yes...
>
> Ah, I went back to read v2 thread. Actually I even prefer
> Gerd's suggestion to remove this dead code.
>

And I totally agree. However, I don't want to mix concerns. I am just
removing dead-code.


