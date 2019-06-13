Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E5243556
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 13:02:35 +0200 (CEST)
Received: from localhost ([::1]:38466 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbNV4-0006tn-6b
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 07:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40558)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <no-reply@patchew.org>) id 1hbNRT-0004uN-Ad
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 06:58:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1hbNRS-00045L-7Y
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 06:58:51 -0400
Resent-Date: Thu, 13 Jun 2019 06:58:51 -0400
Resent-Message-Id: <E1hbNRS-00045L-7Y@eggs.gnu.org>
Received: from sender4-of-o59.zoho.com ([136.143.188.59]:21957)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1hbNRR-00043H-Vk
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 06:58:50 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1560423514; cv=none; d=zoho.com; s=zohoarc; 
 b=fn+l4VaRsoNim9g7hNj3rBt/KHvRVy2Z6lINYUCR3xUe1BADJ5wXbzc3CsAru8tnDfkBKrtZZg52foxC3tnJefLlK68/crq7GaMXXFsMxFykfvJXAouvIqpuC0n/hHyLNhSQLX+QKwWp71zW0VFPjxjbQA7rhJNh18fyi3SSgGc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1560423514;
 h=Content-Type:Content-Transfer-Encoding:Date:From:In-Reply-To:MIME-Version:Message-ID:Subject:To:ARC-Authentication-Results;
 bh=fYtUQt6EVLM5BwNuUIO3P9KsgyRiILwtsS7lNXQlecc=; 
 b=N2mDFw+iNeLhrg5aOaidwpIkQuyM3lAmfeuOJGr48m0TPTNomjeuUuK+xaBuyhXIj9oG6Wp/LFSfPEz8f/THLHcQl2btGhF2H7HGqFtp/4r0zGQfGz2fWKV/5HJE6cUrWlZj6unKhVS5VYn4YC9RyyVDrPzPuj64Aruw3f47HyQ=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.1] (qemu2.osuosl.org [140.211.15.4]) by
 mx.zohomail.com with SMTPS id 15604235117221018.4302755837379;
 Thu, 13 Jun 2019 03:58:31 -0700 (PDT)
In-Reply-To: <B3540B0C-9A71-4733-8109-11B0DC7A17D2@me.com>
Message-ID: <156042336469.23.11459933803687847776@d271e9ad1cbd>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 03:58:31 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.59
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


