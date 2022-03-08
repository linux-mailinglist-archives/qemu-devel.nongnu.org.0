Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E43C44D160F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:21:18 +0100 (CET)
Received: from localhost ([::1]:39910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRXu1-0003DH-PG
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:21:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRXrj-0002JX-IT
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:18:55 -0500
Received: from [2607:f8b0:4864:20::b2d] (port=44649
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRXrf-0002qi-Pi
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:18:53 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id u61so37030779ybi.11
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TeVY1arLDhRbry2+j9aS1hpLITx82WJm0ZEXj6E1M80=;
 b=wu29bfnC+/AWZ8f5UidxKsRytwZS8P1C5TqdcU1rt+5TM/6H5POypo7QNvNQfeg46q
 rwTkn4iNNEwTKe0MWHwxX01bkfKWuj4O7eHRZv+RCk0q0+DJz4VR1hFkUCUfrB6W8lhH
 /1m4HanEevTNuK8mM/X3WVG4vccAL3FmZkmWFb9bFNlxWgpnka6XSq4/3qebeStxzflu
 OxaDtbfLHNwO8ITAgKhAFFpoztOnvZVIY6XtIsS5WkOC7n3uKncQaK0XbwUFaBwOJsjE
 /IQ5kYrIFIbB3fB79yAzN7++mLOiCS7bTjsKPFWU0S7ukmShgvtvVz8GxXzu/bAPJl1g
 cWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TeVY1arLDhRbry2+j9aS1hpLITx82WJm0ZEXj6E1M80=;
 b=wNvKCOJehltDjN+4ffKgAHVYRodmOiYK25ciH5MUXpKjVslpKm5XNKuwafr78ZeqyQ
 3TYwEL6T3WfzaIiiBkc67PVfVvvaMijbYl0dSW6GQjhZsbqujw8TFHZEiJgNVkRl8Cx5
 ZGeTat4N8EiZCarf/tIvKWUCMcxCXF4Z7HhLtC5sUH75G20tzZhOym6EtaOMHfHjUuch
 zM/iBzPW4OO/9cn0Dkqei/e569Qzbon1Zzt0TPrRvuzFynLFxXeBIH5TACdfofBASzB6
 hmPgJylUXLFBnBPnDh5THczQ+nkHK+0I6Pj9fMxPKQQr/p6ELQktH1aTK9Nk1fw0Pq5T
 U69g==
X-Gm-Message-State: AOAM5330a75zZSyI+/NWeTiBEUJrF/xBGrpwkeynvhOK8+aB+330dVI0
 Dj846gsFZhU0OsujdV8dQzfVqibe8pXkuwHaYcJY4w==
X-Google-Smtp-Source: ABdhPJyeXGE5L6Rp7vjkIJSA7WP+QFqSR/fFdLI5UgkMpKaRj8YKUq2VMHH9tQ9av89YjaRLxRkFCy3VnRRjKJ/UbVk=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr11850218ybq.479.1646738329353; Tue, 08
 Mar 2022 03:18:49 -0800 (PST)
MIME-Version: 1.0
References: <20220307100058.449628-1-mst@redhat.com>
 <CAFEAcA94Uu=kyinf+pLUT2cY05326EDX=TKUeiSJH_aEY-kPVg@mail.gmail.com>
 <CAFEAcA_wO6dkr6=HUYsOS7RxGErrAvsNnNqhKfM733Q=4v6cdw@mail.gmail.com>
 <20220307174713-mutt-send-email-mst@kernel.org>
 <CAFEAcA9qUMuDupNRCYeH5rzBY+J7D3XXN_92PJjhBYxF70kF=w@mail.gmail.com>
 <20220308055639-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220308055639-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 11:18:38 +0000
Message-ID: <CAFEAcA-3iD3hz2ihSDOir6ByWztAjNUkAvCSbeeX7-osMQLTdg@mail.gmail.com>
Subject: Re: [PULL v2 00/47] virtio,pc,pci: features, cleanups, fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 11:01, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Mar 08, 2022 at 09:05:27AM +0000, Peter Maydell wrote:
> > On Mon, 7 Mar 2022 at 22:52, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Mon, Mar 07, 2022 at 05:13:16PM +0000, Peter Maydell wrote:
> > > > Also fails on cross-win64-system:
> > > >
> > > > https://gitlab.com/qemu-project/qemu/-/jobs/2172339938
> > > >
> > > > ../hw/virtio/virtio.c: In function 'qmp_x_query_virtio_vhost_queue_status':
> > > > ../hw/virtio/virtio.c:4358:30: error: cast from pointer to integer of
> > > > different size [-Werror=pointer-to-int-cast]
> > > > 4358 | status->desc = (uint64_t)(unsigned long)hdev->vqs[queue].desc;
> > > > | ^
> > > > ../hw/virtio/virtio.c:4359:31: error: cast from pointer to integer of
> > > > different size [-Werror=pointer-to-int-cast]
> > > > 4359 | status->avail = (uint64_t)(unsigned long)hdev->vqs[queue].avail;
> > > > | ^
> > > > ../hw/virtio/virtio.c:4360:30: error: cast from pointer to integer of
> > > > different size [-Werror=pointer-to-int-cast]
> > > > 4360 | status->used = (uint64_t)(unsigned long)hdev->vqs[queue].used;
> > > > | ^
> > > > cc1: all warnings being treated as errors
> >
> > > I dropped these for now but I really question the value of this warning,
> > > as you can see the reason we have the buggy cast to unsigned long
> > > is because someone wanted to shut up the warning on a 32 bit system.
> > >
> > > Now, I could maybe get behind this if it simply warned about a cast that
> > > loses information (cast to a smaller integer) or integer/pointer cast
> > > that does not go through uintptr_t without regard to size.
> >
> > This *is* warning about losing information. On 64-bit Windows
> > pointers are 64 bits but 'long' is 32 bits, so the path
> > pointer -> long -> uint64_t drops the top half of the pointer.

> Yes obviously. My point is that this:
> (uint64_t)hdev->vqs[queue].avail
> is always harmless but it warns on a 32 bit system.

True, I suppose. But compiler warnings are often like that: we
take the hit of having to tweak some things we know to be OK in
order to catch the real bugs in other cases.

> And someone trying to fix that *is* what resulted in
> (uint64_t)(unsigned long)hdev->vqs[queue].avail

Using 'unsigned long' in a cast (or anything else) is often
the wrong thing in QEMU...

> IOW I don't really see how
> (uint64_t)(uintptr_t)hdev->vqs[queue].avail
> is better than
> (uint64_t)hdev->vqs[queue].avail
>
> except as a way to say "yes I do intend to cast pointer to integer
> here, I did not forget to dereference the pointer". But if that
> latter is what gcc is trying to warn about, then it should
> just warn about any cast to integer except to uintptr_t,
> without respect to size.

What is the uint64_t cast bringing to the table? Wouldn't
just status->desc = (uintptr_t)hdev->vqs[queue].desc;
work ?

thanks
-- PMM

