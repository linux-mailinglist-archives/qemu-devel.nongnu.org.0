Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B828645452
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 07:54:17 +0200 (CEST)
Received: from localhost ([::1]:48588 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbfAG-0000KG-98
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 01:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46258)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hbf8d-00082a-VJ
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 01:52:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hbf8d-0003cY-3H
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 01:52:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55200)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1hbf8Z-0003Tn-Kt; Fri, 14 Jun 2019 01:52:32 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9BBC82F8BD7;
 Fri, 14 Jun 2019 05:52:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-148.ams2.redhat.com
 [10.36.116.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6967C80E8;
 Fri, 14 Jun 2019 05:52:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 05F4111386A6; Fri, 14 Jun 2019 07:52:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
References: <20190613153405.24769-1-kwolf@redhat.com>
 <20190613153405.24769-7-kwolf@redhat.com>
Date: Fri, 14 Jun 2019 07:52:28 +0200
In-Reply-To: <20190613153405.24769-7-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 13 Jun 2019 17:33:56 +0200")
Message-ID: <87k1doiuhv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Fri, 14 Jun 2019 05:52:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 06/15] monitor: Rename HMP command type
 and tables
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> This renames the type for HMP monitor commands and the tables holding
> the commands to make clear that they are related to HMP and to allow
> making them public later:
>
> * mon_cmd_t -> HMPCommand (fixing use of a reserved name, too)
> * mon_cmds -> hmp_cmds
> * info_cmds -> hmp_info_cmds
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

