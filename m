Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AF8514C9A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 16:18:53 +0200 (CEST)
Received: from localhost ([::1]:50556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkRSN-0005Rx-OP
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 10:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nkRQj-0004Vs-Fx; Fri, 29 Apr 2022 10:17:09 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:43456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nkRQh-0004Sb-7s; Fri, 29 Apr 2022 10:17:09 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2ec42eae76bso86551517b3.10; 
 Fri, 29 Apr 2022 07:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T0Woq4uFCAyI4S6LpPelmnoVtiBKDzp2XDBy6fm4aIQ=;
 b=Pf3s8tuJET6VI1OBDFveixzCbk3bGs+c+yC0HLkwjovcZTUPqep4btQ5d0I3h48oGc
 qFhzsiz+eTkQI71t0MY0tPWFtucmnpy4KFwwDDh3QYwuG+BfzzhdJ1Oo8cfw4AaqcP9I
 xl5AQErsbfUcemfDXZD0g3uCD72kr9LhDWrOY7MV5MZHctH59AkR7+jItdjW3a4G37lk
 AMgpNHq9ZWeXjvFQBarbnlKf9aTgf8UnJsSDFaI5qN/NCrDO3Q9D+XXdxxg/mjsoUtqv
 pPpls4NDQAPxZUvHD9iGCQfevTC/lcycyraobF0TqsOnP/53W53iyRQDqRhyO4uydM34
 kagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T0Woq4uFCAyI4S6LpPelmnoVtiBKDzp2XDBy6fm4aIQ=;
 b=4b4PJEOc+LJg0jhOo2jibJ4dgo9hsUXQwS/zwMzmtw337zle8l8FwuLGkVbRj4UoZ5
 K9fWRPawaGo6c1wNcAEuzlzY11JYOwzFjBmnfABTkL09sc8GoQXoR/LsD3/DvmmMrF5y
 hvT5jx6YI37/2PZ9b5ARUNYYHPknkcRGAj90S7ks6Cg0qszqKrJrVHHE63Me+aL0OZmi
 KzqP593FXwrYt0JcbiV9QUMfd0usk9f4JZiHrdczZup87EXpw+xKjNCafKczbD+qsYrX
 uxjZiitCrJ7BQyNHC0PDX76U7BRQ4DT9rcni7RKyECLPoagw6gpe/9uBmNTZrM5WfLMG
 isQg==
X-Gm-Message-State: AOAM531pVeJiCRea1BbyIIe+CGTQdjxjj/MoPINUk8/1jxoXVF7w0VbN
 w1l6NDweMHNat8IOfSllbZeAuYioJ9Bld4TM2rI=
X-Google-Smtp-Source: ABdhPJwylkhccHTAK7ZfkeOAhgasTHDxFYxSSCmKX6T5hH7MXkyuPS1AsulFi7UrznXvbHRQZioVG0wrcmsWatqWD4A=
X-Received: by 2002:a05:690c:102:b0:2ef:48d8:24c3 with SMTP id
 bd2-20020a05690c010200b002ef48d824c3mr39376471ywb.153.1651241825718; Fri, 29
 Apr 2022 07:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1651228000.git.qemu_oss@crudebyte.com>
 <CAEUhbmXXLsPVH3JrjKnfD2F6FVhTaGPRZjW29TY9xAzs-6uB2g@mail.gmail.com>
 <20220429152915.7beb6545@bahia> <2182756.uObvtyB7Eu@silver>
In-Reply-To: <2182756.uObvtyB7Eu@silver>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 29 Apr 2022 22:16:54 +0800
Message-ID: <CAEUhbmX1oJPTvtr4wE+e_gDL_iugOaArUtMo22W+LsgH97+1_g@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] 9pfs: fix wrong errno being sent to Linux client
 on macOS host
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1131.google.com
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
Cc: Will Cohen <wwcohen@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-stable@nongnu.org, Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Guohuai Shi <guohuai.shi@windriver.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 29, 2022 at 9:48 PM Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> On Freitag, 29. April 2022 15:29:15 CEST Greg Kurz wrote:
> > On Fri, 29 Apr 2022 21:19:51 +0800
> >
> > Bin Meng <bmeng.cn@gmail.com> wrote:
> > > On Fri, Apr 29, 2022 at 9:08 PM Greg Kurz <groug@kaod.org> wrote:
> > > > On Fri, 29 Apr 2022 14:46:26 +0200
> > > >
> > > > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > > > On Freitag, 29. April 2022 13:28:39 CEST Bin Meng wrote:
> > > > > > On Fri, Apr 29, 2022 at 7:16 PM Christian Schoenebeck
> > > > > >
> > > > > > <qemu_oss@crudebyte.com> wrote:
> > > > > > > Linux and macOS only share some errno definitions with equal macro
> > > > > > > name and value. In fact most mappings for errno are completely
> > > > > > > different on the two systems.
> > > > > > >
> > > > > > > This patch converts some important errno values from macOS host to
> > > > > > > corresponding Linux errno values before eventually sending such
> > > > > > > error
> > > > > > > codes along with 'Rlerror' replies (if 9p2000.L is used that is).
> > > > > > > Not
> > > > > > > having translated errnos before violated the 9p2000.L protocol
> > > > > > > spec,
> > > > > > >
> > > > > > > which says:
> > > > > > >   "
> > > > > > >   size[4] Rlerror tag[2] ecode[4]
> > > > > > >
> > > > > > >   ... ecode is a numerical Linux errno.
> > > > > > >   "
> > > > > > >
> > > > > > >   https://github.com/chaos/diod/wiki/protocol#lerror----return-err
> > > > > > >   or-code
> > > > > > >
> > > > > > > This patch fixes a bunch of misbehaviours when running a Linux
> > > > > > > client
> > > > > > >
> > > > > > > on macOS host. For instance this patch fixes:
> > > > > > >   mount -t 9p -o posixacl ...
> > > > > > >
> > > > > > > on Linux guest if security_mode=mapped was used for 9p server,
> > > > > > > which
> > > > > > > refused to mount successfully, because macOS returned ENOATTR==93
> > > > > > > when client tried to retrieve POSIX ACL xattrs, because errno 93
> > > > > > > is defined as EPROTONOSUPPORT==93 on Linux, so Linux client
> > > > > > > believed
> > > > > > > that xattrs were not supported by filesystem on host in general.
> > > > > >
> > > > > > This issue looks exact the same issue we were trying to fix when
> > > > > > supporting 9p on Windows host,
> > > > > >
> > > > > > What we did is like this:
> > > > > > http://patchwork.ozlabs.org/project/qemu-devel/patch/20220425142705.
> > > > > > 2099270-> 10-bmeng.cn@gmail.com/
> > > > > >
> > > > > > But we had some questions in mind (see the commit message of our
> > > > > > patch, and below)
> > > > > >
> > > > > > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > > > > > Link:
> > > > > > > https://lore.kernel.org/qemu-devel/20220421124835.3e664669@bahia/
> > > > > > > Reviewed-by: Greg Kurz <groug@kaod.org>
> > > > > > > ---
> > > > > > >
> > > > > > >  hw/9pfs/9p-util.h | 30 ++++++++++++++++++++++++++++++
> > > > > > >  hw/9pfs/9p.c      |  2 ++
> > > > > > >  2 files changed, 32 insertions(+)
> > > > > > >
> > > > > > > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> > > > > > > index 2cc9a5dbfb..c3526144c9 100644
> > > > > > > --- a/hw/9pfs/9p-util.h
> > > > > > > +++ b/hw/9pfs/9p-util.h
> > > > > > > @@ -58,6 +58,36 @@ static inline uint64_t
> > > > > > > host_dev_to_dotl_dev(dev_t dev)
> > > > > > >
> > > > > > >  #endif
> > > > > > >  }
> > > > > > >
> > > > > > > +/* Translates errno from host -> Linux if needed */
> > > > > > > +static inline int errno_to_dotl(int err) {
> > > > > > > +#if defined(CONFIG_LINUX)
> > > > > > > +    /* nothing to translate (Linux -> Linux) */
> > > > > > > +#elif defined(CONFIG_DARWIN)
> > > > > > > +    /*
> > > > > > > +     * translation mandatory for macOS hosts
> > > > > > > +     *
> > > > > > > +     * FIXME: Only most important errnos translated here yet,
> > > > > > > this should
> > > > > > > be +     * extended to as many errnos being translated as possible
> > > > > > > in
> > > > > > > future. +     */
> > > > > > > +    if (err == ENAMETOOLONG) {
> > > > > > > +        err = 36; /* ==ENAMETOOLONG on Linux */
> > > > > > > +    } else if (err == ENOTEMPTY) {
> > > > > > > +        err = 39; /* ==ENOTEMPTY on Linux */
> > > > > > > +    } else if (err == ELOOP) {
> > > > > > > +        err = 40; /* ==ELOOP on Linux */
> > > > > > > +    } else if (err == ENOATTR) {
> > > > > > > +        err = 61; /* ==ENODATA on Linux */
> > > > > > > +    } else if (err == ENOTSUP) {
> > > > > > > +        err = 95; /* ==EOPNOTSUPP on Linux */
> > > > > > > +    } else if (err == EOPNOTSUPP) {
> > > > > > > +        err = 95; /* ==EOPNOTSUPP on Linux */
> > > > > > > +    }
> > > > > >
> > > > > > What happens if a macOS guest is running on QEMU from a macOS host?
> > > > > > Here all macOS errnos are translated to the Linux errnos. Will macOS
> > > > > > be happy?
> > > > >
> > > > > Look at the commit log of this patch: it is a matter of which protocol
> > > > > is used> > >
> > > > > (currently there are 3 [1] protocol versions):
> > > > >    * 9p2000: nothing to translate here, as this protocol version does
> > > > >    not
> > > > >
> > > > >      return a numeric error code, it only returns an error string (and
> > > > >      we are
> > > > >      no longer supporting 9p2000 version in QEMU anyway BTW [1]):
> > > > >      http://ericvh.github.io/9p-rfc/rfc9p2000.html#anchor27
> > > > >
> > > > >    * 9p2000.L: errno *must* be in Linux errno mapping:
> > > > >      https://github.com/chaos/diod/wiki/protocol#lerror----return-erro
> > > > >      r-code
> > > > >
> > > > >    * 9p2000.u: this one returns both an error code and error string,
> > > > >    and it
> > > > >
> > > > >      says the error string should be preferred being interpreted by
> > > > >      client:
> > > > >      http://ericvh.github.io/9p-rfc/rfc9p2000.u.html#anchor15
> > > > >
> > > > > In this patch here I only translated errno for 9p2000.L, whereas you
> > > > > are
> > > > > always translating it, no matter wich protocol version is used. You
> > > > > might
> > > > > argue that there should be a translation for 9p2000.u as well, but in
> > > > > the end we don't know the OS running on guest in this case. It could
> > > > > be Linux or something else.
> > > >
> > > > In the case of 9p2000.u the spec says "to provide a hint of the
> > > > underlying
> > > > UNIX error number which caused the error on the server" and even
> > > > mentions
> > > > "consistency problems of mapping error numbers betweeen different
> > > > versions
> > > > of UNIX"... this basically means that errno in 9p2000.u is undefined
> > > > since
> > > > it depends on the host. It is thus unusable unless the guest runs a
> > > > compatible UNIX variant. In any case, there's really nothing to
> > > > translate.
> > > >
> > > > > [1] https://wiki.qemu.org/Documentation/9p#9p_Protocol
> > >
> > > Thanks for the clarifications and pointers to different protocols! It
> > > looks what we did in our Windows patch is correct.
>
> Like I said, you are translating it for all protocol version, whereas this
> patch here translates errnos for 9p2000.L version only.

Yes, this should be fixed in v2.

>
> > > I have another question, does this mean the current 9pfs client on
> > > macOS is broken since it does not use any translation? With this
> > > patch, now the 9p server returns the translated linux errno so the 9p
> > > client on macOS should complain.
> >
> > I don't now the macOS client but if it doesn't expect linux errnos
> > then it is infringing 9p2000.L and should be fixed.
>
> Agreed, if you are using 9p2000.L with that macOS client and client does not
> translate errnos Linux -> macOS, then client is broken. In the end it matters
> what the protocol documentation specified.
>
> Which client is that? Is it from Apple or from a third party? And are you sure
> you were actually using 9p2000.L and not 9p2000.u?
>

I was asking this question because that's something that bothered us
when developing the Windows patch because the errno translation does
not exist in current macOS support, which means when using 9p2000.L:

* if testing a Linux 9 client with a macOS QEMU, it should have been
noticed before due to the errno mismatch which this patch is trying to
fix
* the same error mismatch should happen between a macOS 9p client and
a Linux QEMU
* or maybe only macOS 9p client was tested with a macOS QEMU, because
no errno translation exist, which means the macOS 9p client is broken?

Regards,
Bin

