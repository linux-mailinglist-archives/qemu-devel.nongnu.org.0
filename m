Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B77D68B9
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 19:41:33 +0200 (CEST)
Received: from localhost ([::1]:54772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iK4Lc-0000jE-HP
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 13:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40669)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iK3AE-0006au-Je
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:25:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iK3AC-0003ug-QB
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:25:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45370)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>)
 id 1iK3A9-0003lM-VU; Mon, 14 Oct 2019 12:25:38 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F35A43175295;
 Mon, 14 Oct 2019 16:25:31 +0000 (UTC)
Received: from redhat.com (ovpn-116-106.ams2.redhat.com [10.36.116.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BA1E196AE;
 Mon, 14 Oct 2019 16:25:21 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH 1/2] cpu: use ROUND_UP() to define xxx_PAGE_ALIGN
In-Reply-To: <20191013021145.16011-2-richardw.yang@linux.intel.com> (Wei
 Yang's message of "Sun, 13 Oct 2019 10:11:44 +0800")
References: <20191013021145.16011-1-richardw.yang@linux.intel.com>
 <20191013021145.16011-2-richardw.yang@linux.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Mon, 14 Oct 2019 18:25:19 +0200
Message-ID: <877e578fbk.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 14 Oct 2019 16:25:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Reply-To: quintela@redhat.com
Cc: fam@euphon.net, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, kraxel@redhat.com, den@openvz.org,
 qemu-block@nongnu.org, armbru@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, marcandre.lureau@redhat.com, rth@twiddle.net,
 ehabkost@redhat.com, sw@weilnetz.de, dgilbert@redhat.com,
 yuval.shaia@oracle.com, alex.williamson@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, david@gibson.dropbear.id.au, kwolf@redhat.com,
 cohuck@redhat.com, qemu-s390x@nongnu.org, mreitz@redhat.com,
 qemu-ppc@nongnu.org, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wei Yang <richardw.yang@linux.intel.com> wrote:
> Use ROUND_UP() to define, which is a little bit easy to read.
>
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

