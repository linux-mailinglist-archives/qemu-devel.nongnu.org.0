Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5020520AFC7
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 12:33:26 +0200 (CEST)
Received: from localhost ([::1]:54082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jolfh-0003pV-AJ
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 06:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1joldn-00024Y-Pq
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 06:31:27 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:38860
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1joldm-0003F1-7z
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 06:31:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593167485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ucis0h5PRWD9uffGXWYAjZ2udEIvXSj5tEihR7WFgX0=;
 b=GJc1jhJdedWfy0klwkrVCF8JYinJaGpMQjvwp7PoxdLX/CY4AtUxxkpUz+O1vdis5haFmZ
 a6fKSNp99OHtHVGaPSGlvlCDuIcsFrl1k9TdgHEoNoAlVM8tsy3dLsMTLGyDPn9DOTcbkB
 ZZ6em8+FvWrO4eoMVLNNxZi9F3KaQVg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-yWalPltzOiiQANiIlM_Tww-1; Fri, 26 Jun 2020 06:31:22 -0400
X-MC-Unique: yWalPltzOiiQANiIlM_Tww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1733010059A4
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 10:31:22 +0000 (UTC)
Received: from localhost (ovpn-114-181.ams2.redhat.com [10.36.114.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2BCD5D9C5;
 Fri, 26 Jun 2020 10:31:18 +0000 (UTC)
Date: Fri, 26 Jun 2020 11:31:17 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 3/3] virtiofsd: Allow addition or removal of capabilities
Message-ID: <20200626103117.GE281902@stefanha-x1.localdomain>
References: <20200625162929.46672-1-dgilbert@redhat.com>
 <20200625162929.46672-4-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200625162929.46672-4-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5oH/S/bF6lOfqCQb"
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 03:23:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--5oH/S/bF6lOfqCQb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 25, 2020 at 05:29:29PM +0100, Dr. David Alan Gilbert (git) wrote:
> +    /*
> +     * The modcaps option is a colon separated list of caps,
> +     * each preceded by either + or -.
> +     */
> +    while (lo->modcaps) {
> +        capng_act_t action;
> +        int cap;
> +
> +        char *next = strchr(lo->modcaps, ':');
> +        if (next) {
> +            *next = '\0';
> +            next++;
> +        }
> +
> +        switch (lo->modcaps[0]) {
> +        case '+':
> +            action = CAPNG_ADD;
> +            break;
> +
> +        case '-':
> +            action = CAPNG_DROP;
> +            break;
> +
> +        default:
> +            fuse_log(FUSE_LOG_ERR,
> +                     "%s: Expecting '+'/'-' in modcaps but found '%c'\n",
> +                     __func__, lo->modcaps[0]);
> +            exit(1);
> +        }
> +        cap = capng_name_to_capability(lo->modcaps + 1);
> +        if (cap < 0) {
> +            fuse_log(FUSE_LOG_ERR, "%s: Unknown capability '%s'\n", __func__,
> +                     lo->modcaps);
> +            exit(1);
> +        }
> +        if (capng_update(action, CAPNG_PERMITTED | CAPNG_EFFECTIVE, cap)) {
> +            fuse_log(FUSE_LOG_ERR, "%s: capng_update failed for '%s'\n",
> +                     __func__, lo->modcaps);
> +            exit(1);
> +        }
> +
> +        lo->modcaps = next;

How about passing char *modcaps into this function so that lo->modcaps
isn't modified by the parsing loop? That seems a bit cleaner and if we
ever decide to free lo->modcaps it will work as expected.

Stefan

--5oH/S/bF6lOfqCQb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl71znUACgkQnKSrs4Gr
c8j0/Af/YwHgpiz4d/bv1YWIa/3z3/uXi46uYPop/57woEuGGAXbj2yjw4Umn+nQ
oZxBzRjfzb1A2TBLMp9KkN5QYR06ZiH7r6+M0erhQB8Jls6rJBRhCONxTFvHm+ju
LrYHliNi0+UNsP7T4MFHbpDpWcS1SNgNlY4rGTIcgB5gYUr6bg7NJYv00O1qDxhm
/Q7yE9KN75B/K6IsMBusrgEJeC+opa1016uchr+pp3nWGxsXf56n1D1wisRwuUtW
CNA77KI/D6eykjNtcm7BrgbSDLIi5t7Y8+z1EqMFIdMoMHs5nkmlD3K6Pw6WdUJf
FtNOyXG4DfIoFy2xb53xXjJO7Uv5Mw==
=xKFP
-----END PGP SIGNATURE-----

--5oH/S/bF6lOfqCQb--


