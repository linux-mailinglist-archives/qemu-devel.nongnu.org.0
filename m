Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A68F11326E1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 14:00:28 +0100 (CET)
Received: from localhost ([::1]:48210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iooTB-0003N6-Ou
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 08:00:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56245)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1ionvq-0001Y1-Qh
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:25:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1ionvp-0000Zh-KX
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:25:58 -0500
Resent-Date: Tue, 07 Jan 2020 07:25:58 -0500
Resent-Message-Id: <E1ionvp-0000Zh-KX@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21116)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1ionvp-0000Z9-D5
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:25:57 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1578399942; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GhYSYSwL4tHFo3GK3zx14nO58aQ/Uk1pP6RoaCL3p5ierRgQufsdsJWwT/9/MW/Rf0f9FVsToq50zeK6fKd/YgiO7VaEBv5efNF4yYxfGBWaFHDA6WEJ8JRn3WhzgnwTcI8GRoN7IfM7GdidtjHvtqhhXUzo881/jNrxQQtCES8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1578399942;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=mFl+xX00e6a0HXwfPIT5moPt5qklI19eggcmxCLmUU8=; 
 b=guG1L6SLybCpZA7x00DEir9HmO50wvoV1X02J1JNZlnnwwFtzp+qKUjSYtEDdCUjTahJsd/xTPyoEUNwpqElUiZQMs1I9be6UEz5eo9s95c7zIYrwLZyIYuS8uOWomAzsCxNlMNSmsPPpAbshRHNRBm88LO2EjtXrqbkD2bsOz4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1578399938378190.09249149101674;
 Tue, 7 Jan 2020 04:25:38 -0800 (PST)
In-Reply-To: <20200107111340.334965-1-fflorensa@online.net>
Subject: Re: [PATCH v2 0/1] block/rbd: Add support for ceph namespaces
Message-ID: <157839993776.799.14711854682294607608@37313f22b938>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: fflorensa@online.net
Date: Tue, 7 Jan 2020 04:25:38 -0800 (PST)
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
Cc: kwolf@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, dillaman@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDEwNzExMTM0MC4zMzQ5
NjUtMS1mZmxvcmVuc2FAb25saW5lLm5ldC8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKTi9BLiBJbnRlcm5hbCBlcnJvciB3aGlsZSByZWFkaW5nIGxvZyBmaWxl
CgoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3Mv
MjAyMDAxMDcxMTEzNDAuMzM0OTY1LTEtZmZsb3JlbnNhQG9ubGluZS5uZXQvdGVzdGluZy5jaGVj
a3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBi
eSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJh
Y2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t


