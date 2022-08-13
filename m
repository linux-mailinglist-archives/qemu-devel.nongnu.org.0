Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B07465918F7
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 07:59:11 +0200 (CEST)
Received: from localhost ([::1]:51970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMkAw-0003WS-R1
	for lists+qemu-devel@lfdr.de; Sat, 13 Aug 2022 01:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1oMk9D-0001mV-Jb
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 01:57:23 -0400
Received: from mail-il1-f177.google.com ([209.85.166.177]:44708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1oMk9A-0007ES-KO
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 01:57:23 -0400
Received: by mail-il1-f177.google.com with SMTP id g14so1476202ile.11
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 22:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Ct4UaHPGOQJrMzlKzrhnGWF1GHR8f7qUbp/i55AvxD0=;
 b=JF0XIO0xxZ5egWkOQhIWJcfQQeWdTZv9GpcLwSdtaQrP9MZRXa95ySwVW5eWmlEkL+
 1w4sMA6IayyGSqADVyOD2TJ6OU5A9azyqniMYCjclP8f9xcyKA6gXmLvnCtoriwzeNNL
 1xVPsmz6GT9iJaQnnnUjHnmlMppdIW8Rq5D0Gz+/6VachwQ+STyx8QONrcakmdPgp+0b
 btsiOGfT2UbZJGXxg8tjUO66xQ8Nt2eCzEKgObrt9EK/2TB8MGM31WTL1+s083EsHZDI
 b6MXUZNWTnuv3Ow08QTFmhGYAWH0sYZfAViuj3whEufgnEThTnsZqfxSPGlq2DKx6xG2
 DttA==
X-Gm-Message-State: ACgBeo3dX70Ipn2qcQ3VRbF85sCuPksDPVrkK1iG6Q6TW2pO2qyAqpMj
 PWhrvxmZvSS/ldvCHZjjEj6EURizXs8=
X-Google-Smtp-Source: AA6agR5EC9jwpSozQg754EC9eaRdzuuS9dNw1tYWlxSRm4eyAt/KCwxGKanu8lqZW0c6/0g9RNuQWQ==
X-Received: by 2002:a05:6e02:20ea:b0:2e5:93:3086 with SMTP id
 q10-20020a056e0220ea00b002e500933086mr1002663ilv.231.1660370239536; 
 Fri, 12 Aug 2022 22:57:19 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com.
 [209.85.166.50]) by smtp.gmail.com with ESMTPSA id
 e4-20020a0566380cc400b003435d8a6ee1sm715330jak.69.2022.08.12.22.57.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 22:57:19 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id q124so2344601iod.3
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 22:57:19 -0700 (PDT)
X-Received: by 2002:a02:8484:0:b0:343:9bed:be9f with SMTP id
 f4-20020a028484000000b003439bedbe9fmr567118jai.217.1660370239131; Fri, 12 Aug
 2022 22:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220813011031.3744-1-j@getutm.app>
 <20220813011031.3744-4-j@getutm.app>
 <20220813052956.vnnvukb5xt7f4p6i@tapioca>
 <CA+E+eSAzY6ZVJ-1qqTRs9a-Z5OaxGyhs1R8Jj0H21d2jyo5JPQ@mail.gmail.com>
 <20220813055033.tzdummia7c3igzgm@tapioca>
In-Reply-To: <20220813055033.tzdummia7c3igzgm@tapioca>
From: Joelle van Dyne <j@getutm.app>
Date: Fri, 12 Aug 2022 22:57:08 -0700
X-Gmail-Original-Message-ID: <CA+E+eSBYcDPncJsqZp+U735qM+hEKb9PjhnqLiquDjJfw425eA@mail.gmail.com>
Message-ID: <CA+E+eSBYcDPncJsqZp+U735qM+hEKb9PjhnqLiquDjJfw425eA@mail.gmail.com>
Subject: Re: [PATCH 3/3] usbredir: avoid queuing hello packet on snapshot
 restore
To: Victor Toso <victortoso@redhat.com>
Cc: Joelle van Dyne <j@getutm.app>, QEMU Developers <qemu-devel@nongnu.org>, 
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.177; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f177.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 12, 2022 at 10:50 PM Victor Toso <victortoso@redhat.com> wrote:
>
> Hi,
>
> On Fri, Aug 12, 2022 at 10:33:54PM -0700, Joelle van Dyne wrote:
> > On Fri, Aug 12, 2022 at 10:30 PM Victor Toso <victortoso@redhat.com> wrote:
> > >
> > > Hi,
> > >
> > > On Fri, Aug 12, 2022 at 06:10:31PM -0700, Joelle van Dyne wrote:
> > > > When launching QEMU with "-loadvm", usbredir_create_parser() should avoid
> > > > setting up the hello packet (just as with "-incoming". On the latest version
> > > > of libusbredir, usbredirparser_unserialize() will return error if the parser
> > > > is not "pristine."
> > >
> > > That was wrong in the usbredir side. The fix [0] was merged and
> > > included in the latest 0.13.0 release
> >
> > This is good to know. Should the entire runstate_check in
> > usbredir_create_parser be removed?
>
> From my POV your patch looks correct and would avoid migration
> issues such as [1] with usbredir 0.12.0 that was not patched
>
> [1] https://bugzilla.redhat.com/show_bug.cgi?id=2096008
>
> So, I'd keep the check and the patch :)

I have to admit I'm not too familiar with the inner workings of
libusbredir. But is it desirable to skip the HELLO packet on "loadvm"?
I wrote this on the assumption that it's correct because libusbredir
enforces it, but if that's wrong, then I'm wondering if maybe we need
the HELLO to re-establish communication (that was the issue I triaged
with "-S", when USB devices did not work due to the HELLO packet not
being sent). In a migration, it makes sense that a SPICE client has
not reset the USB device. However, when re-starting QEMU with
"-loadvm", it's possible the USB device has been disconnected and
reconnected. Ideally, we report that to the guest and let it handle
the reset. Would "usbredirparser_fl_no_hello" prevent that?

>
> > > [0] https://gitlab.freedesktop.org/spice/usbredir/-/merge_requests/61
> > >
> > > > Signed-off-by: Joelle van Dyne <j@getutm.app>
> > > > ---
> > > >  hw/usb/redirect.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
> > > > index fd7df599bc..47fac3895a 100644
> > > > --- a/hw/usb/redirect.c
> > > > +++ b/hw/usb/redirect.c
> > > > @@ -1280,7 +1280,8 @@ static void usbredir_create_parser(USBRedirDevice *dev)
> > > >      }
> > > >  #endif
> > > >
> > > > -    if (runstate_check(RUN_STATE_INMIGRATE)) {
> > > > +    if (runstate_check(RUN_STATE_INMIGRATE) ||
> > > > +        runstate_check(RUN_STATE_RESTORE_VM)) {
> > > >          flags |= usbredirparser_fl_no_hello;
> > > >      }
> > > >      usbredirparser_init(dev->parser, VERSION, caps, USB_REDIR_CAPS_SIZE,
> > > > --
> > > > 2.28.0
> > > >
> > > >
>
> Cheers,
> Victor
>

