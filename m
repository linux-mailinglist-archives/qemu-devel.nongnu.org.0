Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 201244041B9
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 01:22:19 +0200 (CEST)
Received: from localhost ([::1]:51806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO6tW-0000xC-2k
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 19:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO6rr-0006J0-4g
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 19:20:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO6rn-0002Zd-Ki
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 19:20:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631143230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vRoi5WrTbIXmM4WjAcv/SppS1KuoM6iQfhbpZ457xYQ=;
 b=HQg7d0MiI9KKf1ZJfzKidCQ3bPkjQUPjoDWnTjnhkUEhGga/ja1xmeJLE2zI8sd/9ljaxE
 kdtndDdPGGgyqP726wFtEzhLC8noFieWqIVyNSdR/mW1gyNXSIs1VdKkMKmESsbFDyEM5f
 dyNfhH3ykBV+5GbwP3auV2oXFMH+4n4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-_64VRjGaOs65aJF5fH3skA-1; Wed, 08 Sep 2021 19:20:28 -0400
X-MC-Unique: _64VRjGaOs65aJF5fH3skA-1
Received: by mail-wm1-f70.google.com with SMTP id
 v2-20020a7bcb420000b02902e6b108fcf1so31883wmj.8
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 16:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1ByN3Of2ZgwJxeRnuvE2fFlKqpGdp9A80ERs6ZdUaDo=;
 b=mgo8ZodGVGo5H2Pc82d/yiUamLOOCdMM86Af37j0P6AN76ctrdNQxOe1HL++pAwohP
 KqKhbETk6/IGrHiJwVvnFxaSEySTJj5jzII5NI+yyCFpTMxeJc0+I+juuUu5KnmJEDec
 ctO0Q3tuNB3yT8hGUQdqd1dDyUnuYSB7W28Nko7WjbF7c8lDGex1Rp193QnPiOYbqaV2
 B8FpmY/QPJa02TtlecZcCW0Q/jEZoy13JdoYlBwoJ2ozExl+facV+InK3Ge2aHsfm2OO
 mHqgscBoEtUVC9W165k8pUEuSi+J0v5BlQWWNYdAEFLYVqdjORAKD7ATZo+ubiBXusjC
 vaZw==
X-Gm-Message-State: AOAM531zJL/5sEccNigoVzMsja8UFs8B0JIto6yaf/898DJdCVkbaMbC
 ev5X0yXg21W6nQ15QQQ3bX0RAsW2/dLdwEc5QQFq1bhtTRX0q6UE38OkNSCgSZt9JcT+khNgJUX
 uTouoLNHe0up6smms9nBhkpkK1we+HRegCiDsCbjbRvPd2+Ro+sK8Et38zbCHP8LP
X-Received: by 2002:adf:cf0b:: with SMTP id o11mr116931wrj.72.1631143226372;
 Wed, 08 Sep 2021 16:20:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJzCKhor1xK77PrKMQ04S9HdElVG3wG7IduY7aZzH1YZcWGdPgvZWSbOwy0GcAZECXsMDD+g==
X-Received: by 2002:adf:cf0b:: with SMTP id o11mr116900wrj.72.1631143226045;
 Wed, 08 Sep 2021 16:20:26 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id s7sm16447wra.75.2021.09.08.16.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 16:20:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 00/10] security: Introduce qemu_security_policy_taint() API
Date: Thu,  9 Sep 2021 01:20:14 +0200
Message-Id: <20210908232024.2399215-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series is experimental! The goal is to better limit the=0D
boundary of what code is considerated security critical, and=0D
what is less critical (but still important!).=0D
=0D
This approach was quickly discussed few months ago with Markus=0D
then Daniel. Instead of classifying the code on a file path=0D
basis (see [1]), we insert (runtime) hints into the code=0D
(which survive code movement). Offending unsafe code can=0D
taint the global security policy. By default this policy=0D
is 'none': the current behavior. It can be changed on the=0D
command line to 'warn' to display warnings, and to 'strict'=0D
to prohibit QEMU running with a tainted policy.=0D
=0D
As examples I started implementing unsafe code taint from=0D
3 different pieces of code:=0D
- accelerators (KVM and Xen in allow-list)=0D
- block drivers (vvfat and parcial null-co in deny-list)=0D
- qdev (hobbyist devices regularly hit by fuzzer)=0D
=0D
I don't want the security researchers to not fuzz QEMU unsafe=0D
areas, but I'd like to make it clearer what the community=0D
priority is (currently 47 opened issues on [3]).=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
[1] https://lore.kernel.org/qemu-devel/20200714083631.888605-2-ppandit@redh=
at.com/=0D
[2] https://www.qemu.org/contribute/security-process/=0D
[3] https://gitlab.com/qemu-project/qemu/-/issues?label_name[]=3DFuzzer=0D
=0D
Philippe Mathieu-Daud=C3=A9 (10):=0D
  sysemu: Introduce qemu_security_policy_taint() API=0D
  accel: Use qemu_security_policy_taint(), mark KVM and Xen as safe=0D
  block: Use qemu_security_policy_taint() API=0D
  block/vvfat: Mark the driver as unsafe=0D
  block/null: Mark 'read-zeroes=3Doff' option as unsafe=0D
  qdev: Use qemu_security_policy_taint() API=0D
  hw/display: Mark ATI and Artist devices as unsafe=0D
  hw/misc: Mark testdev devices as unsafe=0D
  hw/net: Mark Tulip device as unsafe=0D
  hw/sd: Mark sdhci-pci device as unsafe=0D
=0D
 qapi/run-state.json        | 16 +++++++++=0D
 include/block/block_int.h  |  6 +++-=0D
 include/hw/qdev-core.h     |  6 ++++=0D
 include/qemu-common.h      | 19 +++++++++++=0D
 include/qemu/accel.h       |  5 +++=0D
 accel/kvm/kvm-all.c        |  1 +=0D
 accel/xen/xen-all.c        |  1 +=0D
 block.c                    |  6 ++++=0D
 block/null.c               |  8 +++++=0D
 block/vvfat.c              |  6 ++++=0D
 hw/core/qdev.c             | 11 ++++++=0D
 hw/display/artist.c        |  1 +=0D
 hw/display/ati.c           |  1 +=0D
 hw/hyperv/hyperv_testdev.c |  1 +=0D
 hw/misc/pc-testdev.c       |  1 +=0D
 hw/misc/pci-testdev.c      |  1 +=0D
 hw/net/tulip.c             |  1 +=0D
 hw/sd/sdhci-pci.c          |  1 +=0D
 softmmu/vl.c               | 70 ++++++++++++++++++++++++++++++++++++++=0D
 qemu-options.hx            | 17 +++++++++=0D
 20 files changed, 178 insertions(+), 1 deletion(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


