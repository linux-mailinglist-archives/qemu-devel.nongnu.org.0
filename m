Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEEE9D01A
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 15:10:24 +0200 (CEST)
Received: from localhost ([::1]:52721 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2ElJ-00055A-5o
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 09:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59454)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1i2EkU-0004b9-O2
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 09:09:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1i2EkS-0002t3-3R
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 09:09:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43056)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1i2EkR-0002s7-UV
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 09:09:28 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 92F90308218D;
 Mon, 26 Aug 2019 13:09:25 +0000 (UTC)
Received: from localhost.localdomain (ovpn-124-81.rdu2.redhat.com
 [10.10.124.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C8B860166;
 Mon, 26 Aug 2019 13:09:23 +0000 (UTC)
Date: Mon, 26 Aug 2019 09:09:21 -0400
From: Cleber Rosa <crosa@redhat.com>
To: tony.nguyen@bt.com
Message-ID: <20190826130921.GA26839@localhost.localdomain>
References: <20190823215451.26276-1-crosa@redhat.com>
 <1566631944235.10945@bt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566631944235.10945@bt.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Mon, 26 Aug 2019 13:09:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] configure: more resilient Python version
 capture
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
Cc: julio.montes@intel.com, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Aug 24, 2019 at 07:32:24AM +0000, tony.nguyen@bt.com wrote:
> > -python_version=$($python -V 2>&1 | sed -e 's/Python\ //')
> > +python_version=$(python2 -c 'import sys; print("%d.%d.%d" % (sys.version_info[0], sys.version_info[1], sys.version_info[2]))' 2>/dev/null)
> 
> On a Python 3 only system, configure will no longer print the version.
>

Oh my, this is not what I intended... gross late Friday mistake.  I meant:

python_version=$($python -c 'import sys; print("%d.%d.%d" % (sys.version_info[0], sys.version_info[1], sys.version_info[2]))' 2>/dev/null)

- Cleber.

