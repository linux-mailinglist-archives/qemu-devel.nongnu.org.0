Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82321354EB6
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 10:33:02 +0200 (CEST)
Received: from localhost ([::1]:46086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTh8v-0005VW-Ga
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 04:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lTh7I-0004gg-FQ
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 04:31:22 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:47090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lTh7G-0005Md-8N
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 04:31:20 -0400
Received: by mail-lj1-x22d.google.com with SMTP id u20so15443964lja.13
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 01:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vNquzgGV0mkpjfB3nEVof/OR1C9r2BYgCGmDdtd6Ayw=;
 b=kZWn3T9NluiN6cPaBi96eeP22/VuZqTJE1QhcHUFSjleVmpPndzz9+3dcFLsklIYCx
 2Mnu98qD3IcemJNEeRUPhw/VDpBkmvkc4OksEFI6y+21DmgYbTxmLQhLt02bF4ElXUwL
 hIWNhOy/5foasZbutFVN/SqroA0yiuGi0bFUBujYu3EpAGvIzpzpGbtILcL5GpR7kLul
 7VY/0t7GwQsTUIfR3Teq7SVYCOuHx/OAQZBZuSGQLnWYf6rSPHcOsmyDlQfD05dfXNIc
 UTqol4u1E/BUMylMErFiL4VLOj4pEjHkjSrlyDz5e+VSAxnaxrKrUiCC72WvFkhxnACx
 zmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vNquzgGV0mkpjfB3nEVof/OR1C9r2BYgCGmDdtd6Ayw=;
 b=oBwvNh48S800d8uVId8sHtf32YQTWdtmjvP1WYB7UKxQ6clsb/WMyenUk8SiHnpziU
 ua+6K34QbiSzaBdSrWh+3+Q2Mnm3la72xYyiK03oJB050ooNP/CMXDKtof5h336YDXpZ
 I9mF/wgBNODSQAMnVe+aav1arEpMKkuKu1I+LPhasK3ckFF/XbCmfRhHI29ljA9FUJFT
 G58hrjQM+J/3unAZ4xXPqQfCN2OR7OzVIU1dQ7tcDuLH4uOuhuLF0uPWw1dP7O7nJKpN
 0SKxPxkmqYazfNciFkW+XkbQhbP3keGIEnKPM9UiYJ/NO4tqUIjvsoFuQ3tCpFrRRAxH
 dTzw==
X-Gm-Message-State: AOAM532S6bG0QBOMbw2I5YVVP+ORlUsXlHsXpEEmghqNNyVfIvK4mcVG
 wTwTfDTUE5mMPr2YL3ZuuhhICg==
X-Google-Smtp-Source: ABdhPJz+mufRndc9V4AwXwFASgRtpiytW79BN3/71m94LYtRPF0U/mnntZahgbnPA0VxTJR8EIMQdQ==
X-Received: by 2002:a2e:b55a:: with SMTP id a26mr18309857ljn.297.1617697874386; 
 Tue, 06 Apr 2021 01:31:14 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id d22sm2124533lfg.160.2021.04.06.01.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 01:31:13 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: alex.bennee@linaro.org, f4bug@amsat.org, thuth@redhat.com,
 wainersm@redhat.com, willianr@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 0/1] libbpf dependecy for docker containers.
Date: Tue,  6 Apr 2021 11:29:46 +0300
Message-Id: <20210406082947.672708-1-andrew@daynix.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::22d;
 envelope-from=andrew@daynix.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For eBPF RSS steering, qemu required to be built with libbpf.
(https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg08887.html)
So, for few docker containers there was added libbpf.
Some docker containers doesn't have that library, g.e. Ubuntu 20.04.
On some systems, like Centos7 or Debian, libbpf is pressent but doesn't
resolved as dependency by meson(may be pkg-config issues?).
On those systems qemu will be build without eBPF RSS steering.
The patch privedes changes for containers that able to build qemu
with libbpf: Alpine, Centos8 and Fedora.

Andrew Melnychenko (1):
  Added libbpf library to the docker files.

 tests/docker/dockerfiles/alpine.docker  | 1 +
 tests/docker/dockerfiles/centos8.docker | 1 +
 tests/docker/dockerfiles/fedora.docker  | 1 +
 3 files changed, 3 insertions(+)

-- 
2.31.0


