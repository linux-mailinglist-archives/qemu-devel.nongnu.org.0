Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B735B5051E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 11:06:11 +0200 (CEST)
Received: from localhost ([::1]:48922 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfKvS-0007Cv-Vz
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 05:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48605)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hfKre-0003o6-59
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 05:02:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hfKrc-00022x-6s
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 05:02:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39558)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hfKra-0007pC-7R
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 05:02:10 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1F09530BB546
 for <qemu-devel@nongnu.org>; Mon, 24 Jun 2019 09:01:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-169.ams2.redhat.com
 [10.36.117.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE4AF5D721;
 Mon, 24 Jun 2019 09:01:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AF52811386B0; Mon, 24 Jun 2019 11:00:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1561116534-21814-1-git-send-email-pbonzini@redhat.com>
Date: Mon, 24 Jun 2019 11:00:51 +0200
In-Reply-To: <1561116534-21814-1-git-send-email-pbonzini@redhat.com> (Paolo
 Bonzini's message of "Fri, 21 Jun 2019 13:28:54 +0200")
Message-ID: <87tvcftl18.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 24 Jun 2019 09:01:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH RFC] checkpatch: do not warn for multiline
 parenthesized returned value
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

> While indeed we do not want to have
>
>     return (a);
>
> it is less clear that this applies to
>
>     return (a &&
>             b);
>
> Some editors indent more nicely if you have parentheses, and some people's
> eyes may appreciate that as well.

No objection.

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  scripts/checkpatch.pl | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index c2aaf42..2f81371 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2296,7 +2296,8 @@ sub process {
>  			       $value =~ s/\([^\(\)]*\)/1/) {
>  			}
>  #print "value<$value>\n";
> -			if ($value =~ /^\s*(?:$Ident|-?$Constant)\s*$/) {
> +			if ($value =~ /^\s*(?:$Ident|-?$Constant)\s*$/ &&
> +			    $line =~ /;$/) {
>  				ERROR("return is not a function, parentheses are not required\n" . $herecurr);
>  
>  			} elsif ($spacing !~ /\s+/) {


