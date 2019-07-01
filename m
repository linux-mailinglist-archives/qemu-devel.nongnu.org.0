Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C721D3B4C3
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 14:22:48 +0200 (CEST)
Received: from localhost ([::1]:45926 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haJK4-0001np-1H
	for lists+qemu-devel@lfdr.de; Mon, 10 Jun 2019 08:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57938)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1haJHg-0000eM-EV
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 08:20:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1haJHY-0006wf-5Q
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 08:20:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52732)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1haJHX-0006dT-WD
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 08:20:12 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8EDB93082E20
 for <qemu-devel@nongnu.org>; Mon, 10 Jun 2019 12:19:43 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDF60196FF;
 Mon, 10 Jun 2019 12:19:38 +0000 (UTC)
Date: Mon, 10 Jun 2019 14:19:34 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190610141934.5ea6836d@redhat.com>
In-Reply-To: <87o9395mp1.fsf@dusky.pond.sub.org>
References: <1559205199-233510-1-git-send-email-imammedo@redhat.com>
 <87o9395mp1.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Mon, 10 Jun 2019 12:19:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 0/3] numa: deprecate '-numa node,
 mem' and default memory distribution
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
Cc: libvir-list@redhat.com, pbonzini@redhat.com, berrange@redhat.com,
 qemu-devel@nongnu.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 07 Jun 2019 19:28:58 +0200
Markus Armbruster <armbru@redhat.com> wrote:

> Igor Mammedov <imammedo@redhat.com> writes:
> 
> > Changes since v3:
> >   - simplify series by dropping idea of showing property values in "qom-list-properties"
> >     and use MachineInfo in QAPI schema instead  
> 
> Where did "[PATCH v3 1/6] pc: fix possible NULL pointer dereference in
> pc_machine_get_device_memory_region_size()" go?  It fixes a crash bug...

I'll post it as separate patch as it's not more related to this series

