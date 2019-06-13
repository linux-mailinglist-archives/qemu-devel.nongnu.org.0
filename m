Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A43D436A6
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 15:33:45 +0200 (CEST)
Received: from localhost ([::1]:39730 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbPrL-0007N8-NK
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 09:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39793)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <no-reply@patchew.org>) id 1hbP5U-0001cv-Aa
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 08:44:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1hbP5S-0002eK-5D
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 08:44:16 -0400
Resent-Date: Thu, 13 Jun 2019 08:44:15 -0400
Resent-Message-Id: <E1hbP5S-0002eK-5D@eggs.gnu.org>
Received: from sender-of-o53.zoho.com ([135.84.80.218]:21815)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1hbP5Q-0002Tn-FK
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 08:44:13 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1560423511; cv=none; d=zoho.com; s=zohoarc; 
 b=mdOdsTyfBvmiZZnoD8eTqeIzhcqzYjUYCKUBeOaT6Ku9dtLl4WFoRVonpnwnInQrP2d7gdGUTW//KAYicxL2IvkgC4bIsKN4CQRmO8XMAotoK/guFAJlRBlwaKzfKEhS42AFCw2KV/Y7Nm2mOwRpnwlOLxrjex9JWhwbb4n0Exc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1560423511;
 h=Content-Type:Content-Transfer-Encoding:Date:From:In-Reply-To:MIME-Version:Message-ID:Subject:To:ARC-Authentication-Results;
 bh=fYtUQt6EVLM5BwNuUIO3P9KsgyRiILwtsS7lNXQlecc=; 
 b=hD5qbdnXp+AGxth6L60hMRdS0wET9wCvPlOkKygd7D1gEKWI6bG54qVMbv2fdZlwlYFtT5pEXt2S/mjSbfv1is4+tjiaD3hA96+i7CHVPurGhI69jngVGPS3MzOLFtEDzvdJpdYQpJvXWhNRr6LgLkwKXQL1F2hl9Qd6Xje8/fg=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.1] (qemu2.osuosl.org [140.211.15.4]) by
 mx.zohomail.com with SMTPS id 1560423510782104.05994294518894;
 Thu, 13 Jun 2019 03:58:30 -0700 (PDT)
In-Reply-To: <B3540B0C-9A71-4733-8109-11B0DC7A17D2@me.com>
Message-ID: <156042336371.23.16736649545265972432@d271e9ad1cbd>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 03:58:30 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.218
Subject: [Qemu-devel] A patch has been merged in QEMU: [PATCH 0/2] ui/cocoa:
 Fix input device issues on Mojave
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

Q29uZ3JhdHVsYXRpb25zLCBbUWVtdS1kZXZlbF0gW1BBVENIIDAvMl0gdWkvY29jb2E6IEZpeCBp
bnB1dCBkZXZpY2UgaXNzdWVzIG9uIE1vamF2ZSB3YXMgbWVyZ2VkIGJ5IHRoZSBRRU1VCm1haW50
YWluZXJzLgoKaHR0cDovL25leHQucGF0Y2hldy5vcmcvUUVNVS9CMzU0MEIwQy05QTcxLTQ3MzMt
ODEwOS0xMUIwREM3QTE3RDJAbWUuY29tLw==


