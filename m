Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DC829D90C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 23:43:48 +0100 (CET)
Received: from localhost ([::1]:41350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXuAV-0004Hh-B5
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 18:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kXu7s-0003Yt-Cr
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 18:41:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kXu7n-0002kr-SU
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 18:41:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603924858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M9K5kz+ZYEiL79PiuZGawEK+LsMdP2KBV/S8YLAKarM=;
 b=NtP7DXkCuJzTkIwUuSqyhY/JqJ9W2jx4Sxq38Qrjehqgi3L5Ddak9nF0Y498KpYLsMS68y
 gp44c/LsEIRyT+eXVfTG2VC1/48OutfFst0cVNuKM1vrzVeSIMwws82Af7YYDmlZonbcSC
 vvNuJ+frb5VS9+I0M7+c1gR67u7E9E4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-OXil-sVIOXWVERZvZd7BYQ-1; Wed, 28 Oct 2020 18:40:56 -0400
X-MC-Unique: OXil-sVIOXWVERZvZd7BYQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCB306414C;
 Wed, 28 Oct 2020 22:40:53 +0000 (UTC)
Received: from localhost.localdomain (ovpn-119-55.rdu2.redhat.com
 [10.10.119.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D8CED60C04;
 Wed, 28 Oct 2020 22:40:47 +0000 (UTC)
Date: Wed, 28 Oct 2020 18:40:46 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 09/15] python: move flake8 config to setup.cfg
Message-ID: <20201028224046.GB2549351@localhost.localdomain>
References: <20201020193555.1493936-1-jsnow@redhat.com>
 <20201020193555.1493936-10-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201020193555.1493936-10-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oLBj+sq0vYjzfsbl"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:50:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

--oLBj+sq0vYjzfsbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2020 at 03:35:49PM -0400, John Snow wrote:
> Update the comment concerning the flake8 exception to match commit
> 42c0dd12, whose commit message stated:
>=20
> A note on the flake8 exception: flake8 will warn on *any* bare except,
> but pylint's is context-aware and will suppress the warning if you
> re-raise the exception.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--oLBj+sq0vYjzfsbl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAl+Z824ACgkQZX6NM6Xy
CfOfiQ//UOQ4Gmdb06nuAbhRCmk+tBT6f280Z5aZyIQkyk2I1htkswFUpssqAuRP
kaC91BLyqnlu2q1v7KpbPCiI8Zcdk5hDYyVw+4l4PcgU1Sg36vgaGberuNZ9TvE3
DDwcPMcwl0FLvgj8F+qRDmp/0zNRmV060RatNWnbJBWsISUNLhfRiVzTyTLDp0Dr
85TXMQomeaTTGDJ7Lyjn60/kRf5AAgkz88oseT4d1ANVcKD6m6CocV81TXltLwle
Qt/zt5obUai56+Akl/2NYjNDbgj3eZRKAq8l4bwaH0LUk99c0ZBa/8d2/ywF5890
/gy44Bc+Xwzft9E+Atg03D7dBfoEe02uso7ojWa2IEfm0fL7BOghLMimwmhXsXIE
9ITZgYLuVGKD2V5BoWio9OlbWjhzMyRRQppKkeiS38tuxigaW+vDepbJtBJXWmnp
jd59o1xILo7bVhFxNOvP+lONyMQG/+gQAmwFHmWbewa0AC2ZbbUfgJH7z7UbMm29
PLezqjUHF89ewqLkcFVGx2asze/JuOKQcVsFRYD8sYUQl6byx50M5hrb+fPQdQHW
Op5rZtqocsRglcfya6NerhxssSkZxaDd7uE6dUfUSqJDRi4RCv+3UaZ9vEFbR5CC
5CrqI0QwxGDrC9sRFIA4Khwe+dySlYVmVVQryEQ30tL1nVfAJHE=
=7igo
-----END PGP SIGNATURE-----

--oLBj+sq0vYjzfsbl--


