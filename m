Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6057D1486C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 12:37:57 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54149 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNb0O-0001cu-K1
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 06:37:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lukasstraub2@web.de>) id 1hNayr-00013j-GJ
	for qemu-devel@nongnu.org; Mon, 06 May 2019 06:36:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lukasstraub2@web.de>) id 1hNayq-0008Fv-FR
	for qemu-devel@nongnu.org; Mon, 06 May 2019 06:36:21 -0400
Received: from mout.web.de ([212.227.15.3]:34765)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <lukasstraub2@web.de>) id 1hNayq-0008Ea-7M
	for qemu-devel@nongnu.org; Mon, 06 May 2019 06:36:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1557138971;
	bh=4j8FL9g6gVrZ+bFrk1QDPPWCE2RP5egzfvDj/PhUNOA=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
	b=AwN5Wxmesd2U2hs5HEkMbXjlpPr2EQbKsmYAk8xePUVUP2M2R/UZXRFziRV1VJ7xX
	acXsZ3IZRN3WzzTY+A30oTtYcZTgjOenR7OscxTh3cgVeHOXgS/FYCK/uC1Yb8nhEx
	DDaocQslp90NCrGrjz+PqSB7y3mUy/ozXKmeZbvk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([2.247.244.216]) by smtp.web.de (mrweb001
	[213.165.67.108]) with ESMTPSA (Nemesis) id 0LpwMZ-1gm4Z20tuh-00fiBI;
	Mon, 06 May 2019 12:36:11 +0200
Date: Mon, 6 May 2019 12:32:58 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel@nongnu.org
Message-ID: <20190506123020.23d168a3@luklap>
In-Reply-To: <20190420191425.7d1dab82@luklap>
References: <20190420191425.7d1dab82@luklap>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JrYut1/C5LBYNOmqptGd9sN88vyMuuMHp3jARSVqznYPJP3nTrA
	0HciiI7le9+PyTeeV34CmH8b9PbB5a0FkwCLkeuXBGqzWiRp5InIrE87dAW0fDmp/zfCwfZ
	B/B2FjuFYwVqvR0rZt12I0pb3lIcLNHUFzNURaoqjjFKGzUB0+9bS5Yh2OUGmw0qAvYOUg2
	IA4696n/VFl9yzEuW09OA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2slFsyjA8mI=:CXdQc8Ih4imGTa1M/7UKgN
	5fu9Ai6an1CUtKIRXCVZIx5GPgTKKashC0f9TMW5QDN8X9/Mt3zKTzxNfHkUyrt1NWiqo4CHe
	qBoTZQserQw4ZOyfMVt0DQITLL/ZwCTIcY17CKYPrUpNk6ZTevbqP2ZnZt1MTUyLIrtexuTSZ
	A8OccGvXeE/FjmZAY7MqTyK8uD9N213Azva4PA8VvPNN6JgOnmW5D/31bQcXnI7ldqFjfpAZ8
	ceWHv6+/mGhlLjMtFLUgVi6k+qkggpVZuht74LEm6JGrcG+rfgbBBzyOxKfGrQ/J/0fQRLsz8
	cLX5lXfKgs7oWDOrQmjFlBLfS5YNe3DSQqvDWU6qW4GNR/AN82ln4WFU3ecU3z10iqJttV/6c
	wUYw5Z97MbRpwtmk0+E3BdqNYXTgUF3sGiGsRJ+RIgNC3RPsGQbJ2v5y9DdyzyOmBhzsjw7a+
	nJgqlAcyDWRGVSqxgOTOPzyMY7rzTNWoJS9lbSQpUHpLxWbtuzvOZ+eITegYxcEUS2Sh5N5Eh
	2hlAfCnVOuerf28m3BFLxIumlppnngCI9r3O6rGQdyQ2sqwODr1fqyzh4Mit3/faKf0/WIYpI
	UEb6oYH7U5K4iscN/FIt23cfCpHSrSd5i9g1u6a2CB4cq6UAH5Bio60mKZjcYdJG1/rvH9o+Z
	vdQ5pv/gAf6Y54CZ0vMxTboeEpArM3RhmDdMR94KCj05Ja4/lcOQPWwFTNKArm2GtM+64ncQf
	w2im8xvtOwVSd67yYeQKXKXZIA2kBE7CE195HhzDyuSrcoY/VZe+NKBsSTJl9N4hu9V4pa2Ba
	mDsnrbGBsBjZZjGs7m3SDquGyY98EByrQq5wAXzUE3C6MYyyvjvFrPCOkY3rtL2tOleCqoXMz
	uzyINMQMVVVBdzJx0mK6PQ+aqwiICYoxZyL1uDAWOq0kveRDxBrNgiXUfnLSP2up1LxmDPXNC
	OhRS7HfzmoA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.15.3
Subject: Re: [Qemu-devel] [PATCH v2] net/colo-compare.c: Fix a crash in COLO
 Primary.
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
Cc: "Zhang, Chen" <chen.zhang@intel.com>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 20 Apr 2019 19:14:25 +0200
Lukas Straub <lukasstraub2@web.de> wrote:

> From: Lukas Straub <lukasstraub2@web.de>
> Because event_unhandled_count may be accessed concurrently, it needs
> to be protected by taking the lock. However the assert is outside the
> lock, probably causing it to read garbage and aborting Qemu
> erroneously.
>
> The Bug only happens when running Qemu in COLO mode.
>
> This Patch fixes the following bug:
> https://bugs.launchpad.net/qemu/+bug/1824622
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---
>  net/colo-compare.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/net/colo-compare.c b/net/colo-compare.c
> index bf10526f05..fcb491121b 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -813,9 +813,8 @@ static void colo_compare_handle_event(void
> *opaque) break;
>      }
>
> -    assert(event_unhandled_count > 0);
> -
>      qemu_mutex_lock(&event_mtx);
> +    assert(event_unhandled_count > 0);
>      event_unhandled_count--;
>      qemu_cond_broadcast(&event_complete_cond);
>      qemu_mutex_unlock(&event_mtx);

Ping.

Regards,
Lukas Straub

