Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F029826D62A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 10:14:09 +0200 (CEST)
Received: from localhost ([::1]:34910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIp3Q-00016t-Su
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 04:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kIowk-0000uc-Cj
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 04:07:14 -0400
Resent-Date: Thu, 17 Sep 2020 04:07:14 -0400
Resent-Message-Id: <E1kIowk-0000uc-Cj@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kIowh-0007Ko-TP
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 04:07:13 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1600330001; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=buxGrlrOH2WaYp9TMoAyu2EbWW7NqyDcPbbCjEzKdqVOY64CqNwxYToPaYt0vEh5YDbRDRzBGH0Ze9yc88QQskBPkiRfV2JXw1cbC5hDoZESGQ30vl7n/SalXyz8UsTN4QoiOHCxyFOq7QeeLFibugFygKRn823pD1Vc2BSMuoc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1600330001;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=VyxmvDhQu60v1mejppi4ObQpPzRn+QAl0Ja0tVJjzlE=; 
 b=Lr7lfZic5Msx/GhcZ0SOLxvGTJ6sUTqekbG63mGpD6eISKzUR9m0zf0sgb67wNNSg4r7LVq6+URxgzcJPmFve573eIRzQ3XOpEiYluFo4rpG4GUpkuffSIAAYrNzq7dG91/+aUvIikbO6sa1NFqLdpyBkWHex73E4flwcch8+ko=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1600329999570500.97037922096024;
 Thu, 17 Sep 2020 01:06:39 -0700 (PDT)
Subject: Re: [PATCH v6 00/12] i440fx/acpi: addition of feature and bug fixes.
Message-ID: <160032999760.8478.8560819129012516657@66eaa9a8a123>
In-Reply-To: <20200917074733.13612-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: ani@anisinha.ca
Date: Thu, 17 Sep 2020 01:06:39 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.57; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o57.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 04:07:10
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
Cc: ehabkost@redhat.com, mst@redhat.com, jusual@redhat.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, aleksandar.qemu.devel@gmail.com, imammedo@redhat.com,
 ani@anisinha.ca, pbonzini@redhat.com, aurelien@aurel32.net, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDkxNzA3NDczMy4xMzYx
Mi0xLWFuaUBhbmlzaW5oYS5jYS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNv
bWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9y
bWF0aW9uOgoKTi9BLiBJbnRlcm5hbCBlcnJvciB3aGlsZSByZWFkaW5nIGxvZyBmaWxlCgoKClRo
ZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMDA5
MTcwNzQ3MzMuMTM2MTItMS1hbmlAYW5pc2luaGEuY2EvdGVzdGluZy5jaGVja3BhdGNoLz90eXBl
PW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFto
dHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hl
dy1kZXZlbEByZWRoYXQuY29t

