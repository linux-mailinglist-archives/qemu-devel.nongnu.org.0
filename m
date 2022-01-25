Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B298349B2BC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 12:12:13 +0100 (CET)
Received: from localhost ([::1]:60808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCJkC-0001tm-Jg
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 06:12:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nCJgq-00087n-5K
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 06:08:45 -0500
Received: from [2607:f8b0:4864:20::229] (port=34359
 helo=mail-oi1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nCJgl-0005qa-T6
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 06:08:43 -0500
Received: by mail-oi1-x229.google.com with SMTP id bb37so30275657oib.1
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 03:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IUR9BX7Cb6GdW9DgtiMwyQwBOlcjuLzKb/XeuyQtN/o=;
 b=ODeOKPdKo5gpHaIqWvgRjooqy9OhN3IsEF1o/WTmya7XkDlbgdMpN22DTdjDF8ldF9
 pYCoVtMLs3P7lKT3Sf86a+Ed75UyLDgEXhGq66izAvtRj0YONnlDaoVgOoAQ9mTLdmLc
 /OrrqvnQIky5XJoIe5DejlvZdylZFJk7Wjn0IeAfz2Kefpe9I7goQvtrlz0k/2MBOt1g
 YLNv+EC/ZdzHWG74SWiZzzkI8RGjqAk9gN+5b+i0Sbs4wAEV5Qx/2K73nm/F9uHnehbt
 lIy3S4KKs8jWik8wuKEnTPS5pWUw02dPU2oOgY0oXbXLbHDsbuZw958czS7L/zfsKDpd
 4VOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IUR9BX7Cb6GdW9DgtiMwyQwBOlcjuLzKb/XeuyQtN/o=;
 b=t5B+5cFB1ieDCZjFrAyEbWRrsMr/IngZd+uwYOz43gKJe3uPAKXICripxlFTUPH+fi
 DIB5vghpmqazJFLS90FznU6SSNt7ZxTZE0KlaznWku6LyZaWECmU0xY7JRaOQ9WfSMBz
 IIjEitSVizgdTOKnNEz6ZNnXjSw6rtluNSP0uUjfTeXZxJ9mCFFlAejZ3kJmSc6oPhVf
 MdZXDAUuQR6T/ZTN+yh0R85BX+ynMNcV24n/MAgHX6D2Bg574Gi6eN4ifFuI7wzIjqE+
 fEYt5IIM7d1s7d+uTaLsweOATYqKx0m4Sf0lvIWywJU5XTxUIYS7XSAlLhWS8MgeeiSs
 Zeyw==
X-Gm-Message-State: AOAM531ihH3fEqDoXb2alBCLbX7c4bUrD7Z/SS+7FcaNrDlXpzPoHGGN
 Oueo2txAt8jP8IwGfYZgAHyxH5OElDPOB4doEK8=
X-Google-Smtp-Source: ABdhPJzKjD4bfxJsZ3MltnBLLxyc2aX4Ufpsg6toOEhpS3n3ocznWqIgXxtMt0n0CgR8c7hiUm3u9GOHKF6XgrKtqEY=
X-Received: by 2002:a05:6808:1283:: with SMTP id
 a3mr306500oiw.57.1643108912208; 
 Tue, 25 Jan 2022 03:08:32 -0800 (PST)
MIME-Version: 1.0
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
 <20220113172219.66372-3-yaroshchuk2000@gmail.com>
 <Ye53sOJekvKrM8iT@roolebo.dev>
 <7053351.4JHWUSIRgT@silver> <Ye7mwcl/rB714vgl@roolebo.dev>
 <CAFEAcA-UE5MmkESRrxdedkzYkc9jp81jzni=-xmivK88gkr6Rw@mail.gmail.com>
 <Ye8vjmFFRLPrhE1Z@roolebo.dev>
 <CAMVc7JXyFoUCkrGLKhCct_DatwU6Xu+L2XSK5y0YMV8xDHZC+g@mail.gmail.com>
 <CAFEAcA_CT6AJx_ns4zjw1_udq-Ab3YdM2mzPcKKZberUPOqhPA@mail.gmail.com>
In-Reply-To: <CAFEAcA_CT6AJx_ns4zjw1_udq-Ab3YdM2mzPcKKZberUPOqhPA@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Tue, 25 Jan 2022 20:08:21 +0900
Message-ID: <CAMVc7JVShGiPvwc4fWHfG2JjTX0QGOcs3ua3k58WFdo4fOLS6A@mail.gmail.com>
Subject: Re: [PATCH v13 2/7] net/vmnet: add vmnet backends to qapi/net
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::229
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oi1-x229.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, phillip.ennen@gmail.com,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>, Roman Bolshakov <roman@roolebo.dev>,
 Alessio Dionisi <hello@adns.io>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>, Phillip Tennen <phillip@axleos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 25, 2022 at 7:32 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 25 Jan 2022 at 04:14, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> > I'm neutral about the decision. I think QEMU should avoid using
> > Objective-C code except for interactions with Apple's APIs, and .c is
> > superior in terms of that as it would prevent accidental introduction
> > of Objective-C code. On the other hand, naming them .m will allow the
> > introduction of Automatic Reference Counting to manage dispatch queue
> > objects. In fact, I have found a few memory leaks in vmnet in the last
> > review and ui/cocoa.m has a suspicious construction of the object
> > management (Particularly it has asynchronous dispatches wrapped with
> > NSAutoreleasePool, which does not make sense).
>
> I think those are probably my fault -- in commit 6e657e64cd (in 2013)
> we added NSAutoReleasePools to fix leaks that happened because
> we were calling into Cocoa APIs from threads other than the UI
> thread that didn't have their own automatically created autorelease
> pool. Much later in commit 5588840ff778 (in 2019) we put in the
> dispatch_async stuff because newer macOS was stricter about
> requiring Cocoa API calls to be only on the UI thread. So
> I think that means the requirement for the autorelease pools
> has now gone away in those functions and we could simply delete
> them -- does that sound right? (I freely admit that I'm not a macOS
> expert -- I just look stuff up in the documentation; historically
> we haven't really had many expert macOS people around to work on
> cocoa.m...)

Removing them would be an improvement. Enabling ARC is a long-term
solution and would allow clang to analyze object management code and
answer such a question semi-automatically.

Regards,
Akihiko Odaki

>
> On the subject of cocoa.m, while we have various macOS-interested
> people in this thread, can I ask if anybody would like to
> review a couple of patches that came in at the beginning of the
> year?
>
> https://patchew.org/QEMU/20220102174153.70043-1-carwynellis@gmail.com/
> ("ui/cocoa: Add option to disable left command and hide cursor on click")
> and
> https://patchew.org/QEMU/20220103114515.24020-1-carwynellis@gmail.com/
> ("Show/hide the menu bar in fullscreen on mouse")
>
> either from the point of view of "is this a sensible change to
> the macOS UI experience" or for the actual code changes, or both.
>
> We've been very short on upstream macOS code reviewers so if people
> interested in that host platform are able to chip in by
> reviewing each others' code that helps a lot.
>
> thanks
> -- PMM

