Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFAC35DFA
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 15:35:46 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41839 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYW4v-0001M9-8Z
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 09:35:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hYW3G-0000jn-O0
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 09:34:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hYW3F-0002Y4-UY
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 09:34:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59892)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hYW3F-0002X6-PV
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 09:34:01 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 97169A3B5E
	for <qemu-devel@nongnu.org>; Wed,  5 Jun 2019 13:34:00 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2724860579;
	Wed,  5 Jun 2019 13:33:57 +0000 (UTC)
Date: Wed, 5 Jun 2019 10:33:56 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <20190605133356.GM22416@habkost.net>
References: <20190531165334.20403-1-wainersm@redhat.com>
	<20190531165334.20403-2-wainersm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190531165334.20403-2-wainersm@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 05 Jun 2019 13:34:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/1] accel: Remove unused
 AccelClass::opt_name attribute
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
Cc: thuth@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 31, 2019 at 12:53:34PM -0400, Wainer dos Santos Moschetta wrote:
> The AccelType type was converted to AccelClass QOM
> object on b14a0b7469f, and the original data type had
> a field to store the option name which in turn was
> used to search an accelerator. The lookup method
> (accel_find) changed too, making the option field
> unnecessary but it became AccelClass::opt_name despite
> that. Therefore, and given that none accelerator
> implementation sets AccelClass::opt_name, let's
> remove this attribute.
> 
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

Queued, thanks!

-- 
Eduardo

