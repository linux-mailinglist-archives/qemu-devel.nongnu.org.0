Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AFC37B519
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 06:43:37 +0200 (CEST)
Received: from localhost ([::1]:55620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lggie-0006l7-09
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 00:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgghk-00063f-3f
 for qemu-devel@nongnu.org; Wed, 12 May 2021 00:42:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgghf-0005n3-Tx
 for qemu-devel@nongnu.org; Wed, 12 May 2021 00:42:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620794554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j/ZbWW8qsxDyq9IN77ZfKNDomWdmWvlFCCcbDKHb+uM=;
 b=DOfVvojgQypGi+wPVQAZcwAU29dmCFssjExZtVXi+WoY1cWf5ZTHOsG85V7DQceR6dyws9
 lsPxeNInJWeBv0jR0tSfjNplfOyx3w+Qg8xpX+jZeyUBmsEHDNbBj/Ipo1c+l8sNpNG/vR
 j9vu9qAuGiMCFotuIYVFDouN4lEWBEQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-7IdVqRNfMKiOECR7NFUOig-1; Wed, 12 May 2021 00:42:32 -0400
X-MC-Unique: 7IdVqRNfMKiOECR7NFUOig-1
Received: by mail-wm1-f70.google.com with SMTP id
 o18-20020a1ca5120000b02901333a56d46eso174195wme.8
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 21:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/pCfhzyP6eS7AG1WV9Ro3Z7XjCRDW4nv/AmE74GN5s0=;
 b=n4veBO036EUChF9ccIrA9PhzGl7FclyS0x1f1tTLxEfxdzzYOyWO+wq3SETEg78kiJ
 RZByS9//SlHSdf8Ny/vrrTAFqdpKfL3vfm4NE33HnCsa51pnMHsAj0R9JgqA0c4Zhjb7
 IQnzsuahL6baKW9F/SOkZL0oErE1TJi9zDRcB0fulmCloHqh5u3Bi6rDQ6xwQU3DbfUC
 HpRTTGyXTrF/ix+T2+hzwiixmhyQ/kpC8rKRBLQ9sn/azt0aSR/4dj9DtV/CDMsRYUY3
 GTJw8YLJrEZyWtv2zlP9bdzV2P5F7IynaTp3+fwW+IoCw1MSgepATUxhMc994M6ZHm4L
 8yXQ==
X-Gm-Message-State: AOAM531lbH+Q7aNBsMBYAamQXQ636Bggn4GY90DiufeCcGRp73rDFY1t
 No5k/aTgtlljzVt9hbUKUa0OatsIFVYl0Rn1uBlcDz5DdwUxcFwJSMpTu/QTum9t3W0NlrgoXkl
 iaot0VhC8PdFnfYvG3xTx4mJzBIYz3IbWLKWdjIymqrrw4UyobxjXxM6QNOijH/Bi
X-Received: by 2002:adf:eec4:: with SMTP id a4mr42951858wrp.159.1620794551440; 
 Tue, 11 May 2021 21:42:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4zK5uJ9mBIuLSqjSrlLqJxfbaJr9XdztarOTm1iZ5BkmYumIkqR9tJyujTX+UzFSKRD8Rjw==
X-Received: by 2002:adf:eec4:: with SMTP id a4mr42951835wrp.159.1620794551233; 
 Tue, 11 May 2021 21:42:31 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id z66sm5693885wmc.4.2021.05.11.21.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 21:42:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] gitlab-ci: Add KVM x86 cross-build jobs
Date: Wed, 12 May 2021 06:42:27 +0200
Message-Id: <20210512044228.3254073-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a job to avoid breaking x86 KVM-only builds (the feature recently=0D
added by Claudio):=0D
https://gitlab.com/philmd/qemu/-/jobs/1255115665=0D
=0D
Paolo, (assuming Thomas Acks the patch), could you queue it on top=0D
of your current pull request?=0D
=0D
Based-on: <20210511081350.419428-1-pbonzini@redhat.com>=0D
https://gitlab.com/bonzini/qemu.git tags/for-upstream=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  gitlab-ci: Add KVM x86 cross-build jobs=0D
=0D
 .gitlab-ci.d/crossbuilds.yml | 8 ++++++++=0D
 1 file changed, 8 insertions(+)=0D
=0D
--=20=0D
2.26.3=0D
=0D


