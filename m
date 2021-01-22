Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF10300E0B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:49:07 +0100 (CET)
Received: from localhost ([::1]:48798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l33Mg-0007ac-S1
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:49:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l33IY-0004ox-Pl
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:44:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l33IX-0002S2-05
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:44:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611348288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4OzuqsQLfBjX2lp1c++MYIGxnnXw4N5ADkShCVOFdL0=;
 b=fYYh7UfAZNVYhiLxjqTXXSuwnKJmEW8GetAHJ2aK/ImEQC6HA5wt95TQxp+Ln1Bxlb2Zri
 qHb71688wG0zEHHOFoNDa3Z5z7Xv7DPe7W3hEKlZDDBcUoklucCwPe8BEHhAqrAthTjqUO
 RNNu42eTG9MPYZ7l3yfAOTANUirydfg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-Z4Yfude2OzKTuTArMlWOuQ-1; Fri, 22 Jan 2021 15:44:45 -0500
X-MC-Unique: Z4Yfude2OzKTuTArMlWOuQ-1
Received: by mail-ed1-f70.google.com with SMTP id a24so3494085eda.14
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:44:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1TWFiImpz+BDNDM1iYlwvb/wzOAcpAz9PRCn95U+OP4=;
 b=mdxLO0PC8fvkEHB1QG/DtPA3ceOplfvXWk2I2oiGdSboIZJly2Z6vmRv6jI3E3oQdQ
 xGdOiIPA5YusXw4ThgRS8c3JBxAfWOCNViqnb2UtJE2Rioyb5hpCDaxjIwJYRGqSVrfH
 +yODHhkws4W4+Djl4sN9CHwhGqXVAZo66IVcYOyRjy31X5EKOSPubGYBUw0+MwAQzm1G
 iYkqoPZh5JNl/7IyAqEwLTNm52iy3SSN5ec9UGl9JarA3afQRrv1RzoHCRWh6sagMz7p
 Qwq9Z11th5EO2Yb/luUAA4mUF0mlBkLd29gwgzIy5DjhRpWg7JizDJ34ig9PP/LCKuCs
 dV0Q==
X-Gm-Message-State: AOAM532v4hOicu5nYv8Ftc+eKRkExSL+3gbQltx1i4f49nK69ek1+GVA
 dr6Bqy83q3AakzZ+B1Rzkl7Gf+7zkx01YON9KIP41hvS/JkcdAFcNEX+AXTy682jFPng6qIaaL5
 dKHV19FQ17IjJt0SuvlF/3VA7EeMa6EAt3DqI88D5JQ3RZxaCg45JFT+GvOPNX6aa
X-Received: by 2002:a50:fd19:: with SMTP id i25mr4639313eds.386.1611348284124; 
 Fri, 22 Jan 2021 12:44:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1Ua/cbkrQKeO9vmHfE99wlp/4btcZstR6QfnMVobaEIvBBWKKkZqWxF60FMdRcbXX4Dlsgg==
X-Received: by 2002:a50:fd19:: with SMTP id i25mr4639282eds.386.1611348283872; 
 Fri, 22 Jan 2021 12:44:43 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id f20sm6095348edd.47.2021.01.22.12.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 12:44:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 00/12] buildsys: Do not build various objects if not
 necessary
Date: Fri, 22 Jan 2021 21:44:29 +0100
Message-Id: <20210122204441.2145197-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In this series we deselect a bunch of features when they=0D
not required, so less objects are built.=0D
=0D
While this reduce pressure on CI and slow systems, this is=0D
particularly helpful for developers regularly testing multiple=0D
build configurations.=0D
=0D
All CI tests pass:=0D
https://gitlab.com/philmd/qemu/-/pipelines/245654160=0D
=0D
Supersedes: <20210120151916.1167448-1-philmd@redhat.com>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (12):=0D
  configure: Only check for audio drivers if system-mode is selected=0D
  tests/meson: Only build softfloat objects if TCG is selected=0D
  pc-bios/meson: Only install EDK2 blob firmwares with system emulation=0D
  meson: Do not build optional libraries by default=0D
  meson: Restrict block subsystem processing=0D
  meson: Merge trace_events_subdirs array=0D
  meson: Restrict some trace event directories to user/system emulation=0D
  meson: Restrict emulation code=0D
  qapi/meson: Restrict qdev code to system-mode emulation=0D
  qapi/meson: Remove QMP from user-mode emulation=0D
  qapi/meson: Restrict system-mode specific modules=0D
  qapi/meson: Restrict UI module to system emulation and tools=0D
=0D
 configure           |  6 +++++=0D
 meson.build         | 55 ++++++++++++++++++++++++++-------------------=0D
 stubs/qdev.c        | 23 +++++++++++++++++++=0D
 MAINTAINERS         |  1 +=0D
 pc-bios/meson.build |  1 +=0D
 qapi/meson.build    | 34 +++++++++++++++++++---------=0D
 stubs/meson.build   |  2 ++=0D
 tests/meson.build   | 11 +++++++--=0D
 8 files changed, 97 insertions(+), 36 deletions(-)=0D
 create mode 100644 stubs/qdev.c=0D
=0D
--=20=0D
2.26.2=0D
=0D


