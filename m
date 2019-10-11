Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07443D378C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 04:33:46 +0200 (CEST)
Received: from localhost ([::1]:45300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIkkT-0004l3-3A
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 22:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49560)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iIkjI-00046r-JU
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 22:32:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iIkjH-0007zL-BA
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 22:32:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55756)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iIkjH-0007xd-5W
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 22:32:31 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 43A0F5AFDE;
 Fri, 11 Oct 2019 02:32:30 +0000 (UTC)
Received: from localhost (ovpn-116-20.phx2.redhat.com [10.3.116.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5106410013D9;
 Fri, 11 Oct 2019 02:32:27 +0000 (UTC)
Date: Thu, 10 Oct 2019 23:32:25 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: "Moger, Babu" <Babu.Moger@amd.com>
Subject: Re: [Qemu-devel] [RFC 2 PATCH 05/16] hw/i386: Simplify topology
 Offset/width Calculation
Message-ID: <20191011023225.GC29387@habkost.net>
References: <156779689013.21957.1631551572950676212.stgit@localhost.localdomain>
 <156779713027.21957.5884599223662351252.stgit@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156779713027.21957.5884599223662351252.stgit@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 11 Oct 2019 02:32:30 +0000 (UTC)
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
Cc: "mst@redhat.com" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "ssg.sos.staff" <ssg.sos.staff@amd.com>, "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 06, 2019 at 07:12:11PM +0000, Moger, Babu wrote:
> Some parameters are unnecessarily passed for offset/width
> calculation. Remove those parameters from function prototypes.
> No functional change.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>

Isn't it simpler to use the new X86CPUTopoInfo struct, to make
hard-to-spot mistakes less likely when calling those functions?

-- 
Eduardo

