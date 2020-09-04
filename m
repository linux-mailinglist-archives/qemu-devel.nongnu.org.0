Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 145BB25D993
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 15:25:18 +0200 (CEST)
Received: from localhost ([::1]:39350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEBiP-00071A-5Z
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 09:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kEBhg-0006YG-CP
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 09:24:32 -0400
Resent-Date: Fri, 04 Sep 2020 09:24:32 -0400
Resent-Message-Id: <E1kEBhg-0006YG-CP@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kEBha-0003gk-EW
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 09:24:31 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1599225857; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EnALITGmoqFYLQqKFsr0k9j+u+FBzZDio6xdhZk4S8udE074scQcYtvcUVzIxUgdVQJbNDfPOR4ooKJWG/3nKMoAkW4Hu5fFvuRsZbyq2PF60CoSp3Ab0U3rsm8Z1Qs7TCho6IR6z7EnD7Rx4tdeqsGaV+/Xv7Rg082SNsPlD3E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1599225857;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=Ur5r0fbQBwIe9/Qf0kXZclSu4FeX/GB19xcrAXJNmis=; 
 b=itSzN1rUPYbTn/DumM9lHBYPdcGCxyKATP25hQyMAVyt910XqRfmJZpPftjlr7oCOoTZ989nRjluoJ5Lnk4KOGd8ru1O2LRFYkr64yF9R3Gm35ZDW9zNmYU5Cs1wZ49y1A2oVy0NndQyCgO3W+KtC3MsWvk/w2rVrmjwI5lumE8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1599225856123562.9080868234041;
 Fri, 4 Sep 2020 06:24:16 -0700 (PDT)
Subject: Re: [PATCH 0/2] vhost-vdpa: improve parameters error management
Message-ID: <159922585496.11986.7100544074835236774@66eaa9a8a123>
In-Reply-To: <20200903185327.774708-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: lvivier@redhat.com
Date: Fri, 4 Sep 2020 06:24:16 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.57; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o57.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 09:24:22
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: qemu-devel@nongnu.org
Cc: lvivier@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDkwMzE4NTMyNy43NzQ3
MDgtMS1sdml2aWVyQHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKCk4vQS4gSW50ZXJuYWwgZXJyb3Igd2hpbGUgcmVhZGluZyBsb2cgZmlsZQoK
CgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIw
MjAwOTAzMTg1MzI3Ljc3NDcwOC0xLWx2aXZpZXJAcmVkaGF0LmNvbS90ZXN0aW5nLmNoZWNrcGF0
Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBh
dGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0
byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

