Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AA81322C5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 10:44:39 +0100 (CET)
Received: from localhost ([::1]:45432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iolPg-0000Y0-Dr
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 04:44:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37627)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1iokdw-0004Hr-Oe
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 03:55:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1iokdu-0005H0-Pl
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 03:55:15 -0500
Resent-Date: Tue, 07 Jan 2020 03:55:15 -0500
Resent-Message-Id: <E1iokdu-0005H0-Pl@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21185)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1iokdu-0005FX-I0
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 03:55:14 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1578387308; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nRZW1OBoMz18+FIkkQhLNd3kzMy9ij+W631VDFy3LDtcO5KDDwtWgF230mibSCpFG6V1byQnxXqnhPynoqOKrepTTLbGMx2NrqCAbsd9bhxUIdqqLmNPaimPOS3VR3ba7CbkZGzDt0jkZz5hnTmU6LlC/lENImnvAwsM6eiKZRM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1578387308;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=/gL+hqE6FcypT4qXMtXAkMrwO0oceCzm2i1NMQoSxuY=; 
 b=Q9QNKK3EG6Y7Ns69o+F8HVOdkmSrCw53Ax/kix1oMzWsmgIG5TQyPTHDEGUgqvKbjkuBrX5ote8nQKiTgNaeNBYnI01JVLMhaJcFSLZtK/6WtMNACJZ2legkFdFFx8LsNlqFM9BsNSuiSi+BaFKUdkAds7/IajBrzxPoYHCZuHs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1578387306523599.3131519661741;
 Tue, 7 Jan 2020 00:55:06 -0800 (PST)
In-Reply-To: <20200107083606.12393-1-kraxel@redhat.com>
Subject: Re: [PATCH] xhci: recheck slot status
Message-ID: <157838730588.32546.15529440671038680188@37313f22b938>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: kraxel@redhat.com
Date: Tue, 7 Jan 2020 00:55:06 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.51
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDEwNzA4MzYwNi4xMjM5
My0xLWtyYXhlbEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUg
c29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5m
b3JtYXRpb246CgpOL0EuIEludGVybmFsIGVycm9yIHdoaWxlIHJlYWRpbmcgbG9nIGZpbGUKCgoK
VGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIw
MDEwNzA4MzYwNi4xMjM5My0xLWtyYXhlbEByZWRoYXQuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/
dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hl
dyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBh
dGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==


