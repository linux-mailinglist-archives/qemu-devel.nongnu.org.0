Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2CB57E50F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 19:08:08 +0200 (CEST)
Received: from localhost ([::1]:34228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEw8F-00080s-6G
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 13:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEw5G-0002IZ-Aq
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 13:05:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEw5A-0000f7-Am
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 13:04:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658509494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RiSR0nz1ppNMgJ7fAp+Yu2XdyVwwNYzH18ikEI3rZWg=;
 b=H7+wJcDhnkhmhhuVUM8WYXFw307e4kxxQNcev+Hd2C1BK/KB4tn9AiAyxmhYY7WjxFa0Bb
 Il0FyXkGIMyujtHvKsl/bX1yZZUU455tXKddRHkPFkLF4Y6wedbxqMUHpfChYKEXHeTi2l
 IJ+46VLP8dGgUQUKjTvGnlbt/JVVyvM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-WCQf9Jq8PfCGXp6HjYufKQ-1; Fri, 22 Jul 2022 13:04:53 -0400
X-MC-Unique: WCQf9Jq8PfCGXp6HjYufKQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 v9-20020a056402348900b0043bcd680e50so1768676edc.18
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 10:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RiSR0nz1ppNMgJ7fAp+Yu2XdyVwwNYzH18ikEI3rZWg=;
 b=FS/sfzLnpcpDBpT65h+5NYUBO1RyhiXAl2cZqBxVI0d+xaxAyGAsdJ1bei5mFUlbHk
 y4wylyIpFPaVPdYBTHVHuq/6/lsch8OmuNGPl706H+3apJFUlhSaEwEdO6FuwFJ5spt/
 8P/4WpHNVPH3PDifw5BZPd/e8egXRsT9v4xG4Qg7z2noL6tdWOkOFYDZJurCLySnm7x1
 Oz38K7Gw2TQtqafu8y8RmGlFbHVP23xW4jWFHkelvxXWtgvjOowBbSdc/5jEJgGwAKOx
 YQKETM7VXMyeQ3vNtqnPkxU3ACm6W1b31x44AD2nSikQ11q/6mvxuKBQA7rHAmLZKz4f
 bQmw==
X-Gm-Message-State: AJIora9pnnDgr6usbCpXqp1An3HAvwehqq9xk3Dq4n1VtGw8OLsILMxj
 Cn9FLwhXTEn3QaAtNEWPuqzo4xYHx9Id+qN/jw1AJYyl65VBBFnuG7wEfJRxiYQ2VtGz9SsEy2/
 pYmIwPgLHwzw9K3alNK9mS9VsPoQ8fc4jp+9KTpOdhtxdJgw5qcEh9GLHELrpDWBA8So=
X-Received: by 2002:a17:907:2808:b0:72b:50cd:2c8a with SMTP id
 eb8-20020a170907280800b0072b50cd2c8amr653832ejc.246.1658509492041; 
 Fri, 22 Jul 2022 10:04:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t5cLyGkYfKkQp/4dvJChma40n1fLi/pfRHXEyQ4T5PD8WbJXpIzAbe7RPNEoQQlE9vy0+Omg==
X-Received: by 2002:a17:907:2808:b0:72b:50cd:2c8a with SMTP id
 eb8-20020a170907280800b0072b50cd2c8amr653806ejc.246.1658509491521; 
 Fri, 22 Jul 2022 10:04:51 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 bt13-20020a170906b14d00b00726dbb16b8dsm2224667ejb.65.2022.07.22.10.04.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 10:04:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 0/8] More fixes + random seed patches for QEMU 7.1
Date: Fri, 22 Jul 2022 19:04:41 +0200
Message-Id: <20220722170449.853222-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

The following changes since commit 5288bee45fbd33203b61f8c76e41b15bb5913e6e:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-07-21 11:13:01 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream2

for you to fetch changes up to 9fa032885583a2f1cb9cacad2f717784ccea02a1:

  hw/i386: pass RNG seed via setup_data entry (2022-07-22 19:01:44 +0200)

----------------------------------------------------------------
* Bug fixes
* Pass random seed to x86 and other FDT platforms

----------------------------------------------------------------
Alexander Bulekov (1):
      oss-fuzz: ensure base_copy is a generic-fuzzer

Bin Meng (1):
      docs: Add caveats for Windows as the build platform

Jason A. Donenfeld (4):
      hw/nios2: virt: pass random seed to fdt
      hw/mips: boston: pass random seed to fdt
      hw/rx: pass random seed to fdt
      hw/i386: pass RNG seed via setup_data entry

Paolo Bonzini (1):
      oss-fuzz: remove binaries from qemu-bundle tree

Peter Maydell (1):
      accel/kvm: Avoid Coverity warning in query_stats()

 accel/kvm/kvm-all.c                          |  2 +-
 docs/about/build-platforms.rst               | 10 +++++++++-
 hw/i386/microvm.c                            |  2 +-
 hw/i386/pc.c                                 |  4 ++--
 hw/i386/pc_piix.c                            |  2 ++
 hw/i386/pc_q35.c                             |  2 ++
 hw/i386/x86.c                                | 26 ++++++++++++++++++++++----
 hw/mips/boston.c                             |  5 +++++
 hw/nios2/boot.c                              |  5 +++++
 hw/rx/rx-gdbsim.c                            |  4 ++++
 include/hw/i386/pc.h                         |  3 +++
 include/hw/i386/x86.h                        |  3 ++-
 include/standard-headers/asm-x86/bootparam.h |  1 +
 scripts/oss-fuzz/build.sh                    |  6 ++++--
 14 files changed, 63 insertions(+), 12 deletions(-)
-- 
2.36.1


