Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 773FF26D9FB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 13:19:36 +0200 (CEST)
Received: from localhost ([::1]:43956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIrwt-00063o-Az
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 07:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kIrwA-0005ed-BQ
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 07:18:50 -0400
Resent-Date: Thu, 17 Sep 2020 07:18:50 -0400
Resent-Message-Id: <E1kIrwA-0005ed-BQ@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kIrw7-0003Wu-W8
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 07:18:50 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1600341518; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OLry8nIVunfV6KlbkvjnPXzdC+GQJHbFYbpvbcsNLthsBnMQD4foixVH6uDie71DXLxZJnYV52yxjGhjchp7IQXzwfzEF8fbL9SmAoA6IDlH7HUM33+CzIwXsgTyF8isITNbaK9KveLibtHk4uV7mdYn2QufpgVqetkX84cCUPg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1600341518;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=ZcfeHBuEFhJOQ03vZDNsNJ4wR3Dhn+6zQnNUkXNW9Ok=; 
 b=Dxs8RTPJA/Gq5wPRxHN+a/QmfG64reXfLZ7w8TME7FUqoFUIQGWn0JQzReNXW4I6qlmsYFIZXHMushY4UQbaz2y+zgDnkHhj/ChGhZYOCR4FFJjhj3sp3G6PYNzhfXi0UZsjc3zcLoL8qss5MDEMqiwdPGw1LU8JCPhjVNOF4TA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1600341518260253.39924761160808;
 Thu, 17 Sep 2020 04:18:38 -0700 (PDT)
Subject: Re: [PATCH] target/i386: always create kvmclock device
Message-ID: <160034151689.8478.18235018336121752129@66eaa9a8a123>
In-Reply-To: <20200917111306.819263-1-vkuznets@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: vkuznets@redhat.com
Date: Thu, 17 Sep 2020 04:18:38 -0700 (PDT)
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
Cc: ehabkost@redhat.com, mtosatti@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, antoine.damhet@blade-group.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDkxNzExMTMwNi44MTky
NjMtMS12a3V6bmV0c0ByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhh
dmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUg
aW5mb3JtYXRpb246CgpOL0EuIEludGVybmFsIGVycm9yIHdoaWxlIHJlYWRpbmcgbG9nIGZpbGUK
CgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8y
MDIwMDkxNzExMTMwNi44MTkyNjMtMS12a3V6bmV0c0ByZWRoYXQuY29tL3Rlc3RpbmcuY2hlY2tw
YXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkg
UGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNr
IHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

