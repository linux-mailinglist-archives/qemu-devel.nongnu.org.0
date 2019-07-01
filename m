Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4179928B3D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 22:05:59 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42617 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTtyQ-0001Nh-08
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 16:05:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hTtwE-0000JO-CL
	for qemu-devel@nongnu.org; Thu, 23 May 2019 16:03:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hTtq2-0005CL-Ff
	for qemu-devel@nongnu.org; Thu, 23 May 2019 15:57:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54024)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hTtq2-0005Bq-9z
	for qemu-devel@nongnu.org; Thu, 23 May 2019 15:57:18 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DC656300502A;
	Thu, 23 May 2019 19:57:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-250.ams2.redhat.com
	[10.36.117.250])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9680417197;
	Thu, 23 May 2019 19:57:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 222201138648; Thu, 23 May 2019 21:57:14 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20190523081538.2291-1-armbru@redhat.com>
	<20190523081538.2291-6-armbru@redhat.com>
	<db337f20-8b76-9214-533e-3e4b79c5c4d5@redhat.com>
Date: Thu, 23 May 2019 21:57:14 +0200
In-Reply-To: <db337f20-8b76-9214-533e-3e4b79c5c4d5@redhat.com> (Paolo
	Bonzini's message of "Thu, 23 May 2019 18:51:12 +0200")
Message-ID: <87ef4peyg5.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 23 May 2019 19:57:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC v4 5/7] tests: New make target check-source
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 23/05/19 10:15, Markus Armbruster wrote:
>> A large number of headers don't pass this test, by design or by
>> accident.  To keep things more manageable, exclude all headers outside
>> include/ for now.
>
> A lot of these, either in include/ or outside, are _meant_ to be
> included many times.  What about renaming those to .inc.h and
> whitelisting them in the script?

Yes, that would be nice.

