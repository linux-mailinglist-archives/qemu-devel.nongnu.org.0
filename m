Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD5F2B6AB5
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 17:54:45 +0100 (CET)
Received: from localhost ([::1]:46750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4Fg-0003Yi-8u
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 11:54:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EJ-0001tT-MI
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:19 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:39979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EH-00071f-Mx
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:19 -0500
Received: by mail-ed1-x541.google.com with SMTP id d18so10288109edt.7
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OIGmoXRFZVJq4dWZr7TxTP9dW37vSekRJavmhYEo1A0=;
 b=AAXhX9Ye5Zpv9HNMFB/2Znx2XXjltrX5t2ixlAfSGMhVtnn+vR4R/j6WHzIlbMj1TR
 kIlJmNxwoM8SXpKv97eGQRfxNEsd2QlNB9ceqe27Eo/d+sUL4bG04DC3gVFwOvPYdhE4
 vhM7ShQ73kaixLz8+mTsK7HH5Dls2nvQ5LolhN8uRQ0NGb1qo+qPuqBBJQsMR8vNPuPq
 SF7mh4dlM0Ni41Z/vK7s5VAqiFQOiAUl0X+hgTxx7A2u/QghvoI/wJEd7bvA1opMDgbj
 1ShEPTzQyRuZH9XUQoDXZOhBfMw3sHsUG4VXW9lcoqyOzpL1DYL/CfUz/9rHAaz5ufEk
 gbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=OIGmoXRFZVJq4dWZr7TxTP9dW37vSekRJavmhYEo1A0=;
 b=hyc1KZUkt2CxQvIawU0ZHVU39LPYiK52BmqTknkQuMUxKD411tmSx1P+etu8qKRRKX
 i7QueedObVxwUu0G+yltJqw4DdyPoQyO2ibNvmGy5geceiNLaLhp4SHrf7dzlc1AycKd
 nYLhwwm564FlP9MGIYjcTr3J4B3XeVttfNafvIDDr4AVBK6br74Vm+SP1UkOC1AorE+o
 P+c56svYiFG/wTTimKpaPRTBu0/LSXtFEXfJkA5gN92e0ymZd0B7sKB+KwQBvoonOscK
 Ovan7t65N/NjRbb9LoZmn7PUEW63g6KuZtm7GxvF2rnzQzzj2cHWHJAVVbL2tih6aQmv
 Qy5g==
X-Gm-Message-State: AOAM530uexvDeG4mgk0MrKncJ8C/IwcBsrhWTzShjllZNOzsIuIyAbfG
 kLaYd08s8DNEfciDN3w1n4ETo8US7ts=
X-Google-Smtp-Source: ABdhPJye3RNL+Aif6TSfAwsW+Edu/f1dwHrKjmXAXQFYg46zvE/rpVFY/A1U6WmNb/6xPHI8zUuieg==
X-Received: by 2002:a50:9e05:: with SMTP id z5mr20787563ede.231.1605631995370; 
 Tue, 17 Nov 2020 08:53:15 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:14 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 00/29] kernel-doc: update from Linux 5.10
Date: Tue, 17 Nov 2020 17:52:43 +0100
Message-Id: <20201117165312.118257-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series updates kernel-doc to Linux 5.10, which removes the need for
all of our downstream patches (except for the syntax changes, of course).
Sphinx 3 works, as do the QOM typedefs that needed QEMU-specific changes.
All the patches apply cleanly.

Paolo

Alexander A. Klimov (1):
  Replace HTTP links with HTTPS ones: documentation

André Almeida (2):
  kernel-doc: fix processing nested structs with attributes
  kernel-doc: add support for ____cacheline_aligned_in_smp attribute

Jonathan Cameron (1):
  kernel-doc: add support for ____cacheline_aligned attribute

Jonathan Neuschäfer (1):
  scripts/kernel-doc: Add support for named variable macro arguments

Mauro Carvalho Chehab (19):
  scripts: kernel-doc: proper handle @foo->bar()
  scripts: kernel-doc: accept negation like !@var
  scripts: kernel-doc: accept blank lines on parameter description
  scripts/kernel-doc: parse __ETHTOOL_DECLARE_LINK_MODE_MASK
  scripts/kernel-doc: handle function pointer prototypes
  kernel-doc: include line numbers for function prototypes
  scripts: kernel-doc: add support for typedef enum
  scripts: kernel-doc: make it more compatible with Sphinx 3.x
  scripts: kernel-doc: use a less pedantic markup for funcs on Sphinx
    3.x
  scripts: kernel-doc: fix troubles with line counts
  scripts: kernel-doc: reimplement -nofunction argument
  scripts: kernel-doc: fix typedef identification
  scripts: kernel-doc: don't mangle with parameter list
  scripts: kernel-doc: allow passing desired Sphinx C domain dialect
  scripts: kernel-doc: fix line number handling
  scripts: kernel-doc: try to use c:function if possible
  scripts: kernel-doc: fix typedef parsing
  scripts: kernel-doc: split typedef complex regex
  scripts: kernel-doc: use :c:union when needed

Paolo Bonzini (4):
  Revert "scripts/kerneldoc: For Sphinx 3 use c:macro for macros with
    arguments"
  Revert "kernel-doc: Use c:struct for Sphinx 3.0 and later"
  Revert "kernel-doc: Handle function typedefs without asterisks"
  Revert "kernel-doc: Handle function typedefs that return pointers"

Pierre-Louis Bossart (1):
  scripts/kernel-doc: optionally treat warnings as errors

 docs/sphinx/kerneldoc.py |   1 -
 scripts/kernel-doc       | 453 +++++++++++++++++++++++++++------------
 2 files changed, 318 insertions(+), 136 deletions(-)

-- 
2.28.0


