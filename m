Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAC615905B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 14:51:29 +0100 (CET)
Received: from localhost ([::1]:49978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1Vwm-000396-Ev
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 08:51:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43895)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1j1VvS-0002DZ-8I
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 08:50:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1j1VvQ-0006nx-J4
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 08:50:05 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:20927
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1j1VvQ-0006nU-FG
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 08:50:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581429003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QWt2kRoAMVUxl9uTnRaKnHDgsYtBOJM+HROwuiXnw4I=;
 b=OYat05X+uzgEOV0cZuQqskaXDLabqXlQWUaJZ3e2UvrYKnAm4PS/afbrKG5tWbx6r5Tp9b
 X8bULJemvpI69QadMfuWtceCf7+6URW2TzintglxqYdCblKlFUa7HUuzWejIMW/jY3pU7e
 e/ays1uBtQa1GwcBUrDlSRTg/NoeATs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-6sIvghJrOOWVFsPZCb4aow-1; Tue, 11 Feb 2020 08:50:01 -0500
Received: by mail-qt1-f200.google.com with SMTP id l1so6544380qtp.21
 for <qemu-devel@nongnu.org>; Tue, 11 Feb 2020 05:50:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qINkZa/jjde5RZ3v6wvTKsxtDEH2VmmXFbMBdkR8Ksk=;
 b=ka4Ua5nMqaKWczUsQlF9UVBK/NrWWaFUdLMsl9dcDTQAtfMEYWCNlKq85d94Pp5VqV
 RlTZgrUBBxGvep4IhHIgAiriDRhuU/lxBZh7DA12BQ2aGTOqZQ1MyzRZN90qr1FxpjbK
 5hK8FBgJGS68T2E9mKbAhcLbOVkc/ETj8m3ZqrZ1nPe5WGc42Fr9+w8aKJP5XnOBL+dQ
 9lzyTVko67Or6OkObBawFNPIYfAMIowrezAwC2MUZqL3AtfDP5xWNs9p7KEPjOsT+M8f
 PDWeOqzh4SUxusFipah2XifC+cnNBRiGQUhkMgsjMbSAZMK5XT+hCsUIm//dMkB8H07g
 cbQw==
X-Gm-Message-State: APjAAAVKDjIshSYqzlH/Sz5nWr3lZvDAiK3aw1Bayx871yM7ETXpnYt9
 CyVKFpIT4WN1MvwtTQU8u6SnsRnGMrYuPzvJIHGUPm8kHsYpPUVxkCTIF3Ca0nZg9BqFMgcA+MS
 OfyTHqSUFg5B17fs=
X-Received: by 2002:ac8:758a:: with SMTP id s10mr14925193qtq.283.1581429001288; 
 Tue, 11 Feb 2020 05:50:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqyAx1wTBBb8qiDUF4yuMqLAKkrITyd5PTjT8/ZJdS+h7YWu9zRGj99QoGHbPDAUsqHG2WIg3w==
X-Received: by 2002:ac8:758a:: with SMTP id s10mr14925157qtq.283.1581429000988; 
 Tue, 11 Feb 2020 05:50:00 -0800 (PST)
Received: from xz-x1 ([2607:9880:19c8:32::2])
 by smtp.gmail.com with ESMTPSA id t2sm2005045qkc.31.2020.02.11.05.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 05:50:00 -0800 (PST)
Date: Tue, 11 Feb 2020 08:49:58 -0500
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] migration/rdma: rdma_accept_incoming_migration fix error
 handling
Message-ID: <20200211134958.GE984290@xz-x1>
References: <20200210194459.112085-1-dgilbert@redhat.com>
 <20200210223347.GC984290@xz-x1> <20200211092200.GC2751@work-vm>
MIME-Version: 1.0
In-Reply-To: <20200211092200.GC2751@work-vm>
X-MC-Unique: 6sIvghJrOOWVFsPZCb4aow-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 11, 2020 at 09:22:00AM +0000, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > On Mon, Feb 10, 2020 at 07:44:59PM +0000, Dr. David Alan Gilbert (git) =
wrote:
> > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > >=20
> > > rdma_accept_incoming_migration is called from an fd handler and
> > > can't return an Error * anywhere.
> > > Currently it's leaking Error's in errp/local_err - there's
> > > no point putting them in there unless we can report them.
> > >=20
> > > Turn most into fprintf's, and the last into an error_reportf_err
> > > where it's coming up from another function.
> > >=20
> > > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > ---
> > >  migration/rdma.c | 11 +++++++----
> > >  1 file changed, 7 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/migration/rdma.c b/migration/rdma.c
> > > index 2379b8345b..f67161c98f 100644
> > > --- a/migration/rdma.c
> > > +++ b/migration/rdma.c
> > > @@ -3980,13 +3980,13 @@ static void rdma_accept_incoming_migration(vo=
id *opaque)
> > >      RDMAContext *rdma =3D opaque;
> > >      int ret;
> > >      QEMUFile *f;
> > > -    Error *local_err =3D NULL, **errp =3D &local_err;
> > > +    Error *local_err =3D NULL;
> > > =20
> > >      trace_qemu_rdma_accept_incoming_migration();
> > >      ret =3D qemu_rdma_accept(rdma);
> > > =20
> > >      if (ret) {
> > > -        ERROR(errp, "RDMA Migration initialization failed!");
> > > +        fprintf(stderr, "RDMA ERROR: Migration initialization failed=
");
> >=20
> > Is there any reason to explictly use stderr instead of the
> > error_reportf_err() below (then we simply jump to that for error
> > paths)?  The only difference of error_reportf_err() and stderr should
> > be when there's one HMP, while shall we always suggest to use
> > error_reportf_err() rather than stderr?
>=20
> Because the error_reportf_err is taking an Error* (from an error
> reported by migration_fd_process_incoming) where as we don't have an
> Error* at the earlier points.

The ERROR() macro in rdma.c created them?  Though it also prints to
stderr so if we also use the same error_reportf_err() then we can
remove that prints to stderr too.

--=20
Peter Xu


