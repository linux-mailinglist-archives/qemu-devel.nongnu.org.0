Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C37939F0F6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 10:31:13 +0200 (CEST)
Received: from localhost ([::1]:52770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqX8h-0002oH-Jp
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 04:31:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=786c6b92e=graf@amazon.de>)
 id 1lqX5a-00068D-Nv
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:27:58 -0400
Received: from smtp-fw-33001.amazon.com ([207.171.190.10]:54976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=786c6b92e=graf@amazon.de>)
 id 1lqX5Y-0006xC-Dn
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:27:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1623140876; x=1654676876;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dt72r89oBKjQrVVXnFkGO45pvt4R0/uSn+tuKL7DfJA=;
 b=V+ZcbfhNH3aEitQgEvkoIW0+MARlKL357v8VSDO6aQFPEUM1Z08SU3Lv
 G8pK3s5gGxFa2M5nVzCnXD905lrwPQx+sBau9WyEr+6jhzyfnSzCQCyH0
 I032sRYlvg9HRGuSg4XIpIF2dtwaUWkLJ+NJtTeG1K/sV0iHvylaA6mFS k=;
X-IronPort-AV: E=Sophos;i="5.83,257,1616457600"; d="scan'208";a="129758191"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-2b-81e76b79.us-west-2.amazon.com) ([10.25.36.210])
 by smtp-border-fw-33001.sea14.amazon.com with ESMTP; 08 Jun 2021 08:27:48 +0000
Received: from EX13MTAUWC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2b-81e76b79.us-west-2.amazon.com (Postfix) with ESMTPS
 id 59225A1E0E; Tue,  8 Jun 2021 08:27:47 +0000 (UTC)
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC002.ant.amazon.com (10.43.162.240) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18; Tue, 8 Jun 2021 08:27:46 +0000
Received: from [192.168.19.4] (10.43.160.137) by EX13D20UWC001.ant.amazon.com
 (10.43.162.244) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Tue, 8 Jun 2021 08:27:44 +0000
Message-ID: <b76c6cac-2fcc-bbf0-7201-66b442e640bc@amazon.com>
Date: Tue, 8 Jun 2021 10:27:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:90.0)
 Gecko/20100101 Thunderbird/90.0
Subject: Re: [PATCH 2/6] hyper-v: Use -1 as invalid overlay address
Content-Language: en-US
To: Siddharth Chandrasekaran <sidcha@amazon.de>, Paolo Bonzini
 <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
CC: Siddharth Chandrasekaran <sidcha.dev@gmail.com>, Evgeny Iakovlev
 <eyakovl@amazon.de>, Liran Alon <liran@amazon.com>, Ioannis Aslanidis
 <iaslan@amazon.de>, <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>
References: <cover.1621885749.git.sidcha@amazon.de>
 <13aa6b6a4434198ad3d43e48501bce1796266850.1621885749.git.sidcha@amazon.de>
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <13aa6b6a4434198ad3d43e48501bce1796266850.1621885749.git.sidcha@amazon.de>
X-Originating-IP: [10.43.160.137]
X-ClientProxiedBy: EX13D49UWB004.ant.amazon.com (10.43.163.111) To
 EX13D20UWC001.ant.amazon.com (10.43.162.244)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.171.190.10;
 envelope-from=prvs=786c6b92e=graf@amazon.de; helo=smtp-fw-33001.amazon.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

CgpPbiAyNC4wNS4yMSAyMTo1NCwgU2lkZGhhcnRoIENoYW5kcmFzZWthcmFuIHdyb3RlOgo+IFdo
ZW4gbWFuYWdpbmcgb3ZlcmxheSBwYWdlcywgd2UgdXNlZCBod2FkZHIgMCB0byBzaWduYWwgYW4g
aW52YWxpZAo+IGFkZHJlc3MgKHRvIGRpc2FibGUgYSBwYWdlKS4gQWx0aG91Z2ggdW5saWtlbHks
IDAgX2NvdWxkXyBiZSBhIHZhbGlkCj4gb3ZlcmxheSBvZmZzZXQgYXMgSHlwZXItViBUTEZTIGRv
ZXMgbm90IHNwZWNpZnkgYW55dGhpbmcgYWJvdXQgaXQuCj4gCj4gVXNlIC0xIGFzIHRoZSBpbnZh
bGlkIGFkZHJlc3MgaW5kaWNhdG9yIGFzIGl0IGNhbiBuZXZlciBiZSBhIHZhbGlkCj4gYWRkcmVz
cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTaWRkaGFydGggQ2hhbmRyYXNla2FyYW4gPHNpZGNoYUBh
bWF6b24uZGU+CgpSZXZpZXdlZC1ieTogQWxleGFuZGVyIEdyYWYgPGdyYWZAYW1hem9uLmNvbT4K
CgpBbGV4CgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5z
dHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVn
ZXIsIEpvbmF0aGFuIFdlaXNzCkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5i
dXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3
OQoKCg==


