Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E6C23EC56
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 13:23:28 +0200 (CEST)
Received: from localhost ([::1]:48976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k40T9-0000uO-Du
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 07:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1k40SD-00008z-17
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 07:22:29 -0400
Resent-Date: Fri, 07 Aug 2020 07:22:29 -0400
Resent-Message-Id: <E1k40SD-00008z-17@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1k40SA-000802-SC
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 07:22:28 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1596799334; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=dpkDbUpTa4KcuoZfbBvVQYvPx9xHSyxa+S4LNn4sAGcFusSG1jp3Sda4uVmTdbBZNHyEXDAXIv18xCj04ZqPAVAJ/3sP8Voi9fvmcmG1NJ3ztcfBhEFYktidjYvk/EWdy0hyIxIUI+aTwFtrzY0BG+LsktqgYqy5OSINKLmipJA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1596799334;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=q3/M56o4zUxcr1LSWUoEM6zTN6s2Gu/lWbtSJLeczeo=; 
 b=cDdGOPQc0UwoEK6a7U7aQXn2k0IHaPMzC6Arj/JTkQDgec/10h5y5BzdKXQDBc5sa6EZi3PzWtdWfWUF0gmxVfDNYsZhnHXdHM4ljvsOWQRvRIvdku9c8vkIk2KIDGxjs+x/09da73lX4PHbVWhin9DKIOXU3s0Y8us3a/ixs3I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 159679933211423.519625406829277;
 Fri, 7 Aug 2020 04:22:12 -0700 (PDT)
Subject: Re: [RFC v2] checkpatch: detect missing changes to trace-events
Message-ID: <159679933145.14729.10293881254508357697@66eaa9a8a123>
In-Reply-To: <20200807111447.15599-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: cfontana@suse.de
Date: Fri, 7 Aug 2020 04:22:12 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.57; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o57.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/07 04:25:30
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: mst@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 armbru@redhat.com, cfontana@suse.de, stefanha@redhat.com, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDgwNzExMTQ0Ny4xNTU5
OS0xLWNmb250YW5hQHN1c2UuZGUvCgoKCkhpLAoKVGhpcyBzZXJpZXMgZmFpbGVkIHRoZSBkb2Nr
ZXItcXVpY2tAY2VudG9zNyBidWlsZCB0ZXN0LiBQbGVhc2UgZmluZCB0aGUgdGVzdGluZyBjb21t
YW5kcyBhbmQKdGhlaXIgb3V0cHV0IGJlbG93LiBJZiB5b3UgaGF2ZSBEb2NrZXIgaW5zdGFsbGVk
LCB5b3UgY2FuIHByb2JhYmx5IHJlcHJvZHVjZSBpdApsb2NhbGx5LgoKPT09IFRFU1QgU0NSSVBU
IEJFR0lOID09PQojIS9iaW4vYmFzaAptYWtlIGRvY2tlci1pbWFnZS1jZW50b3M3IFY9MSBORVRX
T1JLPTEKdGltZSBtYWtlIGRvY2tlci10ZXN0LXF1aWNrQGNlbnRvczcgU0hPV19FTlY9MSBKPTE0
IE5FVFdPUks9MQo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKCgoKVGhlIGZ1bGwgbG9nIGlzIGF2
YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIwMDgwNzExMTQ0Ny4xNTU5OS0x
LWNmb250YW5hQHN1c2UuZGUvdGVzdGluZy5kb2NrZXItcXVpY2tAY2VudG9zNy8/dHlwZT1tZXNz
YWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6
Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2
ZWxAcmVkaGF0LmNvbQ==

