Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0675F5088
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 17:04:42 +0100 (CET)
Received: from localhost ([::1]:56886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT6ka-0005jd-RJ
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 11:04:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55750)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iT6fC-0001RG-0v
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 10:59:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iT6fA-0000ck-Ox
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 10:59:05 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49163
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iT6fA-0000cR-LL
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 10:59:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573228744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UM89Ln7Q5VEIZ4qoJyGex24mShc1AIwIxDaD7G6utA4=;
 b=FsO6NV5YFuS0cTdvWYqVw/TAMQzKGotL9hzSTLFJfVcKOo6ZbedKWK3IpBbdnfJSD9OAjc
 wk3RakC+GQtppmSXY+ejYfsUq69LomE6GXeqYnsn96btN/RsbE/Fzljkci8u0V2QYKy5No
 +AR+5epGbMic8xBb2exT30WkrCqiGKE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-rMPk5-n5OTOXT3_7jbMM-g-1; Fri, 08 Nov 2019 10:59:00 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8CF7477;
 Fri,  8 Nov 2019 15:58:58 +0000 (UTC)
Received: from [10.3.117.38] (ovpn-117-38.phx2.redhat.com [10.3.117.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8D0A5DA82;
 Fri,  8 Nov 2019 15:58:51 +0000 (UTC)
Subject: Re: [PATCH v2 2/3] hw/mips/gt64xxx: Remove dynamic field width from
 trace events
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191108144042.30245-1-philmd@redhat.com>
 <20191108144042.30245-3-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ead1eb4b-a0e0-edf9-8323-ce9f5a291547@redhat.com>
Date: Fri, 8 Nov 2019 09:58:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191108144042.30245-3-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: rMPk5-n5OTOXT3_7jbMM-g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/19 8:40 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Since not all trace backends support dynamic field width in
> format (dtrace via stap does not), replace by a static field
> width instead.
>=20
> Reported-by: Eric Blake <eblake@redhat.com>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1844817
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v2: Do not update qemu_log_mask()
> ---
>   hw/mips/gt64xxx_pci.c | 16 ++++++++--------
>   hw/mips/trace-events  |  4 ++--
>   2 files changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
> index 5cab9c1ee1..6743e7c929 100644
> --- a/hw/mips/gt64xxx_pci.c
> +++ b/hw/mips/gt64xxx_pci.c
> @@ -642,19 +642,19 @@ static void gt64120_writel(void *opaque, hwaddr add=
r,
>           /* not really implemented */
>           s->regs[saddr] =3D ~(~(s->regs[saddr]) | ~(val & 0xfffffffe));
>           s->regs[saddr] |=3D !!(s->regs[saddr] & 0xfffffffe);
> -        trace_gt64120_write("INTRCAUSE", size << 1, val);
> +        trace_gt64120_write("INTRCAUSE", size << 3, val);

Again, this isn't mentioned in the commit message.  Why are you changing=20
parameter values?


> +++ b/hw/mips/trace-events
> @@ -1,4 +1,4 @@
>   # gt64xxx.c
> -gt64120_read(const char *regname, int width, uint64_t value) "gt64120 re=
ad %s value:0x%0*" PRIx64
> -gt64120_write(const char *regname, int width, uint64_t value) "gt64120 w=
rite %s value:0x%0*" PRIx64
> +gt64120_read(const char *regname, int width, uint64_t value) "gt64120 re=
ad %s width:%d value:0x%08" PRIx64
> +gt64120_write(const char *regname, int width, uint64_t value) "gt64120 w=
rite %s width:%d value:0x%08" PRIx64

Huh, we were really broken - the old code (if passed to printf) would=20
try to parse 4 parameters, even though it was only passed 3.  But it=20
looks like you still need a v3.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


