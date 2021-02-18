Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6349C31EB67
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 16:18:35 +0100 (CET)
Received: from localhost ([::1]:47576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCl4c-0007bu-Dj
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 10:18:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lCl2m-00068r-Mr
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 10:16:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lCl2k-00086S-Eo
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 10:16:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613661397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pp/fpM4Y0hJ9l+E4GnNQmBBxwban8f5rPcBz67Glp2g=;
 b=JEY7u8wxA8twNLx0D+IBTvvlns1rkrFh1UImR/+Z8SRh6TnkUWQo2HQhVRd9X52e/ryue5
 Vax0SPFuBoBHfXmkJC+gra5D1DrLebtvfGORVzSnqdVXTXDv6EAP14JRxRxVCE9u7hBt37
 nHyNqJymFcCIzutr//62qxv1P+y8YbE=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-DjkIYKSsMNSwggDEHS_Cqw-1; Thu, 18 Feb 2021 10:16:36 -0500
X-MC-Unique: DjkIYKSsMNSwggDEHS_Cqw-1
Received: by mail-oi1-f197.google.com with SMTP id l18so1118373oic.13
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 07:16:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pp/fpM4Y0hJ9l+E4GnNQmBBxwban8f5rPcBz67Glp2g=;
 b=Trvuo/FWABdK8+/CUHael6y6kM573gUBbCTxmu7AEFzdYZpXOgZ6OW4dBQSXLzB4/d
 utOE52iafVav8LeqJYIqsHhDmFpBGQ0U3iBy0I9vfjAJVXdgNHDtCEyiJF6CFb/xTDih
 yh+wcoGx9k32JeLWzMmkBpXCy+rIEOYVCy0cBl46uYsc3/BbUfIyw+S5lRuKle6pdNG9
 Iu3b+4aLJ8gi7WwhWbV2YuKKPWDmmXkSGupVu9y7fg9Xfpu4JcQAy5h5NVsE6K2uHju0
 Fo7hErl+mKAP5KZ5VH+0wUnZQXfvjiXlW6/VbHamJfMcPZBX+i6GJ+fde/Rg3A3jOtes
 N20w==
X-Gm-Message-State: AOAM5301PwHrRRBA08V7Emu7NhqBJhTCTUdJLvmKi/yrzu2nagCxzS2n
 kP03/SILy0/SbQ7Yylo5CbzwkCNw66gG4s8dbLXg9wLIAWU7fpjsjfmZ9x5p0qwX7FWNKYJWBrV
 5K1CBJqX+J7hYzYdMMXVXHMhesJyFIXQf2ic3uErqkrVILN1fkuMZK8oWXDpDHkBX
X-Received: by 2002:a05:6808:5ca:: with SMTP id
 d10mr2895861oij.122.1613661395303; 
 Thu, 18 Feb 2021 07:16:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsAS209pGRFU2iWWIKhtuJY+Rp6J+ZMZCBWtG0DPfZwFgbB0ZL8kuwV4Fwhq7ZpzRORLLz4w==
X-Received: by 2002:a05:6808:5ca:: with SMTP id
 d10mr2895845oij.122.1613661395176; 
 Thu, 18 Feb 2021 07:16:35 -0800 (PST)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id w134sm1212136oia.56.2021.02.18.07.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 07:16:34 -0800 (PST)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] SEV firmware error list touchups
Date: Thu, 18 Feb 2021 09:16:31 -0600
Message-Id: <20210218151633.215374-1-ckuehl@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com,
 brijesh.singh@amd.com, thomas.lendacky@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Connor Kuehl (2):
  sev: use explicit indices for mapping firmware error codes to strings
  sev: add missing firmware error conditions

 target/i386/sev.c | 48 ++++++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 23 deletions(-)

-- 
2.29.2


