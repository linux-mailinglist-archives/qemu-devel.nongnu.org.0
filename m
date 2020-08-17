Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77149246D0D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 18:43:19 +0200 (CEST)
Received: from localhost ([::1]:51382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7iEA-0008Ts-J4
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 12:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael@amarulasolutions.com>)
 id 1k7iDC-0007fW-G2
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 12:42:18 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:34256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <michael@amarulasolutions.com>)
 id 1k7iDA-0008D1-6C
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 12:42:18 -0400
Received: by mail-wm1-x32a.google.com with SMTP id c19so13556866wmd.1
 for <qemu-devel@nongnu.org>; Mon, 17 Aug 2020 09:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/L3DyWciEUFzV08baN7hV3ol+9DDNuY5kWd/RT1eIGg=;
 b=NhHqLVRZQSB9y2bp4RXek2KsJg65GaKK6ZT2JFPChXV3jCgXjs0o9d/OmWfwCEqZmc
 tsS4FXlITNZZMF0ptVsIdUtYfdn/CE02sgCBInT9zkWtffjfU/1ozeCEvkJGf0RTNDNp
 M7XRDEXPrmZ5RKyBMUkHFYz+ZwEaAY4GhODtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/L3DyWciEUFzV08baN7hV3ol+9DDNuY5kWd/RT1eIGg=;
 b=X0uapfaJ6+KSYtfAx+BC7M65zDhXOFhDQTi90xBOZ5Ewk8evYJzDsxvNLcdEReWIPt
 9GmZqjQQqalxiAtDcCNZ87QyjaYcq0GdpbloCNx6OR0G83kq5++yJIN9bdqC8H/Ij8O1
 aacHiD24bkXFqU7OuN9Lj1VtTLUYpk49Swrtv/d+3wY8YTPU45a5j3PH/NblLVKDar32
 n62GIA+4A0O1ucLbGhybR/nGurZ+UFXtjf1LGqVr2A128Lhim8abXPtxgBBHeYqJgbV7
 ah38xoOOpL6+r1rHGOKDM66rZ5LPZZ0FS7lrk6CX0k4FSUx2raqUFGoUXEhbwlwcTyWP
 x+mg==
X-Gm-Message-State: AOAM531dD21xRW6pxo0/ygM0hmnrjW8VFM9KIe1FYxNpsO4AW1tVc9+U
 UcoJ3vbLOBFBtrlnol1d+3ChJT43ltcYmqC3jAhWwcRP4To=
X-Google-Smtp-Source: ABdhPJz11z11W8Z2YbfaaO0pdUg1rt0OE16RcbU/KoivUKWPdwtMfB7avVdoNwUpAr+jbhN5njiXsINZMXAkHih0kZc=
X-Received: by 2002:a1c:5f54:: with SMTP id t81mr14879460wmb.2.1597682534038; 
 Mon, 17 Aug 2020 09:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200812152149.260163-1-michael@amarulasolutions.com>
 <20200817064701.o3q3plnjhzyz3s42@sirius.home.kraxel.org>
 <CAOf5uwn94gZPZXChFDXWZ-1w0jOY_SxRqzF4Mk8hrtLq-r3yCg@mail.gmail.com>
 <20200817072841.lvbco4k7hzzimxsb@sirius.home.kraxel.org>
In-Reply-To: <20200817072841.lvbco4k7hzzimxsb@sirius.home.kraxel.org>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Mon, 17 Aug 2020 18:42:02 +0200
Message-ID: <CAOf5uwn2KAajFo7oXYkZg5q3jbJyRC50hJafcoWCVzrdvkqXMw@mail.gmail.com>
Subject: Re: [PATCH] hw: dev-wacom: Support wacom tablet emulation in linux
 qemu
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=michael@amarulasolutions.com; helo=mail-wm1-x32a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd

Have another small question. Do you know how force show cursor working
in this case?

Michael

On Mon, Aug 17, 2020 at 9:28 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > > +static const uint8_t qemu_wacom_hid_report_descriptor[] = {
> > > > +     0x05, 0x01,
> > > > +     0x09, 0x02,
> > >
> > > Where does this come from?  Created from scratch?  Copied from real
> >
> > No, there are dump of several descriptor on github. I will put in the
> > commit message
>
> A comment with a link would be good too.
>
> > > wacom tablet?  Any chance this can get descriptive comments like the
> > > other report descriptors (see dev-hid.c)?
> >
> > Yes, no problem. I will study a bit more. How was working before?
>
> I suspect in the past the linux driver simply checked the device id and
> went with that without fetching the report descriptor.
>
> Also note qemu has a generic tablet (-device usb-tablet), so there are
> probably very few users using the wacom emulation.  Possibly it is
> broken for quite a while already but nobody noticed ...
>
> take care,
>   Gerd
>


-- 
Michael Nazzareno Trimarchi
Amarula Solutions BV
COO Co-Founder
Cruquiuskade 47 Amsterdam 1018 AM NL
T. +31(0)851119172
M. +39(0)3479132170
[`as] https://www.amarulasolutions.com

