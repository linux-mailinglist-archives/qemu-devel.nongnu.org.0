Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CE040100B
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 15:49:53 +0200 (CEST)
Received: from localhost ([::1]:50124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMsWt-0003NK-Nl
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 09:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kallisti5@unixzen.com>)
 id 1mMsV2-0002LF-GM
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 09:47:56 -0400
Received: from mx.dal1.terarocket.io ([108.61.222.170]:43892)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kallisti5@unixzen.com>) id 1mMsV0-0007Iv-U6
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 09:47:56 -0400
Received: by mx.dal1.terarocket.io (Postfix, from userid 1001)
 id 6C3135E77E; Sun,  5 Sep 2021 13:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.dal1.terarocket.io 6C3135E77E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unixzen.com;
 s=default; t=1630849669;
 bh=Ydh7fZIKFiBTl9e+BGi/LeoGcWvLwuozVXuLn4hcy0M=;
 h=Date:From:Subject:To:From;
 b=W4vW7yhi27OqK1eJKJ8pEvhKOTjWIUkWWEkEyWSDsDLX4+5JetMTjvd7C1uRuWPo3
 fXXOxhT/+8E6NLUasxvgBM08EI+kMGNpZqW4lFnnjKcUoiGA1HlIPjq1eycVoFil+p
 2DLgjhHYcUcBn6L3rt/Eje2CDANK2OFrTQi8ifdg=
Received: from mx.dal1.terarocket.io (localhost [IPv6:::1])
 by mx.dal1.terarocket.io (Postfix) with ESMTPSA id 911595E4DD
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 13:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.dal1.terarocket.io 911595E4DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unixzen.com;
 s=default; t=1630849668;
 bh=Ydh7fZIKFiBTl9e+BGi/LeoGcWvLwuozVXuLn4hcy0M=;
 h=Date:From:Subject:To:From;
 b=ZbdrqNMsW8sYMG0ZSExvgubPRe7Ei5zrQsmAmkgWWzq0BdvvwVBuxm/2yd/Z/YRdf
 PVdjF/V/Yy91kozzhfSvys7g45qaOqL6EedY88vYC9IDk8bm1Zmg4Cy90XLAb+JLhk
 +qDk26PAwwqIRJkvpgW66qO6Do0Dn0jASxENIPd8=
MIME-Version: 1.0
Date: Sun, 05 Sep 2021 13:47:48 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: RainLoop/1.13.0
From: "Alexander von Gluck IV" <kallisti5@unixzen.com>
Message-ID: <16fad6ffd7af05706571453114a8c173@unixzen.com>
Subject: virtio "transitional devices"?
To: qemu-devel@nongnu.org
Received-SPF: pass client-ip=108.61.222.170;
 envelope-from=kallisti5@unixzen.com; helo=mx.dal1.terarocket.io
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Could someone explain to me what virtio "transitional devices" are?=0A=0A=
https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html=
#x1-1020002=0A=0AAre "Transitional devices" pre-1.0 specification?=0A=0AH=
aiku's virtio driver (PCI) is looking for PCIID Devices 0x1000-0x103F=0A=
=0A=0AI've noticed qemu-6.1.0 has begun to offer PCI DeviceID  0x1040-0x1=
07F to=0Athe operating system breaking our virtio drivers.=0A=0AExpanding=
 our search range to 0x1040+ seems to solve the issues and gives=0Aus a w=
orking virtio driver, but I feel like we should be checking for=0Aother d=
ifferences.=0A=0AHas something changed in recent qemu's around virtio?  I=
 don't see anything=0Adocumented in the release notes.=0A=0A -- Alex

