Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDA4E4BB6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 15:02:20 +0200 (CEST)
Received: from localhost ([::1]:59640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNzEQ-0001q0-CS
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 09:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56672)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iNzBR-0007HX-RL
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 08:59:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iNzBP-00055V-D1
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 08:59:13 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:57864
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iNzBP-00054w-8f
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 08:59:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572008349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q9Y6LUXciH6BCTmUCMR8bKcp8kmPSCpLDikZ75REqyU=;
 b=fzc5ch4HOUTtTWxogFCLcJHOxPDFtlRqH4I5ZqvKkYipuSTPZEAewar0Hc10G5g6gqigd/
 e3UjuhC6MlasJAG0j/6M4pNaLjWo5ZIA4V6yPBus4XHnj0/sZqfSQe1KrxtGIfo5jsnYqt
 C+qOZ8JXF+yjY04gB0byB/xsOU+dLZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-idP2yN5rOfuzZAtdxPArsw-1; Fri, 25 Oct 2019 08:59:06 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DE24107AD31;
 Fri, 25 Oct 2019 12:59:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE4765DD64;
 Fri, 25 Oct 2019 12:59:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 59E341138619; Fri, 25 Oct 2019 14:59:03 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PULL v2 00/73] tcg plugins and testing updates
References: <20191025063713.23374-1-alex.bennee@linaro.org>
Date: Fri, 25 Oct 2019 14:59:03 +0200
In-Reply-To: <20191025063713.23374-1-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Fri, 25 Oct 2019 07:36:00 +0100")
Message-ID: <87lft9rnfs.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: idP2yN5rOfuzZAtdxPArsw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I hate to interfere with the merging of working code for non-technical
reasons....

This is a plugin interface.  As I wrote in reply to v4, I'd like to see
a pragmatic argument why abuse of the plugin interface to circumvent the
GPL is not practical.  This might include "not a stable interface", "you
have to link with a truckload of gpl code", "the set of things you can
do is deliberately extremely limited".

Perhaps such an argument is made somewhere in these 73 patches already.
I admit to not having read them all :)  In the TCG plugin design document
perhaps?  Assuming it exists...

I proposed discussing the project's requirements for external interfaces
on GPL circumvention deterrence at the QEMU Summit next week.

If merging this could be delayed until the licensing ramifications have
become a bit more clear, I'd be obliged.


