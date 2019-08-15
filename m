Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E805E8E7E7
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 11:15:36 +0200 (CEST)
Received: from localhost ([::1]:39862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyBr5-0003me-9V
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 05:15:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43856)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1hyBq4-0003K2-3e
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 05:14:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1hyBq2-0007vz-Ja
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 05:14:31 -0400
Resent-Date: Thu, 15 Aug 2019 05:14:31 -0400
Resent-Message-Id: <E1hyBq2-0007vz-Ja@eggs.gnu.org>
Received: from sender4-of-o59.zoho.com ([136.143.188.59]:21927)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1hyBq2-0007vL-Bt
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 05:14:30 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1565860462; cv=none; d=zoho.com; s=zohoarc; 
 b=OXluaIh3NQjckBLgK8ebCLcHhiqLbckXgGLxs2hLxBw/aMqaSKG9XXUDpD/o6c3C1gEmczDVqZ2B63qfB9mrKJw7cU9ALu9YwlPGUYFKCT0O0aciOEomUbU3cgBTjaQWxwz6foH9rbWO1UTG6jRu77aoPFVSjxiOK9hi3d2U5cU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1565860462;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=rbv0hPASHUbXh52EGxbH92T9ZJULn7ojhaPhmCGAbQM=; 
 b=Mma2lahV7hSbod1xYaRiwMMlqzFEP/c1abnFAKYsW9iOl1e9ZFIk9Q91qArpNzA5T7fqk2FlpO9lYF+HOwcSWTrh61N/31GP6+KI7tx1MZLKDqSO/vwu7YVygBmNmKQjmjxAlX08j1kFntjgz7897G78MvfGDERY/jufWUdtbQs=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1565860459096121.29602105391746;
 Thu, 15 Aug 2019 02:14:19 -0700 (PDT)
In-Reply-To: <20190815023725.2659-1-vandersonmr2@gmail.com>
Message-ID: <156586045812.14588.16742949359632852303@5dec9699b7de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: vandersonmr2@gmail.com
Date: Thu, 15 Aug 2019 02:14:19 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.59
Subject: Re: [Qemu-devel] [PATCH v1 0/2] Integrating qemu to Linux Perf
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
Cc: vandersonmr2@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDgxNTAyMzcyNS4yNjU5
LTEtdmFuZGVyc29ubXIyQGdtYWlsLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWlsZWQgdGhl
IGFzYW4gYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRlc3RpbmcgY29tbWFuZHMgYW5kCnRo
ZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2VyIGluc3RhbGxlZCwgeW91IGNhbiBw
cm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0K
IyEvYmluL2Jhc2gKbWFrZSBkb2NrZXItaW1hZ2UtZmVkb3JhIFY9MSBORVRXT1JLPTEKdGltZSBt
YWtlIGRvY2tlci10ZXN0LWRlYnVnQGZlZG9yYSBUQVJHRVRfTElTVD14ODZfNjQtc29mdG1tdSBK
PTE0IE5FVFdPUks9MQo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKICBDQyAgICAgIHg4Nl82NC1z
b2Z0bW11L2h3L2ludGMvYXBpY19jb21tb24ubwogIENDICAgICAgeDg2XzY0LXNvZnRtbXUvaHcv
aW50Yy9pb2FwaWMubwogIENDICAgICAgeDg2XzY0LXNvZnRtbXUvaHcvaXNhL2xwY19pY2g5Lm8K
L3RtcC9xZW11LXRlc3Qvc3JjL2FjY2VsL3RjZy9wZXJmL2ppdGR1bXAuYzoxMToxMDogZmF0YWwg
ZXJyb3I6ICdleGVjL3RiLXN0YXRzLmgnIGZpbGUgbm90IGZvdW5kCiNpbmNsdWRlICJleGVjL3Ri
LXN0YXRzLmgiCiAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+CiAgQ0MgICAgICB4ODZfNjQtc29m
dG1tdS9ody9taXNjL2l2c2htZW0ubwoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0
cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAxOTA4MTUwMjM3MjUuMjY1OS0xLXZhbmRlcnNvbm1yMkBn
bWFpbC5jb20vdGVzdGluZy5hc2FuLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQg
YXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBz
ZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t


