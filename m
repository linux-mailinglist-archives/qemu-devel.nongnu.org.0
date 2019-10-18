Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFDDDD0F2
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 23:16:03 +0200 (CEST)
Received: from localhost ([::1]:46084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLZbO-0003Ac-Dj
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 17:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52799)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iLZaN-0002az-Lf
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 17:15:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iLZaL-0002GY-SM
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 17:14:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57602)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iLZaJ-0002En-H7
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 17:14:57 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9F5A789F2BE;
 Fri, 18 Oct 2019 21:14:53 +0000 (UTC)
Received: from localhost (ovpn-116-20.phx2.redhat.com [10.3.116.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2266161F21;
 Fri, 18 Oct 2019 21:14:50 +0000 (UTC)
Date: Fri, 18 Oct 2019 18:14:49 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH] configure: Require Python >= 3.5
Message-ID: <20191018211449.GR4084@habkost.net>
References: <20191016224237.26180-1-ehabkost@redhat.com>
 <e0631f8e-5c0b-c6cf-b513-68113c7ebd6d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0631f8e-5c0b-c6cf-b513-68113c7ebd6d@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Fri, 18 Oct 2019 21:14:53 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 18, 2019 at 05:07:36PM -0400, John Snow wrote:
> 
> 
> On 10/16/19 6:42 PM, Eduardo Habkost wrote:
> > Python 3.5 is the oldest Python version available on our
> > supported build platforms, and Python 2 end of life will be 3
> > weeks after the planned release date of QEMU 4.2.0.  Drop Python
> > 2 support from configure completely, and require Python 3.5 or
> > newer.
> > 
> 
> Which distributions constrain us to 3.5 right now? I know Debian9 is one
> of them, but I'm not sure what others exist.
> 
> I know I went through and checked a month ago, but I'm very smart and
> didn't write it down.
> 
> It might be nice to document (somewhere) so we know when we can require
> something newer than 3.5 at the next major deprecation event.

I've summarized the release dates and Python version information I
could find here: https://wiki.qemu.org/Supported_Build_Platforms

> 
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> 
> 
> Reviewed-by: John Snow <jsnow@redhat.com>

Thanks!

-- 
Eduardo

