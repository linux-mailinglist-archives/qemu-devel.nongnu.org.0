Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3409E46E49C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 09:51:16 +0100 (CET)
Received: from localhost ([::1]:57574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvF90-00083K-S3
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 03:51:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mvF7G-0007Mo-JF
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 03:49:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mvF77-0004QH-Ab
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 03:49:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639039755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KVYsYT84zsZdZoRkJICTRdHaB2tpOi+NYO6uH28oO1w=;
 b=OSfUz/1I08+jlKrQHnUoZXJsexnDsCPVwmhCVapDODcD+WYPlhRPdpsjcPyisLcx8HPP9I
 gLMwSdRYoCbp0UK5hupEB3WH1HpSU/nMwk4CGeaLxiQ11MVZLim7EK0UmJ0bQkAaE8nIwh
 yoh8wcoppX+ta0rAhRa58sZaTjVo6iQ=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-Vr716KDtND6VHFXRhHgYhg-1; Thu, 09 Dec 2021 03:49:14 -0500
X-MC-Unique: Vr716KDtND6VHFXRhHgYhg-1
Received: by mail-lf1-f70.google.com with SMTP id
 24-20020ac25f58000000b0041799ebf529so2373013lfz.1
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 00:49:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KVYsYT84zsZdZoRkJICTRdHaB2tpOi+NYO6uH28oO1w=;
 b=aXh7J/wVYYhyY4JQuUXSOL81fHOzjnk7TzgKdXvkd0WB/oRoPpsVH6LddSw4UHkJzl
 v2XHhPoDbEMDEGbwzbu5uwVdRV+996iDYRuQDl6i/i1E4pqyb8VxgipZmBue1hqSO3oW
 52v9uI4756fy/3JNBV2nV5jYUGr5XaKM6WAhEYE0hj6x41QVeFrby5ime+artl8wb46k
 aWzM5ITFTcfWB3XMMUGYCzAaigkhcJ7C9NjwIC3d9lzUS/0FD1mWKbc3A7rZSt9NaB1E
 jTIXE7ulc4KcIJkHWjXUh/EO9DvnaqFJ7sI2+e8d3666rzU01WMQeLlWtZFdbbZGH4FA
 0cSA==
X-Gm-Message-State: AOAM5320ZNZIxBeNaAT8MqxxgqmlakinUNjEZSgswT0Fo/EZMRcGiaMT
 01syJVLCZDRv7Bh0AZBTKnjrrA8eccrUGNuwMZskD9d6e5Jokek0JQSuRuaYw7MI4Zax1eKoF5b
 /bWioRCSlaJV1JJmoTGvBK58OEI2VrQ8=
X-Received: by 2002:a19:614f:: with SMTP id m15mr4636753lfk.187.1639039753041; 
 Thu, 09 Dec 2021 00:49:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxn6BeA3AXIPpYN/Hr81H2ID1uvqDV3of4lOpGT0E7J/2PJTJzrEcycMIkiqimUvkJ9S+MMWcMFmJNjbxRWf4M=
X-Received: by 2002:a19:614f:: with SMTP id m15mr4636726lfk.187.1639039752727; 
 Thu, 09 Dec 2021 00:49:12 -0800 (PST)
MIME-Version: 1.0
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-4-leobras@redhat.com>
 <YY5H2ixqGpfbo5jI@redhat.com>
 <CAJ6HWG6TczHZC6EFcicG8irVb3XKdhB05bcyOb0ANAZKmRWqZg@mail.gmail.com>
 <YZy6qifB8JNwYEkp@redhat.com>
 <CAJ6HWG5e5VGW0pt_ek+jMZi+oz4uDOLnC0dHczkqMBBspdLf5A@mail.gmail.com>
 <YangvtnXSwge0R0U@redhat.com>
 <CAJ6HWG4GoONK1M_+GOemmLhNsRiN29313Q8sfkLOxQfS3XUznw@mail.gmail.com>
In-Reply-To: <CAJ6HWG4GoONK1M_+GOemmLhNsRiN29313Q8sfkLOxQfS3XUznw@mail.gmail.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 9 Dec 2021 05:49:01 -0300
Message-ID: <CAJ6HWG7Xk_o=BL6uoH-EqB0zqfF9Pe6iCsRd2xhRi_Z7Y86nsA@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] QIOChannelSocket: Implement io_writev_zerocopy &
 io_flush_zerocopy for CONFIG_LINUX
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 9, 2021 at 5:38 AM Leonardo Bras Soares Passos
<leobras@redhat.com> wrote:
>
> Hello Daniel,
>
> On Fri, Dec 3, 2021 at 6:18 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
> >
> > On Fri, Dec 03, 2021 at 02:42:19AM -0300, Leonardo Bras Soares Passos w=
rote:
> > > Hello Daniel,
> > >
> > > On Tue, Nov 23, 2021 at 6:56 AM Daniel P. Berrang=C3=A9 <berrange@red=
hat.com> wrote:
> > > >
> > > > On Tue, Nov 23, 2021 at 01:46:44AM -0300, Leonardo Bras Soares Pass=
os wrote:
> > > > > Hello Daniel,
> > > > >
> > > > > On Fri, Nov 12, 2021 at 7:54 AM Daniel P. Berrang=C3=A9 <berrange=
@redhat.com> wrote:
> > > > > > > +
> > > > > > > +#ifdef CONFIG_LINUX
> > > > > > > +
> > > > > > > +static int qio_channel_socket_poll(QIOChannelSocket *sioc, b=
ool zerocopy,
> > > > > > > +                                   Error **errp)
> > > > > >
> > > > > > There's only one caller and it always passes zerocopy=3Dtrue,
> > > > > > so this parmeter looks pointless.
> > > > >
> > > > > I did that for possible reuse of this function in the future:
> > > > > - As of today, this is certainly compiled out, but if at some poi=
nt
> > > > > someone wants to use poll for something other
> > > > > than the reading of an zerocopy errqueue, it could be reused.
> > > > >
> > > > > But sure, if that's not desirable, I can remove the parameter (an=
d the
> > > > > if clause for !zerocopy).
> > > > >
> > > > > >
> > > > > > > +{
> > > > > > > +    struct pollfd pfd;
> > > > > > > +    int ret;
> > > > > > > +
> > > > > > > +    pfd.fd =3D sioc->fd;
> > > > > > > +    pfd.events =3D 0;
> > > > > > > +
> > > > > > > + retry:
> > > > > > > +    ret =3D poll(&pfd, 1, -1);
> > > > > > > +    if (ret < 0) {
> > > > > > > +        switch (errno) {
> > > > > > > +        case EAGAIN:
> > > > > > > +        case EINTR:
> > > > > > > +            goto retry;
> > > > > > > +        default:
> > > > > > > +            error_setg_errno(errp, errno,
> > > > > > > +                             "Poll error");
> > > > > > > +            return ret;
> > > > > >
> > > > > >        return -1;
> > > > > >
> > > > > > > +        }
> > > > > > > +    }
> > > > > > > +
> > > > > > > +    if (pfd.revents & (POLLHUP | POLLNVAL)) {
> > > > > > > +        error_setg(errp, "Poll error: Invalid or disconnecte=
d fd");
> > > > > > > +        return -1;
> > > > > > > +    }
> > > > > > > +
> > > > > > > +    if (!zerocopy && (pfd.revents & POLLERR)) {
> > > > > > > +        error_setg(errp, "Poll error: Errors present in errq=
ueue");
> > > > > > > +        return -1;
> > > > > > > +    }
> > > > > >
> > > > > > > +
> > > > > > > +    return ret;
> > > > > >
> > > > > >   return 0;
> > > > >
> > > > > In the idea of future reuse I spoke above, returning zero here wo=
uld
> > > > > make this function always look like the poll timed out. Some futu=
re
> > > > > users may want to repeat the waiting if poll() timed out, or if
> > > > > (return > 0) stop polling.
> > > >
> > > > Now that I'm looking again, we should not really use poll() at all,
> > > > as GLib provides us higher level APIs. We in fact already have the
> > > > qio_channel_wait() method as a general purpose helper for waiting
> > > > for an I/O condition to occur.;
> > > >
> > >
> > > So you suggest using
> > > qio_channel_wait(sioc, G_IO_IN);
> > > instead of creating the new qio_channel_socket_poll().
> > >
> > > Is the above correct? I mean, is it as simple as that?
> >
> > Yes, hopefully it is that simple.
>
> It seems not to be the case.
> After some testing, I found out using this stalls the migration.
>
> This happens when multifd_send_sync_main() calls flush_zerocopy(), but
> the migration threads are
> in multifd_send_thread() calling qemu_sem_wait(&p->sem);
>
> I don't really understand enough of GLib to know how much this is
> different from a poll(), but seems to make a difference.

Oh, nevermind.
A few minutes reading GLib docs was enough for me to understand my mistake.
We will need to use G_IO_ERR instead of G_IO_IN, because we are
waiting for messages
in the ERRQUEUE.

>
> >
> > > > > I understand the idea of testing SO_EE_CODE_ZEROCOPY_COPIED to be=
 able
> > > > > to tell whenever zerocopy fell back to copying for some reason, b=
ut I
> > > > > don't see how this can be helpful here.
> > > > >
> > > > > Other than that I would do rv++ instead of rv=3D1 here, if I want=
 to
> > > > > keep track of how many buffers were sent with zerocopy and how ma=
ny
> > > > > ended up being copied.
> > > >
> > > > Sure, we could do   "ret > 0 =3D=3D number of buffers that were cop=
ied"
> > > > as the API contract, rather than just treating it as a boolean.
> > >
> > > Ok, then you suggest the responsibility of checking the number of
> > > writes with SO_EE_CODE_ZEROCOPY_COPIED, comparing with the total
> > > number of writes,  and deciding whether to disable or not zerocopy
> > > should be on the caller.
> >
> > Yep, its a usage policy so nicer to allow caller to decide the
> > policy.
> >
> > Regards,
> > Daniel
> > --
> > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberr=
ange :|
> > |: https://libvirt.org         -o-            https://fstop138.berrange=
.com :|
> > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberr=
ange :|
> >


