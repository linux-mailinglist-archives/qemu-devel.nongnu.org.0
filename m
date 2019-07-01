Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CF634347
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 11:35:54 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49379 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hY5rF-0008N8-A9
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 05:35:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tgfbeta@me.com>) id 1hY5qA-00085X-6y
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 05:34:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tgfbeta@me.com>) id 1hY5q9-0002dZ-DH
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 05:34:46 -0400
Received: from pv50p00im-ztdg10011901.me.com ([17.58.6.50]:41091)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <tgfbeta@me.com>) id 1hY5q9-0002cM-6w
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 05:34:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=04042017;
	t=1559640883; bh=KyZ4nFDaBlQMg/i+h4/EBaBvs44iHJKqNx372aCKLhs=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To;
	b=wbIMPmxgdeZXavoTVfZCFbEeO7cZ13q0FD/VCKXtcw9m+NGZVoukTtBUj1bczuTNT
	DqItWFOoXtiTIjgADy8/hMs+bM31GDf4oRabgo8ZzxvjPmz1GRsWn6tQ3gxOrgOqlO
	qkljB2mHnOvLxnrmsWvoi55q++4xKSMuNozMnhCNqgeq7HSum6VhQ87PB/aEszfyTO
	ecuughZ3Ly/Pk/nx+euyGfnUsh1yzbdcoCETddCnqzA7RyUqZ63sgJJ2ecpTQs5j1+
	xvT/AJcFOckhvxlz+1uk/vMGXn04UozcPk1bEUFjgD7otL2BQwX4SIK+yx2sUZPVfn
	l2UAIlHGo44hA==
Received: from [172.18.2.102] (unknown [36.106.167.139])
	by pv50p00im-ztdg10011901.me.com (Postfix) with ESMTPSA id 32FC880075C; 
	Tue,  4 Jun 2019 09:34:41 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Message-Id: <B3540B0C-9A71-4733-8109-11B0DC7A17D2@me.com>
Date: Tue, 4 Jun 2019 17:34:38 +0800
To: Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3445.104.11)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-06-04_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
	mlxlogscore=792 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1812120000 definitions=main-1906040064
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 17.58.6.50
Subject: [Qemu-devel] [PATCH 0/2] ui/cocoa: Fix input device issues on Mojave
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
Cc: qemu-devel@nongnu.org, tgfbeta@me.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following patches fixed issues of absolute and relative input devices 
on macOS Mojave.

Chen Zhang (2):
  ui/cocoa: Fix absolute input device grabbing issue on Mojave
  ui/cocoa: Fix mouse grabbing in fullscreen mode for relative input
    device

 ui/cocoa.m | 50 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 3 deletions(-)

-- 
2.21.0


