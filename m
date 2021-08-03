Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B24B53DEFCB
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 16:13:42 +0200 (CEST)
Received: from localhost ([::1]:35578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAvAr-0004Re-AA
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 10:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>) id 1mAv9j-0003lG-5i
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:12:31 -0400
Received: from mout.gmx.net ([212.227.15.18]:54119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>) id 1mAv9f-0000Ta-Oa
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:12:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627999944;
 bh=1/cWkxP5INmf2Lvc0s0T5pb211o3ESSZ53lztJrMurc=;
 h=X-UI-Sender-Class:To:From:Subject:Date;
 b=VvOIA7nXHjKeoLJvv/PyvuHDuw8I2+JZfjffhAwQ6yLKuPPIscB9woxsubx7mtGU0
 oJ8rjnvbYPqzMfFp+UbCz5bhEHbh3BJkYkWn1q96KPmjT8eShI9ORQ5F3AhkTswjIm
 5zI8N1wklxUkGdmF2agXCOeSajXe4j6C/azKaDKg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.82.103] ([87.129.254.130]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8ygO-1mGyty204k-0066CX for
 <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 16:12:24 +0200
To: qemu-devel@nongnu.org
From: Axel Heider <axelheider@gmx.de>
Subject: [PATCH 1/2] doc: Clarify serial parameters
Message-ID: <277c4838-aef4-97aa-e92b-8eb7c0056686@gmx.de>
Date: Tue, 3 Aug 2021 16:12:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:O3cg+9tq9WpXXYaDVUYd9uiXZE5I1ZRqqZQ2oVHC6V2Ui5wWuoM
 PMQNDfNuC/xqHlN8YoImgOPNUnproJkbcaukN7zIOSILRqpzw9b7ZK4Br860lTN8NbhPkIZ
 KF9XbrUVWz6mRJZD5UW7VmAq6ShK/laLCrDSb7SVD58to0J4mBRhCSmMi0IGxZMzGjAc/ii
 f47PeQ93DXkce1w7P41BQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rC7S96Srcsk=:hyUH8bAbnojSnF96SeHMTc
 gzVW/kjELX+LgqRmdCQaxHOaluSRRzzUAI3bF4krUbfJbSXpqRWcBUnoRFb0dySoXyIpD3RDf
 mx5XwIx9F7/edb2mMgk44Rnz8Bfpxy79D/m5hnYmqekOrjjEiKfX0U0IdhHRErcG9zviPOgwp
 wcv2vrWPnQRsXrYLoiLaR3d3E+LJ96PgrqTlRwSAQ/GA8epWi1R/xH4xbLY757xP1Q/ghO3ZA
 x8Idd6ijCiinXNUN8Q4C4LXm57lYKBQqOZjFf+yMM7ZlBC4c5Z9/G54J2XtrfWX4tIqMs+uMA
 pRE/E+q7vXn5mMPtb8Am1yZxZQ19im0HNymNBmA3JcG8DT/HFwH3l0syK2SEz/YKvxgbYFiGi
 EcuaoNhFr0WaeHx1uYVxQCquPR+Bg7vHHy8L7zwyZGEAlFDzWu5fpWFHZyUlMXElz62fIuUua
 un7cIQL9AwsddB3bfrWaHTKgmLtdlwjxWMka4QGJb22gQAqM4EOWQcG1MIRNTawOYv13SgNbq
 lQkCXbCaaHPkm3G+AnL+DmZU+dfzoJtnUt+ite4XoyfiQVlHKH0s9fGQBT50FNjmZrj2qZeFa
 QaY7C0l/jwjoAfZalc2h4tGtOO+QDAslhA3YOg6g6f9uDoqrdq+V5ksBzFmhsoVQINT6ecyKG
 2X6k8OQ95RjZL/HLNWld7qyR0fYxmxyJYuVYZ6bcYOVRKblfU12Xld3VzI4RsP4GY0VwVZHX6
 auPPJJ7fIrY6VlcZkElHPNjmNHxb0rfyL0qV+HeK6Uo+kw/QevgzU824R6OVufk1/iXlPzefh
 BawRHsirxuk81gxokeMI6NJufP0y5wblddKM5CgAPh66LV0D2M0VGY7ovHAUsPGoGsWRsg2k+
 jyz1aXcZImxTjln3D+qFNxfm3qEv1aJsjklgaehGdjGXkfqkb50TiWtdEZYIn+kzD7cGLD6Hj
 6bCcoPHSARV4uqwEl016RpegMxjdm2VT4u+5JChBuaf6qexLPgy3qfLDpII0kBZ2sqqnyn4xX
 PgFEGe2QGIZ3u0Xs2dVQv/q3IkkTqo3GiJ45Fvq5w/61tXxXBQjVDPwx+zzuX8KxenS9As39P
 SaCXlI8eQmW7UEDP2NCcJde/zFmS3IFxxkDQEbNDzlAKDKCo8UJhwPSgA==
Received-SPF: pass client-ip=212.227.15.18; envelope-from=axelheider@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is a difference between 'null' and 'none'. Add a sentence to
highlight this, so this does not get mixed up.

Signed-off-by: Axel Heider <axelheider@gmx.de>
=2D--
  qemu-options.hx | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 83aa59a920..e3f256fa72 100644
=2D-- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3702,7 +3702,8 @@ SRST
          [Linux only] Pseudo TTY (a new PTY is automatically allocated)

      ``none``
-        No device is allocated.
+        No serial devices are allocated at all. Use ``null`` to disable a
+        specific serial device.

      ``null``
          void device
=2D-
2.17.1

