Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3CA418A5E
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 19:29:59 +0200 (CEST)
Received: from localhost ([::1]:41598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUXyQ-00018K-Bz
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 13:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUXsf-0003qI-SH
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 13:24:03 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:47034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUXsd-000509-Ep
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 13:24:00 -0400
Received: by mail-wr1-x42f.google.com with SMTP id c21so15184866wrb.13
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 10:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:from:subject:content-transfer-encoding;
 bh=g7iTCIx7xoLBU/K3fvS0y/NmshOoebbBp9VJ4T8+kO0=;
 b=NXBGykx6lavj3Hil0h/OwaV8c2mGA3mTNlyBhYWVE0YvfqMtMEyzPDCxMYUbsJ6MnG
 v9X249Ume3mwRyfX8SZWg9y59BjmdGN2s9STvoarFTFAJPNWLt+HPsNaWKfgSWNjBCrV
 /uhh4gT035Q67qQVg+T2117R3ZoKHJ2y6X/9zFZqkxSJMIPVNTQFuNHXb6PS5S9Xbu/5
 uUFSrEX1nDoJuyYnw3Fw1hmTGw3VYPZ+zzUDyBSIb2Nhl9maVuFwLfHj5Ab+hxf+iWoR
 I3Mqyi6q+fXsqIF0BQo8ffZr8bJbwkryIL0JO8jc5ca2DduUcc11VDmyrBzZsgATdfcl
 vQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=g7iTCIx7xoLBU/K3fvS0y/NmshOoebbBp9VJ4T8+kO0=;
 b=yhBOc9gdPd72EkWpGW1SAK+420U34zQv4JSOB+A9tWC8Lq9GZCH2zexvmGDadiE7Ub
 5ej7MZ5ZGZNrPXmiHdfhjT5L0VYMC7IrUtJUeOOAEj7VLSEDAhKiYvJ67PG0cYU2iuM5
 d454Gtx48B9Of8ZXpyls4pxtLCDUp3TsHi69yQ+ABRiL34emvRFAjeilRvgkPUQgRgiG
 NM5cuc5jKfMvMEFSQiZ9KyFbnWeMmLcZlKpVfvbnRhVJyuKCndhVgU8kxUGDmhupfk5c
 dXtX3EPYmYyAKGp8FUyheIgIQbDOOMV/GDfAXcvIN1w2w8BTiP9qDonnbKSTfSg1e8Zk
 4fLA==
X-Gm-Message-State: AOAM533BKsn9urBFyd41CygMVWKxo/9YxvN5bHv2rhmLw9+2/ukyZ4eL
 xebdIZsrKpBsOyKQg3eKzXE=
X-Google-Smtp-Source: ABdhPJz8UXbsWC6pkFqcQNL5V9ScBEf93HUyBnZ4uD/nClgcidI8YhWuaaPWHFskrS3P4Jzk1wOiCw==
X-Received: by 2002:a05:600c:49a2:: with SMTP id
 h34mr4147310wmp.190.1632677037586; 
 Sun, 26 Sep 2021 10:23:57 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id t13sm3711062wro.76.2021.09.26.10.23.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 10:23:57 -0700 (PDT)
Message-ID: <657cbef7-11ac-196c-01e2-aeb9744fe446@amsat.org>
Date: Sun, 26 Sep 2021 19:23:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: "Cho, Yu-Chen" <acho@suse.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Subject: gitlab-ci: amd64-opensuse-leap-container job failing
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

FYI the OpenSUSE job is failing since few days, i.e.:
https://gitlab.com/qemu-project/qemu/-/jobs/1622345026

  Retrieving repository 'Main Repository' metadata
[..........................................................error]
  Repository 'Main Repository' is invalid.

[repo-oss|http://download.opensuse.org/distribution/leap/15.2/repo/oss/]
Valid metadata not found at specified URL
  History:
   - Download (curl) error for
'http://download.opensuse.org/distribution/leap/15.2/repo/oss/repodata/repomd.xml':
  Error code: Curl error 56
  Error message: Recv failure: Connection reset by peer
   - Can't provide /repodata/repomd.xml
  Please check if the URIs defined for this repository are pointing to a
valid repository.
  Warning: Skipping repository 'Main Repository' because of the above error.

I tried to run 'zypper ref' with:

-- >8 --
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -109,5 +109,7 @@ ENV PACKAGES \
     zlib-devel
 ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3.6

-RUN zypper update -y && zypper --non-interactive install -y $PACKAGES
+RUN zypper refresh && \
+    zypper update -y && \
+    zypper --non-interactive install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
---

but no luck: https://gitlab.com/philmd/qemu/-/jobs/1623554962

Should we temporarily disable to job and its dependencies?

Regards,

Phil.

