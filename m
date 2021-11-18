Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF86455C4C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 14:07:59 +0100 (CET)
Received: from localhost ([::1]:58952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnh8w-0007gr-Rd
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 08:07:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mnh5Z-0004AO-BO; Thu, 18 Nov 2021 08:04:29 -0500
Received: from [2607:f8b0:4864:20::12b] (port=41473
 helo=mail-il1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mnh5W-0005VW-W3; Thu, 18 Nov 2021 08:04:29 -0500
Received: by mail-il1-x12b.google.com with SMTP id a15so3299923ilj.8;
 Thu, 18 Nov 2021 05:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kMxbiNBbePVTQoDo/+zXJLfl9o2ASii+f2IrkLECank=;
 b=IFuxepHipM1/nd7fSyh+pLXftLM9HUB2hKDLdRtqnYiQqdalb+BPPi8OPjrA8WJcDk
 77aePuA2tTfWSs5ob0iGezqby82Izg07oMERpPrFQeloLwheizMAGOlIAG+2ucjFviWC
 tENf2+Qr4DveQkI/yYFgND0C/g3BrbPu7EXr0KTh4yzeEjLzQLfqW49T2lPXb6Gxjf8/
 4OYPmpgvV8IzhmJCgLBD8JHCNCWWg8GzYKVM7kA2WPqpnvenaw7yNKB7FpKtcudAtpgZ
 Tic+yMC1HuSwrVdW+nkrdqW0LQb0r29fyIUxL+Ggg8Fe+GHeEBt7ODwrKpj3pWtGVTtj
 sH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kMxbiNBbePVTQoDo/+zXJLfl9o2ASii+f2IrkLECank=;
 b=lN2M9/cYKDpbmZSQQ8dqqC1Lx8Q1wf8bXQQcxGtOjOre79jxhKsdaO7zYPP3G8Sjzs
 lHto80hSycQrQcyZUIlSZBIjrq5sNpFgbfpXCbfwNXyBgjt7JNX3dGKv40PHpcNMn5GH
 +Nq3gP9L9RXyeKi+8eNWgogzPYWPAnBQKF2PhEHD7GeoWZKUKArztIvunrywMh4YQ2XU
 KUjWTFEyERDQ3TuGpsJn7EjOcVlcXEdGpLLX10lCWxy5E1kWkWmni5Vg+nJqELPXLojP
 gApak9b89xw0X4UD3kD6EElnvmeRmLAWJv1+tKmOKXS/yGb1/hkqVAL9u3A2eUCymC0C
 M/zg==
X-Gm-Message-State: AOAM5316j9ZaboE2MVt6chDFFC7RxORZyZw70FcYfUe2j2g0nALL5WEY
 lMJ6cMXruAS4Ti5FodmvGqrVv3xy2Qug5yKg3JU=
X-Google-Smtp-Source: ABdhPJyVxD6OOSPC0qumik3Ru2j6hmeP7YCQo7CRbrES2XVdS3bTmRb/0jwP92GD4fC7AZ4FhanjOpvwRW+24hUDWSo=
X-Received: by 2002:a05:6e02:1bec:: with SMTP id
 y12mr14551838ilv.74.1637240664171; 
 Thu, 18 Nov 2021 05:04:24 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA9zmPds0+jHm8VY465XEhK6bbVPd+nDob1ruRPaHOua_Q@mail.gmail.com>
 <87r1bxzl5c.fsf@dusky.pond.sub.org>
 <e7ec3afc-6db9-822e-5a5e-dee7c4db8f34@redhat.com>
 <87pmr5cxbt.fsf@dusky.pond.sub.org>
 <CAFEAcA8sNjLsknea5Nt-tANEniFF2FYmjiV0xz=pr+vFwkX-gw@mail.gmail.com>
 <875ysunfwz.fsf@dusky.pond.sub.org>
 <CAKmqyKN9FWkNd2WpBsW8sdDdiQsmw-AVvG-kowiBigj5kRyZFQ@mail.gmail.com>
 <a1d797e7-a05f-cd39-80cf-3125e7522503@redhat.com>
In-Reply-To: <a1d797e7-a05f-cd39-80cf-3125e7522503@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 18 Nov 2021 23:03:58 +1000
Message-ID: <CAKmqyKPn3OWjN+ytU19KD8_83QB+PL0ggwbY=AyZCFzqk3ttTA@mail.gmail.com>
Subject: Re: does drive_get_next(IF_NONE) make sense?
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Hao Wu <wuhaotsh@google.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 16, 2021 at 2:10 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 15/11/2021 08.12, Alistair Francis wrote:
> > On Mon, Nov 15, 2021 at 3:32 PM Markus Armbruster <armbru@redhat.com> wrote:
> >>
> >> Peter Maydell <peter.maydell@linaro.org> writes:
> >>
> >>> On Fri, 12 Nov 2021 at 13:34, Markus Armbruster <armbru@redhat.com> wrote:
> >>>>
> >>>> Thomas Huth <thuth@redhat.com> writes:
> >>>>
> >>>>> On 03/11/2021 09.41, Markus Armbruster wrote:
> >>>>>> Peter Maydell <peter.maydell@linaro.org> writes:
> >>>>>>
> >>>>>>> Does it make sense for a device/board to do drive_get_next(IF_NONE) ?
> >>>>>> Short answer: hell, no!  ;)
> >>>>>
> >>>>> Would it make sense to add an "assert(type != IF_NONE)" to drive_get()
> >>>>> to avoid such mistakes in the future?
> >>>>
> >>>> Worth a try.
> >>>
> >>> You need to fix the sifive_u_otp device first :-)
> >>
> >> And for that, we may want Hao Wu's "[PATCH v4 5/7] blockdev: Add a new
> >> IF type IF_OTHER" first.
> >
> > I can fixup sifive_u_otp, just let me know what the prefered solution is
>
> What kind of device is that OTP exactly? If it is some kind of non-serial
> flash device, maybe you could simply use IF_PFLASH instead?

It just says "one time programmable memory". I'm guessing it's
sometype of eFuse.

Alistair

>
>   Thomas
>

