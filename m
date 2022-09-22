Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2720F5E6BB1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 21:30:34 +0200 (CEST)
Received: from localhost ([::1]:44564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obRu4-0004dI-Lt
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 15:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1obRYC-0004Oi-07
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 15:07:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1obRY8-0003b4-DD
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 15:07:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663873671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i3lpII403H32nAicFnMpJGNc4TfdG2I+nwmaY8ont9A=;
 b=BHu0jq1CSiCJpWqik0O+5GrDVN1yQKtZJIhzXwP0QfDl4MVMWVeiBjQzS0OjayB/4Rn+wV
 ed3A8ama+MWHK1FSey1ht2/gexMQLNTinYl2wJEqTW4RWa0uaLhUiRryJZ4p/MNlxaZZ1J
 I8jIf+tNgpHSj1yImnH+GkQIp7OgUa8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-RcWty-tqOLqJk6xQHd0PSw-1; Thu, 22 Sep 2022 15:07:49 -0400
X-MC-Unique: RcWty-tqOLqJk6xQHd0PSw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D9BB882821;
 Thu, 22 Sep 2022 19:07:49 +0000 (UTC)
Received: from localhost (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BDC91121314;
 Thu, 22 Sep 2022 19:07:48 +0000 (UTC)
Date: Thu, 22 Sep 2022 15:07:47 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: qemu-devel@nongnu.org, tsimpson@quicinc.com,
 richard.henderson@linaro.org, f4bug@amsat.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: Re: [PULL 0/2] Hexagon target update
Message-ID: <Yyyyg0DRqnfugZMs@fedora>
References: <20220919201159.31838-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9J8vapgXlzS9yCDx"
Content-Disposition: inline
In-Reply-To: <20220919201159.31838-1-tsimpson@quicinc.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9J8vapgXlzS9yCDx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

This pull request did not show up in the patches tool
(https://github.com/stefanha/patches) that I use. If I miss a pull
request from you in the future, please feel free to ping me after 48
hours.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--9J8vapgXlzS9yCDx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMssoMACgkQnKSrs4Gr
c8jF7wf/WuARlJ6kvGO4BrykT8hADrTL0NrAgW0Jv/anfp7JkZlbuoWgE5x985P2
TNY7RDYorCj1I9rx47LhCI4Wx+WaWU1p8kt6DnDe9557jmR6GbdqKg8ZeLemEd59
3o6iYXMZqJqYZO9rvq0OdBiVj480mdEZi4kCd9sS0MN+zUo3h7pT57WHDEd3YZ0j
iE+T+ddDLITFz/Of6ZxzaFLWAuCXjtXzbI5rKiK5glFUSJwG6kWI0dhtKkJlEPVI
iYe5iX/ycHyaq7uQblQ+Qn/wjHVfHDOKHI+W45BiGXfTBeuTW0KUGGB/5GoofvJs
SR+H3LbeHizKynxa2pfisUxcesd3dg==
=SaKP
-----END PGP SIGNATURE-----

--9J8vapgXlzS9yCDx--


