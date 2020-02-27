Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56826171513
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 11:34:47 +0100 (CET)
Received: from localhost ([::1]:56866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7GVB-0008Ol-EL
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 05:34:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45691)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <coiby.xu@gmail.com>) id 1j7GQD-0003UJ-8l
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 05:29:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <coiby.xu@gmail.com>) id 1j7GQC-0001Jr-2Q
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 05:29:37 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:45227)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <coiby.xu@gmail.com>) id 1j7GQB-0001Co-Qd
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 05:29:36 -0500
Received: by mail-lj1-x244.google.com with SMTP id e18so2721479ljn.12
 for <qemu-devel@nongnu.org>; Thu, 27 Feb 2020 02:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q9782uO6U1GtQHeswx106Gf0qWSFhYb6uhF5QwTrPV0=;
 b=eaG/XsV4oxu8HvV9Pooo69l4SuZuJqoAqIRG4iFY17CgmE9dWqKRPfWZbNyEzP5Yqc
 pC42WNyILbAbZ2zY1CcKD0g8Azc9kOeHtUub6nKtt30Gc+GPOCvdyUaoCKFIJVLomkMc
 r3LxYIRBy+nsI1ZuD3RarpQFcfQHM8KeDkQw71WZCf2jC4o61/9bGnmUU/bcf6ddNSzX
 6s3HOtjSLuFS7AsI5ewuY+tfP6pfmxCALEA+79DMaWo3CGq8dgmgqcCOnaAyWrX9AudW
 OIBlkU0fp3s4iEv00QAiizNt/wpcZ/gNy70uWQqzkasUQPrS5x3yRhdpaHqVD0zlfDQF
 g38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q9782uO6U1GtQHeswx106Gf0qWSFhYb6uhF5QwTrPV0=;
 b=Vo6Fj0o0IAdCIEfyUOPG3zqB+u9GmZfQIcricqCQ0Zmg+hJ7lgt5tC3zgKu0AQL+QA
 nEbkW6ynDTFQqCh9NRrUR5OQXzjXmt5h3RIpFyt+i9MkpnFWmoVo9ow+huyhwUQRjeex
 zyT2+/oxEbid8hsI36jB21ONXSlyABXujsY1TgZoM6FlItMjHBGDo/YQ85foG+Svx6Op
 qo9Nl0ORyz59hPph7imS3pZS7J6Sq3aNzOute0lUoeA/CgX059tRXAn8252HfMdY6DAG
 960o9ZSe/0dRicyXPZTo35g30Kqyv1ouFdINVbaYSOVj/aZTX6CoLARnpn9zjU9o/sNU
 1vxg==
X-Gm-Message-State: ANhLgQ0hoBKe1t+/qTjis8cPssPjm2Qf4g7Fuk/kMsC1pDzDgY5tuoOQ
 WhvK/KznL+4MXDLfbssXeVIpu7BZOUmtFfdr5wU=
X-Google-Smtp-Source: ADFU+vvW1nRTeCU5QPwd54vuh/9EicL+MbjBwf4QEnbywV/mL0y+Zzgm/jV+PL/4qFo1G0DYBjlnYbtMGs6LRqBHh2E=
X-Received: by 2002:a2e:7816:: with SMTP id t22mr2347885ljc.161.1582799374202; 
 Thu, 27 Feb 2020 02:29:34 -0800 (PST)
MIME-Version: 1.0
References: <20200218050711.8133-1-coiby.xu@gmail.com>
 <20200219163815.GD1085125@stefanha-x1.localdomain>
 <CAJAkqrXaqmT2pR4K1x06AeQZHvUWp-fcqnbKZq_45czO96v5PA@mail.gmail.com>
 <20200227074114.GB83512@stefanha-x1.localdomain>
 <CAJAkqrWUJWLdT+6b_XmHFwnzhhbYei2SakCKVW0Rf92HJgoZDw@mail.gmail.com>
 <20200227100206.GA7493@linux.fritz.box>
In-Reply-To: <20200227100206.GA7493@linux.fritz.box>
From: Coiby Xu <coiby.xu@gmail.com>
Date: Thu, 27 Feb 2020 18:28:57 +0800
Message-ID: <CAJAkqrW_Euur3HjWaK6E-TAjT1dmjA1fz1oPwKSt7_pOC3=S+w@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] vhost-user block device backend implementation
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
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
Cc: bharatlkmlkvm@gmail.com,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > we still need customized vu_message_read because libvhost-user assumes
> > we will always get a full-size VhostUserMsg and hasn't taken care of
> > this short read case. I will improve libvhost-user's vu_message_read
> > by making it keep reading from socket util getting enough bytes. I
> > assume short read is a rare case thus introduced performance penalty
> > would be negligible.

> In any case, please make sure that we use the QIOChannel functions
> called from a coroutine in QEMU so that it will never block, but the
> coroutine can just yield while it's waiting for more bytes.

But if I am not wrong, libvhost-user is supposed to be indepdent from
the main QEMU code. So it can't use the QIOChannel functions if we
simply modify exiting vu_message_read to address the short read issue.
In v3 & v4, I extended libvhost-user to allow vu_message_read to be
replaced by one which will depend on the main QEMU code. I'm not sure
which way is better.

On Thu, Feb 27, 2020 at 6:02 PM Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 27.02.2020 um 10:53 hat Coiby Xu geschrieben:
> > Thank you for reminding me of this socket short read issue! It seems
> > we still need customized vu_message_read because libvhost-user assumes
> > we will always get a full-size VhostUserMsg and hasn't taken care of
> > this short read case. I will improve libvhost-user's vu_message_read
> > by making it keep reading from socket util getting enough bytes. I
> > assume short read is a rare case thus introduced performance penalty
> > would be negligible.
>
> In any case, please make sure that we use the QIOChannel functions
> called from a coroutine in QEMU so that it will never block, but the
> coroutine can just yield while it's waiting for more bytes.
>
> Kevin
>
> > On Thu, Feb 27, 2020 at 3:41 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > >
> > > On Wed, Feb 26, 2020 at 11:18:41PM +0800, Coiby Xu wrote:
> > > > Hi Stefan,
> > > >
> > > > Thank you for reviewing my code!
> > > >
> > > > I tried to reach you on IRC. But somehow either you missed my message
> > > > or I missed your reply. So I will reply by email instead.
> > > >
> > > > If we use qio_channel_set_aio_fd_handler to monitor G_IO_IN event,
> > > > i.e. use vu_dispatch as the read handler, then we can re-use
> > > > vu_message_read. And "removing the blocking recv from libvhost-user"
> > > > isn't necessary because "the operation of poll() and ppoll() is not
> > > > affected by the O_NONBLOCK flag" despite that we use
> > > > qio_channel_set_blocking before calling qio_channel_set_aio_fd_handler
> > > > to make recv non-blocking.
> > >
> > > I'm not sure I understand.  poll() just says whether the file descriptor
> > > is readable.  It does not say whether enough bytes are readable :).  So
> > > our callback will be invoked if there is 1 byte ready, but when we try
> > > to read 20 bytes either it will block (without O_NONBLOCK) or return
> > > only 1 byte (with O_NONBLOCK).  Neither case is okay, so I expect that
> > > code changes will be necessary.
> > >
> > > But please go ahead and send the next revision and I'll take a look.
> > >
> > > Stefan
> >
> >
> >
> > --
> > Best regards,
> > Coiby
> >
>


-- 
Best regards,
Coiby

