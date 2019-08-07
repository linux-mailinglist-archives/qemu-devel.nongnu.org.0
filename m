Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 098898436F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 06:41:43 +0200 (CEST)
Received: from localhost ([::1]:37158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvDld-00080j-ND
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 00:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38748)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hvDkx-0007Rz-05
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 00:40:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hvDkw-0006NQ-6m
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 00:40:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57602)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hvDkw-0006Mq-1i
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 00:40:58 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D159930A00E1
 for <qemu-devel@nongnu.org>; Wed,  7 Aug 2019 04:40:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-197.ams2.redhat.com
 [10.36.116.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DDD15D9E1;
 Wed,  7 Aug 2019 04:40:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 080B5113864E; Wed,  7 Aug 2019 06:40:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20190806151435.10740-1-armbru@redhat.com>
 <20190806151435.10740-30-armbru@redhat.com>
Date: Wed, 07 Aug 2019 06:40:52 +0200
In-Reply-To: <20190806151435.10740-30-armbru@redhat.com> (Markus Armbruster's
 message of "Tue, 6 Aug 2019 17:14:35 +0200")
Message-ID: <87o911bnaj.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Wed, 07 Aug 2019 04:40:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 29/29] sysemu: Split sysemu/runstate.h
 off sysemu/sysemu.h
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo, should I add include/sysemu/runstate.h to MAINTAINERS section
"Main loop"?

