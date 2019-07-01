Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 636725A4A6
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 20:57:35 +0200 (CEST)
Received: from localhost ([::1]:35550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgw3y-0000kA-HX
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 14:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41227)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hgvyy-0005Pr-88
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 14:52:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hgvyv-0005Kv-MX
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 14:52:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45566)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>)
 id 1hgvyv-00058L-Df; Fri, 28 Jun 2019 14:52:21 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2898330833DF;
 Fri, 28 Jun 2019 18:52:16 +0000 (UTC)
Received: from localhost (ovpn-116-7.gru2.redhat.com [10.97.116.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39DEF5C730;
 Fri, 28 Jun 2019 18:52:12 +0000 (UTC)
Date: Fri, 28 Jun 2019 15:49:17 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190628184916.GG1862@habkost.net>
References: <20190628015606.32107-1-ehabkost@redhat.com>
 <156169018571.6332.9317225427076483475@c4a48874b076>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156169018571.6332.9317225427076483475@c4a48874b076>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Fri, 28 Jun 2019 18:52:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PULL 00/29] Machine next patches
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
Cc: David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 27, 2019 at 07:49:47PM -0700, no-reply@patchew.org wrote:
> === TEST SCRIPT END ===
> 
> /var/tmp/patchew-tester-tmp-vfw4sa78/src/target/s390x/kvm.c:367: undefined reference to `max_cpus'
> /usr/bin/ld: target/s390x/kvm.o: in function `kvm_s390_vcpu_interrupt_pre_save':
> /var/tmp/patchew-tester-tmp-vfw4sa78/src/target/s390x/kvm.c:1953: undefined reference to `max_cpus'

I've fixed this and I'm sending v2 of the pull request right now.

-- 
Eduardo

