Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C42489BE
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 19:11:29 +0200 (CEST)
Received: from localhost ([::1]:49974 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcvAG-0007nM-8A
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 13:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51478)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hcuTW-0008Hw-Dk
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 12:27:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hcuTV-0000H7-6T
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 12:27:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39986)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hcuTV-0000Fv-0V
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 12:27:17 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2B162C18B2C8;
 Mon, 17 Jun 2019 16:27:10 +0000 (UTC)
Received: from localhost (ovpn-116-100.phx2.redhat.com [10.3.116.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A561A69616;
 Mon, 17 Jun 2019 16:27:02 +0000 (UTC)
Date: Mon, 17 Jun 2019 13:27:00 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190617162700.GC19178@habkost.net>
References: <20180202182326.GB22556@localhost.localdomain>
 <20180205122235.03fdeaad@redhat.com>
 <20180205135401.GA3300@localhost.localdomain>
 <20180205154202.7d1269a9@redhat.com>
 <20180205224205.GA3291@localhost.localdomain>
 <20180206154320.288acdc2@redhat.com>
 <62d7649e-e85d-43a2-2df8-85e2a0953e89@redhat.com>
 <20190617170106.48d776ca@redhat.com>
 <0a31228d-4d32-2c54-649b-6aef9953fffc@redhat.com>
 <20190617173343.68e3c9ec@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190617173343.68e3c9ec@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Mon, 17 Jun 2019 16:27:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v5 1/6] machine: Convert the valid cpu
 types to use cpu_model
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
Cc: marcel@redhat.com, peter.maydell@linaro.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 17, 2019 at 05:33:43PM +0200, Igor Mammedov wrote:
> On Mon, 17 Jun 2019 17:15:21 +0200
> Philippe Mathieu-Daud=E9 <philmd@redhat.com> wrote:
[...]
> > Yes. Eduardo and you should write some lines to explain this, and the=
n
> > we will follow :)
> Unfortunately I don't recall details anymore. One could check out all
> implementations of class_by_name callbacks to find out current state.

See this message for a summary of existing class_by_name quirks:

  https://www.mail-archive.com/qemu-devel@nongnu.org/msg615503.html
  Date: Wed, 08 May 2019 10:34:44 +0200
  Message-ID: <877eb173a3.fsf@dusky.pond.sub.org>
  Subject: Re: [Qemu-devel] [PATCH 0/7] Delete 16 *_cpu_class_by_name() f=
unctions

I'm unsure about Igor's suggestion to get rid of CPU model names
and use only QOM type names in external interfaces.  In either
case, we can still simplify the rules rules and reduce the amount
of arch-specific code.

--=20
Eduardo

