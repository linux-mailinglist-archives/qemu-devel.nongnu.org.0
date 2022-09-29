Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0015EF224
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 11:34:29 +0200 (CEST)
Received: from localhost ([::1]:57964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odpw4-0008Ts-5M
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 05:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1odpnm-0004WF-KO
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 05:25:54 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:42630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1odpnk-0000MV-Kr
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 05:25:54 -0400
Received: by mail-ed1-x52f.google.com with SMTP id x92so1125973ede.9
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 02:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=A3Oy43Qdq+TsIWtVdEhsHV1+HzXdLgornpIO4q3Bbb0=;
 b=bZx6yqf2518J3YzVWR1gTWml4DAkGI6qA9LnSneNXe6/4NFGZnKPXCov2XJVvg8cNT
 DPLnvJcZ4lSfE32V/0Ylz/LG4cJeMWoW98N3EKWa2vWurLFPaghB3tLltaYJlUNUExxq
 /bwj1FcKqcoBIx2IVECJZiibWfcLMSS1x4sceB4Enw6LCUVzSpZi6z1f2uapCP24AR7B
 KPOdmJ8lu1W4fuLjeVWqUKvgxFDbsuvUGSca5Lsg4mME5DNviUAtShekrm1832UYXJHd
 f1hS2KlhM9FZ4WUFaC6RcFGlrQli9ExJnvraLZgcaKzVk6MoXDocFul6A7SQ/FW2sQC5
 ffig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=A3Oy43Qdq+TsIWtVdEhsHV1+HzXdLgornpIO4q3Bbb0=;
 b=Ib5CvX8etZsKsdCrm4aM5Xf9WAXNiFryzq3C3NZMD3YqMQL9MM5dYKqyfFalECHawL
 BJO7wv08KszTGbFcBc7sbE0ZboL7MNqwrZJvdBNCTBdFYLgGZTf0YvgIntdljJZ1L7GW
 kvGPMF/zhxhsjzrA9u4xa9QYkzsaiL/ezS1xVCSZqEjbd7h6vdTeXMsIC9wT+DaXRTJx
 NZvUUfSbq049wvIYxahshe795GlMTsSTb3fmi9Zroe1ng00WQzw131D3X9jrJeIb7nxC
 IPEs79iBygmTnbjN/EuYPej2QkJgp0wxV9Q43JGbpXrki02GOZB0AjrPMuePSTBMs+ga
 wQlQ==
X-Gm-Message-State: ACrzQf00uB8u4fPRsMl+9suXMnKQGHtb8PmenRzp2rEPrcMAPwdbSS1q
 zq5bGBk4UfiD1UiaKn6r9hRpML/lYupq7/+pWKH/0Q==
X-Google-Smtp-Source: AMsMyM4utj58T+rtfnj1+UGoorLLh+T4P9U84tY3CMR91F/Zcbqf/iPTkZl7uS5ijcX6UMpIaWWgSS66fHger7jusiw=
X-Received: by 2002:a05:6402:400e:b0:458:29c3:ba34 with SMTP id
 d14-20020a056402400e00b0045829c3ba34mr1563901eda.294.1664443550596; Thu, 29
 Sep 2022 02:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220831013236.32937-1-akihiko.odaki@daynix.com>
 <87tu5qulay.fsf@pond.sub.org>
 <CAE=JJXdg=Miisek8WeqQ12NqL8obzmuyzD0mbv1SfiJTyVBLuw@mail.gmail.com>
 <875yi2mat1.fsf@pond.sub.org>
 <CAE=JJXcRH-0TuM7WgbM35Nb=Ud94K-LUcdzjoyJDMEuK9o=uFw@mail.gmail.com>
In-Reply-To: <CAE=JJXcRH-0TuM7WgbM35Nb=Ud94K-LUcdzjoyJDMEuK9o=uFw@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 29 Sep 2022 18:25:39 +0900
Message-ID: <CAE=JJXcsPkQyfPY0SAam6uCu3CQze6rOr3kWuo8pk1qiMr_7VA@mail.gmail.com>
Subject: Re: [PATCH v2] pci: Assert that capabilities never overlap
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org, 
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>, 
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>, 
 Stefan Weil <sw@weilnetz.de>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, 
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::52f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Mon, Sep 5, 2022 at 7:11 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> On Mon, Sep 5, 2022 at 6:26 PM Markus Armbruster <armbru@redhat.com> wrote:
> >
> > Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> >
> > > On Fri, Sep 2, 2022 at 7:23 PM Markus Armbruster <armbru@redhat.com> wrote:
> > >>
> > >> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> > >>
> > >> > pci_add_capability appears most PCI devices. Its error handling required
> > >> > lots of code, and led to inconsistent behaviors such as:
> > >> > - passing error_abort
> > >> > - passing error_fatal
> > >> > - asserting the returned value
> > >> > - propagating the error to the caller
> > >> > - skipping the rest of the function
> > >> > - just ignoring
> > >> >
> > >> > The code generating errors in pci_add_capability had a comment which
> > >> > says:
> > >> >> Verify that capabilities don't overlap.  Note: device assignment
> > >> >> depends on this check to verify that the device is not broken.
> > >> >> Should never trigger for emulated devices, but it's helpful for
> > >> >> debugging these.
> > >> >
> > >> > Indeed vfio has some code that passes capability offsets and sizes from
> > >> > a physical device, but it explicitly pays attention so that the
> > >> > capabilities never overlap.
> > >>
> > >> I can't see that at a glance.  Can you give me a clue?
> > >>
> > >> >                             Therefore, we can always assert that
> > >> > capabilities never overlap when pci_add_capability is called, resolving
> > >> > these inconsistencies.
> > >> >
> > >> > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> > >>
> > >
> > > Looking at vfio_add_std_cap(), and vfio_add_ext_cap() it seems that
> > > they are clipping the size of capabilities so that they do not
> > > overlap, if I read it correctly.
> >
> > If we want to deal gracefully with buggy physical devices, we need to
> > treat pdev->config[] as untrusted input.
> >
> > As far as I can tell:
> >
> > * vfio_add_capabilities() replicates the physical device's capabilities
> >   (starting at pdev->config[PCI_CAPABILITY_LIST]) in the virtual device.
> >
> > * vfio_add_std_cap() is a helper to add the tail starting at
> >   pdev->config[pos].
> >
> > Could the physical device's capabilities overlap?  If yes, what would
> > happen before and after your series?
> >
>
> When the capabilities overlap, vfio_std_cap_max_size() and
> vfio_ext_cap_max_size(), called by vfio_add_std_cap(),
> vfio_add_ext_cap() should clip the size of capabilities. Comments in
> vfio_add_std_cap() and vfio_add_ext_cap() say: "Since QEMU doesn't
> actually handle many of the config accesses, exact size doesn't seem
> worthwhile."
>
> Regards,
> Akihiko Odaki

Hi, please check the last reply I have sent if you have not yet.

Regards,
Akihiko Odaki

