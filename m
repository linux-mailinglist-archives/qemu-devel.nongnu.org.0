Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEA32D06A9
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Dec 2020 19:58:13 +0100 (CET)
Received: from localhost ([::1]:55608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klzEa-0006u7-SH
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 13:58:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klzBo-0004Pg-UN
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 13:55:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klzBl-0001dh-Ua
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 13:55:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607280916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oz3755FMu8d1x8s9I95QQZsr6H/EfAu6k1jRrCig21A=;
 b=XyghoQpJOR7foFreAGe7UDE001khSSSlAROjw6uvCKkckAFGGEcV5IPsSmM7gGJmntHc6M
 2Sf9i2HM5letzyg2Zn0pLuaQGVKTVfL+zG5Ds6wGSy8h2+GR/WWanJ1kkbf4b2igTxKCV3
 tzHo0duse6WOtB4RdKMpiUNeatJ4BYU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-JSOPQvUKNJWz9ntjVikYxA-1; Sun, 06 Dec 2020 13:55:13 -0500
X-MC-Unique: JSOPQvUKNJWz9ntjVikYxA-1
Received: by mail-wm1-f72.google.com with SMTP id a205so3197585wme.9
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 10:55:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5L9zYVEk7UDV9e8J6jUWmDLNneFBSRjTDjE9eeZGMJ4=;
 b=qKksOAnEmtzIdfKPusj/n0Uop3S+ekoW6D3DH53OxPxQteyxJ7kkMJ1Zss3udJ4hX6
 1Cjiw/o1O0XTNx4tvppP+LNeUsLeljtM1AcvKIRUa1YGGfmRQpja5mmvwSYkfYS5hWlw
 pGGhZT1Mwqc9VOfzPMO9aYAPMOefidNeJgtkW1zXuf7T7cyR/5WrJD9JN7oAFKwy9oKW
 qJZXtfEr5ZJjyODJn1eB2ggMzsgmVmsUcXrc8Xb8Imnb8EX4Vgjz2DxJ5s7pwcmrjyc1
 dBB7iiPoPC1hEUz7OxKQdbpJ9sTvECt/3YAKmib504wk5jNUJbFB8VBmsT9aJnjWSit3
 9XVA==
X-Gm-Message-State: AOAM532sLkdWCQkX3HFOo8gNcR7alvy5stMYfMhdsuS41yB859O9Bb1E
 CsSrMRAiwCS6NO3cTBf1dnwjh5sZw8YpxZsOFkxbdW8noHB2fgWJKRd55JpvjRuWbWiH0UACqmW
 1R6+QZF9vQ1SPvAU6p4QyYJnJrYoDevCp6n096gnhZcpFiKjGbVnL9ck2q+FLxqtc
X-Received: by 2002:a1c:6056:: with SMTP id u83mr14528878wmb.90.1607280912159; 
 Sun, 06 Dec 2020 10:55:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCSZGi5rbiGoVRoGKRNGTcTbBvyODVVSoiL6GLaxlOiqbwRFYQlZdlM1E+jjVm6ac4G5YFvw==
X-Received: by 2002:a1c:6056:: with SMTP id u83mr14528834wmb.90.1607280911735; 
 Sun, 06 Dec 2020 10:55:11 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id a62sm4051738wmh.40.2020.12.06.10.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 10:55:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] gitlab-ci: Add accelerator-specific Linux jobs
Date: Sun,  6 Dec 2020 19:55:00 +0100
Message-Id: <20201206185508.3545711-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_PH_BODY_ACCOUNTS_PRE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, Thomas Huth <thuth@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
I was custom to use Travis-CI for testing KVM builds on s390x/ppc=0D
with the Travis-CI jobs.=0D
=0D
During October Travis-CI became unusable for me (extremely slow,=0D
see [1]). Then my free Travis account got updated to the new=0D
"10K credit minutes allotment" [2] which I burned without reading=0D
the notification email in time (I'd burn them eventually anyway).=0D
=0D
Today Travis-CI is pointless to me. While I could pay to run my=0D
QEMU jobs, I don't think it is fair for an Open Source project to=0D
ask its forks to pay for a service.=0D
=0D
As we want forks to run some CI before contributing patches, and=0D
we have cross-build Docker images available for Linux hosts, I=0D
added some cross KVM/Xen build jobs to Gitlab-CI.=0D
=0D
Cross-building doesn't have the same coverage as native building,=0D
as we can not run the tests. But this is still useful to get link=0D
failures.=0D
=0D
Each job is added in its own YAML file, so it is easier to notify=0D
subsystem maintainers in case of troubles.=0D
=0D
Resulting pipeline:=0D
https://gitlab.com/philmd/qemu/-/pipelines/225948077=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
[1] https://travis-ci.community/t/build-delays-for-open-source-project/1027=
2=0D
[2] https://blog.travis-ci.com/2020-11-02-travis-ci-new-billing=0D
=0D
Philippe Mathieu-Daud=C3=A9 (8):=0D
  gitlab-ci: Replace YAML anchors by extends (cross_system_build_job)=0D
  gitlab-ci: Introduce 'cross_accel_build_job' template=0D
  gitlab-ci: Add KVM X86 cross-build jobs=0D
  gitlab-ci: Add KVM ARM cross-build jobs=0D
  gitlab-ci: Add KVM s390x cross-build jobs=0D
  gitlab-ci: Add KVM PPC cross-build jobs=0D
  gitlab-ci: Add KVM MIPS cross-build jobs=0D
  gitlab-ci: Add Xen cross-build jobs=0D
=0D
 .gitlab-ci.d/crossbuilds-kvm-arm.yml   |  5 +++=0D
 .gitlab-ci.d/crossbuilds-kvm-mips.yml  |  5 +++=0D
 .gitlab-ci.d/crossbuilds-kvm-ppc.yml   |  5 +++=0D
 .gitlab-ci.d/crossbuilds-kvm-s390x.yml |  6 +++=0D
 .gitlab-ci.d/crossbuilds-kvm-x86.yml   |  6 +++=0D
 .gitlab-ci.d/crossbuilds-xen.yml       | 14 +++++++=0D
 .gitlab-ci.d/crossbuilds.yml           | 52 ++++++++++++++++----------=0D
 .gitlab-ci.yml                         |  6 +++=0D
 MAINTAINERS                            |  6 +++=0D
 9 files changed, 85 insertions(+), 20 deletions(-)=0D
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-arm.yml=0D
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-mips.yml=0D
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-ppc.yml=0D
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-s390x.yml=0D
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-x86.yml=0D
 create mode 100644 .gitlab-ci.d/crossbuilds-xen.yml=0D
=0D
--=20=0D
2.26.2=0D
=0D


