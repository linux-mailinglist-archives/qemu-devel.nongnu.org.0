Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEC07A8B4
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 14:38:02 +0200 (CEST)
Received: from localhost ([::1]:60650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsROD-0004Sp-Lw
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 08:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37033)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hsRN3-00037W-5y
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 08:36:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hsRN2-0006AM-A2
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 08:36:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59710)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hsRN2-00069m-4c
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 08:36:48 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DCC3130821AE
 for <qemu-devel@nongnu.org>; Tue, 30 Jul 2019 12:36:46 +0000 (UTC)
Received: from Igors-MacBook-Pro (ovpn-204-67.brq.redhat.com [10.40.204.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D6D25C1B4;
 Tue, 30 Jul 2019 12:36:41 +0000 (UTC)
Date: Tue, 30 Jul 2019 14:36:38 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190730143638.208a2f56@Igors-MacBook-Pro>
In-Reply-To: <20190723160859.27250-1-imammedo@redhat.com>
References: <20190729211404.1533-1-mst@redhat.com>
 <20190723160859.27250-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Tue, 30 Jul 2019 12:36:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PULL 3/3] pc-dimm: fix crash when invalid slot
 number is used
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 29 Jul 2019 17:16:14 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

Hi Michael,

it seems tooling used for pull req is a bit broken
 * minor issue is CC list contains bogus addresses like: &lt@redhat.com, Mammedov@redhat.com,
 * a bigger issie is that Message-Id is taken from original patch even though [PULL 3/3]
   is not 100% the same as original which confuses mail clients quite a bit.

