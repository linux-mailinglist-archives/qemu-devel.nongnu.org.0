Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2B5B9734
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 20:31:54 +0200 (CEST)
Received: from localhost ([::1]:34572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBNhA-0000Zj-Ud
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 14:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50171)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iBNfa-0008SZ-9k
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 14:30:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iBNfY-0004dF-9R
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 14:30:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33929)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iBNfY-0004cn-26
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 14:30:12 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 09EBF30832C6;
 Fri, 20 Sep 2019 18:30:10 +0000 (UTC)
Received: from localhost (ovpn-116-45.gru2.redhat.com [10.97.116.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B440E5D6B0;
 Fri, 20 Sep 2019 18:29:59 +0000 (UTC)
Date: Fri, 20 Sep 2019 15:29:58 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v2] target/i386: clean up comments over 80 chars per line
Message-ID: <20190920182958.GC5035@habkost.net>
References: <20190920053136.945-1-tao3.xu@intel.com>
 <20190920091456.c6r4lcnsts6jw2v7@steredhat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190920091456.c6r4lcnsts6jw2v7@steredhat>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Fri, 20 Sep 2019 18:30:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: pbonzini@redhat.com, Tao Xu <tao3.xu@intel.com>, philmd@redhat.com,
 qemu-devel@nongnu.org, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 20, 2019 at 11:14:56AM +0200, Stefano Garzarella wrote:
> On Fri, Sep 20, 2019 at 01:31:36PM +0800, Tao Xu wrote:
> > Drop the duplicate definition of CPUID_7_0_ECX_VBMI. And add some
> > comments, clean up comments over 80 chars per line.
> > 
> > There is an extra line in comment of CPUID_8000_0008_EBX_WBNOINVD,
> > remove the extra enter and spaces.
> 
> Might it be better to split this patch into two?
> 
> One where you fix the comments over 80 chars rand one where you drop the
> CPUID_7_0_ECX_VBMI definition.

Yes, please.  The subject line implies the only changes are in
comment formatting, but the patch is replacing a macro.

-- 
Eduardo

