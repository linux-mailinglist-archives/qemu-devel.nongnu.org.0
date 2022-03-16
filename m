Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1854DB9E7
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 22:09:12 +0100 (CET)
Received: from localhost ([::1]:43296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUatK-00030a-O4
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 17:09:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUarR-0001wg-C1
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 17:07:13 -0400
Received: from [2607:f8b0:4864:20::b32] (port=39638
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUarP-0004hy-On
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 17:07:12 -0400
Received: by mail-yb1-xb32.google.com with SMTP id t11so6716849ybi.6
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 14:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TNH3nWalh8NgTXLtpze8tFDSWD0JbTwj8lRF3TDZ3aQ=;
 b=Pb/jAOkDTaO2skvtEghr+HyOvgBUl+wmDCPdQEEuOQy0Dwq4+A8q48AMizIgrTmjOx
 Pk8d3iy3Qey4eRYg5lyhJ3NtukLpC0XylZvVokHgUxk3rPInTpVIuIttunnMT7ASO1Xz
 gApb2idho2IVKGQnavbQpc0i59Ur0Tgvq1gvo1W3Bc/LTyP8rcdDyeGdO1Hy3VTOEiIi
 QKIRNN0opfUVtqYoTE7w1CyeKdAo6I3WthIRjyz4IjCT5beIXcO2TwESC0RLadt+EdNX
 NJVElaWSVMuzxgOUjBuxu7jJe/OX1CPh6f3F8jBB8ivylPJui6iMP83eThFsa6XQM5Sh
 5otw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TNH3nWalh8NgTXLtpze8tFDSWD0JbTwj8lRF3TDZ3aQ=;
 b=l6VeReVD5RNNRZZEP46bJWpByDL2Af76wFRtMWRjWVol/kdhSdkZAYOrklJ+WADIuW
 qCHkxOZsGsNpdl+DC+r94mU//vc7NFM13Nprbn0zxaj/NKLFsfriRjEZiJKzqT1e4ZTM
 P23MFzWL1kB9S+l2tiJqNg5z7TA09TDiSm+dZi2L71wJhKlLLy2/NEu7TWjovKvhbTmG
 PBm+ro+Yv8J2AbgwQz2dB8FjGUb7hIGz/6ksAVu9cmJrSiJajkGjo7CFJ/FRIgm67Y2E
 lRJEWjil60LRPctxoFVDG5oVgQ+rROXHQbOaVYyciUub4nn4BNQmA8Gswl9vJBEiAIZM
 lX6g==
X-Gm-Message-State: AOAM530OtvlnuOF5y5DAhKb+oNl235hIlz4aG6+J3agzQDl+fb7Leh82
 JEYEUY2SsFBU8l2ekHmC/426AkL9y+SK5DvIZoHbqw==
X-Google-Smtp-Source: ABdhPJzL4dR6iBJTifg9nqduaaurX00K1AAndXGh1ZiocUnTtaFguH5jFDvLSvE9IXkSBQ6srnhH38Dub3tAIynMIMA=
X-Received: by 2002:a05:6902:510:b0:630:b29f:ce2e with SMTP id
 x16-20020a056902051000b00630b29fce2emr2008906ybs.67.1647464830665; Wed, 16
 Mar 2022 14:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220316160300.85438-1-philippe.mathieu.daude@gmail.com>
 <e1a5b41b-708d-ef3b-4c9b-8b2469cf4a92@gmail.com>
 <f7fb6c55-60ba-f510-b9cc-8a257859072e@redhat.com>
 <CAFEAcA_JHky3XJYVsq9VzG38fWQgSO4k7QWWf+hAyUXrh-BfJQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_JHky3XJYVsq9VzG38fWQgSO4k7QWWf+hAyUXrh-BfJQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2022 21:06:59 +0000
Message-ID: <CAFEAcA-bqoQR+qdFe6fkZ9Rvn4rKAxOXTwfPdFGA9uNEdHKGNg@mail.gmail.com>
Subject: Re: [RFC PATCH-for-7.0 v2] cocoa: run qemu_init in the main thread
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Mar 2022 at 19:29, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 16 Mar 2022 at 17:31, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > On 3/16/22 17:22, Akihiko Odaki wrote:
> > > I was thinking that it may be better to let softmmu/main.c do the
> > > details if it involves the internals of qemu_main() like qemu_main_loop().
> > >
> > > More concretely, softmmu/main.c would provide a function to register a
> > > function pointer to take over the main thread. main() implemented in
> > > softmmu/main.c would call qemu_init(). If a function pointer gets
> > > registered in qemu_init(), it would create a thread for main loop and
> > > call the registered function pointer. Otherwise, it would directly call
> > > qemu_main_loop().
> > >
> > > It would be a semantically appropriate division of ui/cocoa.m and
> > > softmmu/main.c. It would also be beneficial for end-users as it would
> > > also allow to isolate ui/cocoa.m into a separate module when
> > > --enable-modules in the future. (With "In the future", I mean sometime
> > > when we have time to hack Meson build files and some details we cannot
> > > fill by 7.0.)
> >
> > I would like this for 7.1.
> >
> > Basically rename qemu_main_loop to qemu_default_main_loop, and
> > cocoa_display_init would do
> >
> >      qemu_main_loop = qemu_cocoa_main_loop;
> >
> > qemu_cocoa_main_loop would include the bulk of the current main of
> > ui/cocoa.m.  Seems like a good idea.
>
> Speaking of 7.1, is cocoa currently completely broken, ie in need
> of an interim fix for 7.0 ? If so, which of the various patches/approaches
> should it be ?

To answer the first half of my question, yes, the cocoa UI is
currently completely broken as it asserts on startup.

-- PMM

