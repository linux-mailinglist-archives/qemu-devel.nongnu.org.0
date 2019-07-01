Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0BF4D414
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 18:44:55 +0200 (CEST)
Received: from localhost ([::1]:50274 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1he0BC-0008CM-8X
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 12:44:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41716)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1he072-0004Pb-F2
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 12:40:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hdzte-0006n1-0a
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 12:26:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53858)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hdztb-0006kv-Ve
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 12:26:44 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6C708C024920
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 16:26:42 +0000 (UTC)
Received: from localhost (ovpn-116-76.gru2.redhat.com [10.97.116.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 015DB6090E;
 Thu, 20 Jun 2019 16:26:41 +0000 (UTC)
Date: Thu, 20 Jun 2019 13:26:40 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190620162640.GC1862@habkost.net>
References: <20190620154035.30989-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190620154035.30989-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Thu, 20 Jun 2019 16:26:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2] qmp: make qmp-shell work with python3
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
Cc: crosa@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 20, 2019 at 11:40:35AM -0400, Igor Mammedov wrote:
> python3 doesn't have raw_input(), so qmp-shell breaks.
> Use input() instead and override it with raw_input()
> if running on python2.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Queued, thanks.

-- 
Eduardo

