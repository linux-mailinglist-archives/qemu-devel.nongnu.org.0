Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 186A299996
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 18:52:40 +0200 (CEST)
Received: from localhost ([::1]:45950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0qKF-0000j9-7x
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 12:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51665)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1i0qIa-0008T1-SB
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 12:50:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1i0qIZ-0007XG-Tp
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 12:50:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58160)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1i0qIZ-0007Wj-OY
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 12:50:55 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 15C33C049D59;
 Thu, 22 Aug 2019 16:50:55 +0000 (UTC)
Received: from work-vm (ovpn-117-231.ams2.redhat.com [10.36.117.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C7AA60603;
 Thu, 22 Aug 2019 16:50:47 +0000 (UTC)
Date: Thu, 22 Aug 2019 17:50:45 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190822165045.GM3277@work-vm>
References: <CAFEAcA8kEKVcRu62+VGDkzRj2J87QPxzjg05dCHszeBC6X76pg@mail.gmail.com>
 <20190822114747.GS3267@redhat.com> <20190822163150.GA3332@work-vm>
 <9caf3a64-0841-dde6-3413-a77dc80e22bd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9caf3a64-0841-dde6-3413-a77dc80e22bd@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 22 Aug 2019 16:50:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] more automated/public CI for QEMU pullreqs
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
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Samuel Ortiz <sameo@linux.intel.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Paolo Bonzini (pbonzini@redhat.com) wrote:
> On 22/08/19 18:31, Dr. David Alan Gilbert wrote:
> >> With both these points in mind, I think it is  pretty hard sell to
> >> say we should write & maintain a custom CI system just for QEMU
> >> unless it is offering major compelling functionality we can't do
> >> without.

(That was Dan's comment)

> In theory I agree.
> 
> In practice, the major compelling functionality is portability.  If it
> is true that setting up runners is problematic even on aarch64, frankly
> GitLab CI is dead on arrival.  If it is not true, then I'd be very happy
> to use GitLab CI too.

IMHO if for some weird reason Gitlab has problems on aarch64 then we just need to get that
fixed.

Dave

> Paolo
> 
> > I'd agree; and I'd also find it useful to have runners setup for
> > Gitlab CI for related things (it would be useful for the virtio-fs
> > stuff);  if there are problems on other architectures then we should
> > find some go wranglers to go fix it.
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

