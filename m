Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 550DB297A1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 13:54:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53002 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hU8m7-0001Q6-I7
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 07:54:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hU8ku-00017F-Eq
	for qemu-devel@nongnu.org; Fri, 24 May 2019 07:53:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hU8kp-0007hf-2I
	for qemu-devel@nongnu.org; Fri, 24 May 2019 07:53:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:13951)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hU8ko-0007hX-TL
	for qemu-devel@nongnu.org; Fri, 24 May 2019 07:52:55 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 46C3DC0624A1
	for <qemu-devel@nongnu.org>; Fri, 24 May 2019 11:52:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-250.ams2.redhat.com
	[10.36.117.250])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 179915C239;
	Fri, 24 May 2019 11:52:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A03541138648; Fri, 24 May 2019 13:52:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
References: <20190523081538.2291-1-armbru@redhat.com>
	<20190523081538.2291-7-armbru@redhat.com>
	<d1a31149-6732-e7d6-e2c3-bf3d919c4c03@redhat.com>
Date: Fri, 24 May 2019 13:52:52 +0200
In-Reply-To: <d1a31149-6732-e7d6-e2c3-bf3d919c4c03@redhat.com> (Thomas Huth's
	message of "Fri, 24 May 2019 09:24:55 +0200")
Message-ID: <87y32w9ii3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 24 May 2019 11:52:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC v4 6/7] tests: Don't limit check-headers to
 include/
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> On 23/05/2019 10.15, Markus Armbruster wrote:
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Please add a proper patch description. You don't really expect someone
> to review this monster patch without instructions where to look first?

Fair point.  RFC is no excuse for making review harder than necessary.

