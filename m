Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD11F10297A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 17:33:50 +0100 (CET)
Received: from localhost ([::1]:47320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iX6Rp-0004Yd-GI
	for lists+qemu-devel@lfdr.de; Tue, 19 Nov 2019 11:33:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37274)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1iX6Fh-0006o0-Pc
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 11:21:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1iX6Fg-0005dq-9I
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 11:21:17 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:59927
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1iX6Fg-0005dO-5B
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 11:21:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574180475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hrcLuZBIhmc2gp7jpHS7Xt1cPZ3P7rf618i1CBZD37w=;
 b=OCmZP2zPwDfuj9bQUIU1bVAzPin3XIfr7QKGVlhqgOJqoMmo2+uVnQo4Tbvr3Mk9p0eIzJ
 ji8pSQZfcCnhi02dOeTuzXgsgbACWYhbTSkYb/O1TzzTKhXJHumJtTVmLJk2Cl2BKgFuX9
 wHoFUDmr0TZ/P4Wx8C1+IZ72R3ib0fc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-kM2DIN9YO0OcFYgQe5vD_g-1; Tue, 19 Nov 2019 11:21:13 -0500
Received: by mail-qt1-f199.google.com with SMTP id h15so14943045qtn.6
 for <qemu-devel@nongnu.org>; Tue, 19 Nov 2019 08:21:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=exJax9A/OGuqm+LJoGkeuH8cEK3c1x7vOQFhq5CexLY=;
 b=jd/kj4Ivg4uxw71XtNDwU1VwgBtyiFSxT/oz8KJibNIZwRTohTL7ze/kHNAVCcrSrK
 mi2qXklB0v/zAYYycZ524o5dOu9HpIknuZEXd5jPJ3ENIQIlOMhzbiNbS/8a50e8qBw2
 +PhfHWCjpchO1zy99efIhaoiLCw5PSTNpPIUx450DZ7o+8YIcYk94fnqZdYUHZIpPtKq
 pPaMKvTwDIMeiqT6Jl7qLSvYgpw5i2N5Gt718c7+y6aIOq66DTuX0kXQnUIGApFLtNEL
 KRH/r9QjEw+tFSqCihtN35NrMWUh5EKp2RZ4XwW0VYSlXkRBAWYsRHVgtRA2QrqF1M16
 QBSg==
X-Gm-Message-State: APjAAAWQnDt8hfcZNKNfTaXtfOprS+/2TBCtd7Mvd1UuwrIZ2SfgL8rS
 0zDq2yPlkFp1kVB8VVZC6/lA5iByqa9CuBCjD02BhrrnidUNiP3g0saHRQVimsOowesL5M5Gfdz
 3tUGk/RkDs5YiJOE=
X-Received: by 2002:ac8:53c1:: with SMTP id c1mr15910373qtq.328.1574180472758; 
 Tue, 19 Nov 2019 08:21:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqxsGxbYvxlPlSQyAwWwlK7/Q/fKLC15TWw775I2qdi9nZkLjUtzWoLioMALmFvBEdNbeqG7kg==
X-Received: by 2002:ac8:53c1:: with SMTP id c1mr15910351qtq.328.1574180472569; 
 Tue, 19 Nov 2019 08:21:12 -0800 (PST)
Received: from xz-x1 ([104.156.64.74])
 by smtp.gmail.com with ESMTPSA id q204sm10555034qke.39.2019.11.19.08.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 08:21:11 -0800 (PST)
Date: Tue, 19 Nov 2019 11:21:10 -0500
From: Peter Xu <peterx@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 0/2] TM field check failed
Message-ID: <20191119162110.GL9053@xz-x1>
References: <cover.1570503331.git.qi1.zhang@intel.com>
 <20191119060259-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20191119060259-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-MC-Unique: kM2DIN9YO0OcFYgQe5vD_g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qi1.zhang@intel.com, ehabkost@redhat.com, qemu-devel@nongnu.org,
 pbonzini@redhat.com, yadong.qi@intel.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 19, 2019 at 06:05:11AM -0500, Michael S. Tsirkin wrote:
> On Tue, Nov 19, 2019 at 08:28:12PM +0800, qi1.zhang@intel.com wrote:
> > From: "Zhang, Qi" <qi1.zhang@intel.com>
> >=20
> > spilt the reserved fields arrays and remove TM field from reserved=20
> >  bits
>=20
> Looks good to me.
> Also Cc Peter Xu.
> Also I wonder - do we need to version this change
> with the machine type? Peter what's your take?

It should be a bugfix to me.  With the patchset we check even less
reserved bits, then imho it shouldn't break any existing good users.
So we can probably skip versioning this change.

> Also, Peter, how about we create a MAINTAINERS entry for IOMMUs
> and add everyone involved, this way people will
> remember to CC you?

Sure, I'll be fine with either way.

Thanks,

--=20
Peter Xu


