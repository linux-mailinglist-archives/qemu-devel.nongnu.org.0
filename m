Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3785F43B4F4
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 16:57:41 +0200 (CEST)
Received: from localhost ([::1]:43740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfNtU-0006Aa-Aw
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 10:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfNrH-0003nw-6F
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 10:55:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfNrA-00011f-6h
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 10:55:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635260114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=p/gR15rcrlMZneiHMesM251aq0sIvOBIBL0VFkaJQmw=;
 b=PZzvEHu5SECSfsY0YmR59UONmeMNPJTSk7uE3Sj/HjtJLcVmMcYj5FdZcyXEjFQhOCBbyb
 JkfiBP95wCar+jBUiFiduffmXmwP4upANWO7tE0iDJOqQ1DZpSioVPKckBO13dwBp8pkt4
 WA2bNDO2ta7Fp4Rj5WjIIvPRhVFJjs4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-O7Cy0QUKPtexgX0x4f0zlg-1; Tue, 26 Oct 2021 10:55:13 -0400
X-MC-Unique: O7Cy0QUKPtexgX0x4f0zlg-1
Received: by mail-wm1-f71.google.com with SMTP id
 y12-20020a1c7d0c000000b0032ccaad73d0so776828wmc.5
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 07:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5yYkOyYJtvEnOGt8O20lwyz6uEN5AxvswxkXxfI4wsU=;
 b=BwbqWSk90Mw5jYiChxVbgJeaaC3ZZv2Ado0JBGJZdVixWJbhzMDGC8OKSnjANt/C4J
 if8arYGxNv/k78Y9+B31A9/Wia2khAIxLcWDWXOOiivJwCkmVVq5+zPKpjn3PtmWf8Qo
 upokNbweTJLXyMSFV7PjpyMW2U7U8pE8UgMc+6NaktIzG2SfXBZo+YCtkTdzinocjDE2
 3bdKsdF21HjXWRj7P6tBG/POOXTxskvf/4gbmFbLCWUrDZ2N6va9qTFkYBwBrfOHdwFf
 Co9Rwce9N7nWDILCIuNKkk6LfxlIWEocygZSJcUNMMI2CGizf6rUEWAHsIkqmTTSwq9f
 L47g==
X-Gm-Message-State: AOAM533KN5V4Z6G/0e4Iw6zssBwCaRjZKkMZtJL5MmuOuWyQFFfWep92
 mYpnnCl1mAsMlap53lWaKqap9Yz+7yKpDB7GEFRE9fh0hGmMA8FWbOtplJYpwY56q7PjYGVV/OP
 H3zaeEzee2nFbtm7g+WCBHnC50w/nnAQhPVeHvsdW+o38YpBMEeunPOcMBbDe1+vz
X-Received: by 2002:a05:600c:190a:: with SMTP id
 j10mr28011012wmq.184.1635260112122; 
 Tue, 26 Oct 2021 07:55:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYwQXaA+0OjTFgwxrrQzMGz2wdwL8R7pL9lmvyWFaYBasp+HmSbgIxshU57T9JfWBKE9Q1Sw==
X-Received: by 2002:a05:600c:190a:: with SMTP id
 j10mr28010980wmq.184.1635260111917; 
 Tue, 26 Oct 2021 07:55:11 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id p12sm21087246wrr.67.2021.10.26.07.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 07:55:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] gitlab-ci: Only push docker images to mainstream registry
 from /master
Date: Tue, 26 Oct 2021 16:55:08 +0200
Message-Id: <20211026145509.1029274-1-philmd@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
I guess I got very unlucky because I happened to pull the docker=0D
images from the mainstream registry in a very short time frame=0D
where they jumped back in time... Then I kept using them to run=0D
my tests during 1 week trying to understand why I was having odd=0D
build failures. Then I realize the Ubuntu docker images were out=0D
of sync. I pulled again and it was working, so I searched for the=0D
mainstream job producing the outdated images and found a pipeline=0D
pushing the 'stable-6.0-staging' branch. This branch doesn't=0D
contain the recent gitlab-ci and Dockerfile changes...=0D
=0D
Similarly, this branch doesn't contain commit eafadbbbac0=0D
("gitlab: only let pages be published from default branch") so=0D
outdated documentation got pushed for a short time.=0D
=0D
This patch won't fix branches pushed from the past, but at least=0D
it should avoid to reproduce this problem in the future.=0D
=0D
Any idea how to improve the GitLab infrastructure to avoid these=0D
kind of problems in the future? Is it possible to enforce=0D
restrictions from the project configuration, rather than the=0D
repository YAML file?=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  gitlab-ci: Only push docker images to registry from /master branch=0D
=0D
 .gitlab-ci.d/container-template.yml | 11 ++++++++++-=0D
 .gitlab-ci.d/edk2.yml               | 11 ++++++++++-=0D
 .gitlab-ci.d/opensbi.yml            | 11 ++++++++++-=0D
 3 files changed, 30 insertions(+), 3 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


