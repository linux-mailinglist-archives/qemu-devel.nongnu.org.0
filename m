Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED3040252C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 10:31:32 +0200 (CEST)
Received: from localhost ([::1]:54056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNWVv-00083x-CL
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 04:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNWSx-0005oI-Ak
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:28:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNWSt-0000Sx-Vs
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:28:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631003302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=moawCLYSupqB2dbFtNvQHP83HMxlJBjoKwx1j16d5ko=;
 b=H3PwwGpJ+rJADV0caJdId6qp4NUIS1B9zs0gNyCQDvHjZHf9APVNzP5VgPcIs9/N6Gn5CS
 FM2xlAeSHPizn5q+AK9GJ7ztBq5pur+XhZuT0QQlwOohDy7TG2r1LBfjshzlUYtfXhbylJ
 vW2/3JPPX9zDSeYxoazin5vKAPND0bM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-s5XS5DfpPFOLN0oJrI2XMA-1; Tue, 07 Sep 2021 04:28:19 -0400
X-MC-Unique: s5XS5DfpPFOLN0oJrI2XMA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDB8E835DE7;
 Tue,  7 Sep 2021 08:28:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA85E19723;
 Tue,  7 Sep 2021 08:28:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 37A061138606; Tue,  7 Sep 2021 10:28:17 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 2/6] qapi/parser: Allow empty QAPIDoc Sections
References: <20210520225710.168356-1-jsnow@redhat.com>
 <20210520225710.168356-3-jsnow@redhat.com>
Date: Tue, 07 Sep 2021 10:28:17 +0200
In-Reply-To: <20210520225710.168356-3-jsnow@redhat.com> (John Snow's message
 of "Thu, 20 May 2021 18:57:06 -0400")
Message-ID: <87sfyg6b8e.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> It simplifies the typing to say that _section is always a
> QAPIDoc.Section().

If you say so....

> To accommodate this change, we must allow for this object to evaluate to
> False for functions like _end_section which behave differently based on
> whether or not a Section has been started.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
>
> ---
>
> Probably a better fix is to restructure the code to prevent empty
> sections from being "ended", but that seems like a bigger whale than
> what I'm after at the immediate moment.

Do we have a TODO comment for that?

>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/parser.py | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> index b6a5e661215..3ddde318376 100644
> --- a/scripts/qapi/parser.py
> +++ b/scripts/qapi/parser.py
> @@ -456,6 +456,9 @@ def __init__(self, parser, name=None, indent=0):
>              # the expected indent level of the text of this section
>              self._indent = indent
>  
> +        def __bool__(self) -> bool:
> +            return bool(self.name or self.text)
> +
>          def append(self, line):
>              # Strip leading spaces corresponding to the expected indent level
>              # Blank lines are always OK.

Overriding __bool__() is the minimally invasive compensation for the
next hunk's replacement of None by a QAPIDoc.Section

However, I'm wary of overriding __bool__().  It creates a difference
between "if object:" and "if object is not None:".  Gives me a queasy
feeling, as shortening the latter to the former is pretty much
automatic.

A boring .is_empty() would avoid that, but we'd have to adjust "if S" to
"if S.is_empty()" wherever we changed S from Optional[Section] to
Section.  Which S could be affected?

The following variables get assigned Section or ArgSection:

    QAPIDoc.body
    QAPIDoc._section
    QAPIDoc.args[NAME]
    QAPIDoc.features[NAME]

.body, .args[NAME] and .features[NAME] are never None I believe.

._section is also assigned None, in ._end_section().  It remains None
until the next ._start*_section().

The only use of .section that doesn't dot into it is in ._end_section().
That's the only spot to adjust.

Confirm by testing: in all of "make check", Section.__bool__() is only
ever called from QAPIDoc._end_section().  Checked by sticking
traceback.print_stack() into .__bool__().

> @@ -722,7 +725,7 @@ def _end_section(self):
>                  raise QAPIParseError(
>                      self._parser,
>                      "empty doc section '%s'" % self._section.name)
> -            self._section = None
> +            self._section = QAPIDoc.Section(self._parser)
>  
>      def _append_freeform(self, line):
>          match = re.match(r'(@\S+:)', line)

Replacing None by QAPIDoc.Section doesn't just simplify the typing!  It
also creates a bogus "additional section" (in the sense of QAPIDoc's
class comment) after any section.  Works, because the .start*_section()
all call .end_section() first, .end_section() does nothing for empty
sections, and the bogus sections remain empty, unless we somehow screw
up the code to add contents to them.  Such screwups are now possible,
whereas before they would crash.

This correctness argument isn't obvious, and therefore should be made in
the commit message.


