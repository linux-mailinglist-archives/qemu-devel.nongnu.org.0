Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1EEBD7E0
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 07:46:02 +0200 (CEST)
Received: from localhost ([::1]:45660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iD07l-000425-Qv
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 01:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57593)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iD05S-0002uk-RP
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 01:43:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iD05O-0000Qw-UC
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 01:43:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45346)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1iD05O-0000Pw-P0; Wed, 25 Sep 2019 01:43:34 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F1BE04628B;
 Wed, 25 Sep 2019 05:43:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83FEF1001B05;
 Wed, 25 Sep 2019 05:43:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E4CAD113864E; Wed, 25 Sep 2019 07:43:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH] qemu-options.hx: remove stray quote
References: <20190924231325.25444-1-jsnow@redhat.com>
Date: Wed, 25 Sep 2019 07:43:29 +0200
In-Reply-To: <20190924231325.25444-1-jsnow@redhat.com> (John Snow's message of
 "Tue, 24 Sep 2019 19:13:25 -0400")
Message-ID: <87o8z9rkvy.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Wed, 25 Sep 2019 05:43:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 2a04ca6ac5..629a7b1186 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1192,7 +1192,7 @@ Instead of @option{-fda}, @option{-fdb}, you can use:
>  By default, @var{interface} is "ide" and @var{index} is automatically
>  incremented:
>  @example
> -@value{qemu_system_x86} -drive file=a -drive file=b"
> +@value{qemu_system_x86} -drive file=a -drive file=b
>  @end example
>  is interpreted like:
>  @example

Messed up more than ten years ago, in commit e0e7ada1d55, faithfully
copied around ever since.  Makes me wonder how much this part of
qemu-doc is actually read.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

