Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2994726DE5F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 16:37:31 +0200 (CEST)
Received: from localhost ([::1]:55036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIv2P-0008Ju-WD
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 10:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kIuhk-0004b8-01
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 10:16:08 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49765
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kIuhd-0002UB-UE
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 10:16:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600352160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mfk91ZLwcA151obhdySBDXW0lINLBQbPWikVuCPUtVE=;
 b=NFPm6AHxANY7OZfxfPhfCo80q47ubQ3zVQoGbsdBq9wLQQ7MGZmWaL8HmsewhMokZsc6YO
 WLk9lsABvos2rlpY+d0oSvn2Kh5h808hGnj9aSMvo4t+02dqM0wZgSyyBkZ5Y2nk4PF05B
 kMbm6W2xefP14lKM/hakVczlkgMLwBk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-EjDdiXsdPd-4hG4zO6ggdw-1; Thu, 17 Sep 2020 10:15:56 -0400
X-MC-Unique: EjDdiXsdPd-4hG4zO6ggdw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCDFF10BBED5;
 Thu, 17 Sep 2020 14:15:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 956885DE51;
 Thu, 17 Sep 2020 14:15:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 29D4F113864A; Thu, 17 Sep 2020 16:15:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 10/37] qapi/common.py: delint with pylint
References: <20200915224027.2529813-1-jsnow@redhat.com>
 <20200915224027.2529813-11-jsnow@redhat.com>
Date: Thu, 17 Sep 2020 16:15:53 +0200
In-Reply-To: <20200915224027.2529813-11-jsnow@redhat.com> (John Snow's message
 of "Tue, 15 Sep 2020 18:40:00 -0400")
Message-ID: <87r1r0pjza.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 02:16:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/common.py | 16 +++++++---------
>  scripts/qapi/schema.py | 14 +++++++-------
>  2 files changed, 14 insertions(+), 16 deletions(-)
>
> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> index 87d87b95e5..c665e67495 100644
> --- a/scripts/qapi/common.py
> +++ b/scripts/qapi/common.py
> @@ -14,6 +14,11 @@
>  import re
>  
>  
> +EATSPACE = '\033EATSPACE.'
> +POINTER_SUFFIX = ' *' + EATSPACE
> +c_name_trans = str.maketrans('.-', '__')
> +
> +

You rename and move.  pylint gripes about the names, but it doesn't
actually ask for the move, as far as I can tell.  Can you explain why
you move?

>  # ENUMName -> ENUM_NAME, EnumName1 -> ENUM_NAME1
>  # ENUM_NAME -> ENUM_NAME, ENUM_NAME1 -> ENUM_NAME1, ENUM_Name2 -> ENUM_NAME2
>  # ENUM24_Name -> ENUM24_NAME
> @@ -42,9 +47,6 @@ def c_enum_const(type_name, const_name, prefix=None):
>      return camel_to_upper(type_name) + '_' + c_name(const_name, False).upper()
>  
>  
> -c_name_trans = str.maketrans('.-', '__')
> -
> -
>  # Map @name to a valid C identifier.
>  # If @protect, avoid returning certain ticklish identifiers (like
>  # C keywords) by prepending 'q_'.
> @@ -89,10 +91,6 @@ def c_name(name, protect=True):
>      return name
>  
>  
> -eatspace = '\033EATSPACE.'
> -pointer_suffix = ' *' + eatspace
> -
> -
>  class Indent:
>      """
>      Indent-level management.
> @@ -135,12 +133,12 @@ def pop(self, amount: int = 4) -> int:
>  
>  
>  # Generate @code with @kwds interpolated.
> -# Obey indent_level, and strip eatspace.
> +# Obey INDENT level, and strip EATSPACE.

Is the change to INDENT intentional?

>  def cgen(code, **kwds):
>      raw = code % kwds
>      if INDENT:
>          raw, _ = re.subn(r'^(?!(#|$))', str(INDENT), raw, flags=re.MULTILINE)
> -    return re.sub(re.escape(eatspace) + r' *', '', raw)
> +    return re.sub(re.escape(EATSPACE) + r' *', '', raw)
>  
>  
>  def mcgen(code, **kwds):
[...]


