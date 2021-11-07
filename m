Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC354472D1
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Nov 2021 13:09:02 +0100 (CET)
Received: from localhost ([::1]:57406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjgyq-0000Jp-NO
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 07:09:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kvmluck@163.com>) id 1mjgxh-0007yZ-DV
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 07:07:49 -0500
Received: from m13139.mail.163.com ([220.181.13.139]:3577)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kvmluck@163.com>) id 1mjgxa-0007s7-S5
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 07:07:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=WeOtm
 UHMzqSA6ucZrpnIx76dyY3Sss9ziQLzQzt1y/k=; b=DwMDr8sqAtdId6B3U+zjB
 S/9X8i9Q6OTZV1Q2rn5RyuTGavoaX3vBPa/MQokgLP0+ax+Bm4U/NsfGYaWV+zIh
 eyK8hb2kl0RR0cmM5XyJRMjnXNur6NtbWCqLJI95GOD69uI1Pa6DZw2vxgGn4h2K
 LQQKi3XWlU/jqQDfKaJUH4=
Received: from kvmluck$163.com ( [114.246.35.27] ) by ajax-webmail-wmsvr139
 (Coremail) ; Sun, 7 Nov 2021 19:52:17 +0800 (CST)
X-Originating-IP: [114.246.35.27]
Date: Sun, 7 Nov 2021 19:52:17 +0800 (CST)
From: yue  <kvmluck@163.com>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: Bus 'pcie.0' does not support hotplugging
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210622(1d4788a8)
 Copyright (c) 2002-2021 www.mailtech.cn 163com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <7a2a9f80.19fc.17cfa3df784.Coremail.kvmluck@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: i8GowAAnXOrxvYdhKgKCAQ--.32858W
X-CM-SenderInfo: xnypz3lfn6il2tof0z/xtbByQ1EiV1vmaEiLwADsN
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Received-SPF: pass client-ip=220.181.13.139; envelope-from=kvmluck@163.com;
 helo=m13139.mail.163.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGksIGFsbDoKICAgIGluIG15IGNhc2UgaXQgaXMga2F0YSB0aGF0IG1hbmFnZSBxZW11IGRpcmVj
dGx5IHZpYSBxbXAuICAoUUVNVSBlbXVsYXRvciB2ZXJzaW9uIDUuMi4wIChrYXRhLXN0YXRpYykp
LgoKICBpIGhhdmUgdGVzdGVkIHZpYSB2aXJzaCBjb21tYW5kIGFuZCBtYWtlIHN1cmUgdGhhdCBx
ZW11LXN5c3RlbS14ODZfNjQgc3VwcG9ydHMgaG90cGx1Zy4gCiAgYnV0IGlmIHFlbXUgd2FzIHN0
YXJ0ZWQgYnkga2F0YSwgIGF0dGFjaC1kaXNrIGZhaWxlZC4gIAoKCjEuICBpdCBpcyB3aGljaCBv
cHRpb24gdGhhdCBwbGF5IGEgcGFydD8gICBpcyBpdCBzaHBjPW9uPwoyLiBpbiBrYXRhIGNhc2Us
IHRoZXJlIGlzIG5vIGJvb3QgcHJvY2VzcyBmb3Igdm0uIHFlbXUgc3RhcnRzIHdpdGggLWtlcm5l
bCBvcHRpb24gYW5kIGEgcm9vdGZzIChyb290PS9kZXYvcG1lbTBwMSkuICB3aGF0IGFmZmVjdHMg
aG90cGx1Z2dpbmcgaW5zaWRlIHZtPwoKCnRoYW5rIHZlcnkgbXVjaC4KCgoKL29wdC9rYXRhL2Jp
bi9xZW11LXN5c3RlbS14ODZfNjQgLW5hbWUgc2FuZGJveC10ZXN0LWthdGExIC1tYWNoaW5lIHEz
NSxhY2NlbD1rdm0sa2VybmVsX2lycWNoaXA9b24sbnZkaW1tPW9uIC1jcHUgaG9zdCxwbXU9b2Zm
IAotcW1wIHVuaXg6L3J1bi92Yy92bS90ZXN0LWthdGExL3FtcC5zb2NrLHNlcnZlcj1vbix3YWl0
PW9mZiAtcW1wIHVuaXg6L3J1bi92Yy92bS90ZXN0LWthdGExL3FtcDEuc29jayxzZXJ2ZXI9b24s
d2FpdD1vZmYgLW0gMjA0OE0sc2xvdHM9MTAsbWF4bWVtPTI1ODQ4MU0gCi1kZXZpY2UgcGNpLWJy
aWRnZSxidXM9cGNpZS4wLGlkPXBjaS1icmlkZ2UtMCxjaGFzc2lzX25yPTEsc2hwYz1vbixhZGRy
PTIgLWRldmljZSB2aXJ0aW8tc2VyaWFsLXBjaSxkaXNhYmxlLW1vZGVybj1mYWxzZSxpZD1zZXJp
YWwwIC1kZXZpY2UgdmlydGNvbnNvbGUsY2hhcmRldj1jaGFyY29uc29sZTAsaWQ9Y29uc29sZTAg
LWNoYXJkZXYgc29ja2V0LGlkPWNoYXJjb25zb2xlMCxwYXRoPS9ydW4vdmMvdm0vdGVzdC1rYXRh
MS9jb25zb2xlLnNvY2ssc2VydmVyPW9uLHdhaXQ9b2ZmIAoKLWRldmljZSBudmRpbW0saWQ9bnYw
LG1lbWRldj1tZW0wLHVuYXJtZWQ9b24gLW9iamVjdCBtZW1vcnktYmFja2VuZC1maWxlLGlkPW1l
bTAsbWVtLXBhdGg9L29wdC9rYXRhL3NoYXJlL2thdGEtY29udGFpbmVycy9rYXRhLWNsZWFybGlu
dXgtbGF0ZXN0LmltYWdlLHNpemU9MjY4NDM1NDU2LHJlYWRvbmx5PW9uIC1vYmplY3Qgcm5nLXJh
bmRvbSxpZD1ybmcwLGZpbGVuYW1lPS9kZXYvdXJhbmRvbSAtZGV2aWNlIHZpcnRpby1ybmctcGNp
LHJuZz1ybmcwIAoKLWRldmljZSBwY2llLXJvb3QtcG9ydCxpZD1ycDAsYnVzPXBjaWUuMCxjaGFz
c2lzPTAsc2xvdD0wLG11bHRpZnVuY3Rpb249b2ZmIC1kZXZpY2UgcGNpZS1yb290LXBvcnQsaWQ9
cnAxLGJ1cz1wY2llLjAsY2hhc3Npcz0wLHNsb3Q9MSxtdWx0aWZ1bmN0aW9uPW9mZiAKLWRldmlj
ZSB2aG9zdC12c29jay1wY2ksZGlzYWJsZS1tb2Rlcm49ZmFsc2Usdmhvc3RmZD0zLGlkPXZzb2Nr
LTI5MjQwMTA0NjEsZ3Vlc3QtY2lkPTI5MjQwMTA0NjEgCi1kZXZpY2UgdmlydGlvLTlwLXBjaSxk
aXNhYmxlLW1vZGVybj1mYWxzZSxmc2Rldj1leHRyYS05cC1rYXRhU2hhcmVkLG1vdW50X3RhZz1r
YXRhU2hhcmVkIC1mc2RldiBsb2NhbCxpZD1leHRyYS05cC1rYXRhU2hhcmVkLHBhdGg9L3J1bi9r
YXRhLWNvbnRhaW5lcnMvc2hhcmVkL3NhbmRib3hlcy90ZXN0LWthdGExL3NoYXJlZCxzZWN1cml0
eV9tb2RlbD1ub25lLG11bHRpZGV2cz1yZW1hcCAtcnRjIGJhc2U9dXRjLGRyaWZ0Zml4PXNsZXcs
Y2xvY2s9aG9zdCAtZ2xvYmFsIGt2bS1waXQubG9zdF90aWNrX3BvbGljeT1kaXNjYXJkIC12Z2Eg
bm9uZSAtbm8tdXNlci1jb25maWcgLW5vZGVmYXVsdHMgLW5vZ3JhcGhpYyAtLW5vLXJlYm9vdCAt
ZGFlbW9uaXplIC1vYmplY3QgbWVtb3J5LWJhY2tlbmQtcmFtLGlkPWRpbW0xLHNpemU9MjA0OE0g
LW51bWEgbm9kZSxtZW1kZXY9ZGltbTEgCgota2VybmVsIC9vcHQva2F0YS9zaGFyZS9rYXRhLWNv
bnRhaW5lcnMvdm1saW51eC01LjEwLjI1LTg1IAotYXBwZW5kIHRzYz1yZWxpYWJsZSBub190aW1l
cl9jaGVjayByY3VwZGF0ZS5yY3VfZXhwZWRpdGVkPTEgaTgwNDIuZGlyZWN0PTEgaTgwNDIuZHVt
YmtiZD0xIGk4MDQyLm5vcG5wPTEgaTgwNDIubm9hdXg9MSBub3JlcGxhY2Utc21wIHJlYm9vdD1r
IGNvbnNvbGU9aHZjMCBjb25zb2xlPWh2YzEgY3J5cHRvbWdyLm5vdGVzdHMgbmV0LmlmbmFtZXM9
MCBwY2k9bGFzdGJ1cz0wIHJvb3Q9L2Rldi9wbWVtMHAxIHJvb3RmbGFncz1kYXgsZGF0YT1vcmRl
cmVkLGVycm9ycz1yZW1vdW50LXJvIHJvIHJvb3Rmc3R5cGU9ZXh0NCBkZWJ1ZyBzeXN0ZW1kLnNo
b3dfc3RhdHVzPXRydWUgc3lzdGVtZC5sb2dfbGV2ZWw9ZGVidWcgcGFuaWM9MSBucl9jcHVzPTQ4
IHN5c3RlbWQudW5pdD1rYXRhLWNvbnRhaW5lcnMudGFyZ2V0IHN5c3RlbWQubWFzaz1zeXN0ZW1k
LW5ldHdvcmtkLnNlcnZpY2Ugc3lzdGVtZC5tYXNrPXN5c3RlbWQtbmV0d29ya2Quc29ja2V0IGFn
ZW50LmxvZz1kZWJ1ZyBhZ2VudC5kZWJ1Z19jb25zb2xlIGFnZW50LmRlYnVnX2NvbnNvbGVfdnBv
cnQ9MTAyNiAtc21wIDEsY29yZXM9MSx0aHJlYWRzPTEsc29ja2V0cz00OCxtYXhjcHVzPTQ4CgoK
eyJleGVjdXRlIiA6ICJxbXBfY2FwYWJpbGl0aWVzIn0gCnsicmV0dXJuIjoge319CnsgImV4ZWN1
dGUiOiAiYmxvY2tkZXYtYWRkIiwgImFyZ3VtZW50cyI6IHsgImRyaXZlciI6ICJyYXciLCAibm9k
ZS1uYW1lIjogImRyaXZlLXZpcnRpby1kaXNrMiIsICJmaWxlIjogeyAiZHJpdmVyIjogImZpbGUi
LCAiZmlsZW5hbWUiOiAiL3Jvb3QvY2lycm9zL2RhdGEteG1sLnJhdyIgfSB9IH0KeyJyZXR1cm4i
OiB7fX0KeyJleGVjdXRlIjoiZGV2aWNlX2FkZCIsImFyZ3VtZW50cyI6eyJkcml2ZXIiOiJ2aXJ0
aW8tYmxrLXBjaSIsInNjc2kiOiJvZmYiLCJidXMiOiJwY2llLjAiLCJhZGRyIjoiMHg3IiwiZHJp
dmUiOiJkcml2ZS12aXJ0aW8tZGlzazIiLCJpZCI6InZpcnRpby1kaXNrMiJ9LCJpZCI6ImxpYnZp
cnQtMTgifQp7ImlkIjogImxpYnZpcnQtMTgiLCAiZXJyb3IiOiB7ImNsYXNzIjogIkdlbmVyaWNF
cnJvciIsICJkZXNjIjogIkJ1cyAncGNpZS4wJyBkb2VzIG5vdCBzdXBwb3J0IGhvdHBsdWdnaW5n
In19

