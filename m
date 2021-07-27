Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31123D786A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 16:26:25 +0200 (CEST)
Received: from localhost ([::1]:50148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8O2K-0006iS-V4
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 10:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8O0d-0004dP-8N
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 10:24:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8O0b-0001gH-OY
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 10:24:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627395876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vN2RwLNR3eiYHYtON+WenFAvmXYQBGqq4nD0CjphjFo=;
 b=BB2HDHaxN2osHDOrNlEvI376FWO3UCOIEz1oauAQVK5KUEnr5pVs+AC5gOQIl6aWdUuPRg
 6TShYuVQwWJeQPwLZIItZBQ0RdH4WSisd7ehDt4XYBI4RpK8CI3D6vaSG7Fdg3ftAXJVqO
 kwQYRYsyswAXawXjC4va5c3SzHJ0rQs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-mks-jhecNgWodPP3fnrR_A-1; Tue, 27 Jul 2021 10:24:35 -0400
X-MC-Unique: mks-jhecNgWodPP3fnrR_A-1
Received: by mail-wr1-f71.google.com with SMTP id
 u26-20020adfb21a0000b029013e2b4a9d1eso6103639wra.4
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 07:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uGX6R2GSSP4lDShZJMkvp4iKCPGIxOb+BIe99pQxRgo=;
 b=nqqUT+Gz/yJaqa+rCJdh39+DtKOGKWV+bznlYOoN8EaBs8ryZ6YeGC2p1gEZvC6JlV
 e3rq9NC9FK8/KP6+TbMT3dB/IRil9QLJhpNiA+triVBGQkk31xdBjJiH9T4vQP7EaDMD
 gnhAO30aWsw9qLqopr4toXUYlQZuKyeXmldPrwQjYLPppkXsLrLZPgD9vyDxVrLx060z
 rOiczAjE/xZzVf4oMgmI6yv2sGfhMu4TgOHUjZMyWmBZr3PwUWNyfJU0sqlhDIaNEtBh
 KGeoie07gdz8MkCwtzGOABz+BQ7+sFRtdKkr0gslXx9eTvYAvfPLXFQmHFnBpjiIEmeM
 WhAw==
X-Gm-Message-State: AOAM531H5njspEvvIb0iS1FbyvRxBfq7jsn8YZHc0ldDvAktfojg/rvD
 SiFCWXzmbIHVQV21kJqaZlZD4oaXw4PN3fvM+yFVVxTkxXt81DZdOt8uUCSKGXCldfAZyxHn9cB
 TV6i5IsespTC/NGxmpKQwW2R3QVEYdKi32XV6ACuEnFAQA//4oiBJMubHQa6ETPq2
X-Received: by 2002:adf:fb8f:: with SMTP id a15mr25216275wrr.92.1627395874147; 
 Tue, 27 Jul 2021 07:24:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVjNWsRiBXegcDwnjXI2LhT+Wt8ZhFN/cNmmp/JrTH+Re4FRtNxTviH24PRWIxu4AVvrK9Zw==
X-Received: by 2002:adf:fb8f:: with SMTP id a15mr25216217wrr.92.1627395873623; 
 Tue, 27 Jul 2021 07:24:33 -0700 (PDT)
Received: from x1w.redhat.com (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id l2sm1411626wry.32.2021.07.27.07.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 07:24:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 v5 0/4] gitlab-ci: Document custom CI/CD variables,
 fix 'when:' conditions
Date: Tue, 27 Jul 2021 16:24:27 +0200
Message-Id: <20210727142431.1672530-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v4:=0D
- Fixed typo, update link (thuth)=0D
=0D
Since v3:=0D
- Unfortunately patch 4 v2 got merged as 0a9487d80af so=0D
  rebase & reword.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  docs: Document GitLab custom CI/CD variables=0D
  gitlab-ci: Fix 'when:' condition in acceptance_test_job_template=0D
  gitlab-ci: Fix 'when:' condition in EDK2 jobs=0D
  gitlab-ci: Fix 'when:' condition in OpenSBI jobs=0D
=0D
 docs/devel/ci.rst                   | 40 +++++++++++++++++++++++++++++=0D
 .gitlab-ci.d/buildtest-template.yml |  4 +--=0D
 .gitlab-ci.d/edk2.yml               |  6 ++---=0D
 .gitlab-ci.d/opensbi.yml            |  8 +++---=0D
 .gitlab-ci.yml                      | 19 ++------------=0D
 5 files changed, 51 insertions(+), 26 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


