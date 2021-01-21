Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A21F2FF212
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 18:36:58 +0100 (CET)
Received: from localhost ([::1]:56814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2dt9-0004eR-Jh
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 12:36:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2dl5-0006Vo-DQ
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:28:35 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:43882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2dl3-0003Td-T8
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:28:35 -0500
Received: by mail-ej1-x633.google.com with SMTP id a10so3737803ejg.10
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 09:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DqjhzjUy31/FnxQdnBS2SQa+Y15kXItwBiziiA2canY=;
 b=jSx4LRQwS40KXEXnvQAaSQZkUFdx3v36nke7eK20KNu+vAMB0MVUZ2W2tcUajNYa6k
 8sqVBFqsSAU55JL146sTbH/pCEPVyfhw7mhT79ztITMcQDY9NUxJF+0rIdXCTnXg4SMU
 OIuzfLzX2OBPaHU/YZ8uX+6mj1N7/swkRGKn1r6Pp5pzlL9DnP6JxSsiwFLmUO9tJ7mv
 GyDcxoBGd+UkoWZ2vEAD3yUdVQuhd6GlnbPInP7or1JeYlHBRDZe+NKX4bJxraIE5+1Q
 f7uuMQZnVUzi3QukKVlMldczevKVPRsPgwM+jWu3ojCMjbfn9e1O9EbbQZDtcvKi8LNe
 X3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=DqjhzjUy31/FnxQdnBS2SQa+Y15kXItwBiziiA2canY=;
 b=YIsLN1J/E0vX7aNUWQlCAAnv9/3lJ5V3mczX4uzitUdT1+C6MfpCfEoDXJx2ahzSnp
 byWgGAYHmPRiXJEnWgDH9ALIFyTDosaa5NJ4MFKW03jU4S3IRFUn4DPeBtF8oOYr6xNZ
 BU4JHzeYtmXXYGZoM3oXMOoguLPiX2AZwHnNdOsaeyL1dxPUhqrYnZx9wWx6TO8OhGir
 3QsUD9IyTFYbzVVLB39rszZldB0bpogZqYfluuykW0BqQAOIV269/wMQX8n9BJqwiNQO
 CPXQyKEEP+VIqrntkErGnqfHj0WO25OP06c+C/nuhJWBf4cjQZNzDCpy4fwj3C79D8Gt
 ZUvw==
X-Gm-Message-State: AOAM5313KSNzL9L3DlQgFgrKM8fYW2LqquyewRqUgpZrx27Q66SmbWXE
 748vp8C8MjoB8Zngy8EgUF30PUqFJ3U=
X-Google-Smtp-Source: ABdhPJyLa4wmUU3AXgCf3m+eC7XPId3Z7TPM1VV8eTSQwV6ARXJawsCt9RcGGhE26Iki/Xsj1OZrxQ==
X-Received: by 2002:a17:906:2755:: with SMTP id
 a21mr373411ejd.374.1611250111888; 
 Thu, 21 Jan 2021 09:28:31 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id e11sm2480795ejz.94.2021.01.21.09.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 09:28:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] gitlab-ci: Test linux-user on CentOS 7
Date: Thu, 21 Jan 2021 18:28:27 +0100
Message-Id: <20210121172829.1643620-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first patch adds the static libc package to the CentOS 7=0D
Docker image so then we can run the TCG linux-user tests on=0D
it (second patch).=0D
=0D
Since v1:=0D
- added first patch=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  tests/docker: Install static libc package in CentOS 7=0D
  gitlab-ci: Test building linux-user targets on CentOS 7=0D
=0D
 .gitlab-ci.yml                          | 7 +++++++=0D
 tests/docker/dockerfiles/centos7.docker | 1 +=0D
 2 files changed, 8 insertions(+)=0D
=0D
-- =0D
2.26.2=0D
=0D

