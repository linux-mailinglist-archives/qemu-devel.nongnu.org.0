Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3C226F798
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 10:02:46 +0200 (CEST)
Received: from localhost ([::1]:49084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJBLx-0004Mq-B8
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 04:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kJBKP-0003l7-Q9; Fri, 18 Sep 2020 04:01:10 -0400
Resent-Date: Fri, 18 Sep 2020 04:01:09 -0400
Resent-Message-Id: <E1kJBKP-0003l7-Q9@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kJBKI-0002Fe-O3; Fri, 18 Sep 2020 04:01:08 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1600416039; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Vv6rz5xl/hqUPeA7SEy0CcMbMYqjxBd65cCb/TKy32Yx/cdx94GCLuaEt3DhkmENLLo8LyZHdctUAEJuwRU1k+Cy7TdT8+RFuv+pZ9mMyz9cLJQbVH+bWpVzdwlgqjt1eA0nA79NO3Zv4oA/ld0eQ24BrIaOsntDN/EUHtC14mY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1600416039;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=to9R9tmZP0OWpCFQ2NHacDVO0YpTVelmJdyyVMBI9kY=; 
 b=EAwuroPI511QPaETIKSw1SxXp8tg3r5NfbtvRy5U+3moCmUn16fvoho6so+O2qiCQCyEOc5vvmWpuKg57+RcryFB50bj3LjFdr2uNcUMCkxquRUty6Sme/COBuCb0TpLs5P2Z9vYDO05/SjQ6lDsTUPscjiIuFN+PYFHUuTBAio=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1600416038152379.7206094190076;
 Fri, 18 Sep 2020 01:00:38 -0700 (PDT)
Subject: Re: [PATCH v3 0/4] vhost-vsock: force virtio version 1
Message-ID: <160041603561.8478.1968543601437050626@66eaa9a8a123>
In-Reply-To: <20200918074710.27810-1-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: sgarzare@redhat.com
Date: Fri, 18 Sep 2020 01:00:38 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.57; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o57.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 04:00:59
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
Cc: thuth@redhat.com, qcheng@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 qemu-stable@nongnu.org, cohuck@redhat.com, david@redhat.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, caiqian@redhat.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDkxODA3NDcxMC4yNzgx
MC0xLXNnYXJ6YXJlQHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgZmFpbGVkIGJ1aWxk
IHRlc3Qgb24gRnJlZUJTRCBob3N0LiBQbGVhc2UgZmluZCB0aGUgZGV0YWlscyBiZWxvdy4KCgoK
CgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8y
MDIwMDkxODA3NDcxMC4yNzgxMC0xLXNnYXJ6YXJlQHJlZGhhdC5jb20vdGVzdGluZy5GcmVlQlNE
Lz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRj
aGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8g
cGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

