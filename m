Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA7982B37
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 07:46:06 +0200 (CEST)
Received: from localhost ([::1]:58614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1husIP-0008Cm-K7
	for lists+qemu-devel@lfdr.de; Tue, 06 Aug 2019 01:46:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52597)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1husHN-0007eq-EV
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 01:45:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1husHM-0002m6-LU
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 01:45:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50228)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1husHM-0002lu-GX
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 01:45:00 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 30E86300BEB4
 for <qemu-devel@nongnu.org>; Tue,  6 Aug 2019 05:44:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-51.ams2.redhat.com
 [10.36.116.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC5D360C47;
 Tue,  6 Aug 2019 05:44:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 54A4C1138619; Tue,  6 Aug 2019 07:44:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1565042940-8837-1-git-send-email-pbonzini@redhat.com>
Date: Tue, 06 Aug 2019 07:44:57 +0200
In-Reply-To: <1565042940-8837-1-git-send-email-pbonzini@redhat.com> (Paolo
 Bonzini's message of "Tue, 6 Aug 2019 00:09:00 +0200")
Message-ID: <87imrasv8m.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 06 Aug 2019 05:44:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] Makefile: remove unused variables
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

Paolo Bonzini <pbonzini@redhat.com> writes:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  Makefile | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 73fbba0..7b0e2f4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -429,10 +429,6 @@ dummy := $(call unnest-vars,, \
>                  io-obj-y \
>                  common-obj-y \
>                  common-obj-m \
> -                ui-obj-y \
> -                ui-obj-m \
> -                audio-obj-y \
> -                audio-obj-m \
>                  trace-obj-y)
>  
>  include $(SRC_PATH)/tests/Makefile.include

Reviewed-by: Markus Armbruster <armbru@redhat.com>

