Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49921C3D29
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 16:35:17 +0200 (CEST)
Received: from localhost ([::1]:42916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVcBg-0005bf-Rx
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 10:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jVc6R-0005g8-0f
 for qemu-devel@nongnu.org; Mon, 04 May 2020 10:29:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27914
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jVc6Q-0006Hu-5h
 for qemu-devel@nongnu.org; Mon, 04 May 2020 10:29:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588602589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fvBdJ5beAcx5ETaxyqLjGGsvHSXEGwdO8SCWGzPboug=;
 b=JsejLQdFFWBuUIwffX5jqbP+muc4gUs5Ra2QRUlcUptWbpWI2bDxW31uFxnaC4jvKIZB/W
 a8r+3PZs7bbQ3+TyGc60UVpNdmUnai56SS3TECdb2WpxXe0myH4pCZGa+GWAw1g9jaFeEu
 xqtPi8nk4S4v+xxjMyDqYrYEI21ea4A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-KhquzkfbMQytusml3nYqsA-1; Mon, 04 May 2020 10:29:48 -0400
X-MC-Unique: KhquzkfbMQytusml3nYqsA-1
Received: by mail-wm1-f70.google.com with SMTP id 71so3584318wmb.8
 for <qemu-devel@nongnu.org>; Mon, 04 May 2020 07:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JtHWGy8MS63RnTw62YE9/Nri9iozspFrFIvB4vm6Ufs=;
 b=Fl2bYaAcH/D9oBBMlPquI1GWW1wMr9ooKnT0Z52yVTOW/k7hWCgKyPCfF/ndYMzcVl
 mlxQftG6/bmidwmAWjusGRgYjZF4UQo/LbJnaTyZZX1R7wAlrqHRRYk2eyCl2fbyZuPZ
 uDUX+EO/iXohxb1QbdP/NuD7B3kdDMFlAehFQOxxDfBTvMrwMO7/CEGux6Iikzcb5tLS
 Nm2S+0wMTL/nB7w1YHib5nU9oDLhrJUIYuPq5IbjAitlBzxEg7LM/jtRMH0zR0VqwVAe
 Nt7t1CcAY0fxkMSqzls5VIL3mfX0F50qeUh581tRHiEbWLBXsYBa/uj8eFs2UEzJuTP+
 rXmg==
X-Gm-Message-State: AGi0PuY/pg45XfivW7oFLI6lr8V3PZV157+k8+BqI6fsgckkMe2N6Nrz
 6nNAm3ChJ27VJpXwwZWgCn8mBE7O9Q96Krs608LVGcjSvEiL6TfiNRmVymKjGHnqOoZCiVvoDjb
 WjoydpYAl422WiEg=
X-Received: by 2002:a1c:2d02:: with SMTP id t2mr14915846wmt.98.1588602586629; 
 Mon, 04 May 2020 07:29:46 -0700 (PDT)
X-Google-Smtp-Source: APiQypL5sKwavcakxQbGvb9qxGQ6DHp601FwURtWt/44KzPdJGYk6p0W6MXPtmzbRVz62eQQ2RoLxA==
X-Received: by 2002:a1c:2d02:: with SMTP id t2mr14915822wmt.98.1588602586400; 
 Mon, 04 May 2020 07:29:46 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 a24sm13411437wmb.24.2020.05.04.07.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 07:29:46 -0700 (PDT)
Date: Mon, 4 May 2020 10:29:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/29] checkpatch: ignore allowed diff list
Message-ID: <20200504142814.157589-14-mst@redhat.com>
References: <20200504142814.157589-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200504142814.157589-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 04:24:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow changing allowed diff list at any point:
- when changing code under test
- when adding expected files

It's just a list of files so easy to review and merge anyway.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 scripts/checkpatch.pl | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index c3d08aa99f..0ba213e9f2 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1261,12 +1261,13 @@ sub WARN {
 sub checkfilename {
 =09my ($name, $acpi_testexpected, $acpi_nontestexpected) =3D @_;
=20
-=09if ($name =3D~ m#^tests/data/acpi/# and
-=09=09# make exception for a shell script that rebuilds the files
-=09=09not $name =3D~ m#^\.sh$# or
-=09=09$name =3D~ m#^tests/qtest/bios-tables-test-allowed-diff.h$#) {
+        # Note: shell script that rebuilds the expected files is in the sa=
me
+        # directory as files themselves.
+        # Note: allowed diff list can be changed both when changing expect=
ed
+        # files and when changing tests.
+=09if ($name =3D~ m#^tests/data/acpi/# and not $name =3D~ m#^\.sh$#) {
 =09=09$$acpi_testexpected =3D $name;
-=09} else {
+=09} elsif ($name =3D~ m#^tests/qtest/bios-tables-test-allowed-diff.h$#) {
 =09=09$$acpi_nontestexpected =3D $name;
 =09}
 =09if (defined $$acpi_testexpected and defined $$acpi_nontestexpected) {
--=20
MST


