Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3459B29D797
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 23:27:13 +0100 (CET)
Received: from localhost ([::1]:58680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXtuS-0007Lm-AU
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 18:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kXtsY-0006iU-F7
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 18:25:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kXtsV-0000Su-HX
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 18:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603923910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=glRjg/WZ3rqfgFnOpquiLIhc32VFe6q+3xTYl+JUhiY=;
 b=NsMORQXwrNXyZ6xRjMl7BGCSq5f9SoYin+E7YsJGGeEFbGmXMfki+kDSCrTA8/CWR6/oHW
 7vdIIZU2JKPI5fFYiT3lH/EVGQHGQjNQxawHpI0AshzTwoaYhphPhP16ot5o3fqDP05IJI
 TEUaBoK0tmhZOybLwiZvRa875zaalm8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-hbwvgbikNrGQzKWHvXDIHw-1; Wed, 28 Oct 2020 18:25:06 -0400
X-MC-Unique: hbwvgbikNrGQzKWHvXDIHw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6093A107B478;
 Wed, 28 Oct 2020 22:25:05 +0000 (UTC)
Received: from localhost.localdomain (ovpn-119-55.rdu2.redhat.com
 [10.10.119.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D8696EF54;
 Wed, 28 Oct 2020 22:25:00 +0000 (UTC)
Date: Wed, 28 Oct 2020 18:24:58 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 06/15] python: add pylint import exceptions
Message-ID: <20201028222458.GJ2201333@localhost.localdomain>
References: <20201020193555.1493936-1-jsnow@redhat.com>
 <20201020193555.1493936-7-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201020193555.1493936-7-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QnBU6tTI9sljzm9u"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:51:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Ben Widawsky <ben@bwidawsk.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>,
 Rohit Shinde <rohit.shinde12194@gmail.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--QnBU6tTI9sljzm9u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2020 at 03:35:46PM -0400, John Snow wrote:
> Pylint 2.5.x and 2.6.x have regressions that make import checking
> inconsistent, see:
>=20
> https: //github.com/PyCQA/pylint/issues/3609
> https: //github.com/PyCQA/pylint/issues/3624
> https: //github.com/PyCQA/pylint/issues/3651
>

Are these whitespaces on purpose?

> Pinning to 2.4.4 is worse, because it mandates versions of shared
> dependencies that are too old for features we want in isort and mypy.
> Oh well.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>

Other than that,

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--QnBU6tTI9sljzm9u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAl+Z77oACgkQZX6NM6Xy
CfPQ9xAAieBFPF6q/9HEf58mUaKLwN5xNvI+Y5AyhCWtgHSSEqPkWzz+wliEDWxU
9ePf8gPNZhCTDeLDkaIVrhtyGYxeVt9x56mKbZ4znZRuPBAOGAuMD0uuR2iXfIht
jUPxktIOjYDZPq1TeBuAKRN5CQ28Ee1HavNHhbiXVV4Z6azuUjzaypksA/ge0oZ0
8y1zRmokDgIdMAMUFzuDUIJTWiBo5Tr4qQYKK5WaR4qPUUrObLVR4AGwASj9ohmS
GmubN3AVJHU92yI0I+JiaHEjtvRbdu47W+HV7oqsPAf8Jvvq3fy1GosDUFvn0V3p
pyuTMZXBNepTMJwvIiyUhNIusGuk5HhemPePuHfz20nzen0hwqa31lvJLMreOuJQ
wC9idKJvY6KewRk0fCGqE61mu5TyYwZdqmtdFrl3VrIL+K+5CaExuoN6o1PJiV0+
m4LVva8uwN5YzW/1CfaVGWFSD+dF6CP/Pt8zf9SbyTZf1YKstDRRa7b9Ymx/GpGE
4AplBwvSRQaPSIdr/6DpLy5sy/vfRHtXTPPuhGoxhhT16tenxwuE/w1Yb+ZpdrUj
cacg6RQqjegWdiJOq7CqtSeTS4z2l9zJR7y3G4Y2nwsZ7U1v8m5aQ9PhhYbqScF9
b4yL93QOdE1FxmKnb/G9ZvrShANqQKzazw/kvVV0W1t/0jKxr2Y=
=VpTF
-----END PGP SIGNATURE-----

--QnBU6tTI9sljzm9u--


