Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B66026D90B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 12:29:47 +0200 (CEST)
Received: from localhost ([::1]:44454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIrAg-0005dM-5X
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 06:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kIr8t-00044O-MA
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 06:27:55 -0400
Resent-Date: Thu, 17 Sep 2020 06:27:55 -0400
Resent-Message-Id: <E1kIr8t-00044O-MA@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kIr8r-0005bn-8u
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 06:27:55 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1600338460; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hwh5UBN6JgACWK7AED7Z5h1eJJLS3+siFWllWonLm2x/ePGhO8KBXdDP/5BBiB1WhkDXfE5GaMH/ZnOCjvO40JlngfMXInGOnIuFYm0eT3DPr6UvpTZICNROCKGEFuLfyHhLKBQ2vfactzq03Q1vTsV28JVEILek/iyPbtG6hV0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1600338460;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=lIJ5rkjI5uCOnI6R10BejhY/Xu0lf6vXLMqWFXeb1ns=; 
 b=CjZNzCB26kzF0sZH7awDxhPsE43c2jZSo/iFT6/vVKKWyfcrvHocy7QmyXAwrQWP6WigO3d1V7EcyjEYamwDKifm63apMDMyUVrRhFGBttgeVC1H6QQ1yu5FFl9WF6gPJRfFRqpoUZvrGJaGENLyaWk7vza/55lgcICNqxl69tw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1600338457923917.0633903245174;
 Thu, 17 Sep 2020 03:27:37 -0700 (PDT)
Subject: Re: [PATCH v7 00/12] i440fx/acpi: addition of feature and bug fixes.
Message-ID: <160033845638.8478.14003502353342283749@66eaa9a8a123>
In-Reply-To: <20200917100947.21106-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: ani@anisinha.ca
Date: Thu, 17 Sep 2020 03:27:37 -0700 (PDT)
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
Cc: lvivier@redhat.com, thuth@redhat.com, mst@redhat.com, jusual@redhat.com,
 qemu-devel@nongnu.org, imammedo@redhat.com, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDkxNzEwMDk0Ny4yMTEw
Ni0xLWFuaUBhbmlzaW5oYS5jYS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNv
bWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9y
bWF0aW9uOgoKTi9BLiBJbnRlcm5hbCBlcnJvciB3aGlsZSByZWFkaW5nIGxvZyBmaWxlCgoKClRo
ZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMDA5
MTcxMDA5NDcuMjExMDYtMS1hbmlAYW5pc2luaGEuY2EvdGVzdGluZy5jaGVja3BhdGNoLz90eXBl
PW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFto
dHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hl
dy1kZXZlbEByZWRoYXQuY29t

