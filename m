Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3199B5EDE45
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 15:56:20 +0200 (CEST)
Received: from localhost ([::1]:33522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odXXu-000677-KL
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 09:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1odUFW-00007J-VT
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 06:25:09 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:39740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1odUFN-0002PK-L5
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 06:25:01 -0400
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 398172E1254;
 Wed, 28 Sep 2022 13:24:33 +0300 (MSK)
Received: from rvkaganb (unknown [2a02:6b8:b081:8002::1:22])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 T1PeJ8iFUZ-OVOi4iVV; Wed, 28 Sep 2022 13:24:32 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1664360672; bh=1CgI2UhGYW24URwu612f51ao0ypoQa/TrsU/tFQVXKM=;
 h=In-Reply-To:Cc:Message-ID:Subject:Date:References:To:From;
 b=jdPe3l5bbNjAma9P8S7kun0V3U/0QuE9fvPFYhYVGI7zlhGw/4CrG5QpBwPpEpwMc
 Z5QlVe3FuaikcwjlgTGaMXB0cDYkX4DgeUWmu6UNiJ+mpQxSMNor2/B4Yxn4ZK5xUz
 3rO/bEMl+iFfwDFpO14lyQRAgYngN3qE6au0iD58=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Date: Wed, 28 Sep 2022 16:24:29 +0600
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Markus Armbruster <armbru@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Denis Plotnikov <den-plotnikov@yandex-team.ru>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru, michael.roth@amd.com
Subject: Re: [patch v0] qapi/qmp: Add timestamps to qmp command responses.
Message-ID: <YzQg3R1yYFopabkQ@rvkaganb>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Denis Plotnikov <den-plotnikov@yandex-team.ru>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru, michael.roth@amd.com
References: <20220926095940.283094-1-den-plotnikov@yandex-team.ru>
 <YzGmoWQPhR27VWX7@redhat.com> <871qrxnyjo.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <871qrxnyjo.fsf@pond.sub.org>
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 27, 2022 at 08:04:11AM +0200, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> > On Mon, Sep 26, 2022 at 12:59:40PM +0300, Denis Plotnikov wrote:
> >> Example of result:
> >> 
> >>     ./qemu/scripts/qmp/qmp-shell /tmp/qmp.socket
> >> 
> >>     (QEMU) query-status
> >>     {"end": {"seconds": 1650367305, "microseconds": 831032},
> >>      "start": {"seconds": 1650367305, "microseconds": 831012},
> >>      "return": {"status": "running", "singlestep": false, "running": true}}
> >> 
> >> The responce of the qmp command contains the start & end time of
> >> the qmp command processing.
> 
> Seconds and microseconds since when?  The update to qmp-spec.txt should
> tell.
> 
> Why split the time into seconds and microseconds?

This is exactly how timestamps in QMP events are done, so we thought
we'd just follow suit

> > The mgmt app already knows when it send the QMP command and knows
> > when it gets the QMP reply.  This covers the time the QMP was
> > queued before processing (might be large if QMP is blocked on
> > another slow command) , the processing time, and the time any
> > reply was queued before sending (ought to be small).
> >
> > So IIUC, the value these fields add is that they let the mgmt
> > app extract only the command processing time, eliminating
> > any variance do to queue before/after.

Right, this is precisely the motivation.

Thanks,
Roman.

