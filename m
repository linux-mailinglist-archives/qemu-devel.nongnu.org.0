Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB92554E2F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 14:03:02 +0200 (CEST)
Received: from localhost ([::1]:59468 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfkA9-0002B5-PY
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 08:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60765)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hfk85-0001cp-RA
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 08:00:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hfk84-0008Q1-Fk
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 08:00:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52202)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hfk84-0008NW-3k
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 08:00:52 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 02788308621F
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2019 12:00:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-169.ams2.redhat.com
 [10.36.117.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D64315D717;
 Tue, 25 Jun 2019 12:00:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3A0F811386A0; Tue, 25 Jun 2019 14:00:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20190608233447.27970-1-ehabkost@redhat.com>
 <20190624180326.GJ1862@habkost.net>
Date: Tue, 25 Jun 2019 14:00:02 +0200
In-Reply-To: <20190624180326.GJ1862@habkost.net> (Eduardo Habkost's message of
 "Mon, 24 Jun 2019 15:03:26 -0300")
Message-ID: <87o92looxp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 25 Jun 2019 12:00:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 0/1] Export machine type deprecation
 info through QMP
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P.
 Berrange" <berrange@redhat.com>, Michal Privoznik <mprivozn@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> Any objections to this?  I'm planning to merge it this week.

No objection, in fact:
Reviewed-by: Markus Armbruster <armbru@redhat.com>

The QAPI feature flags work, once finished, might render this redundant,
but I'd rather not have my unfinished solution for a wider problem block
your working solution for a narrower problem.

