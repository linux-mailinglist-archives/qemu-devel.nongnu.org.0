Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAC964B779
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 15:36:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p56Ml-0000jo-UY; Tue, 13 Dec 2022 09:34:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wanghw364@163.com>) id 1p54av-00041N-Kg
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:41:14 -0500
Received: from m1368.mail.163.com ([220.181.13.68])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wanghw364@163.com>) id 1p54as-00076j-5a
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:41:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=/wW9KgE6zJGlnOaKFlzC7JWzrQ+eGj4mqpsGM7g69w8=; b=U
 yI6cVlEHxw4CBVksDXoyMDsF9KJIU5dd0Fn8pqQJmbQdo9FzLjrzD1By8C9hgQS9
 eP+WCvZsjFvjVwpXkg2XNniQ813XeDNH/PcdH8+lKPtZBBOM4pfrDnBcEhKN8Ukc
 2lWaLLY80LDvUOhpgOS6xZ8Ps95JGE1CAYel/jqeJI=
Received: from wanghw364$163.com ( [183.193.17.50] ) by ajax-webmail-wmsvr68
 (Coremail) ; Tue, 13 Dec 2022 20:25:38 +0800 (CST)
X-Originating-IP: [183.193.17.50]
Date: Tue, 13 Dec 2022 20:25:38 +0800 (CST)
From: wanghw364 <wanghw364@163.com>
To: qemu-devel@nongnu.org
Subject: QEMU function trace
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20220708(c4627114)
 Copyright (c) 2002-2022 www.mailtech.cn 163com
X-NTES-SC: AL_QuycAvWYu0so7iGeYekZk04Vjug9WMK2sv0n2IdXPp80mSrV/w8LZVJkL1DS8NiwNjGXnTWrTDVBy8hGQI5hcqRa32l9M4YLCRbYq1orXVhW
Content-Type: multipart/alternative; 
 boundary="----=_Part_111830_690191940.1670934338176"
MIME-Version: 1.0
Message-ID: <4019c9d3.7721.1850b729a80.Coremail.wanghw364@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: RMGowAD3_ZlCb5hj98GrAA--.41331W
X-CM-SenderInfo: pzdqwxbztwkqqrwthudrp/xtbBawLWB1et7FDCswAAsP
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Received-SPF: pass client-ip=220.181.13.68; envelope-from=wanghw364@163.com;
 helo=m1368.mail.163.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 13 Dec 2022 09:34:40 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

------=_Part_111830_690191940.1670934338176
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

CgoKSGkgYWxsLAoKCkRvZXMgcWVtdS1zeXN0ZW0tcmlzY3Y2NCBoYXZlIGFueSBwbHVnaW4gb3Ig
dG9vbHMgdGhhdCBjYW4gc3VwcG9ydCB0YXJnZXQgcHJvZ3JhbSBmdW5jdGlvbiB0cmFjZSBmZWF0
dXJlPwoKCkl0IHNlZW1zIHRoZXJlIGlzIG5vIHN1Y2ggZmVhdHVyZSB1bmRlciBsaW5rOmh0dHBz
Oi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3QvcWVtdS8tL2Jsb2IvbWFzdGVyL2RvY3MvZGV2ZWwv
dGNnLXBsdWdpbnMucnN0CgoKRm9yIGV4YW1wbGUsIHdlIGNhbiB1c2UgbGliZXhlY2xvZy5zbyBw
bHVnaW4gdG8gdHJhY2UgdGFyZ2V0IHByb2dyYW0gaW5zdHJ1Y3Rpb24gdHJhY2UuCgoKSW4gbXkg
Y2FzZSwgd2hlbiBJIGJvb3QgbGludXgga2VybmVsIHdpdGggcWVtdSwgaXQgaGFuZ3MgaW4gdGhl
IGhhbGZ3YXksIGJ1dCBJIGRvbid0IGtub3cgdGhlIGhhbmcgcG9zaXRpb24gaW4gdGhlIGNvZGUs
IAoKCnNvIEkgd2FudCB0byB0cmFjZSB0aGUga2VybmVsIGZ1bmN0aW9uIGNhbGxpbmcgdHJhY2Ug
c28gdGhhdCBJIGNhbiBmaW5kIG91dCB3aGVuIGFuZCB3aGVyZSBleGVjdXRpb24gZGl2ZXJnZXMu
CgoKCgoKClRoYW5rcy4gCgoKCgoKCgoKCgoKCgoKCgo=
------=_Part_111830_690191940.1670934338176
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6c2ltc3VuLCBTVFNvbmd0aS1TQy1SZWd1bGFyIj48cCBzdHlsZT0ibWFyZ2lu
OjA7Ij48YnI+PC9wPjxkaXYgc3R5bGU9Im1hcmdpbjogMDsiPkhpIGFsbCw8L2Rpdj48ZGl2IHN0
eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0ibWFyZ2luOiAwOyI+RG9lcyBx
ZW11LXN5c3RlbS1yaXNjdjY0IGhhdmUgYW55IHBsdWdpbiBvciB0b29scyB0aGF0IGNhbiBzdXBw
b3J0IHRhcmdldCBwcm9ncmFtIGZ1bmN0aW9uIHRyYWNlIGZlYXR1cmU/PC9kaXY+PGRpdiBzdHls
ZT0ibWFyZ2luOiAwOyI+PGJyPjwvZGl2PjxkaXYgc3R5bGU9Im1hcmdpbjogMDsiPkl0IHNlZW1z
IHRoZXJlIGlzIG5vIHN1Y2ggZmVhdHVyZSB1bmRlciBsaW5rOjxhIGhyZWY9Imh0dHBzOi8vZ2l0
bGFiLmNvbS9xZW11LXByb2plY3QvcWVtdS8tL2Jsb2IvbWFzdGVyL2RvY3MvZGV2ZWwvdGNnLXBs
dWdpbnMucnN0IiBfc3JjPSJodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUvLS9i
bG9iL21hc3Rlci9kb2NzL2RldmVsL3RjZy1wbHVnaW5zLnJzdCI+aHR0cHM6Ly9naXRsYWIuY29t
L3FlbXUtcHJvamVjdC9xZW11Ly0vYmxvYi9tYXN0ZXIvZG9jcy9kZXZlbC90Y2ctcGx1Z2lucy5y
c3Q8L2E+IDwvZGl2PjxkaXYgc3R5bGU9Im1hcmdpbjogMDsiPjxicj48L2Rpdj48ZGl2IHN0eWxl
PSJtYXJnaW46IDA7Ij5Gb3IgZXhhbXBsZSwgd2UgY2FuIHVzZSBsaWJleGVjbG9nLnNvIHBsdWdp
biB0byB0cmFjZSB0YXJnZXQgcHJvZ3JhbSBpbnN0cnVjdGlvbiB0cmFjZS48L2Rpdj48ZGl2IHN0
eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0ibWFyZ2luOiAwOyI+SW4gbXkg
Y2FzZSwgd2hlbiBJIGJvb3QgbGludXgga2VybmVsIHdpdGggcWVtdSwgaXQgaGFuZ3MgaW4gdGhl
IGhhbGZ3YXksIGJ1dCBJIGRvbid0IGtub3cgdGhlIGhhbmcgcG9zaXRpb24gaW4gdGhlIGNvZGUs
Jm5ic3A7PC9kaXY+PGRpdiBzdHlsZT0ibWFyZ2luOiAwOyI+PGJyPjwvZGl2PjxkaXYgc3R5bGU9
Im1hcmdpbjogMDsiPnNvIEkgd2FudCB0byB0cmFjZSB0aGUga2VybmVsIGZ1bmN0aW9uIGNhbGxp
bmcgdHJhY2Ugc28gdGhhdCBJIGNhbiBmaW5kIG91dCB3aGVuIGFuZCB3aGVyZSBleGVjdXRpb24g
ZGl2ZXJnZXMuPC9kaXY+PGRpdiBzdHlsZT0ibWFyZ2luOiAwOyI+PGJyPjwvZGl2PjxkaXYgc3R5
bGU9Im1hcmdpbjogMDsiPjxicj48L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9k
aXY+PGRpdiBzdHlsZT0ibWFyZ2luOiAwOyI+VGhhbmtzLiZuYnNwOzwvZGl2PjxkaXYgc3R5bGU9
Im1hcmdpbjogMDsiPjxicj48L2Rpdj48cCBzdHlsZT0ibWFyZ2luOiAwOyI+PGJyPjwvcD48cCBz
dHlsZT0ibWFyZ2luOiAwOyI+PGJyPjwvcD48cCBzdHlsZT0ibWFyZ2luOiAwOyI+PGJyPjwvcD48
cCBzdHlsZT0ibWFyZ2luOiAwOyI+PGJyPjwvcD48ZGl2IHN0eWxlPSJwb3NpdGlvbjpyZWxhdGl2
ZTt6b29tOjEiPjxwIHN0eWxlPSJtYXJnaW46IDAiPjxicj48L3A+PGRpdiBzdHlsZT0iY2xlYXI6
Ym90aCI+PC9kaXY+PC9kaXY+PC9kaXY+
------=_Part_111830_690191940.1670934338176--


