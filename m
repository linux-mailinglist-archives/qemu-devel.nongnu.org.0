Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F9199633
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 16:19:00 +0200 (CEST)
Received: from localhost ([::1]:43746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0nvW-00042H-Ns
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 10:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54661)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1i0ntb-0002L5-JY
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 10:17:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1i0ntZ-0005tL-G3
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 10:16:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43830)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1i0ntZ-0005sP-7H
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 10:16:57 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C955B308FC4B;
 Thu, 22 Aug 2019 14:16:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AA875DC1E;
 Thu, 22 Aug 2019 14:16:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CF6681162B63; Thu, 22 Aug 2019 16:16:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <20190822011620.106337-1-aik@ozlabs.ru>
Date: Thu, 22 Aug 2019 16:16:53 +0200
In-Reply-To: <20190822011620.106337-1-aik@ozlabs.ru> (Alexey Kardashevskiy's
 message of "Thu, 22 Aug 2019 11:16:20 +1000")
Message-ID: <87wof5b7ze.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Thu, 22 Aug 2019 14:16:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC PATCH qemu] qapi: Add query-memory-checksum
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:

> This returns MD5 checksum of all RAM blocks for migration debugging
> as this is way faster than saving the entire RAM to a file and checking
> that.
>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Any particular reason for MD5?  Have you measured the other choices
offered by GLib?

I understand you don't need crypto-strength here.  Both MD5 and SHA-1
would be bad choices then.

