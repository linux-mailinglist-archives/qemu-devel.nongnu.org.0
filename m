Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B0C1C46D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 10:10:46 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41586 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQSWK-0007hr-UE
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 04:10:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kchamart@redhat.com>) id 1hQSUm-00072J-M4
	for qemu-devel@nongnu.org; Tue, 14 May 2019 04:09:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kchamart@redhat.com>) id 1hQSUk-0001xn-Oj
	for qemu-devel@nongnu.org; Tue, 14 May 2019 04:09:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54230)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kchamart@redhat.com>) id 1hQSUi-0001pT-QB
	for qemu-devel@nongnu.org; Tue, 14 May 2019 04:09:06 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 28DEB88318;
	Tue, 14 May 2019 08:09:01 +0000 (UTC)
Received: from paraplu.localdomain (ovpn-117-140.ams2.redhat.com
	[10.36.117.140])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2F87608AC;
	Tue, 14 May 2019 08:08:55 +0000 (UTC)
Received: by paraplu.localdomain (Postfix, from userid 1001)
	id 8503A3E0060; Tue, 14 May 2019 10:08:54 +0200 (CEST)
Date: Tue, 14 May 2019 10:08:54 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20190514080854.GD17214@paraplu>
References: <20190514075602.7674-1-lvivier@redhat.com>
	<20190514075602.7674-2-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514075602.7674-2-lvivier@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 14 May 2019 08:09:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 1/3] VirtIO-RNG: Update default entropy
 source to `/dev/urandom`
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
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Amit Shah <amit@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Richard W . M . Jones" <rjones@redhat.com>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 14, 2019 at 09:56:00AM +0200, Laurent Vivier wrote:
> From: Kashyap Chamarthy <kchamart@redhat.com>
> 
> When QEMU exposes a VirtIO-RNG device to the guest, that device needs a
> source of entropy, and that source needs to be "non-blocking", like
> `/dev/urandom`.  However, currently QEMU defaults to the problematic
> `/dev/random`, which on linux is "blocking" (as in, it waits until

OCD nit: s/linux/Linux/

Maybe Michael can do the touch up when applying.

Thanks, Laurent, for reworking the commit message update.

> sufficient entropy is available).

[...]

-- 
/kashyap

