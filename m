Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18409D8D56
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Oct 2019 12:09:18 +0200 (CEST)
Received: from localhost ([::1]:40370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKgF2-00054j-Lc
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 06:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60953)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iKgE0-0004e7-Eb
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 06:08:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iKgDy-00083i-3K
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 06:08:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42854)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iKgDx-00083D-Ua
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 06:08:10 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 738C918C427E
 for <qemu-devel@nongnu.org>; Wed, 16 Oct 2019 10:08:08 +0000 (UTC)
Received: from redhat.com (ovpn-117-4.ams2.redhat.com [10.36.117.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8EF6601AC;
 Wed, 16 Oct 2019 10:08:05 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 4/4] migration: Check in savevm_state_handler_insert
 for dups
In-Reply-To: <20191016022933.7276-5-peterx@redhat.com> (Peter Xu's message of
 "Wed, 16 Oct 2019 10:29:33 +0800")
References: <20191016022933.7276-1-peterx@redhat.com>
 <20191016022933.7276-5-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Wed, 16 Oct 2019 12:08:03 +0200
Message-ID: <87wod5ovek.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Wed, 16 Oct 2019 10:08:08 +0000 (UTC)
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
Reply-To: quintela@redhat.com
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> wrote:
> Before finally register one SaveStateEntry, we detect for duplicated
> entries.  This could be helpful to notify us asap instead of get
> silent migration failures which could be hard to diagnose.
>
> For example, this patch will generate a message like this (if without
> previous fixes on x2apic) as long as we wants to boot a VM instance
> with "-smp 200,maxcpus=288,sockets=2,cores=72,threads=2" and QEMU will
> bail out even before VM starts:
>
> savevm_state_handler_insert: Detected duplicate SaveStateEntry: id=apic, instance_id=0x0
>
> Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

