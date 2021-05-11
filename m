Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F1137AB35
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:58:08 +0200 (CEST)
Received: from localhost ([::1]:36248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgUlr-0008ES-3S
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgUiC-0005CI-A0
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:54:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgUi7-0001Qy-Mf
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:54:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620748453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uH9oZ89gvWoYRdRll+1JTa/YDb5VPJzxnFVJfT2wFN4=;
 b=guq6tEPiiiayC08O0+lGIur8D8nBYA3mG7IJdtJ1tZdz5/fFNovi7OZsjYVDJbEba4Bevd
 8e59hP0rOsMiuUm7Otb0qXXbiLgoV9cRiePb4lV/275Jlx1sF4WIzpPsX8Y7Nmru/G7UTq
 PCOW7PamYPIwl7Ay0+Gavsce2DKYfN4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-zNgkQEQPPkyjQRJIYjPomQ-1; Tue, 11 May 2021 11:54:10 -0400
X-MC-Unique: zNgkQEQPPkyjQRJIYjPomQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 36-20020adf91a70000b029010ec34b3f27so727073wri.10
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uH9oZ89gvWoYRdRll+1JTa/YDb5VPJzxnFVJfT2wFN4=;
 b=Bsau2PNrmTNPzY7KHb19dPEt7pzG0x2HrTXU+Cntc9QA6yOp+uk/i791UBga+c8kFB
 EyKv0wnpwjt/ehLqSG2LKcZiKubo5iESkJ2X9LUkW3lofPBqULh7x9PnKNMv56j99cEh
 9Ir3lV8+eCPHuluG+8hqAVdccDllCvzThosyz7KYuItK3VijKQps5oM3GFO3eFCfAfco
 L+CaD93DnSosa9pzVdNWgKjAafsiqJ3QFS/YhhFpC6EI9PJLXEZC8Ko++k4kwD83GkRZ
 K93m9i0QvXGPN8G912KFYKMSQU2s3RN8oh8NyOvmga4aT8nftiTdXfgUblNRQh5FJC7P
 ZZbQ==
X-Gm-Message-State: AOAM531RU990F3sJ1LWMjpZNP+MTykf4L5a4/ZzLdoc00Lh85xTKytvA
 UU34KsL6DthyaIWUCUpT91qoGuOGB20T36FjHrPFSWjTUsnynuOBdZyTUH89Fh3E7OvxGNTqNO4
 /QVvFe/CPQ1/JDiE8rR0lXR1aYY4o6Q6YXcVpOw6JuJpHJyXZ9DgP90aeJkPqOGco
X-Received: by 2002:a5d:47a9:: with SMTP id 9mr39155873wrb.298.1620748447999; 
 Tue, 11 May 2021 08:54:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyq2zzJ+fkfSXW3iPHupw14zdOeY2d6riQs8R4dzdXgmDf3uscdF51vxAyQaZtwAIyddEFxOQ==
X-Received: by 2002:a5d:47a9:: with SMTP id 9mr39155846wrb.298.1620748447727; 
 Tue, 11 May 2021 08:54:07 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u8sm3665961wmq.29.2021.05.11.08.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 08:54:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/5] buildsys: Do not use internal fdt library when asked
 for the system one
Date: Tue, 11 May 2021 17:53:49 +0200
Message-Id: <20210511155354.3069141-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Attempt to fix the issue reported by John when building=0D
with an outdated libfdt.=0D
=0D
For now it changes:=0D
=0D
  hw/ppc/spapr_hcall.c: In function =3DE2=3D80=3D98h_update_dt=3DE2=3D80=3D=
99:=0D
  hw/ppc/spapr_hcall.c:1966:9: warning: implicit declaration of function =
=3DE2=3D=0D
=3D80=3D98fdt_check_full=3DE2=3D80=3D99; did you mean =3DE2=3D80=3D98fdt_ch=
eck_header=3DE2=3D80=3D=0D
=3D99? [-Wimplicit-function-declaration]=0D
   1966 |     if (fdt_check_full(fdt, cb)) {=0D
        |         ^~~~~~~~~~~~~~=0D
        |         fdt_check_header=0D
  hw/ppc/spapr_hcall.c:1966:9: warning: nested extern declaration of =3DE2=
=3D80=3D=0D
=3D98fdt_check_full=3DE2=3D80=3D99 [-Wnested-externs]=0D
  [...]=0D
  /usr/bin/ld: libqemu-ppc64-softmmu.fa.p/hw_ppc_spapr_hcall.c.o: in functi=
on=3D=0D
 `h_update_dt':=0D
  hw/ppc/spapr_hcall.c:1966: undefined reference to `fdt_check_full'=0D
  collect2: error: ld returned 1 exit status=0D
=0D
by:=0D
=0D
  qemu/meson.build:1352:4: ERROR: Running configure command failed.=0D
  The following clauses were found for PSERIES=0D
=0D
    CONFIG_PSERIES=3D3Dy=0D
    config PSERIES depends on FDT=0D
=0D
which is not better, but one step at a time...=0D
=0D
John said: https://gitlab.com/qemu-project/qemu/-/issues/255#note_572421108=
=0D
=0D
  Distributions usually don't used embedded copies of libraries,=0D
  so the configure script should require the correct minimum version.=0D
=0D
Personally I'd rather allow users to build the most of QEMU with what is=0D
available, that is all possible machines except pSeries, making pSeries=0D
machine selected by default and deselected if not possible, with this=0D
change:=0D
=0D
-- >8 --=0D
diff --git a/default-configs/devices/ppc64-softmmu.mak b/default-configs/de=
vi=3D=0D
ces/ppc64-softmmu.mak=0D
index cca52665d90..62339661fca 100644=0D
--- a/default-configs/devices/ppc64-softmmu.mak=0D
+++ b/default-configs/devices/ppc64-softmmu.mak=0D
@@ -5,6 +5,3 @@ include ppc-softmmu.mak=0D
=0D
 # For PowerNV=0D
 CONFIG_POWERNV=3D3Dy=0D
-=0D
-# For pSeries=0D
-CONFIG_PSERIES=3D3Dy=0D
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig=0D
index 3935b73456f..706debd4fee 100644=0D
--- a/hw/ppc/Kconfig=0D
+++ b/hw/ppc/Kconfig=0D
@@ -1,5 +1,6 @@=0D
 config PSERIES=0D
     bool=0D
+    default y=0D
     depends on FDT=0D
     imply PCI_DEVICES=0D
     imply TEST_DEVICES=0D
---=0D
=0D
But I suppose it breaks user expectations.=0D
=0D
Thoughts?=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (5):=0D
  hw/mem/nvdimm: Use Kconfig 'imply' instead of 'depends on'=0D
  Kconfig: Declare 'FDT' host symbol=0D
  hw/ppc: Have pSeries depends on libfdt (via host Kconfig FDT symbol)=0D
  hw/ppc/fdt: Drop dependency on libfdt=0D
  meson: Do not use internal fdt library if user asked for the system=0D
    one=0D
=0D
 default-configs/devices/ppc64-softmmu.mak | 1 -=0D
 meson.build                               | 2 +-=0D
 Kconfig.host                              | 3 +++=0D
 hw/arm/Kconfig                            | 1 +=0D
 hw/i386/Kconfig                           | 1 +=0D
 hw/mem/Kconfig                            | 2 --=0D
 hw/ppc/Kconfig                            | 2 ++=0D
 hw/ppc/meson.build                        | 8 ++++----=0D
 8 files changed, 12 insertions(+), 8 deletions(-)=0D
=0D
--=3D20=0D
2.26.3=0D
=0D


