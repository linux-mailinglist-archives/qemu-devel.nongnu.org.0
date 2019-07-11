Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6C365E69
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 19:22:43 +0200 (CEST)
Received: from localhost ([::1]:43738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlcmI-0006WO-0a
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 13:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59992)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hlclz-0005q4-LH
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:22:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hlcly-0003j2-PN
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:22:23 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54705)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1hlcly-0003hY-JM
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:22:22 -0400
Received: by mail-wm1-x343.google.com with SMTP id p74so6425180wme.4
 for <qemu-devel@nongnu.org>; Thu, 11 Jul 2019 10:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=MMRHPKV8s5WDgjt0cQp3rOu+hHayH02p+73bo1A3S2Y=;
 b=a3fqmChWqU3tFTxHPG+kEYmbY5OVMLv9nWoThgqbvP5w9f+fMk3CTdUDLE1Vh+xS5X
 CJVoNR/y3xR2rVGHejmoU7IH//C/kEQOAW3E0lLecS3EaYt/lF/50eOpGL45DsrlEG+T
 rnsxuZiHjbc+43o3b8R02N5FCIzGuiHOTqAD38zPESqJzSB8S9iKdjZza66RITbKvQm8
 hJy29RfxThvvY3/dM40V60zyAr7PjQJhGguvylT0o/WJRk3YILr/8H0MfL/FL5+adEiv
 9NRny4J5/DxfBW6HOSv1Bctl8L25xP5PD4haVmvyqSVw2SU8OHxve+LRFyt2Yasdl1IU
 lPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=MMRHPKV8s5WDgjt0cQp3rOu+hHayH02p+73bo1A3S2Y=;
 b=nbo2HcBBUZgXwHVGlx+zO2LFlOzkBM5wqpM6Nr4WrXz8g695afJoeo4qK4sXvOMffF
 4XkL62CBqdgAY5QtRUaUqTEyiWii1rdniTW4bfwHUAv8li3BHdFhaUREhcn9J8e9uA/V
 GhBEGJWH7J4wY5RvtjPKzcr5PwmDFk0c4b1dkbKrGg15pVk53b6ORwPQvQfEI5Fq9fBI
 srLK3SjNNtTxl22c3helScDjoPMtDq6kGBJ7n1LcmKe/v0KgHqb6UW9cDjpLCBdgoT01
 D+OEiNLtFF0Ps0HRbJZYONH2xYMbLZh14wJqhmhrjW4t6GEmhNAMfeBcBWRfgPquDvud
 G+SQ==
X-Gm-Message-State: APjAAAWZQCKDYPuR81LQ/uNgHW4MvtnqQxXplNEvsDZBkjq7U8pvxQjH
 vq6GvFVbdmDKik7tLQQ53Y5U4RaZcxk=
X-Google-Smtp-Source: APXvYqxNC+WOWVRJ89JC8tfG1Q2aZZgF3GAReG7eICVcFcJuJELzuXfDWo63htnSosWaBkYIcETADQ==
X-Received: by 2002:a7b:cc97:: with SMTP id p23mr5304428wma.120.1562865738375; 
 Thu, 11 Jul 2019 10:22:18 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id c11sm8654514wrq.45.2019.07.11.10.22.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jul 2019 10:22:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 11 Jul 2019 19:22:14 +0200
Message-Id: <1562865736-3546-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-devel] [PATCH 0/2] small create_config cleanup
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Noticed while reviewing the config-devices.h, decided to remove
it since it confused Philippe as well.

Paolo Bonzini (2):
  Makefile: do not repeat $(CONFIG_SOFTMMU) in hw/Makefile.objs
  create_config: remove $(CONFIG_SOFTMMU) hack

 configure             |  2 +-
 hw/Makefile.objs      | 61 +++++++++++++++++++++++++++------------------------
 scripts/create_config |  2 +-
 3 files changed, 34 insertions(+), 31 deletions(-)

-- 
1.8.3.1


