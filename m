Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A753514A64
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 15:22:16 +0200 (CEST)
Received: from localhost ([::1]:51404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkQZa-0005kQ-42
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 09:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nkQXY-0003aN-0a; Fri, 29 Apr 2022 09:20:08 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:37242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nkQXV-0002xz-Q8; Fri, 29 Apr 2022 09:20:07 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2f16645872fso84904487b3.4; 
 Fri, 29 Apr 2022 06:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2CS/KzVezZFxw9TP3fcgPravu6XcoeY3/FV+n3RBI6U=;
 b=Pdn+xJ9rkZrkF41Q/kWwFr9q5Hzdlpkfsf5LcneT0zqWHlkdSwZ8Ru8QjirpJ0StbQ
 I3G4DJjZjeMqzyCEVN+E6fArSuZImMSip1tBCyiOGbQl4t1bLqRfaF2APGkQyTtxlaKD
 dSGkMPfml++7B0xd42XWRxaLPJs9kLt/L0EcTLUfTyXQ6tzeLXQVsn7By3q+vu9TQonf
 qrBVML4hPKTuukKr4/DmzbIL21YIFa6E2aJBLzq0I8BPTUf3IeiqIuQ9p9h0nXlyhOFj
 DY/NdcenDJnLotySJ0mM60g5nOeSq21EAFAIBqos3rd6CytVOgBTJr4xT5T99JqMBPCf
 cQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2CS/KzVezZFxw9TP3fcgPravu6XcoeY3/FV+n3RBI6U=;
 b=lZzBByrRztvBezIBW6a/wTi0RAd2KXWgHl0BXzrhPvi+c2XwmuLD/wye0pGAsN6CLe
 p/O1MGghcwzKcVLCXA8miSHtSJfFUKLyf34DjF0P5p937hD9mjPwC+Y9S5a3LOKk2BOE
 GBJd9jgqROy/xPbrz/64K0DRGFCNfEpPq84U9R/sbFPTucA+bjevfyPcBU6sarFiDq6f
 nqBmvFIqPyOMHT1sBBMsKoAHk4xI7blhH2cFqNo8pfDcLW8At4ZEluZUd7I3bd4I9tl+
 Lj4QdU8RLF2aiTBNZik80+es8vNltatK2lLDR3JX98TloYcHC7P7xQ84X3M5bVrF3mBE
 +w3g==
X-Gm-Message-State: AOAM533G9kdFteeczpZzPaaZfjB0tISCdLYwG+oyM96nLrErZTXTiVcl
 CmE0A4ooP+koHViHNd1hHe+3f8TNepYvIpCPzaM=
X-Google-Smtp-Source: ABdhPJwy2uo2yz9Jyw3Tq7Vcl8DoqWJQAkl59Fu8zrx4+HqwmljTKECjhREZgno++7HmU3xBUgRHLhJNjLMRUWe1IQk=
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr37689127ywb.132.1651238404007; Fri, 29
 Apr 2022 06:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1651228000.git.qemu_oss@crudebyte.com>
 <b322ab298a62069e527d2b032028bdc9115afacd.1651228001.git.qemu_oss@crudebyte.com>
 <CAEUhbmUVb_MLEGbKaJKjL023KUDUy=wvf9KCNn+NeAMW0SeELg@mail.gmail.com>
 <7406109.yuWpBpk2tO@silver> <20220429150810.05eca6fe@bahia>
In-Reply-To: <20220429150810.05eca6fe@bahia>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 29 Apr 2022 21:19:51 +0800
Message-ID: <CAEUhbmXXLsPVH3JrjKnfD2F6FVhTaGPRZjW29TY9xAzs-6uB2g@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] 9pfs: fix wrong errno being sent to Linux client
 on macOS host
To: Greg Kurz <groug@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLY=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Michael Roitzsch <reactorcontrol@icloud.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-stable@nongnu.org, Keno Fischer <keno@juliacomputing.com>,
 Will Cohen <wwcohen@gmail.com>, Guohuai Shi <guohuai.shi@windriver.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 29, 2022 at 9:08 PM Greg Kurz <groug@kaod.org> wrote:
>
> On Fri, 29 Apr 2022 14:46:26 +0200
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
>
> > On Freitag, 29. April 2022 13:28:39 CEST Bin Meng wrote:
> > > On Fri, Apr 29, 2022 at 7:16 PM Christian Schoenebeck
> > >
> > > <qemu_oss@crudebyte.com> wrote:
> > > > Linux and macOS only share some errno definitions with equal macro
> > > > name and value. In fact most mappings for errno are completely
> > > > different on the two systems.
> > > >
> > > > This patch converts some important errno values from macOS host to
> > > > corresponding Linux errno values before eventually sending such error
> > > > codes along with 'Rlerror' replies (if 9p2000.L is used that is). Not
> > > > having translated errnos before violated the 9p2000.L protocol spec,
> > > >
> > > > which says:
> > > >   "
> > > >   size[4] Rlerror tag[2] ecode[4]
> > > >
> > > >   ... ecode is a numerical Linux errno.
> > > >   "
> > > >
> > > >   https://github.com/chaos/diod/wiki/protocol#lerror----return-error-code
> > > >
> > > > This patch fixes a bunch of misbehaviours when running a Linux client
> > > >
> > > > on macOS host. For instance this patch fixes:
> > > >   mount -t 9p -o posixacl ...
> > > >
> > > > on Linux guest if security_mode=mapped was used for 9p server, which
> > > > refused to mount successfully, because macOS returned ENOATTR==93
> > > > when client tried to retrieve POSIX ACL xattrs, because errno 93
> > > > is defined as EPROTONOSUPPORT==93 on Linux, so Linux client believed
> > > > that xattrs were not supported by filesystem on host in general.
> > >
> > > This issue looks exact the same issue we were trying to fix when
> > > supporting 9p on Windows host,
> > >
> > > What we did is like this:
> > > http://patchwork.ozlabs.org/project/qemu-devel/patch/20220425142705.2099270-> 10-bmeng.cn@gmail.com/
> > >
> > > But we had some questions in mind (see the commit message of our
> > > patch, and below)
> > >
> > > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > > Link: https://lore.kernel.org/qemu-devel/20220421124835.3e664669@bahia/
> > > > Reviewed-by: Greg Kurz <groug@kaod.org>
> > > > ---
> > > >
> > > >  hw/9pfs/9p-util.h | 30 ++++++++++++++++++++++++++++++
> > > >  hw/9pfs/9p.c      |  2 ++
> > > >  2 files changed, 32 insertions(+)
> > > >
> > > > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> > > > index 2cc9a5dbfb..c3526144c9 100644
> > > > --- a/hw/9pfs/9p-util.h
> > > > +++ b/hw/9pfs/9p-util.h
> > > > @@ -58,6 +58,36 @@ static inline uint64_t host_dev_to_dotl_dev(dev_t dev)
> > > >
> > > >  #endif
> > > >  }
> > > >
> > > > +/* Translates errno from host -> Linux if needed */
> > > > +static inline int errno_to_dotl(int err) {
> > > > +#if defined(CONFIG_LINUX)
> > > > +    /* nothing to translate (Linux -> Linux) */
> > > > +#elif defined(CONFIG_DARWIN)
> > > > +    /*
> > > > +     * translation mandatory for macOS hosts
> > > > +     *
> > > > +     * FIXME: Only most important errnos translated here yet, this should
> > > > be +     * extended to as many errnos being translated as possible in
> > > > future. +     */
> > > > +    if (err == ENAMETOOLONG) {
> > > > +        err = 36; /* ==ENAMETOOLONG on Linux */
> > > > +    } else if (err == ENOTEMPTY) {
> > > > +        err = 39; /* ==ENOTEMPTY on Linux */
> > > > +    } else if (err == ELOOP) {
> > > > +        err = 40; /* ==ELOOP on Linux */
> > > > +    } else if (err == ENOATTR) {
> > > > +        err = 61; /* ==ENODATA on Linux */
> > > > +    } else if (err == ENOTSUP) {
> > > > +        err = 95; /* ==EOPNOTSUPP on Linux */
> > > > +    } else if (err == EOPNOTSUPP) {
> > > > +        err = 95; /* ==EOPNOTSUPP on Linux */
> > > > +    }
> > >
> > > What happens if a macOS guest is running on QEMU from a macOS host?
> > > Here all macOS errnos are translated to the Linux errnos. Will macOS
> > > be happy?
> >
> > Look at the commit log of this patch: it is a matter of which protocol is used
> > (currently there are 3 [1] protocol versions):
> >
> >    * 9p2000: nothing to translate here, as this protocol version does not
> >      return a numeric error code, it only returns an error string (and we are
> >      no longer supporting 9p2000 version in QEMU anyway BTW [1]):
> >      http://ericvh.github.io/9p-rfc/rfc9p2000.html#anchor27
> >
> >    * 9p2000.L: errno *must* be in Linux errno mapping:
> >      https://github.com/chaos/diod/wiki/protocol#lerror----return-error-code
> >
> >    * 9p2000.u: this one returns both an error code and error string, and it
> >      says the error string should be preferred being interpreted by client:
> >      http://ericvh.github.io/9p-rfc/rfc9p2000.u.html#anchor15
> >
> > In this patch here I only translated errno for 9p2000.L, whereas you are
> > always translating it, no matter wich protocol version is used. You might
> > argue that there should be a translation for 9p2000.u as well, but in the end
> > we don't know the OS running on guest in this case. It could be Linux or
> > something else.
> >
>
> In the case of 9p2000.u the spec says "to provide a hint of the underlying
> UNIX error number which caused the error on the server" and even mentions
> "consistency problems of mapping error numbers betweeen different versions
> of UNIX"... this basically means that errno in 9p2000.u is undefined since
> it depends on the host. It is thus unusable unless the guest runs a compatible
> UNIX variant. In any case, there's really nothing to translate.
>
> > [1] https://wiki.qemu.org/Documentation/9p#9p_Protocol
> >

Thanks for the clarifications and pointers to different protocols! It
looks what we did in our Windows patch is correct.

I have another question, does this mean the current 9pfs client on
macOS is broken since it does not use any translation? With this
patch, now the 9p server returns the translated linux errno so the 9p
client on macOS should complain.

Regards,
Bin

