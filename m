Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 774883F6103
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 16:54:16 +0200 (CEST)
Received: from localhost ([::1]:48860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIXoc-0002ss-Vy
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 10:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIXSC-00041s-90
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:31:04 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:41626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIXS9-0001IC-4N
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:31:03 -0400
Received: by mail-ed1-x529.google.com with SMTP id y5so1181841edp.8
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 07:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zYyrvTK7aiGO5fckK3msNQHlojrpNvBZVYXIHOJG3c0=;
 b=wuVHaIFYF4Yt3qxZ1UzJ31Ia1p69PbJ5ZOuEBySWPR64naK1wnE1g9SqVR5dareFJB
 zlYDVEuIU3IyxhHm1V/bkPfTTvxyCYZ1tNk3jKZsVLI6Jh0nAKXXdumIezn/MFCGQ4a7
 sAY3bK+qcaGmoqrEWMW1lbH08+PElGCO37hor+LItMi1CLRUmuw6ewDyY8xAxnsOgoqK
 TtszfTJLAnIKVehIlB/vZps3qwkFD24N1g4+if1rExSKPyaox9Hab0p1t+8i6FaqemAT
 DjGTiMrUSUSGwyu2R61CTus3dAii6IESTmsM9Wi4k+8Kun8zExKnxdXYq4NjSP7F1M05
 kgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zYyrvTK7aiGO5fckK3msNQHlojrpNvBZVYXIHOJG3c0=;
 b=iwrR+8+7j5Jx3NoiHgpl6K6SJuqHQgbcy3icilC6scrMbePKgzU2E6BKrb0Y63jLHg
 jRGSBX3ibM8ckwr9mUhitsqAoExkrCIKAsPc5oH3lbXXP+aEZcPDbl8ZgwC9KIqp9lvx
 D6/MRjK6L/Cc3l4ZQzMkW8rgemBx9BwKDH0Ivw3QJpKFNfZdvvaG4yQ2Y6Ex5OH13HHe
 CBqeN73GL4SMQctMDHkeqQYCGt3e5szlpARMIIJ60byfa0LZI823hVz6RB4MzYY6RW49
 7DJElyFVoJtHdZfHBb4M7YLae7ZHIRXQMiVRgw+DFkbl3d70y2qfWcAoAYS071ogXhQG
 8fZg==
X-Gm-Message-State: AOAM531IXrsOeZ3x9PftEIz1Kj44RNW9wHo1b2XLnestxcXob1idYTe+
 oCVhZwOj5cUFhdb5B0K6i0qp+fFSXImUCzK+sOtqSw==
X-Google-Smtp-Source: ABdhPJzcS78sas1AnjZm6UkIVLqQ/bqDx/O8NWu/dS0VG3TQIJKqMFcm05FXKi6RBKCVNj4crbzXRHuIFNyhVWV22wk=
X-Received: by 2002:a05:6402:4387:: with SMTP id
 o7mr43330817edc.204.1629815459829; 
 Tue, 24 Aug 2021 07:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210819171547.2879725-1-philmd@redhat.com>
 <20210819171547.2879725-3-philmd@redhat.com>
 <20210823183414.hmu4ly2y5zkbw3mg@habkost.net>
 <87ilzvntu1.fsf@dusky.pond.sub.org>
 <CAFEAcA-2ShxjS6YAb_xBk=v5YJ5nLaaKtOLVEn7Vjfe6rkpp2A@mail.gmail.com>
 <87tujfdp4c.fsf@dusky.pond.sub.org>
 <CAFEAcA9_HGCVYX8smuAWhUDJ8NbfQ76XgJjOLd2EoyiS2gKC0A@mail.gmail.com>
 <87bl5mdik9.fsf@dusky.pond.sub.org>
In-Reply-To: <87bl5mdik9.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 15:30:12 +0100
Message-ID: <CAFEAcA_8yQu2nbyjhCXKPROP=LLr6iKw2bTg0sHCM0uamwGz5w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw/usb/hcd-xhci-pci: Abort if setting link
 property failed
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Aug 2021 at 15:27, Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Tue, 24 Aug 2021 at 13:05, Markus Armbruster <armbru@redhat.com> wrote:
> >> When you know that all callers handle errors like &error_fatal does, use
> >> of &error_fatal doesn't produce wrong behavior.  It's still kind of
> >> wrong, because relying on such a non-local argument without a genuine
> >> need is.
> >
> > Not using error_fatal results in quite a bit of extra boilerplate
> > for all those extra explicit "check for failure, print the error
> > message and exit" points. If the MachineState init function took
> > an Error** that might be a mild encouragement to "pass an Error
> > upward rather than exiting"; but it doesn't.
> >
> > Right now we have nearly a thousand instances of error_fatal
> > in the codebase, incidentally.
>
> Use of &error_fatal is clearly superior to accomplishing the same
> behavior the way you describe.
>
> My point was this behavior is usually wrong in functions with an Error
> **errp parameter.

Right, but as Eduardo has noted, only about 8% of our use of
error_fatal is like that. The vast bulk is other cases, so
if you want to call it "kind of wrong" we ought to have a view
of how it could be done otherwise.

-- PMM

