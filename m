Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E99F2D47B5
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:19:26 +0100 (CET)
Received: from localhost ([::1]:54702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn37d-00062w-Mb
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:19:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kn2q2-0006YI-Dx
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:01:15 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:36392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kn2ps-0000pT-Ut
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:01:13 -0500
Received: by mail-wm1-x341.google.com with SMTP id y23so2437287wmi.1
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 09:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F/OufLkcg2BRq+en8GKAvZBJDlSbU413z51RYXACQ28=;
 b=xk/OrSG5qRvK5b2BfkMYRywPqg9eNWL6ITO7UaedTM6TyVZFQxrEN5GwZnb7oYYfcZ
 TBxE7lw04fXRwMLZ/+erQdCrqu7UAfoOljBrS7PlezoYq2sLZqS2IPpqCsBcki/O1gNg
 mP+IeMnfu7snK0nq7s+lLnK12/48B71zn0/huRPqwbClrrrDhupZezWHTZbAvxPPzGJc
 PfVo1jKD3vFDhvqj42HY9hwiJt+NiJLz7RTW/klnwV81FGhhMIoRtYBMdkuRPuTeyI9o
 v0/P6Qm3hr0XJCWKCkiIf85SCNaqbxfJXj+WYgZRaus7BHjWmA+8tkSzovJLMRZbTlPv
 XMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F/OufLkcg2BRq+en8GKAvZBJDlSbU413z51RYXACQ28=;
 b=ajjPIRzciGv5snywqFrWRZY15z64d9WIgjJhSwhKxkRtzpClfjReBnnb/TdQPmKfCT
 Kwyq92SKbBeiKumae/OVIzMZ8C9qwzAKzA7RCd8B54oKPkg6svI/MbfbfRIpgy3+Dh1y
 c7t3IPlHlrtschW3+VMEPChs286yT/348BbAvN6SGPD9S2o4lBz++wAsTipVsxjWnFKP
 uvHS2qElRBbhYa1urtpwd4xeq4AOhXUcle+LxziisZkEiP00jErTwoUaWFPsOMLAwEXm
 p9U2dIH/CXGC/O7GT0XyjEpgOHqOeKV0a6rrlHi1hnfX4Xjrug1oyBgx0ehPw2DWBWv0
 yyxw==
X-Gm-Message-State: AOAM531yWz2jhWtERn18sHrbPJSIh5UVc5VGcZRC0k2OYePhcCQtKYD0
 6MxHDz/DvKCWJzd50MGRzLPmVQ==
X-Google-Smtp-Source: ABdhPJwR0mklEPkgfZjjkeeNb/O8FoDJ5ENPWC4IyQGOyhhEOHIHdZ7EIxfpEhLT8Jt6Qhl5HiSOxQ==
X-Received: by 2002:a05:600c:210e:: with SMTP id
 u14mr3831100wml.48.1607533262097; 
 Wed, 09 Dec 2020 09:01:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h5sm5017230wrp.56.2020.12.09.09.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 09:00:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 365771FF7E;
 Wed,  9 Dec 2020 17:00:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 0/6] testing/next (without-features, gitlab, python)
Date: Wed,  9 Dec 2020 17:00:53 +0000
Message-Id: <20201209170059.20742-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

With another release away time to start the ball rolling with testing
patches again. Not much in the current queue but few little configure
tweaks and a working version of --without-default-features. Currently
combined with --without-default-devices it's not super useful but on
it's own it cuts a fair amount of weight from the build.

Alex Bennée (6):
  configure: include moxie-softmmu in deprecated_targets_list
  gitlab: include aarch64-softmmu and ppc64-softmmu cross-system-build
  configure: add --without-default-features
  python: add __repr__ to ConsoleSocket to aid debugging
  gitlab: move --without-default-devices build from Travis
  gitlab: add --without-default-features build

 configure                     | 161 +++++++++++++++++++---------------
 .gitlab-ci.d/crossbuilds.yml  |   4 +-
 .gitlab-ci.yml                |  16 +++-
 .travis.yml                   |   8 --
 python/qemu/console_socket.py |   7 ++
 5 files changed, 113 insertions(+), 83 deletions(-)

-- 
2.20.1


