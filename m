Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6454502EF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 11:58:26 +0100 (CET)
Received: from localhost ([::1]:34230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmZgu-0007kL-VH
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 05:58:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmZfR-0006t2-02
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 05:56:53 -0500
Received: from [2a00:1450:4864:20::432] (port=33695
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmZfP-0004cC-Bc
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 05:56:52 -0500
Received: by mail-wr1-x432.google.com with SMTP id d24so29862060wra.0
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 02:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PWwCW8mXVC/xZ6jkKVAjmXw3p7extKN8cI5Vy5wzrpg=;
 b=zTeGU0DGd+6H3acvrUE2XmrPSInU1UfGeLT82n0gAgOzIAUGvcaieXF8GUQEZPxBqK
 jvrks6SR/2vIKV7VKMe+TOnlfl7fE/HrQlg0Nx25nZp7hWCJen8zCaIO4V2UGmbYgmzl
 fXvaVjEtHMvAiLo9l0UUtcD8VYyyQaZSTrjpXo1ghMIL37QwgLF1Ml29n5wTR6OpdxZG
 hzT0HS0Obaphf+efyt4bLI+LncJ2uqyMsMNI5LM4WOHFRPhd+QqFi0zrxh5uNF8LrFQO
 yuAhU19+ib2k0jKfG6cZfQqc05M2xkl1lpoXdDhvAEqb6qJxry5Whz8oo77ZrM+GFZ7Z
 bsrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PWwCW8mXVC/xZ6jkKVAjmXw3p7extKN8cI5Vy5wzrpg=;
 b=PdAWSSh1EAqNp6rqYm8PR5/GqlvOjkJahihLzUddw3PX8rD91f/Zl245+5X55OMiyb
 R5id5BkyFAG6lSdL3CsKJAmm38nWYy5OQnEqnLU9QlsI2Rrt8QcyV1yeTNReaezuJrld
 xo5+VU1fwV7QLd7c7prbVlKLfLZUg5jqyl7VZ3EbC48TgRZAxJOXyTv50sCwNUkoQFrl
 8Lgjtbbx5+Wmqu9VaknbKy5xvHM6NMI91+DFw+yAKog5YFGNMAWnuBvImbQEuBywhPHP
 rTyC93ZcZz66X8vaftLa1MdkSnm57f5m9gnVuWHLwrokxcKg+sz68ID5gAGj28MIRPrJ
 cUmw==
X-Gm-Message-State: AOAM531lw+5N9HllDvLJNJ9wctv/VPHeODkFnkR7KUZUT+oEnFUgoqYq
 j7jNsiIlId06UegfrMDteJF2hb7dEeU+VhBLwXiOTw==
X-Google-Smtp-Source: ABdhPJzLGB3NsTcTPq4kevF68H7VhflROSqzR9gvvsFeNbMe67/YJDWT0kS7qDrQbtICAWuFhf+uVoFXjda7cW+Oo68=
X-Received: by 2002:a5d:6da1:: with SMTP id u1mr46582938wrs.263.1636973809843; 
 Mon, 15 Nov 2021 02:56:49 -0800 (PST)
MIME-Version: 1.0
References: <20201012220620.124408-1-linus.walleij@linaro.org>
 <20201013092240.GI32292@arm.com>
 <CACRpkdZoMoUQX+CPd31qwjXSKJvaZ6=jcFvUrK_3hkxaUWJNJg@mail.gmail.com>
In-Reply-To: <CACRpkdZoMoUQX+CPd31qwjXSKJvaZ6=jcFvUrK_3hkxaUWJNJg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Nov 2021 10:56:39 +0000
Message-ID: <CAFEAcA9R3xc4PFZiojDZviFxeDFE0a9Ka=3okE3mt1c0NGc7MA@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND] fcntl: Add 32bit filesystem mode
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Theodore Ts'o <tytso@mit.edu>, Linux API <linux-api@vger.kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Florian Weimer <fw@deneb.enyo.de>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Andy Lutomirski <luto@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Nov 2020 at 23:38, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Oct 13, 2020 at 11:22 AM Dave Martin <Dave.Martin@arm.com> wrote:
>
> > >       case F_SETFD:
> > >               err = 0;
> > >               set_close_on_exec(fd, arg & FD_CLOEXEC);
> > > +             if (arg & FD_32BIT_MODE)
> > > +                     filp->f_mode |= FMODE_32BITHASH;
> > > +             else
> > > +                     filp->f_mode &= ~FMODE_32BITHASH;
> >
> > This seems inconsistent?  F_SETFD is for setting flags on a file
> > descriptor.  Won't setting a flag on filp here instead cause the
> > behaviour to change for all file descriptors across the system that are
> > open on this struct file?  Compare set_close_on_exec().
> >
> > I don't see any discussion on whether this should be an F_SETFL or an
> > F_SETFD, though I see F_SETFD was Ted's suggestion originally.
>
> I cannot honestly say I know the semantic difference.
>
> I would ask the QEMU people how a user program would expect
> the flag to behave.

Apologies for the very late response -- I hadn't noticed that
this thread had stalled out waiting for an answer to this,
and was only reminded of it recently when another QEMU user
ran into the problem that this kernel patch is trying to resolve.

If I understand the distinction here correctly, I think
QEMU wouldn't care about it in practice. We want the "32 bit readdir
offsets" behaviour on all file descriptors that correspond
to where we're emulating "the guest opened this file descriptor".
We don't want (but probably won't notice if we get) that behaviour
on file descriptors that QEMU has opened for its own purposes.
But we'll never open a file descriptor for the guest and then
dup it into one for QEMU's purposes. (I guess there might be
some weird unlikely-to-happen edge cases where an emulated
guest binary opens an fd for a directory and then passes it
via exec to a host binary: but even there I expect the host
binary wouldn't notice it was getting 32-bit hashes.)

But overall I think that the more natural behaviour would be that
it is per-file-descriptor.

-- PMM

