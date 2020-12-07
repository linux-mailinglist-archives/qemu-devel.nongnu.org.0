Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3C32D1003
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 13:04:53 +0100 (CET)
Received: from localhost ([::1]:46848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmFG8-000845-Eh
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 07:04:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmEce-0004Cy-Eu
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:24:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmEcc-0004WL-Li
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:24:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607340241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KjLEJ26NwV7wRGptfySD4BLn63K7qvIHtT9dhMtihSI=;
 b=TVrUjUXRPk6xhThcCqJa3U7vQG9cw8oX7fR4vdlLFE7ForJaHVr3J7ee9MMi5KZu3gTu1J
 0BznLY4w3SS+pqWUAWhrAJV/Ac+o+MVmMlQ1pF8UlKw/uMCnsa0tefRhos4UycsHlZMAwP
 TrngTi8MlLzPqzvqaB0UPwTrfQd5XoU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-1I7LXoc4OwixCftjbORSbA-1; Mon, 07 Dec 2020 06:23:58 -0500
X-MC-Unique: 1I7LXoc4OwixCftjbORSbA-1
Received: by mail-wm1-f70.google.com with SMTP id l5so4060231wmi.4
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 03:23:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=auivzVy5y6QOjO5B6onFwW2/1Tqt9pcw8PvGSGN2N6I=;
 b=pN6dnlnHJDG6jgybsVB9Zq9hhWZxPEmv6It2IpIQaQf1kPgfkQMxAqHI39I+b/u5r5
 GJEjxNRdrKaDHiv7NV1giLG8HgYVNDaip3UmpBWBHZ2+dmBSznZNl0xdpWzr3S/OGLo7
 tjaORVUh79AhoCCYIZyybXAdIzKrOcBKl8iUGqsakCJZqeQjFDKHkHIoXGhY7nk1qMK0
 XIJnlI7CMLSKJztbByCDAH1JeIDFfdSMZVsA24EKB1goxtWRnRkFnU+sWinv5EmiEKr4
 yvVLcMevrG8OA+4R8REX4eR1JhkRanwGOagTpMeQo3kIHRlL9YKFfuGKWGO2z1lQVwXD
 Xb3g==
X-Gm-Message-State: AOAM5325BC+ha9rqzVgAIxsSAB7PceH6dZpQ2eNJJafIUAshpC2BYgui
 5nuS13QZoo0nvx485nX9AE5dJbpMApGPZQzWGlXGiHc9jXWKkP6rlhmy+X9bEf3ZlOjXILYC4Sm
 y6cP/NK0/lH7lkHFyaPEMZk9HhAaFos0YnsSJpU6hMiaxAUEyBe0qif016bw/g2ha
X-Received: by 2002:a1c:750f:: with SMTP id o15mr17874299wmc.144.1607340237326; 
 Mon, 07 Dec 2020 03:23:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtEVzeEC7jhHuC2uJxrowF2KeO/P6RnnWe7mlJ0qlo0yRhGBZE6N17mpPfK6BoXPRNgR263w==
X-Received: by 2002:a1c:750f:: with SMTP id o15mr17874250wmc.144.1607340236966; 
 Mon, 07 Dec 2020 03:23:56 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id 34sm14514869wrh.78.2020.12.07.03.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 03:23:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] gitlab-ci: Add accelerator-specific Linux jobs
Date: Mon,  7 Dec 2020 12:23:48 +0100
Message-Id: <20201207112353.3814480-1-philmd@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Thomas Huth <thuth@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 kvm@vger.kernel.org, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Claudio Fontana <cfontana@suse.de>, Willian Rampazzo <wrampazz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v1:=0D
- Documented cross_accel_build_job template (Claudio)=0D
- Only add new job for s390x (Thomas)=0D
- Do not add entry to MAINTAINERS (Daniel)=0D
- Document 'build-tcg-disabled' job is X86 + KVM=0D
- Drop the patches with negative review feedbacks=0D
=0D
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
Philippe Mathieu-Daud=C3=A9 (5):=0D
  gitlab-ci: Document 'build-tcg-disabled' is a KVM X86 job=0D
  gitlab-ci: Replace YAML anchors by extends (cross_system_build_job)=0D
  gitlab-ci: Introduce 'cross_accel_build_job' template=0D
  gitlab-ci: Add KVM s390x cross-build jobs=0D
  gitlab-ci: Add Xen cross-build jobs=0D
=0D
 .gitlab-ci.d/crossbuilds.yml | 80 ++++++++++++++++++++++++++----------=0D
 .gitlab-ci.yml               |  5 +++=0D
 2 files changed, 64 insertions(+), 21 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


