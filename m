Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A681B4DC
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Apr 2019 05:39:12 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39237 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hKael-0002iL-9E
	for lists+qemu-devel@lfdr.de; Sat, 27 Apr 2019 23:39:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tgfbeta@me.com>) id 1hKacx-0001sr-9t
	for qemu-devel@nongnu.org; Sat, 27 Apr 2019 23:37:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tgfbeta@me.com>) id 1hKaYA-0006PO-DO
	for qemu-devel@nongnu.org; Sat, 27 Apr 2019 23:32:23 -0400
Received: from pv50p00im-ztdg10011301.me.com ([17.58.6.40]:23042)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <tgfbeta@me.com>) id 1hKaYA-0006OL-5B
	for qemu-devel@nongnu.org; Sat, 27 Apr 2019 23:32:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=04042017;
	t=1556422341; bh=0WNm1kn5TP4Do87ua83jpqVh6ikh4v9ytPumFRZ994Y=;
	h=From:Message-Id:Content-Type:Mime-Version:Subject:Date:To;
	b=GxxAckINdwl3eLPcgInYeN1Ij3w+JBIEfQeHtl0zGCaOWs2D1WtExLC0/11sqrRAD
	1Q5N08/Qyl6ZanRCZaPhCne26xFoY49bxdFkbxLPWC39AgB9Ztot4D5bz3G/MSil+x
	0YGVJk5vNSfsu58FoKm7QutlKjSlEVsDi3bAcXQ/LLsnyDE1TjixPQK+WkKQ/3pQae
	NaNm3Oll0i8eNjBiaLmOZEIAaoqfxweq4LtRNKBm1xssCOqGgfoLnu6u4hQPYnvZWI
	GQWW6pVM8M/uVCcigR5Dbkbb5+kS4/Nyk0aHVVc8MzzHMJZHQJlVlOyivZxTNLbanE
	JvxfDj9CjNX8Q==
Received: from [172.18.2.102] (unknown [36.106.167.46])
	by pv50p00im-ztdg10011301.me.com (Postfix) with ESMTPSA id 053A664011E; 
	Sun, 28 Apr 2019 03:32:19 +0000 (UTC)
Message-Id: <C73C2019-CB01-4E30-8D17-02F7EA044BDE@me.com>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Date: Sun, 28 Apr 2019 11:32:19 +0800
In-Reply-To: <4EAA64FC-AA22-4B01-8BC4-49DAC694963B@me.com>
To: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
References: <4EAA64FC-AA22-4B01-8BC4-49DAC694963B@me.com>
X-Mailer: Apple Mail (2.3445.102.3)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-04-28_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
	mlxlogscore=803 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1812120000 definitions=main-1904280022
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 17.58.6.40
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: [Qemu-devel] [PATCH RESEND 2/2] ui/cocoa: Fix mouse grabbing in
 fullscreen mode for relative input device
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
From: Chen Zhang via Qemu-devel <qemu-devel@nongnu.org>
Reply-To: Chen Zhang <tgfbeta@me.com>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In fullscreen mode, the window property of cocoaView may not be the key
window, and the current implementation would not grab mouse in =
fullscreen
mode after user ungrabs cursor in fullscreen mode with hot-key, and left
clicks the relative input devices to re-grab it.

This patch used value of isFullscreen as a short-cirtuit condition for
relative input device grabbing.

Signed-off-by: Chen Zhang <tgfbeta@me.com <mailto:tgfbeta@me.com>>
---
ui/cocoa.m | 7 ++++++-
1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 474d44cb9f..aa7cf07368 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -901,7 +901,12 @@ QemuCocoaView *cocoaView;
        case NSEventTypeLeftMouseUp:
            mouse_event =3D true;
            if (!isMouseGrabbed && [self screenContainsPoint:p]) {
-                if([[self window] isKeyWindow]) {
+                /*
+                 * In fullscreen mode, the window of cocoaView may not =
be the
+                 * key window, therefore the position relative to the =
virtual
+                 * screen alone will be sufficient.
+                 */
+                if(isFullscreen || [[self window] isKeyWindow]) {
                    [self grabMouse];
                }
            }
--=20
2.19.2=
