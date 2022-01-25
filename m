Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3624449A8C3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 05:16:03 +0100 (CET)
Received: from localhost ([::1]:48392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCDFR-0004PH-PG
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 23:16:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nCDE9-0003kT-3D
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 23:14:41 -0500
Received: from [2607:f8b0:4864:20::32b] (port=35641
 helo=mail-ot1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nCDE7-00077x-GK
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 23:14:40 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 o9-20020a9d7189000000b0059ee49b4f0fso8006891otj.2
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 20:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oWti/9WlMj0sOM2r0kDQDpMhiMEorMR9lxQ5Thtpatc=;
 b=PvdYsgedsoS0BblUkioKpz9GIkJQBI1jQbssWuGHZODeWEqu8XiWor/yB2XWbsfsZ3
 TNB+q1HTIfvrJDW1miFcjdhAmmnfumLxh5IEDTOLJ20XQ922bxeGJNVrWVBkIA0PpfxA
 tGa9OgIrHG3B20VnJlPno5QpKVHB41uqz/QkyTLLtSDDAcsHQMg0iByvweXqpoL/cBjt
 LhmKu50B+/ZNk7EwSvuTVsSCG5bUJJvfWxX/nQyJ9y/SeZsrkJTsRGl/vD+urra/owga
 KDsvUBPYXD5OIt0ekW1UCP33Y0wcyNW+iHI0dPm19jb66iVD1iJOuZMv88OvkO/+VNMn
 Fi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oWti/9WlMj0sOM2r0kDQDpMhiMEorMR9lxQ5Thtpatc=;
 b=cNC7oBGQWS1CprPEOL9qvxjTmRkXYqdw5cWHS0JenwqyXqxWc0apAsDzm4kkf9xv3a
 XUqA05X3Tq0mZJxbSHyVQilHlDRvjKw3hrhZ40/ZaMH6srpFYF1n61JB1/7z9NsmLxdF
 RMKtRfUfaMzRjRQ9VJEZCLSCnDir3hyJ03AO8rOuyOq8HkLFvNWmKq/mV8Wo3bUHd5eN
 8kIGuXUkY8Zw5cMqAzQB4BCRHIs+KH6oNdFjAMrWYF3B3tPJvP8IUcG0kQG2ELi8wVkt
 yTD97rTG8PGi9ug5f29a/D1yeTmvRmhTMrsXtMFzAMeovBb1ROh74OY0ccaE4cX/dLHX
 ZBOw==
X-Gm-Message-State: AOAM5336vbDhJnLEMdcLrjy1UCWhvOABP0TQ17BPoxBndtorAs3jOLzn
 /LGrkqTFp1x8Z85w8MGCnImb2TrIHjccI2recHk=
X-Google-Smtp-Source: ABdhPJxilzARdG2i6OMhK6Wz3sA2gHCbeDYu6B6mC9rY0sB5EZC9idg5+Xr5Apu6uZ2bsrlBKPsv7UU2tUK3ALbd2MI=
X-Received: by 2002:a05:6830:440b:: with SMTP id
 q11mr14433742otv.270.1643084078211; 
 Mon, 24 Jan 2022 20:14:38 -0800 (PST)
MIME-Version: 1.0
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
 <20220113172219.66372-3-yaroshchuk2000@gmail.com>
 <Ye53sOJekvKrM8iT@roolebo.dev>
 <7053351.4JHWUSIRgT@silver> <Ye7mwcl/rB714vgl@roolebo.dev>
 <CAFEAcA-UE5MmkESRrxdedkzYkc9jp81jzni=-xmivK88gkr6Rw@mail.gmail.com>
 <Ye8vjmFFRLPrhE1Z@roolebo.dev>
In-Reply-To: <Ye8vjmFFRLPrhE1Z@roolebo.dev>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Tue, 25 Jan 2022 13:14:27 +0900
Message-ID: <CAMVc7JXyFoUCkrGLKhCct_DatwU6Xu+L2XSK5y0YMV8xDHZC+g@mail.gmail.com>
Subject: Re: [PATCH v13 2/7] net/vmnet: add vmnet backends to qapi/net
To: Roman Bolshakov <roman@roolebo.dev>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, phillip.ennen@gmail.com,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>, Alessio Dionisi <hello@adns.io>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>, Phillip Tennen <phillip@axleos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 25, 2022 at 8:00 AM Roman Bolshakov <roman@roolebo.dev> wrote:
>
> On Mon, Jan 24, 2022 at 08:14:31PM +0000, Peter Maydell wrote:
> > On Mon, 24 Jan 2022 at 17:49, Roman Bolshakov <roman@roolebo.dev> wrote:
> > > I'm not sure why blocks are Objective-C specific. All the data I have
> > > shows the opposite [3][4][5]. They're just extensively used in Apple APIs.
> >
> > This is true, but for the purposes of our build machinery it is
> > simpler to have three types of source files that it deals
> > with (C, C++, ObjC) rather than four (C, C++, ObjC, C-that-uses-blocks).
> > So unless there's a clear benefit from adding the extra category
> > I think we should do the simple thing and keep these files named
> > with a ".m" extension.
> >
>
> Fine by me as long as majority finds it's simpler :) Perhaps it's just a
> matter of personal preference.
>
> I've used to the fact that platform-specific code uses platform-specific
> extensions or some sort of weird "GCC attributes". Therefore C with an
> extension is easier to reason for me than Objective-C with ARC and other
> kinds of implicit behaviour without an actual Objective-C code.
>
> Thanks,
> Roman

Being technically pedantic, actually this vmnet implementation uses
Objective-C and there is a file with .c which uses blocks.
If a file is named .m, dispatch_retain(o) will be redefined as [o
retain], and effectively makes it Objective-C code. Therefore, vmnet
involves Objective-C as long as its files are named .m. It will be C
with blocks if they are named .c.
Speaking of use of blocks, actually audio/coreaudio.c involves blocks
in header files; Core Audio has functions which accept blocks.

I'm neutral about the decision. I think QEMU should avoid using
Objective-C code except for interactions with Apple's APIs, and .c is
superior in terms of that as it would prevent accidental introduction
of Objective-C code. On the other hand, naming them .m will allow the
introduction of Automatic Reference Counting to manage dispatch queue
objects. In fact, I have found a few memory leaks in vmnet in the last
review and ui/cocoa.m has a suspicious construction of the object
management (Particularly it has asynchronous dispatches wrapped with
NSAutoreleasePool, which does not make sense). Introduction of
Automatic Reference Counting would greatly help addressing those
issues, but that would require significant rewriting of ui/cocoa.m.
Personally I'm concerned with ui/cocoa.m and do want to do that
rewriting, but I'm being busy so it would not happen anytime soon.

Regards,
Akihiko Odaki

