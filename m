Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A1C5F2B6
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jul 2019 08:19:44 +0200 (CEST)
Received: from localhost ([::1]:43044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiv5q-0003os-V4
	for lists+qemu-devel@lfdr.de; Thu, 04 Jul 2019 02:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38295)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ppandit@redhat.com>) id 1hiv4t-0003IQ-No
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 02:18:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ppandit@redhat.com>) id 1hiv4s-00020G-1u
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 02:18:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34192)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ppandit@redhat.com>)
 id 1hiv4n-0001xy-Og; Thu, 04 Jul 2019 02:18:37 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C84DD300194A;
 Thu,  4 Jul 2019 06:18:30 +0000 (UTC)
Received: from kaapi (ovpn-116-120.sin2.redhat.com [10.67.116.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 829DA3795;
 Thu,  4 Jul 2019 06:18:28 +0000 (UTC)
Date: Thu, 4 Jul 2019 11:48:25 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@kaapi
To: qemu-devel@nongnu.org
In-Reply-To: <156220045355.21218.10996548601675268562@c4a48874b076>
Message-ID: <nycvar.YSQ.7.76.1907041145470.6795@xnncv>
References: <156220045355.21218.10996548601675268562@c4a48874b076>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Thu, 04 Jul 2019 06:18:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] hw/ssi/xilinx_spips: add lqspi_write
 routine
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, slei.casper@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+-- On Wed, 3 Jul 2019, no-reply@patchew.org wrote --+
| Patchew URL: https://patchew.org/QEMU/20190703190615.31436-1-ppandit@redhat.com/
| 
| This series failed the asan build test. Please find the testing commands and
| their output below. If you have Docker installed, you can probably reproduce it
| locally.
| 
| === TEST SCRIPT BEGIN ===
| #!/bin/bash
| make docker-image-fedora V=1 NETWORK=1
| time make docker-test-debug@fedora TARGET_LIST=x86_64-softmmu J=14 NETWORK=1
| === TEST SCRIPT END ===

This patch does not build for x86_64 target. Not sure what's causing the test 
failure.

--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F

