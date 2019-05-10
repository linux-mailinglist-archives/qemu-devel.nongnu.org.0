Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 538851A35E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 21:18:12 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48868 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hPB23-0000Oh-Gp
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 15:18:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55740)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hPB0s-00005M-Rz
	for qemu-devel@nongnu.org; Fri, 10 May 2019 15:16:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hPB0q-00071p-HY
	for qemu-devel@nongnu.org; Fri, 10 May 2019 15:16:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58814)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hPB0q-00070k-9y
	for qemu-devel@nongnu.org; Fri, 10 May 2019 15:16:56 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F3574307D849;
	Fri, 10 May 2019 19:16:54 +0000 (UTC)
Received: from work-vm (ovpn-117-163.ams2.redhat.com [10.36.117.163])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B59DF22711;
	Fri, 10 May 2019 19:16:51 +0000 (UTC)
Date: Fri, 10 May 2019 20:16:49 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20190510191648.GB2895@work-vm>
References: <20190510185620.15757-1-ehabkost@redhat.com>
	<ffe6be45-7c22-1264-08f2-faa21ab9db69@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffe6be45-7c22-1264-08f2-faa21ab9db69@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Fri, 10 May 2019 19:16:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] monitor: Call mon_get_cpu() only once at
 hmp_gva2gpa()
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
Cc: Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Richard Henderson (richard.henderson@linaro.org) wrote:
> On 5/10/19 11:56 AM, Eduardo Habkost wrote:
> > hmp_gva2gpa() calls mon_get_cpu() twice, which is unnecessary.
> > Not an actual bug, but this is reported as a defect by Coverity
> > Scan (CID 1401346).
> > 
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> >  monitor.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> I was about to send the same patch.  ;-)

I did :-)

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> 
> 
> r~
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

