Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 888A76BB9BF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 17:35:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcU4n-0005N0-HV; Wed, 15 Mar 2023 12:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pcU4m-0005Mn-2Z
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 12:34:08 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pcU4k-0005vt-CV
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 12:34:07 -0400
Received: by mail-yb1-xb29.google.com with SMTP id e71so11643344ybc.0
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 09:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678898045;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MeCMC8UVxnfNnGa1kuwPfz3Mk2N5NEKae7N+GRlze08=;
 b=Hqe0WGAkdVZ0vGlmEXnrfEcCJH+Mc+8Cu5WYXSSy+ANFx9eUcd+4mAeKhnzr4B0uGA
 9//DshLo48pr3S1PhnWitO7mZ5Hn+o3wP7isWMr+4MTizl+wKZk76IHDUYTYXBE/4oPc
 T6VdZLwUmSGpQv5oG3lRZhCcvcDwb9XmjqgaDK9ZFfu3L/4yFTUu2isxvEqMzZY6Pi7+
 uSb4kPFiDKTEIoL3G/zTYfw/xoYnQJrZDYhVrnhQAtKGkNwxHDYbYCLL7Qg3rc4cvPu+
 sOru9V2BbdDwwxOHXmoFZ1+NB6QkA+Z90gdcJAKKYC8tbouTQXniqXRrSfWE1VKVgxvW
 hzpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678898045;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MeCMC8UVxnfNnGa1kuwPfz3Mk2N5NEKae7N+GRlze08=;
 b=cLNG8EY6pcu36rQz4q0If82nKrVcTb1Ugm4t0mhH+muU/yPE7f63uVJwaScYu5h243
 m3sJi8YjEbwZCMYoVdahmQCTy+2vH8aw7HgWrX5yuAI+eg5f3HbgKkG+PNMD44u1gETj
 HiaL3YXbCNWpVhiy6PcNOqcZvK7hp+PCavQWTed/uVWixN51rT0oCGkpT7J+wOvHLiwf
 3I560VAE4lecQfLaM5ApC1PcWycE0EbN9eBGy1cNCQ1EqcqVZF/+Q+8gl2LNl2GnY2aa
 5XLNaTsWM51kagR7TNNF0pPBLUj7ZMe4VZ35PNJ0Pwm6FhnYbT8yBA9aC72cD+B5xwoU
 o24w==
X-Gm-Message-State: AO0yUKWW7eDwiSORFaFfzqE9/qqVBv0m5XQJl7vdTmT81OEEATxSwlQu
 oHi2CmhHM8XnPieQMquS0cJUmjI1MwWib7S0/q4=
X-Google-Smtp-Source: AK7set8rxdGSQEA4EAjaUpb8iQPJRgDhFg5IzaeHf6LBgqKNL6aC8rGalv2yXMPGdKLIcSkypJjl7UFVu1PyEQrewyE=
X-Received: by 2002:a25:8607:0:b0:b30:2539:a2b4 with SMTP id
 y7-20020a258607000000b00b302539a2b4mr4458438ybk.2.1678898045211; Wed, 15 Mar
 2023 09:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230313174833.28790-1-hreitz@redhat.com>
 <20230313174833.28790-2-hreitz@redhat.com>
 <20230315135844.GC6146@fedora>
 <aca54f19-1c95-01b6-5c5d-bfcee7942c16@redhat.com>
In-Reply-To: <aca54f19-1c95-01b6-5c5d-bfcee7942c16@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 15 Mar 2023 12:33:53 -0400
Message-ID: <CAJSP0QX1+YvFeHqbOfysKOmR-oZqz35BfWBgyNUiZOce=zWobA@mail.gmail.com>
Subject: Re: [RFC 1/2] vhost-user: Add interface for virtio-fs migration
To: Hanna Czenczek <hreitz@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, "Michael S . Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, 
 Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 15 Mar 2023 at 11:56, Hanna Czenczek <hreitz@redhat.com> wrote:
>
> On 15.03.23 14:58, Stefan Hajnoczi wrote:
> > On Mon, Mar 13, 2023 at 06:48:32PM +0100, Hanna Czenczek wrote:
> >> Add a virtio-fs-specific vhost-user interface to facilitate migrating
> >> back-end-internal state.  We plan to migrate the internal state simply
> > Luckily the interface does not need to be virtiofs-specific since it
> > only transfers opaque data. Any stateful device can use this for
> > migration. Please make it generic both at the vhost-user protocol
> > message level and at the QEMU vhost API level.
>
> OK, sure.
>
> >> as a binary blob after the streaming phase, so all we need is a way to
> >> transfer such a blob from and to the back-end.  We do so by using a
> >> dedicated area of shared memory through which the blob is transferred =
in
> >> chunks.
> > Keeping the migration data transfer separate from the vhost-user UNIX
> > domain socket is a good idea since the amount of data could be large an=
d
> > may congest the UNIX domain socket. The shared memory interface solves
> > this.
> >
> > Where I get lost is why it needs to be shared memory instead of simply
> > an fd? On the source, the front-end could read the fd until EOF and
> > transfer the opaque data. On the destination, the front-end could write
> > to the fd and then close it. I think that would be simpler than the
> > shared memory interface and could potentially support zero-copy via
> > splice(2) (QEMU doesn't need to look at the data being transferred!).
> >
> > Here is an outline of an fd-based interface:
> >
> > - SET_DEVICE_STATE_FD: The front-end passes a file descriptor for
> >    transferring device state.
> >
> >    The @direction argument:
> >    - SAVE: the back-end transfers an outgoing device state over the fd.
> >    - LOAD: the back-end transfers an incoming device state over the fd.
> >
> >    The @phase argument:
> >    - STOPPED: the device is stopped.
> >    - PRE_COPY: reserved for future use.
> >    - POST_COPY: reserved for future use.
> >
> >    The back-end transfers data over the fd according to @direction and
> >    @phase upon receiving the SET_DEVICE_STATE_FD message.
> >
> > There are loose ends like how the message interacts with the virtqueue
> > enabled state, what happens if multiple SET_DEVICE_STATE_FD messages ar=
e
> > sent, etc. I have ignored them for now.
> >
> > What I wanted to mention about the fd-based interface is:
> >
> > - It's just one message. The I/O activity happens via the fd and does
> >    not involve GET_STATE/SET_STATE messages over the vhost-user domain
> >    socket.
> >
> > - Buffer management is up to the front-end and back-end implementations
> >    and a bit simpler than the shared memory interface.
> >
> > Did you choose the shared memory approach because it has certain
> > advantages?
>
> I simply chose it because I didn=E2=80=99t think of anything else. :)
>
> Using just an FD for a pipe-like interface sounds perfect to me.  I
> expect that to make the code simpler and, as you point out, it=E2=80=99s =
just
> better in general.  Thanks!

The Linux VFIO Migration v2 API could be interesting to look at too:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/inc=
lude/uapi/linux/vfio.h#n814

It has a state machine that puts the device into
pre-copy/saving/loading/etc states.

> > What is the rationale for waiting to receive the entire incoming state
> > before parsing it rather than parsing it in a streaming fashion? Can
> > this be left as an implementation detail of the vhost-user back-end so
> > that there's freedom in choosing either approach?
>
> The rationale was that when using the shared memory approach, you need
> to specify the offset into the state of the chunk that you=E2=80=99re cur=
rently
> transferring.  So to allow streaming, you=E2=80=99d need to make the fron=
t-end
> transfer the chunks in a streaming fashion, so that these offsets are
> continuously increasing.  Definitely possible, and reasonable, I just
> thought it=E2=80=99d be easier not to define it at this point and just st=
ate
> that decoding at the end is always safe.
>
> When using a pipe/splicing, however, that won=E2=80=99t be a concern anym=
ore, so
> yes, then we can definitely allow the back-end to decode its state while
> it=E2=80=99s still being received.

I see.

Stefan

