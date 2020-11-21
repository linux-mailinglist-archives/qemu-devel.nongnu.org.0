Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B672BBE79
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 11:27:40 +0100 (CET)
Received: from localhost ([::1]:58000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgQ7H-0002xX-4v
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 05:27:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1kgQ6E-0002Yj-93
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 05:26:34 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:36986
 helo=v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1kgQ6C-0002bA-5G
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 05:26:33 -0500
Received: from localhost (localhost [127.0.0.1])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 87833DA44E8;
 Sat, 21 Nov 2020 11:26:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
 by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id CdfRBV8np73p; Sat, 21 Nov 2020 11:25:54 +0100 (CET)
Received: from edv-macbook-pro.fritz.box (p57b420e8.dip0.t-ipconnect.de
 [87.180.32.232])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 031DDDA1255;
 Sat, 21 Nov 2020 11:25:53 +0100 (CET)
To: Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <97b04446-ca94-cebd-2d8d-4c2013521208@weilnetz.de>
 <20201117175030.eqz5run2m7qmx5qt@steredhat>
 <a6c8de1a-da41-1a4a-8907-790c2467a0b0@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: Regressions in build process introduced since August
Message-ID: <ee31c6f2-19dd-f3f6-d916-f04490909dd8@weilnetz.de>
Date: Sat, 21 Nov 2020 11:25:53 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <a6c8de1a-da41-1a4a-8907-790c2467a0b0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGksCgpJIGp1c3Qgbm90aWNlZCBhbm90aGVyIHJlZ3Jlc3Npb246CgpBIGNyb3NzIGJ1aWxk
IHRhcmdldGluZyBXaW5kb3dzIG5vIGxvbmdlciBkZXRlY3RzIFZOQyBKUEVHIHN1cHBvcnQu
IApVc2luZyBwa2ctY29uZmlnIGxpa2UgaW4gdGhlIHBhdGNoIGJlbG93IHdvdWxkIGZpeCB0
aGF0IChhbmQgYWxzbyB3b3JrcyAKZm9yIG5hdGl2ZSBidWlsZHMgb24gRGViaWFuIEdOVSBM
aW51eCkuCgpNYXliZSB0aGUgY3VycmVudCBmaW5kX2xpYnJhcnkgaWdub3JlcyAtLWV4dHJh
LWNmbGFncyBhbmQgCi0tZXh0cmEtbGRmbGFncz8gVGhhdCB3b3VsZCBleHBsYWluIHdoeSBp
dCBmYWlscyB0byBmaW5kIHRoZSByZXF1aXJlZCAKaGVhZGVyIGFuZCBsaWJyYXJ5IGZpbGVz
LiBPdGhlciBjaGVja3Mgd291bGQgZmFpbCB0aGVuLCB0b28uCgpSZWdhcmRzLAoKU3RlZmFu
CgoKLS0tIGEvbWVzb24uYnVpbGQKKysrIGIvbWVzb24uYnVpbGQKQEAgLTY0OSw5ICs2NDks
OCBAQCBpZiBnZXRfb3B0aW9uKCd2bmMnKS5lbmFibGVkKCkKIMKgwqAgdm5jID0gZGVjbGFy
ZV9kZXBlbmRlbmN5KCkgIyBkdW1teSBkZXBlbmRlbmN5CiDCoMKgIHBuZyA9IGRlcGVuZGVu
Y3koJ2xpYnBuZycsIHJlcXVpcmVkOiBnZXRfb3B0aW9uKCd2bmNfcG5nJyksCiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZXRob2Q6ICdwa2ctY29uZmlnJywg
c3RhdGljOiBlbmFibGVfc3RhdGljKQotwqAganBlZyA9IGNjLmZpbmRfbGlicmFyeSgnanBl
ZycsIGhhc19oZWFkZXJzOiBbJ2pwZWdsaWIuaCddLAotwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlcXVpcmVkOiBnZXRfb3B0aW9uKCd2bmNf
anBlZycpLAotwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHN0YXRpYzogZW5hYmxlX3N0YXRpYykKK8KgIGpwZWcgPSBkZXBlbmRlbmN5KCdsaWJw
bmcnLCByZXF1aXJlZDogZ2V0X29wdGlvbigndm5jX2pwZWcnKSwKK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZXRob2Q6ICdwa2ctY29uZmlnJywgc3RhdGljOiBl
bmFibGVfc3RhdGljKQogwqDCoCBzYXNsID0gY2MuZmluZF9saWJyYXJ5KCdzYXNsMicsIGhh
c19oZWFkZXJzOiBbJ3Nhc2wvc2FzbC5oJ10sCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXF1aXJlZDogZ2V0X29wdGlvbigndm5jX3Nh
c2wnKSwKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHN0YXRpYzogZW5hYmxlX3N0YXRpYykKCg==

