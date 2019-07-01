Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 225164A773
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 18:47:14 +0200 (CEST)
Received: from localhost ([::1]:59830 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdHGK-0007x4-St
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 12:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34446)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hdGG0-0007dg-QM
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 11:42:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hdGFy-0006lj-Ez
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 11:42:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56128)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hdGFu-0006BP-Hg
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 11:42:44 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 03F27306E61C;
 Tue, 18 Jun 2019 15:42:24 +0000 (UTC)
Received: from work-vm (ovpn-117-76.ams2.redhat.com [10.36.117.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2CF7179E3;
 Tue, 18 Jun 2019 15:42:21 +0000 (UTC)
Date: Tue, 18 Jun 2019 16:42:19 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Liran Alon <liran.alon@oracle.com>
Message-ID: <20190618154218.GH2850@work-vm>
References: <20190617175658.135869-1-liran.alon@oracle.com>
 <20190617175658.135869-7-liran.alon@oracle.com>
 <20190618085539.GB2850@work-vm>
 <AB34E76F-231C-4E66-B5CB-113AFCE7A20F@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AB34E76F-231C-4E66-B5CB-113AFCE7A20F@oracle.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Tue, 18 Jun 2019 15:42:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [QEMU PATCH v3 6/9] vmstate: Add support for
 kernel integer types
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
Cc: ehabkost@redhat.com, kvm@vger.kernel.org, maran.wilson@oracle.com,
 mtosatti@redhat.com, qemu-devel@nongnu.org,
 Nikita Leshenko <nikita.leshchenko@oracle.com>, pbonzini@redhat.com,
 jmattson@google.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Liran Alon (liran.alon@oracle.com) wrote:
>=20
>=20
> > On 18 Jun 2019, at 11:55, Dr. David Alan Gilbert <dgilbert@redhat.com=
> wrote:
> >=20
> > * Liran Alon (liran.alon@oracle.com) wrote:
> >> Reviewed-by: Nikita Leshenko <nikita.leshchenko@oracle.com>
> >> Reviewed-by: Maran Wilson <maran.wilson@oracle.com>
> >> Signed-off-by: Liran Alon <liran.alon@oracle.com>
> >> ---
> >> include/migration/vmstate.h | 18 ++++++++++++++++++
> >> 1 file changed, 18 insertions(+)
> >>=20
> >> diff --git a/include/migration/vmstate.h b/include/migration/vmstate=
.h
> >> index 9224370ed59a..a85424fb0483 100644
> >> --- a/include/migration/vmstate.h
> >> +++ b/include/migration/vmstate.h
> >> @@ -797,6 +797,15 @@ extern const VMStateInfo vmstate_info_qtailq;
> >> #define VMSTATE_UINT64_V(_f, _s, _v)                                =
  \
> >>     VMSTATE_SINGLE(_f, _s, _v, vmstate_info_uint64, uint64_t)
> >=20
> > A comment here stating they're for Linux kernel types would be nice.
>=20
> I didn=E2=80=99t want to state this because in theory these types can b=
e used not in kernel context=E2=80=A6
> I thought commit message is sufficient. I think comments in code should=
 be made to clarify
> things. But to justify existence I think commit message should be used.
> But if you insist, I have no strong objection of adding such comment.

It's only a 'would be nice' - it's just I don't want people trying to
use them for other places (I'm not sure what happens if you pass a
uint8_t to VMSTATE_U8 ???

> >=20
> >> +#define VMSTATE_U8_V(_f, _s, _v)                                   =
\
> >> +    VMSTATE_SINGLE(_f, _s, _v, vmstate_info_uint8, __u8)
> >> +#define VMSTATE_U16_V(_f, _s, _v)                                  =
\
> >> +    VMSTATE_SINGLE(_f, _s, _v, vmstate_info_uint16, __u16)
> >> +#define VMSTATE_U32_V(_f, _s, _v)                                  =
\
> >> +    VMSTATE_SINGLE(_f, _s, _v, vmstate_info_uint32, __u32)
> >> +#define VMSTATE_U64_V(_f, _s, _v)                                  =
\
> >> +    VMSTATE_SINGLE(_f, _s, _v, vmstate_info_uint64, __u64)
> >> +
> >=20
> > Have you checked that builds OK on a non-Linux system?
>=20
> Hmm that=E2=80=99s a good point. No. :P

Worth a check if you can find one lying around :-)

Dave

> -Liran
>=20
> >=20
> > Dave
> >=20
> >> #define VMSTATE_BOOL(_f, _s)                                        =
  \
> >>     VMSTATE_BOOL_V(_f, _s, 0)
> >>=20
> >> @@ -818,6 +827,15 @@ extern const VMStateInfo vmstate_info_qtailq;
> >> #define VMSTATE_UINT64(_f, _s)                                      =
  \
> >>     VMSTATE_UINT64_V(_f, _s, 0)
> >>=20
> >> +#define VMSTATE_U8(_f, _s)                                         =
\
> >> +    VMSTATE_U8_V(_f, _s, 0)
> >> +#define VMSTATE_U16(_f, _s)                                        =
\
> >> +    VMSTATE_U16_V(_f, _s, 0)
> >> +#define VMSTATE_U32(_f, _s)                                        =
\
> >> +    VMSTATE_U32_V(_f, _s, 0)
> >> +#define VMSTATE_U64(_f, _s)                                        =
\
> >> +    VMSTATE_U64_V(_f, _s, 0)
> >> +
> >> #define VMSTATE_UINT8_EQUAL(_f, _s, _err_hint)                      =
  \
> >>     VMSTATE_SINGLE_FULL(_f, _s, 0, 0,                               =
  \
> >>                         vmstate_info_uint8_equal, uint8_t, _err_hint=
)
> >> --=20
> >> 2.20.1
> >>=20
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

