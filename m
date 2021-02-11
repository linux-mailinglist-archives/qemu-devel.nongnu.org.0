Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABAC3188EE
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 12:06:06 +0100 (CET)
Received: from localhost ([::1]:35102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA9nR-0007k8-ED
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 06:06:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lA9mR-000781-Dp; Thu, 11 Feb 2021 06:05:03 -0500
Resent-Date: Thu, 11 Feb 2021 06:05:03 -0500
Resent-Message-Id: <E1lA9mR-000781-Dp@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lA9mN-0002S4-T1; Thu, 11 Feb 2021 06:05:02 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1613041471; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CLltYurgaFlgw3ujaIu+Ug7KmWLrD/WzJPjBaylr6sAu6a0bESR3Tmdq6tu5657rgkBQIirbzogOrCozLY85bABW/TGurwgG6l3VGEUwd/7CXsyi8/JOVNmANTaR3T6khBaYyfM6Dlyg/VUttBqDOBPWejwGtKqnRSz+kxvQCCE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1613041471;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=Cnqai8k2sFSUtQDS7IMmscCNGRPkYtO6/sC3MnjEl98=; 
 b=TbFXRLCH6vBcH6OTjANKCifoPCDCgsNYI3uuAANPd4HsS80lWUpdQzP6jOoalIfj8z0SKSt7GUN/MsaRXpt9jeaHKrMNBdVuC6Z7OZTRZnBhWx7dYYFGkdO1Dtqlnk5nDLmWqyZvot/7k3Zsx8sbQDtIE8tvkMdWBFeTHsYFLmQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1613041469025745.2449533651692;
 Thu, 11 Feb 2021 03:04:29 -0800 (PST)
In-Reply-To: <1612923021-19746-1-git-send-email-bmeng.cn@gmail.com>
Subject: Re: [PATCH v3] hw/net: fsl_etsec: Reverse the RCTRL.RSF logic
Message-ID: <161304146734.26113.2003471194112317308@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: bmeng.cn@gmail.com
Date: Thu, 11 Feb 2021 03:04:29 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, jasowang@redhat.com, bin.meng@windriver.com,
 groug@kaod.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNjEyOTIzMDIxLTE5NzQ2LTEt
Z2l0LXNlbmQtZW1haWwtYm1lbmcuY25AZ21haWwuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNl
ZW1zIHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cg
Zm9yCm1vcmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMTYxMjkyMzAy
MS0xOTc0Ni0xLWdpdC1zZW5kLWVtYWlsLWJtZW5nLmNuQGdtYWlsLmNvbQpTdWJqZWN0OiBbUEFU
Q0ggdjNdIGh3L25ldDogZnNsX2V0c2VjOiBSZXZlcnNlIHRoZSBSQ1RSTC5SU0YgbG9naWMKCj09
PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4g
L2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAw
CmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwg
ZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJh
Y2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZm
ODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNo
ZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvY292ZXIuMTYxMjk1
MzQxOS5naXQucGtyZW1wYUByZWRoYXQuY29tIC0+IHBhdGNoZXcvY292ZXIuMTYxMjk1MzQxOS5n
aXQucGtyZW1wYUByZWRoYXQuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKCj09
PSBPVVRQVVQgQkVHSU4gPT09CmNoZWNrcGF0Y2gucGw6IG5vIHJldmlzaW9ucyByZXR1cm5lZCBm
b3IgcmV2bGlzdCAnYmFzZS4uJwo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0
ZWQgd2l0aCBjb2RlOiAyNTUKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9w
YXRjaGV3Lm9yZy9sb2dzLzE2MTI5MjMwMjEtMTk3NDYtMS1naXQtc2VuZC1lbWFpbC1ibWVuZy5j
bkBnbWFpbC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBn
ZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10u
ClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

