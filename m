Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0436B41D5B4
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 10:50:14 +0200 (CEST)
Received: from localhost ([::1]:41082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVrlc-0002i0-TQ
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 04:50:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mVril-0008Pa-7w
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 04:47:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mVrij-0004KD-5W
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 04:47:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632991632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wzj9huDbGjgQnEFoVzzwnzI0uIiKMwR4c1oMJzotNWc=;
 b=eyy3OKql9aa+4B8d+hjt7bj5hRAh7PMfwsLY47LZSOJxBxCxGFrqczZLwcULvXCFtrUozh
 ueGpQ+9SaFUbqVe/qOVB27Qumgl1ZDPspEJ6F38tODq8NJyVSuFFOj17D2IwmOhfNqrjPM
 xwil8NTiZxRkPMwdak0BqxCtbZp07Qc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-RnfGIyT3PgqFcjCDIBa3Cw-1; Thu, 30 Sep 2021 04:47:10 -0400
X-MC-Unique: RnfGIyT3PgqFcjCDIBa3Cw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1912B1018720;
 Thu, 30 Sep 2021 08:47:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DCE3860877;
 Thu, 30 Sep 2021 08:47:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8CE97113865F; Thu, 30 Sep 2021 10:47:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 06/13] qapi/parser: remove FIXME comment from
 _append_body_line
References: <20210929194428.1038496-1-jsnow@redhat.com>
 <20210929194428.1038496-7-jsnow@redhat.com>
Date: Thu, 30 Sep 2021 10:47:08 +0200
In-Reply-To: <20210929194428.1038496-7-jsnow@redhat.com> (John Snow's message
 of "Wed, 29 Sep 2021 15:44:21 -0400")
Message-ID: <87y27eqwkz.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

> True, we do not check the validity of this symbol -- but we don't check
> the validity of definition names during parse, either -- that happens
> later, during the expr check. I don't want to introduce a dependency on
> expr.py:check_name_str here and introduce a cycle.
>
> Instead, rest assured that a documentation block is required for each
> definition. This requirement uses the names of each section to ensure
> that we fulfilled this requirement.
>
> e.g., let's say that block-core.json has a comment block for
> "Snapshot!Info" by accident. We'll see this error message:
>
> In file included from ../../qapi/block.json:8:
> ../../qapi/block-core.json: In struct 'SnapshotInfo':
> ../../qapi/block-core.json:38: documentation comment is for 'Snapshot!Info'
>
> That's a pretty decent error message.
>
> Now, let's say that we actually mangle it twice, identically:
>
> ../../qapi/block-core.json: In struct 'Snapshot!Info':
> ../../qapi/block-core.json:38: struct has an invalid name
>
> That's also pretty decent. If we forget to fix it in both places, we'll
> just be back to the first error.
>
> Therefore, let's just drop this FIXME and adjust the error message to
> not imply a more thorough check than is actually performed.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/parser.py                 | 6 ++++--
>  tests/qapi-schema/doc-empty-symbol.err | 2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> index 2f93a752f66..52748e8e462 100644
> --- a/scripts/qapi/parser.py
> +++ b/scripts/qapi/parser.py
> @@ -558,9 +558,11 @@ def _append_body_line(self, line):
>                  raise QAPIParseError(
>                      self._parser, "extra whitespace around symbol declaration")
>              self.symbol = line[1:-1]
> -            # FIXME invalid names other than the empty string aren't flagged
> +            # Invalid names are not checked here, but the name provided MUST
> +            # match the following definition, which *is* validated.
>              if not self.symbol:
> -                raise QAPIParseError(self._parser, "invalid name")
> +                raise QAPIParseError(
> +                    self._parser, "doc symbol name cannot be blank")

"blank" feels like "empty or just whitespace" to me.  We actually mean
"empty".

What about "name required after @"?

>          elif self.symbol:
>              # This is a definition documentation block
>              name = line.split(' ', 1)[0]
> diff --git a/tests/qapi-schema/doc-empty-symbol.err b/tests/qapi-schema/doc-empty-symbol.err
> index 81b90e882a7..a4981ee28ea 100644
> --- a/tests/qapi-schema/doc-empty-symbol.err
> +++ b/tests/qapi-schema/doc-empty-symbol.err
> @@ -1 +1 @@
> -doc-empty-symbol.json:4:1: invalid name
> +doc-empty-symbol.json:4:1: doc symbol name cannot be blank


