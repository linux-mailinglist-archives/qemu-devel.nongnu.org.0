Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D37F1CA7C7
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 12:01:50 +0200 (CEST)
Received: from localhost ([::1]:36344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWzpE-0006RY-VE
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 06:01:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <1482995675@qq.com>) id 1jWznz-0005BH-4i
 for qemu-devel@nongnu.org; Fri, 08 May 2020 06:00:31 -0400
Received: from smtpbgeu1.qq.com ([52.59.177.22]:35385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <1482995675@qq.com>) id 1jWzns-0004FF-Tv
 for qemu-devel@nongnu.org; Fri, 08 May 2020 06:00:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1588932013; bh=wNpwT9q56nZU4bIaUjs8+j3Nv+poZj/Hooauf1HxQC0=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=ig5QPXfY51DsbHKDoIRGvmKhJf3w0IkwePyOMNcpgKproBJ2usvfABkOQ/Pe2mXCu
 8MgNTmRgCSOwySGkpuJuBbE2InDCbb9bLlOwZeL1jbqovMrr/+W+xoAX+EHeKxG+lO
 aSpb0LtZrCTt29sQ5/lSByyaSdzS/QIBIX4UkuzE=
X-QQ-FEAT: UqeVckw21VbcvJ2XoBAzaZXYwatd3s6FJapiZlo14xNv1SKpZPsIbnDE59nX4
 AVy9Ykej+0yi0b6uKrKziZ+edUyVBXoxm150W7o9ctl5h+LBZkF7lvw25v1oIQL246s7iE6
 jyzZU/5feEtIcUwmj+An2g/mQ0JiXoyeIlf0RNyhccwCsFsM7iDcUhUizJ6WHkcjLuVHbxB
 8P2EeMRIEYFMkbt/5OH+g9waVVBUoGRgqfxbHe+oOD+Cc0S7WIuNJhD4nY/HfWDU4bdsEPb
 gZgmljlccgv56o6dZ9FqEOJxc=
X-QQ-SSF: 000100000000009000000000000000D
X-QQ-XMAILINFO: OC9lFa73oN0RKMLXbudefm6lEiYe7EdXCzpdK9OyRhY69xrYQGTCmWS5FErxey
 Fr61fXtlTY0iNoUQQbVrG+rNp4uTdpG3fKvJJ8qIYzTwfGnR+qdz/sGFICQ6f25bQC6PlbQe6zHIi
 im4rBUGgYcKvctdZpOVjU/7iKCYm29ISiZXBkyLr04FZWi07PIM7pjSauGyXigejtpQCoGJekhYbi
 uYpBYwY6mdErAygS/4Z0fOEwCSmUt7ht95Bk17wvT0HpuNNiQcsvCCWeumNReaKqh7Nt8+DwCo6XK
 X8qWRSD9EiKl1663pfl512XYDcgJrvgCQFFnCAtzuT0xmt1uSIXP9k/VFrxu/wbc2aAn3FPIUSnkk
 PkA5us8pQyTMN8b8Jy6tWBKFwyASKr3QsRZlzYUVmEW/FzrA+jGD8cyfMjgP1Ro2YgpC9lKcBSrAY
 VKdhwNeikqweT7q99nlOj9aUnL48jOYaa41zEwD75DLn9tS9CRODcea6plH3PbmVOZpNlS8Wbz0aA
 I2WpN3CspnDoKK8m/8YACnZGjDUiDOa4uT0kah/GfQW5hLVy4ls+7hO+SbdIFctgq2ZR4slmz4w0m
 7vh7DrVMahxYYVVwG/tbzBuZlg8MCsyJgwtPFLmZA==
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 54.180.176.61
X-QQ-STYLE: 
X-QQ-mid: webmail725t1588932011t7912555
From: "=?gb18030?B?Y2FzbWFj?=" <1482995675@qq.com>
To: "=?gb18030?B?cWVtdS1kZXZlbA==?=" <qemu-devel@nongnu.org>
Subject: how to run qemu test
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5EB52DAB_0F807E80_08A84796"
Content-Transfer-Encoding: 8Bit
Date: Fri, 8 May 2020 18:00:11 +0800
X-Priority: 3
Message-ID: <tencent_D787B2532D5D3E3EBC6DD3B6A714D4106F08@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Fri, 08 May 2020 18:00:13 +0800 (CST)
Feedback-ID: webmail:qq.com:bgforeign:bgforeign12
X-QQ-Bgrelay: 1
Received-SPF: pass client-ip=52.59.177.22; envelope-from=1482995675@qq.com;
 helo=smtpbgeu1.qq.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 06:00:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: 62
X-Spam_score: 6.2
X-Spam_bar: ++++++
X-Spam_report: (6.2 / 5.0 requ) BAYES_05=-0.5, CHARSET_FARAWAY_HEADER=3.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, FROM_EXCESS_BASE64=0.979,
 HTML_MESSAGE=0.001, MIME_CHARSET_FARAWAY=2.45, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: reject
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.

------=_NextPart_5EB52DAB_0F807E80_08A84796
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

SGkgYWxsLA0KJm5ic3A7ICZuYnNwO0kgYW0gaGF2aW5nIHRyb3VibGUgcnVubmluZyBxZW11
IHRlc3RzLiBiYXNpY2FsbHkgLGNhbiBub3QgcnVuIGNoZWNrLXRjZyBhbmQgY2hlY2stdW5p
dC4NCiZuYnNwOyBCZWZvcmUgZXhlY3V0aW5nIHRoZSB0ZXN0cywgSSBkaWQgdGhlIGNvbmZp
Z3VyYXRpb26juiZuYnNwO2NvbmZpZ3VyZSAtLXRhcmdldC1saXN0PXNwYXJjLXNvZnRtbXUg
LS1jcm9zcy1wcmVmaXg9eDg2XzY0LXc2NC1taW5ndzMyLSAtLWVuYWJsZS1ndGsgLS1lbmFi
bGUtc2RsIC0tZW5hYmxlLWRlYnVnDQombmJzcDsgVGhlIHNvdXJjZSBjb2RlIGlzIGJ1aWx0
Jm5ic3A7IGFscmlndGh0IC4gYnV0IGNhbiBub3QgZXhlY3V0ZSB0aGUgdGVzdHMuDQombmJz
cDsgUnVubmluZyBtYWtlIGNoZWNrLXRjZyByZXR1cm5lZCBub3RoaW5nIGJ1dDoNCiQgbWFr
ZSBjaGVjay10Y2cNCiZuYnNwOyBCVUlMRCZuYnNwOyAmbmJzcDtUQ0cgdGVzdHMgZm9yIHNw
YXJjLXNvZnRtbXUNCiZuYnNwOyBCVUlMRCZuYnNwOyAmbmJzcDtzcGFyYy1zb2Z0bW11IGd1
ZXN0LXRlc3RzIFNLSVBQRUQNCiZuYnNwOyBSVU4mbmJzcDsgJm5ic3A7ICZuYnNwO1RDRyB0
ZXN0cyBmb3Igc3BhcmMtc29mdG1tdQ0KJm5ic3A7IFJVTiZuYnNwOyAmbmJzcDsgJm5ic3A7
dGVzdHMgZm9yIHNwYXJjLXNvZnRtbXUgU0tJUFBFRA0KDQoNCg0KJm5ic3A7IFJ1bmluZyBt
YWtlIGNoZWNrLXVuaXQsIGdpdmUgbWUgInVuZGVmaW5lZCByZWZlcmVuY2UiZXJyb3IgbWVz
c2FnZaO6DQokIG1ha2UgY2hlY2stdW5pdA0KQzovbXN5czY0L21pbmd3NjQvYmluLy4uL2xp
Yi9nY2MveDg2XzY0LXc2NC1taW5ndzMyLzkuMy4wLy4uLy4uLy4uLy4uL3g4Nl82NC13NjQt
bWluZ3czMi9iaW4vbGQuZXhlOiB0ZXN0cy90ZXN0LWJpdG1hcC5vOiBpbiBmdW5jdGlvbiBg
Y2hlY2tfYml0bWFwX2NvcHlfd2l0aF9vZmZzZXQnOg0KRDovY3VpeC93b3Jrc3BhY2VfZGV2
bC9xZW11LTQuMi4wL3Rlc3RzL3Rlc3QtYml0bWFwLmM6MjU6IHVuZGVmaW5lZCByZWZlcmVu
Y2UgdG8gYHJhbmRvbScNCkM6L21zeXM2NC9taW5ndzY0L2Jpbi8uLi9saWIvZ2NjL3g4Nl82
NC13NjQtbWluZ3czMi85LjMuMC8uLi8uLi8uLi8uLi94ODZfNjQtdzY0LW1pbmd3MzIvYmlu
L2xkLmV4ZTogRDovY3VpeC93b3Jrc3BhY2VfZGV2bC9xZW11LTQuMi4wL3Rlc3RzL3Rlc3Qt
Yml0bWFwLmM6MjY6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHJhbmRvbScNCkM6L21zeXM2
NC9taW5ndzY0L2Jpbi8uLi9saWIvZ2NjL3g4Nl82NC13NjQtbWluZ3czMi85LjMuMC8uLi8u
Li8uLi8uLi94ODZfNjQtdzY0LW1pbmd3MzIvYmluL2xkLmV4ZTogRDovY3VpeC93b3Jrc3Bh
Y2VfZGV2bC9xZW11LTQuMi4wL3Rlc3RzL3Rlc3QtYml0bWFwLmM6Mjc6IHVuZGVmaW5lZCBy
ZWZlcmVuY2UgdG8gYHJhbmRvbScNCkM6L21zeXM2NC9taW5ndzY0L2Jpbi8uLi9saWIvZ2Nj
L3g4Nl82NC13NjQtbWluZ3czMi85LjMuMC8uLi8uLi8uLi8uLi94ODZfNjQtdzY0LW1pbmd3
MzIvYmluL2xkLmV4ZTogRDovY3VpeC93b3Jrc3BhY2VfZGV2bC9xZW11LTQuMi4wL3Rlc3Rz
L3Rlc3QtYml0bWFwLmM6Mjg6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHJhbmRvbScNCmNv
bGxlY3QyLmV4ZTogZXJyb3I6IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0dXMNCm1ha2U6ICoq
KiBbL2QvY3VpeC93b3Jrc3BhY2VfZGV2bC9xZW11LTQuMi4wL3J1bGVzLm1hazoxMjSjunRl
c3RzL3Rlc3QtYml0bWFwLmV4ZV0gZXJyb3ImbmJzcDsgMQ0KDQoNCg0KJm5ic3A7ICZuYnNw
O1NvbWV0aGluZyB3ZW50IHdyb25nIGJ1dCBJIGhhdmUgbm8gY2x1ZSBhdCBhbGwuIEFueSBz
dWdnZXN0aW9ucz8mbmJzcDsNCiZuYnNwOyAmbmJzcDtUaGFua3MgYSBsb3QuDQoNCg0KcmVn
YXJkcywNCg0KDQp4aWFvbGVp

------=_NextPart_5EB52DAB_0F807E80_08A84796
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PGRpdj5IaSBhbGwsPC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7SSBh
bSBoYXZpbmcgdHJvdWJsZSBydW5uaW5nIHFlbXUgdGVzdHMuIGJhc2ljYWxseSAsY2FuIG5v
dCBydW4gY2hlY2stdGNnIGFuZCBjaGVjay11bml0LjwvZGl2PjxkaXY+Jm5ic3A7IEJlZm9y
ZSBleGVjdXRpbmcgdGhlIHRlc3RzLCBJIGRpZCB0aGUgY29uZmlndXJhdGlvbqO6Jm5ic3A7
Y29uZmlndXJlIC0tdGFyZ2V0LWxpc3Q9c3BhcmMtc29mdG1tdSAtLWNyb3NzLXByZWZpeD14
ODZfNjQtdzY0LW1pbmd3MzItIC0tZW5hYmxlLWd0ayAtLWVuYWJsZS1zZGwgLS1lbmFibGUt
ZGVidWc8L2Rpdj48ZGl2PiZuYnNwOyBUaGUgc291cmNlIGNvZGUgaXMgYnVpbHQmbmJzcDsg
YWxyaWd0aHQgLiBidXQgY2FuIG5vdCBleGVjdXRlIHRoZSB0ZXN0cy48L2Rpdj48ZGl2PiZu
YnNwOyBSdW5uaW5nIG1ha2UgY2hlY2stdGNnIHJldHVybmVkIG5vdGhpbmcgYnV0OjwvZGl2
PjxkaXY+PGRpdj4kIG1ha2UgY2hlY2stdGNnPC9kaXY+PGRpdj4mbmJzcDsgQlVJTEQmbmJz
cDsgJm5ic3A7VENHIHRlc3RzIGZvciBzcGFyYy1zb2Z0bW11PC9kaXY+PGRpdj4mbmJzcDsg
QlVJTEQmbmJzcDsgJm5ic3A7c3BhcmMtc29mdG1tdSBndWVzdC10ZXN0cyBTS0lQUEVEPC9k
aXY+PGRpdj4mbmJzcDsgUlVOJm5ic3A7ICZuYnNwOyAmbmJzcDtUQ0cgdGVzdHMgZm9yIHNw
YXJjLXNvZnRtbXU8L2Rpdj48ZGl2PiZuYnNwOyBSVU4mbmJzcDsgJm5ic3A7ICZuYnNwO3Rl
c3RzIGZvciBzcGFyYy1zb2Z0bW11IFNLSVBQRUQ8L2Rpdj48L2Rpdj48ZGl2Pjxicj48L2Rp
dj48ZGl2PiZuYnNwOyBSdW5pbmcgbWFrZSBjaGVjay11bml0LCBnaXZlIG1lICJ1bmRlZmlu
ZWQgcmVmZXJlbmNlImVycm9yIG1lc3NhZ2WjujwvZGl2PjxkaXY+JCBtYWtlIGNoZWNrLXVu
aXQ8L2Rpdj48ZGl2PjxkaXY+QzovbXN5czY0L21pbmd3NjQvYmluLy4uL2xpYi9nY2MveDg2
XzY0LXc2NC1taW5ndzMyLzkuMy4wLy4uLy4uLy4uLy4uL3g4Nl82NC13NjQtbWluZ3czMi9i
aW4vbGQuZXhlOiB0ZXN0cy90ZXN0LWJpdG1hcC5vOiBpbiBmdW5jdGlvbiBgY2hlY2tfYml0
bWFwX2NvcHlfd2l0aF9vZmZzZXQnOjwvZGl2PjxkaXY+RDovY3VpeC93b3Jrc3BhY2VfZGV2
bC9xZW11LTQuMi4wL3Rlc3RzL3Rlc3QtYml0bWFwLmM6MjU6IHVuZGVmaW5lZCByZWZlcmVu
Y2UgdG8gYHJhbmRvbSc8L2Rpdj48ZGl2PkM6L21zeXM2NC9taW5ndzY0L2Jpbi8uLi9saWIv
Z2NjL3g4Nl82NC13NjQtbWluZ3czMi85LjMuMC8uLi8uLi8uLi8uLi94ODZfNjQtdzY0LW1p
bmd3MzIvYmluL2xkLmV4ZTogRDovY3VpeC93b3Jrc3BhY2VfZGV2bC9xZW11LTQuMi4wL3Rl
c3RzL3Rlc3QtYml0bWFwLmM6MjY6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHJhbmRvbSc8
L2Rpdj48ZGl2PkM6L21zeXM2NC9taW5ndzY0L2Jpbi8uLi9saWIvZ2NjL3g4Nl82NC13NjQt
bWluZ3czMi85LjMuMC8uLi8uLi8uLi8uLi94ODZfNjQtdzY0LW1pbmd3MzIvYmluL2xkLmV4
ZTogRDovY3VpeC93b3Jrc3BhY2VfZGV2bC9xZW11LTQuMi4wL3Rlc3RzL3Rlc3QtYml0bWFw
LmM6Mjc6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHJhbmRvbSc8L2Rpdj48ZGl2PkM6L21z
eXM2NC9taW5ndzY0L2Jpbi8uLi9saWIvZ2NjL3g4Nl82NC13NjQtbWluZ3czMi85LjMuMC8u
Li8uLi8uLi8uLi94ODZfNjQtdzY0LW1pbmd3MzIvYmluL2xkLmV4ZTogRDovY3VpeC93b3Jr
c3BhY2VfZGV2bC9xZW11LTQuMi4wL3Rlc3RzL3Rlc3QtYml0bWFwLmM6Mjg6IHVuZGVmaW5l
ZCByZWZlcmVuY2UgdG8gYHJhbmRvbSc8L2Rpdj48ZGl2PmNvbGxlY3QyLmV4ZTogZXJyb3I6
IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0dXM8L2Rpdj48ZGl2Pm1ha2U6ICoqKiBbL2QvY3Vp
eC93b3Jrc3BhY2VfZGV2bC9xZW11LTQuMi4wL3J1bGVzLm1hazoxMjSjunRlc3RzL3Rlc3Qt
Yml0bWFwLmV4ZV0gZXJyb3ImbmJzcDsgMTwvZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+Jm5ic3A7ICZuYnNwO1NvbWV0aGluZyB3ZW50IHdyb25nIGJ1dCBJIGhhdmUgbm8gY2x1
ZSBhdCBhbGwuIEFueSBzdWdnZXN0aW9ucz8mbmJzcDs8L2Rpdj48ZGl2PiZuYnNwOyAmbmJz
cDtUaGFua3MgYSBsb3QuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5yZWdhcmRzLDwvZGl2
PjxkaXY+PGJyPjwvZGl2PjxkaXY+eGlhb2xlaTwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
PGJyPjwvZGl2Pg==

------=_NextPart_5EB52DAB_0F807E80_08A84796--




