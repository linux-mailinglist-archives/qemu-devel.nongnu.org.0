Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA8665F94E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 02:51:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDbsu-0002X4-OA; Thu, 05 Jan 2023 20:51:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangdongdong@eswincomputing.com>)
 id 1pDbsp-0002Wq-7T
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 20:51:00 -0500
Received: from azure-sdnproxy.icoremail.net ([20.232.28.96])
 by eggs.gnu.org with smtp (Exim 4.90_1)
 (envelope-from <zhangdongdong@eswincomputing.com>)
 id 1pDbsm-0006D3-Sr
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 20:50:58 -0500
Received: from zhangdongdong$eswincomputing.com ( [10.12.96.123] ) by
 ajax-webmail-app2 (Coremail) ; Fri, 6 Jan 2023 09:50:44 +0800 (GMT+08:00)
X-Originating-IP: [10.12.96.123]
Date: Fri, 6 Jan 2023 09:50:44 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Dongdong Zhang" <zhangdongdong@eswincomputing.com>
To: "John Snow" <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, crosa@redhat.com, bleal@redhat.com
Subject: Re: Re: [PING PATCH 0/1] Fix some typos
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT6.0.3 build 20220420(169d3f8c)
 Copyright (c) 2002-2023 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <CAFn=p-bnm5WgBO-eXTyuV+mPiCYaLM-rFaUVXY+kmU39GvwpZw@mail.gmail.com>
References: <20221130015358.6998-1-zhangdongdong@eswincomputing.com>
 <1ceb5a68.dd0e.18518f40d8f.Coremail.zhangdongdong@eswincomputing.com>
 <CAFn=p-bnm5WgBO-eXTyuV+mPiCYaLM-rFaUVXY+kmU39GvwpZw@mail.gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <2a334c7d.1060e.18584c5f906.Coremail.zhangdongdong@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: EggMCgBX5i91frdjrwchAA--.22753W
X-CM-SenderInfo: x2kd0wpgrqwvxrqjqvxvzl0uprps33xlqjhudrp/1tbiAQEDCmO3F
 gEJOwABs5
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Received-SPF: pass client-ip=20.232.28.96;
 envelope-from=zhangdongdong@eswincomputing.com;
 helo=azure-sdnproxy.icoremail.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

SGkgSm9obiwKCkNvdWxkIHlvdSBoZWxwIG1lIHJlbGF5IHRoZXNlIGZpeGVzPyAKSWYgSSBzdWJt
aXQgYSBwdWxsIHJlcXVlc3QsIEkgd2lsbCBnbyB0aHJvdWdoIGNvbXBhbnkncyBpbnRlcm5hbCBy
ZXZpZXcgcHJvY2VzcyBhZ2Fpbi4gCgpUaGFua3MgYSBsb3QhCgpEb25nZG9uZwoKCj4gLS0tLS3l
jp/lp4vpgq7ku7YtLS0tLeWPkeS7tuS6ujoiSm9obiBTbm93IiA8anNub3dAcmVkaGF0LmNvbT7l
j5HpgIHml7bpl7Q6MjAyMy0wMS0wNiAwNzoyNTo0MyAo5pif5pyf5LqUKeaUtuS7tuS6ujoiRG9u
Z2RvbmcgWmhhbmciIDx6aGFuZ2Rvbmdkb25nQGVzd2luY29tcHV0aW5nLmNvbT7mioTpgIE6cWVt
dS1kZXZlbEBub25nbnUub3JnLCBjcm9zYUByZWRoYXQuY29tLCBibGVhbEByZWRoYXQuY29t5Li7
6aKYOlJlOiBbUElORyBQQVRDSCAwLzFdIEZpeCBzb21lIHR5cG9zCj4gCj4gT24gVGh1LCBEZWMg
MTUsIDIwMjIgYXQgMTA6MjIgUE0gRG9uZ2RvbmcgWmhhbmcKPiA8emhhbmdkb25nZG9uZ0Blc3dp
bmNvbXB1dGluZy5jb20+IHdyb3RlOgo+ID4KPiA+IEhpIGFsbCwKPiA+Cj4gPiBJIHdvdWxkIGxp
a2UgdG8gcGluZyBhIHBhdGNoCj4gPgo+ID4gaHR0cHM6Ly9saXN0cy5ub25nbnUub3JnL2FyY2hp
dmUvaHRtbC9xZW11LWRldmVsLzIwMjItMTEvbXNnMDQ1NjguaHRtbAo+ID4gaHR0cHM6Ly9saXN0
cy5ub25nbnUub3JnL2FyY2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMjItMTEvbXNnMDQ1NzAuaHRt
bAo+ID4KPiA+Cj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZXMtLS0tLUZyb206IkRvbmdkb25n
IFpoYW5nIiA8emhhbmdkb25nZG9uZ0Blc3dpbmNvbXB1dGluZy5jb20+U2VudCBUaW1lOjIwMjIt
MTEtMzAgMDk6NTM6NTcgKFdlZG5lc2RheSlUbzpxZW11LWRldmVsQG5vbmdudS5vcmdDYzpqc25v
d0ByZWRoYXQuY29tLCBjcm9zYUByZWRoYXQuY29tLCBibGVhbEByZWRoYXQuY29tLCAiRG9uZ2Rv
bmcgWmhhbmciIDx6aGFuZ2Rvbmdkb25nQGVzd2luY29tcHV0aW5nLmNvbT5TdWJqZWN0OltQQVRD
SCAwLzFdICBGaXggc29tZSB0eXBvcwo+ID4gPgo+ID4gPiBUaGlzIHBhdGNoIG1haW5seSBmaXhl
cyBzb21lIHR5cG9zIGluIHRoZSAncHl0aG9uJyBkaXJlY3RvcnkuCj4gPiA+Cj4gPiA+IERvbmdk
b25nIFpoYW5nICgxKToKPiA+ID4gICBGaXggc29tZSB0eXBvcwo+ID4gPgo+ID4gPiAgcHl0aG9u
L3FlbXUvbWFjaGluZS9jb25zb2xlX3NvY2tldC5weSB8IDIgKy0KPiA+ID4gIHB5dGhvbi9xZW11
L21hY2hpbmUvcXRlc3QucHkgICAgICAgICAgfCAyICstCj4gPiA+ICBweXRob24vcWVtdS9xbXAv
cHJvdG9jb2wucHkgICAgICAgICAgIHwgMiArLQo+ID4gPiAgcHl0aG9uL3FlbXUvcW1wL3FtcF90
dWkucHkgICAgICAgICAgICB8IDYgKysrLS0tCj4gPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gLS0KPiA+ID4gMi4xNy4xCj4g
Cj4gQUNLIHRvIHRoaXMgcGF0Y2guCj4gCj4gRm9yIGZpeGVzIHVuZGVyIHB5dGhvbi9xZW11L3Ft
cC8sIEkgbmVlZCB0byByZWxheSB0aGVzZSBmaXhlcyBvdmVyIHRvCj4gaHR0cHM6Ly9naXRsYWIu
Y29tL3FlbXUtcHJvamVjdC9weXRob24tcWVtdS1xbXAgLS0geW91IGNhbiBkbyBpdAo+IHlvdXJz
ZWxmIGFuZCBzZW5kIGEgc21hbGwgbWVyZ2UgcmVxdWVzdCwgb3IgSSBjYW4gZG8gaXQgZm9yIHlv
dSwgaWYKPiB5b3UnZCBsaWtlLiBQbGVhc2UgbGV0IG1lIGtub3cgd2hhdCB5b3UnZCBwcmVmZXIs
IGFuZCB0aGVuIEkgd2lsbAo+IHN0YWdlIHRoaXMgcGF0Y2guCj4gCj4gKEFwb2xvZ2llcyB0aGF0
IHRoZSBjb2RlIGlzIGR1cGxpY2F0ZWQgaW4gdHdvIHJlcG9zaXRvcmllcyByaWdodAo+IG5vdy4u
Li4gSSdtIHdvcmtpbmcgb24gZml4aW5nIHRoYXQuKQo+IAo+IC0tanMK

