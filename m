Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EA341D670
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 11:36:29 +0200 (CEST)
Received: from localhost ([::1]:41924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVsUO-0008Nn-3P
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 05:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mVsT0-0007cY-Lo
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 05:35:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mVsSx-0002F6-P5
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 05:35:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632994499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uyKhSRx/ENyQ3Hd1A3NJxb/wg7jKkxrhI/DlfNmllXM=;
 b=jEgZTpp0PyzjBm33OlK9ZT+CIqz1GuBQp3Wbtci0qIx2V9YDtWdvG+7ObRlX1E/kES4xK1
 lNu+TUdu9j9LjBXWMudlHm2zEJyv5Qa8ln8b0MveHi8eeAl1Py3cTHgSipeBnvmXFZSYS2
 JoYMWLTO4U2uVNFgHxjaArGCBFd9bY8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-ybkjN2T2OmC1-BT01wYHNA-1; Thu, 30 Sep 2021 05:34:57 -0400
X-MC-Unique: ybkjN2T2OmC1-BT01wYHNA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14F26100C621;
 Thu, 30 Sep 2021 09:34:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B591100760B;
 Thu, 30 Sep 2021 09:34:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2DC60113865F; Thu, 30 Sep 2021 11:34:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 08/13] qapi/parser: Introduce NullSection
References: <20210929194428.1038496-1-jsnow@redhat.com>
 <20210929194428.1038496-9-jsnow@redhat.com>
Date: Thu, 30 Sep 2021 11:34:55 +0200
In-Reply-To: <20210929194428.1038496-9-jsnow@redhat.com> (John Snow's message
 of "Wed, 29 Sep 2021 15:44:23 -0400")
Message-ID: <87tui2qudc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Here's the weird bit. QAPIDoc generally expects -- virtually everywhere
> -- that it will always have a current section. The sole exception to
> this is in the case that end_comment() is called, which leaves us with
> *no* section. However, in this case, we also don't expect to actually
> ever mutate the comment contents ever again.
>
> NullSection is just a Null-object that allows us to maintain the
> invariant that we *always* have a current section, enforced by static
> typing -- allowing us to type that field as QAPIDoc.Section instead of
> the more ambiguous Optional[QAPIDoc.Section].
>
> end_section is renamed to switch_section and now accepts as an argument
> the new section to activate, clarifying that no callers ever just
> unilaterally end a section; they only do so when starting a new section.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
>
> ---
>
> For my money: Optional types can be a nuisance because an unfamiliar
> reader may wonder in what circumstances the field may be unset. This
> makes the condition quite a bit more explicit and statically provable.
>
> Doing it in this way (and not by creating a dummy section) will also
> continue to reject (rather noisily) any erroneous attempts to append
> additional lines after end_comment() has been called.
>
> Also, this section isn't indexed into .sections[] and isn't really
> visible in any way to external users of the class, so it seems like a
> harmless and low-cost way to formalize the "life cycle" of a QAPIDoc
> parser.
>
> Clean and clear as I can make it, in as few lines as I could muster.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/parser.py | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
>
> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> index 1fdc5bc7056..123fc2f099c 100644
> --- a/scripts/qapi/parser.py
> +++ b/scripts/qapi/parser.py
> @@ -478,6 +478,13 @@ def __init__(self, parser, name, indent=0):
>          def connect(self, member):
>              self.member = member
>  
> +    class NullSection(Section):
> +        """
> +        Empty section that signifies the end of a doc block.

What about "Dummy section for use at the end of a doc block"?

> +        """
> +        def append(self, line):
> +            assert False, "BUG: Text appended after end_comment() called."

How can a failing assertion *not* be a bug?

> +
>      def __init__(self, parser, info):
>          # self._parser is used to report errors with QAPIParseError.  The
>          # resulting error position depends on the state of the parser.
> @@ -525,7 +532,7 @@ def append(self, line):
>          self._append_line(line)
>  
>      def end_comment(self):
> -        self._end_section()
> +        self._switch_section(QAPIDoc.NullSection(self._parser))
>  
>      @staticmethod
>      def _is_section_tag(name):
> @@ -702,9 +709,9 @@ def _start_symbol_section(self, symbols_dict, name, indent):
>              raise QAPIParseError(self._parser,
>                                   "'%s' parameter name duplicated" % name)
>          assert not self.sections
> -        self._end_section()
> -        self._section = QAPIDoc.ArgSection(self._parser, name, indent)
> -        symbols_dict[name] = self._section
> +        new_section = QAPIDoc.ArgSection(self._parser, name, indent)
> +        self._switch_section(new_section)
> +        symbols_dict[name] = new_section
>  
>      def _start_args_section(self, name, indent):
>          self._start_symbol_section(self.args, name, indent)
> @@ -716,13 +723,11 @@ def _start_section(self, name=None, indent=0):
>          if name in ('Returns', 'Since') and self.has_section(name):
>              raise QAPIParseError(self._parser,
>                                   "duplicated '%s' section" % name)
> -        self._end_section()
> -        self._section = QAPIDoc.Section(self._parser, name, indent)
> -        self.sections.append(self._section)
> -
> -    def _end_section(self):
> -        assert self._section is not None
> +        new_section = QAPIDoc.Section(self._parser, name, indent)
> +        self._switch_section(new_section)
> +        self.sections.append(new_section)
>  
> +    def _switch_section(self, new_section):
>          text = self._section.text = self._section.text.strip()
>  
>          # Only the 'body' section is allowed to have an empty body.
> @@ -735,7 +740,7 @@ def _end_section(self):
>                  self._parser,
>                  "empty doc section '%s'" % self._section.name)
>  
> -        self._section = None
> +        self._section = new_section
>  
>      def _append_freeform(self, line):
>          match = re.match(r'(@\S+:)', line)

Feels clearer, thanks!


