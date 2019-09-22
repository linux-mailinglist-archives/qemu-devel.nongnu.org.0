Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3527BA177
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Sep 2019 10:18:39 +0200 (CEST)
Received: from localhost ([::1]:45714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBx4o-00047T-9j
	for lists+qemu-devel@lfdr.de; Sun, 22 Sep 2019 04:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59187)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1iBx3Z-0003XE-4Z
 for qemu-devel@nongnu.org; Sun, 22 Sep 2019 04:17:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1iBx3Y-0004sz-9K
 for qemu-devel@nongnu.org; Sun, 22 Sep 2019 04:17:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50796)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1iBx3R-0004nV-8i; Sun, 22 Sep 2019 04:17:13 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5C53818CB8E0;
 Sun, 22 Sep 2019 08:17:09 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51E3E5C1B5;
 Sun, 22 Sep 2019 08:17:04 +0000 (UTC)
Message-ID: <d371336cfe6b8428ebc9a68a9787c19082e9f0de.camel@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2 00/11] RFC crypto/luks: encryption key
 managment using amend interface
From: Maxim Levitsky <mlevitsk@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Date: Sun, 22 Sep 2019 11:17:03 +0300
In-Reply-To: <632e3a8b-ee54-50e0-83a2-ea82ad8e061f@redhat.com>
References: <20190912223028.18496-1-mlevitsk@redhat.com>
 <632e3a8b-ee54-50e0-83a2-ea82ad8e061f@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Sun, 22 Sep 2019 08:17:09 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. =?ISO-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2019-09-20 at 17:14 -0400, John Snow wrote:
> 
> On 9/12/19 6:30 PM, Maxim Levitsky wrote:
> > This patch series is continuation of my work to add encryption
> > key managment to luks/qcow2 with luks.
> > 
> > This is second version of this patch set.
> > The changes are mostly addressing the review feedback,
> > plus I tested (and fixed sadly) the somewhat ugly code
> > that allows to still write share a raw luks device,
> > while preveting the key managment from happening in this case,
> > as it is unsafe.
> > I added a new iotest dedicated to that as well.
> > 
> > Best regards,
> > 	Maxim Levitsky
> > 
> 
> What branch is this based on?
> It doesn't seem to apply to origin/master.
> 
> --js
It is based on refactoring patch series I send before,
which is also under review:
"[PATCH v2 00/13] RFC crypto/luks: preparation for encryption key managment"

Best regards,
	Maxim Levitsky




