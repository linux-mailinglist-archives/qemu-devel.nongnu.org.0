Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBAF7661D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 14:46:46 +0200 (CEST)
Received: from localhost ([::1]:39630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqzcS-0000OC-Pi
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 08:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50918)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hqzcF-0008R7-2w
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 08:46:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hqzcE-0007ZW-1Q
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 08:46:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35758)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hqzcD-0007Uv-RE
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 08:46:29 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8B3913082B44;
 Fri, 26 Jul 2019 12:46:27 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90BEA36FB;
 Fri, 26 Jul 2019 12:46:17 +0000 (UTC)
Date: Fri, 26 Jul 2019 14:46:15 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190726144615.6ed811de@redhat.com>
In-Reply-To: <20190725133500-mutt-send-email-mst@kernel.org>
References: <87pnlymm47.fsf@redhat.com>
 <d48da49f-c8d8-00f7-1634-569e8d924b8a@redhat.com>
 <CAJSP0QUJCh-SaZ9NQ+Wr8vr7R+gBsfhYmBrx45B4z2G9v9L=1A@mail.gmail.com>
 <20190725080556-mutt-send-email-mst@kernel.org>
 <CAJSP0QVvnXV8Ha0yaO84qLL6unVroV5GqcuL-x9ruB7o_24WBA@mail.gmail.com>
 <ddc31318-dc52-b9f2-5a9d-bd1fc650df5b@redhat.com>
 <87muh2mazh.fsf@redhat.com>
 <20190725104721-mutt-send-email-mst@kernel.org>
 <20190725110114-mutt-send-email-mst@kernel.org>
 <cdc6e86c-ce05-fd48-c8a3-0e6cec894d4e@redhat.com>
 <20190725133500-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 26 Jul 2019 12:46:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 0/4] Introduce the microvm machine type
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Maran Wilson <maran.wilson@oracle.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Jul 2019 13:38:48 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Jul 25, 2019 at 05:39:39PM +0200, Paolo Bonzini wrote:
> > On 25/07/19 17:01, Michael S. Tsirkin wrote:  
> > >> It would be educational to try to enable ACPI core but disable all
> > >> optional features.  
> > 
> > A lot of them are select'ed so it's not easy.
> >   
> > > Trying with ACPI_REDUCED_HARDWARE_ONLY would also be educational.  
> > 
> > That's what the NEMU guys experimented with.  It's not supported by our
> > DSDT since it uses ACPI GPE,  
> 
> Well there are two GPE blocks in FADT. We could just switch to
> these if necesary I think.

if it's simplistic vm we could build dedicated DSDT (or whole set of tables)
for it and use reduced profile like arm-virt machine does (just a newer
version of FADT with need flags set). That probably would cut acpi cost on
QEMU side.

> > and the reduction in code size is small
> > (about 15000 lines of code in ACPICA, perhaps 100k if you're lucky?).
> > 
> > Paolo  
> 
> Well ACPI is 150k loc I think, right?
> 
> linux]$ wc -l `find drivers/acpi/ -name '*.c' `|tail -1
>  145926 total
> 
> So 100k wouldn't be too shabby.
> 


