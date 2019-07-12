Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B8B666B0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 07:57:38 +0200 (CEST)
Received: from localhost ([::1]:46754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hloYr-0006hO-8I
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 01:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40509)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hloYe-0006J9-KS
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 01:57:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hloYd-0004dM-Py
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 01:57:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56450)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hloYd-0004cf-KC
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 01:57:23 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 27B5530C121A;
 Fri, 12 Jul 2019 05:57:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-111.ams2.redhat.com
 [10.36.116.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFCC85C559;
 Fri, 12 Jul 2019 05:57:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 50D911138648; Fri, 12 Jul 2019 07:57:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Fei Li <lifei1214@126.com>
References: <20190201051806.53183-1-lifei1214@126.com>
Date: Fri, 12 Jul 2019 07:57:19 +0200
In-Reply-To: <20190201051806.53183-1-lifei1214@126.com> (Fei Li's message of
 "Fri, 1 Feb 2019 13:17:55 +0800")
Message-ID: <871ryviym8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Fri, 12 Jul 2019 05:57:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v11 for-4.0 00/11] qemu_thread_create:
 propagate the error to callers to handle
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
Cc: qemu-devel@nongnu.org, shirley17fei@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Did this get stuck?

Fei Li <lifei1214@126.com> writes:

> Hi,
>
> This idea comes from BiteSizedTasks, and this patch series implement
> the error checking of qemu_thread_create: make qemu_thread_create
> return a flag to indicate if it succeeded rather than failing with
> an error; make all callers check it.
>
> The first patch modifies the qemu_thread_create() by passing
> &error_abort and returing a value to indicate if it succeeds. The next
> 10 patches will improve on &error_abort for callers who could handle
> more properly.
>
> Please help to review, thanks a lot! 
[...]

