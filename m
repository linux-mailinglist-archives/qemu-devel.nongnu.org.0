Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4669D650D14
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 15:12:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Gqa-0001TU-AK; Mon, 19 Dec 2022 09:10:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3454adc0d=anthony.perard@citrix.com>)
 id 1p7GqV-0001Sf-J3; Mon, 19 Dec 2022 09:10:23 -0500
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3454adc0d=anthony.perard@citrix.com>)
 id 1p7GqT-000510-QC; Mon, 19 Dec 2022 09:10:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1671459021;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bkhL5i1Zpu2u0dNJ8rDflE68+bM9GeYGaMZ8cE7WyBg=;
 b=gZuSjaPMY4Z3rOqXiGGkTnC/xSVYaJMf6NtYK7B5hPJE12c0gCsmdR5p
 K8uZrx68Ov3IT3TBvHLv6/GtcU1dJgeaQBpsrTNMW+F3m/puogC4jjaPe
 nr1Ol7CCC1aVOhFehr1DtEbEqis04E5Ie2p4qbLWI9hAAzZFzmo4N1hhR k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 89102970
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:REAz26uKIQm+B1lLID8TiCsKKOfnVB9YMUV32f8akzHdYApBsoF/q
 tZmKWyCaPrcMWunf98laIri9UhUuJTdmt4yTQRqpCgzF3sR+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QWHxiFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwdhMTYyCOgfiNmr+pcrB8n4MBBcSzFdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfAdMYH49tL7Aan3XejtEqFWTtOwv7nLa1gBZ27nxKtvFPNeNQK25m27I9
 zuepTWmWnn2MvSi0Dq77SOutNaWsiP1ZrATTIKe17l11Qj7Kms7V0RNCArTTeOCokK3XdNSL
 0wepnN1hac3/U2vCNL6WnWQqWSBtAQBc8BdH+0z9EeGza+8ywKHB3YFQyRpctEqtMYqAzct0
 zehltfkFXplvbuTRH+18raSpCm1fy8PIgcqYC4PTQII55/5p50zphvKQpBoF6vdpsP0Ay3xx
 HWEtwAkirkThNJN3KK+lXjejjex45TEUAMxzgPQWG2j80V+foHNT4Oy7kXUxfVJK4rfSUOO1
 FAYm9WC7MgUAJ2NnTDLS+IIdJm56vDAPDDCjFpHG5g66y/r63OlZZpX4jx1OAFuKMlsUSbkZ
 VKWoRtazJlUOnSscOlweY3ZI8glzKzqGM75furZYtpHft56cwrv1DlkYkiC3mbsuFIhnaE2J
 dGQdsPEJW0GBKpuyjq/b/0Q3b8i2mY1wma7bZLgyRO4+aCTaH6cVfEON17mRuo09rmNpgrY2
 8xSO8uD11NUV+iWSirN+J4eKXgQIHQ7DIywoMtSHsaYORZvEmwlD/7XwJsidpZjkqATkf3Hl
 lmkV0pFjVPlgFXBLgOFbG0lb6ngNb5noG42J2opNEek1nwnSYKu6q4FcN0wZ7ZP3PVuyOMxR
 f0CcMaoBPNJRTLavTMHYvHVp4htXBeigg7IODCqCBAzdoBhSyTG+9X/eQ2p+DMJFiC6vNF4o
 rHm3x6zaYIKWgBKHMvQLvW1wDuMUWM1wbwoGRGSe58KJRuqoNMCxzHNYuEffeISJCXOwCGhj
 QuEOU4IvK7vioJt2Yyc7UyblLuBH+x7F0tcOmDU67eqKCXXllaeLZ98vPWgJm6ECj6tkEm2T
 aAMlqynbqVb9Lpfm9Ake4uH257S8DcGS1Vy6g1/VEvGYF2wYl+LCinXhJIf3kGhK1IwhOdXZ
 q5t0oMBUVlqEJm/eLL0GObCRrrr6B3ssmOOhcnZ2W2jjMONwJKJUF9JIz6HgzFHIb1+PesNm
 Ll+4ZVGu1fh1Ep7Y75qaxy4EEzVchQ9v1gP7MlGUOcHdCJwor29XXAsInCvu8zeAzm9GkIrP
 iWVlML/ulio/WKbKyBbPSGUjYJgaWEm5EgiIKkqew7YxbIoR5YfgHVszNjAZl8On0gYjb4uZ
 zAD2o8cDfzmwgqETfNrBwiEczytzjXDkqAt4zPlTFHkcnQ=
IronPort-HdrOrdr: A9a23:UTs5kqCJzyLV3uflHemA55DYdb4zR+YMi2TDgXoBLiC9Ffb1qy
 nOppsmPHrP4wr5N0tPpTntAsi9qBHnhP1ICPgqXYtKNTOO0AHEEGgF1/qG/9SKIVydygcy79
 YZT0FWMqyVMXFKyer8/QmkA5IB7bC8gduVbD7lvhFQpNdRGthd0zs=
X-IronPort-AV: E=Sophos;i="5.96,255,1665460800"; d="scan'208";a="89102970"
Date: Mon, 19 Dec 2022 14:10:04 +0000
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
CC: <qemu-devel@nongnu.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 <qemu-ppc@nongnu.org>, <xen-devel@lists.xenproject.org>, Laurent Vivier
 <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>, "Daniel Henrique
 Barboza" <danielhb413@gmail.com>, <virtio-fs@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Alex =?iso-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>, <qemu-block@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>, Paul Durrant
 <paul@xen.org>, David Gibson <david@gibson.dropbear.id.au>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, John Snow
 <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "Gerd
 Hoffmann" <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>, Thomas Huth
 <thuth@redhat.com>
Subject: Re: [PATCH 2/6] hw/xen: use G_GNUC_PRINTF/SCANF for various functions
Message-ID: <Y6BwvATqB0ka7qys@perard.uk.xensource.com>
References: <20221219130205.687815-1-berrange@redhat.com>
 <20221219130205.687815-3-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221219130205.687815-3-berrange@redhat.com>
Received-SPF: pass client-ip=216.71.145.155;
 envelope-from=prvs=3454adc0d=anthony.perard@citrix.com;
 helo=esa3.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Dec 19, 2022 at 08:02:01AM -0500, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

