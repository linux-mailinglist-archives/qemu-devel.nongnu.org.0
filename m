Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6083FBD17
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 21:43:48 +0200 (CEST)
Received: from localhost ([::1]:37288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKnC1-0001K9-SO
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 15:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <johannes.stoelp@googlemail.com>)
 id 1mKn6G-0002QU-Kv; Mon, 30 Aug 2021 15:37:44 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:44853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <johannes.stoelp@googlemail.com>)
 id 1mKn6E-0003EG-V0; Mon, 30 Aug 2021 15:37:44 -0400
Received: by mail-pf1-x42c.google.com with SMTP id v123so13010113pfb.11;
 Mon, 30 Aug 2021 12:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LtBGuJebGmv1cfvYr9RhkscSVvbjAGdKN8AeQiV/CHs=;
 b=avY6WCoHfYvC9+2jUWmmxDriiDlJdWQlswBV9WKEzI+Jew4SRQCk8ytUFK6e6N9piT
 Rxn/QjuXL6D0cTTakMCecBAF58uuwgZ/Oatorj6+wliXlIbvUIK8Is/A0ddZ6bEUEpLo
 GmV9OyuhYgVV8dN81St7GzQZB58BXVg0Fgh/6LgQzqMafD/yWkNx7mwMfzNucaHOgw5p
 hUWIPFMMh5KOKWVyr8jF3tvcVlP6qzUejd7YT5zrx8wxPzvf/B0lb20dMX6sW3TChaMF
 wPL9aJTIGNfTYxmkYgceH6OrSHpvPSUIuiUtCIbaKH7zTBWH89rt3jCgh2TS1nkds9B5
 FIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LtBGuJebGmv1cfvYr9RhkscSVvbjAGdKN8AeQiV/CHs=;
 b=QnkI/5JDi/CiFdz+UY7u+OMbnXc2eMpP6DMUoDsayXl00nwL0bBO1vWgKTcMuXrnS9
 BRkazJSnf13WtqpRmvvf1OYirJOWlsT9ty1Hq7MdECIx6Tiko28fzXtvxhv89dKOZdrp
 IBomZ/0BptlGBJUrJDgWQMooc4usyzMuKqavKNFIFf9KKK1DkwUHP/nL1AWrt2iUpvzO
 XxD1XXb2NNRb5ww/MeNliw87GTqNp6a0xGOP6yjkHa6gy+o8HMSJBONiUmx8VFpmRIO1
 icQ+JC44zIycwUeksuAcEdrhvFSSrX6EhqYHt/hFboN0KFW93LQMfkWiTeGnlatfWeBm
 ynog==
X-Gm-Message-State: AOAM533yRZj6szbXQp/0xH6v04mtcdI1kP0piF5j4q11XVjQkzKF/dqa
 PYDEhEukieUwuptB9RbwT8+R/o5hNnu63qj5GMI=
X-Google-Smtp-Source: ABdhPJxsvmI7hd5bWcqDvADpYFfh4BmTmy02z9lVQLsc/s6IJKDLav9NdeNH6PwImGYe1tvDRoRO7OjfEtF0ZXE9zII=
X-Received: by 2002:a63:5651:: with SMTP id g17mr8171158pgm.119.1630352260981; 
 Mon, 30 Aug 2021 12:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210805193950.514357-1-johannes.stoelp@gmail.com>
 <CAFEAcA8TRQdj33Ycm=XzmuUUNApaXVgeDexfS+3Ycg6kLnpmyg@mail.gmail.com>
 <20210830154708.ah27fh34q5dgg3le@redhat.com>
 <CAFEAcA-QW1_sLEArKY1jBJkmGdKQukgwe=O36p7gDpH2mFceqw@mail.gmail.com>
In-Reply-To: <CAFEAcA-QW1_sLEArKY1jBJkmGdKQukgwe=O36p7gDpH2mFceqw@mail.gmail.com>
From: Johannes S <johannes.stoelp@googlemail.com>
Date: Mon, 30 Aug 2021 21:37:30 +0200
Message-ID: <CAMnW+q_6Vd0os7AEVVyM30m1kzev_3j8MWusXV1kp6jmUmRqcg@mail.gmail.com>
Subject: Re: [PATCH v0] kvm: unsigned datatype in ioctl wrapper
To: Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 =?UTF-8?Q?Johannes_St=C3=B6lp?= <johannes.stoelp@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=johannes.stoelp@googlemail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_XBL=0.375, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Aug 29, 2021 at 11:10 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> It would be more helpful to readers to state the reason directly
> in the commit message, rather than requiring them to go and look
> up a comment in some other file.

Thanks for the tip, that makes sense. I will follow it next time.

> > Of the various KVM_* ioctls we use via these functions, do
> > any actually have values that would result in invalid sign
> > extension here ? That is, is this fixing an existing bug, or is
> > it merely avoiding a potential future bug?
>
> My question as well.  If there is such a bug, calling it out in the
> commit message is essential; if the bug is just theoretical,
> mentioning that is still useful.

I agree, more details would have been helpful here.

The background is, that I observed some sign-extension for certain kvm
ioctl requests. However that was in an artificial environment which
included an ioctl wrapper that was defined as
    int ioctl(int fd, unsigned long type, ...);

One example for such an ioctl request is the 'KVM_IRQ_LINE_STATUS'.

So this is not fixing a actual bug, but a theoretical one.

On Mon, Aug 30, 2021 at 5:47 PM Eric Blake <eblake@redhat.com> wrote:
> The fact that glibc uses unsigned long rather than int for the second
> argument is a strong argument in favor of using an unsigned type (on
> 64-bit platforms, the kernel really is looking at 64 bits, even though
> POSIX says we are only passing in 32, and sign-extension is wrong),
> but on the other hand, I don't know if any ioctl requests CAN be sign
> extended (ideally, no ioctl request has bit 0x80000000 set, so that it
> doesn't matter if the userspace code was calling via a signed or
> unsigned type, or via the 32-bit POSIX signature instead of the actual
> kernel 'unsigned long' signature).

On my machine (64bit) I found some ioctl requests with the 0x8000_0000 bit
set, eg
- KVM_IRQ_LINE_STATUS
- KVM_GET_MSR_INDEX_LIST
- KVM_SET_IRQCHIP

I was curious and looked into the macro definitions and it turns out on my
machine, all requests with the '_IOC_READ' direction seem to have the
0x8000_0000 bit set.
_IOC_READ = 2
_IOC_DIRSHIFT = 30
_IOC_READ << _IOC_DIRSHIFT = 0x80000000

#define KVM_SET_IRQCHIP     _IOR(KVMIO,  0x63, struct kvm_irqchip)
#define _IOR(type,nr,size)  _IOC(_IOC_READ,(type),(nr),(_IOC_TYPECHECK(size)))
#define _IOC(dir,type,nr,size) \
    (((dir)  << _IOC_DIRSHIFT) | \
     ((type) << _IOC_TYPESHIFT) | \
     ((nr)   << _IOC_NRSHIFT) | \
     ((size) << _IOC_SIZESHIFT))

On Mon, Aug 30, 2021 at 7:33 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> I found this glibc bug from 2012, filed by some random guy named
> Linus Torvalds, and still open:
> https://sourceware.org/bugzilla/show_bug.cgi?id=14362
> where among other things he claims
> # As noted, this does not actually cause problems on Linux, because
> # unlike FreeBSD, Linux knows what the f*ck it is doing, and just
> # ignores the upper bits exactly because of possible sign confusion.

Sounds like we are saved be the Linux Kernel here :)

In my opinion we should use 'unsigned' data types here for the ioctl
request in the ioctl wrappers or would you prefer to keep the ioctl
wrapper definition as is today? What is you opinion?

Thanks and best,
Johannes

