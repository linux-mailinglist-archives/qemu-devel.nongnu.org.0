Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E83157CE60
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 16:58:41 +0200 (CEST)
Received: from localhost ([::1]:40796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEXdQ-0007ei-6Y
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 10:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1oEXZm-0001wB-8T
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 10:54:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1oEXZj-0004x0-KA
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 10:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658415288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kAA8j6kHkZWcPGDQU0GS8iMJ+IiLYAvh95JVFFzihDk=;
 b=WAm8ZmB0RyyiwNoz3OqMeCDTzFRjfRyFOTxug8nqrqP5F22FkvCkb7axipKA1ZlZbybAjt
 oxsMozpjvZTab0hwzYSOX78Rs+Xhxb/eLWuGWg2xHSRDJKAwnQKdRVY6CBmVXjH3kGDApG
 W5V5F6sB206JEhnysP044xXANsIWs90=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-aHkfRdLnOZ--MSc3SC2dbw-1; Thu, 21 Jul 2022 10:54:46 -0400
X-MC-Unique: aHkfRdLnOZ--MSc3SC2dbw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 810B11C006A9;
 Thu, 21 Jul 2022 14:54:46 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.54])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D82952026985;
 Thu, 21 Jul 2022 14:54:45 +0000 (UTC)
Date: Thu, 21 Jul 2022 09:54:44 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 1/9] tests: introduce tree-wide code style checking
Message-ID: <20220721145444.cnh4wbuqiqczqy42@redhat.com>
References: <20220707163720.1421716-1-berrange@redhat.com>
 <20220707163720.1421716-2-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220707163720.1421716-2-berrange@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 07, 2022 at 05:37:12PM +0100, Daniel P. Berrangé wrote:
> Historically QEMU has used the 'scripts/checkpatch.pl' script to
> validate various style rules but there are a number of issues:
> 
>  - Contributors / maintainers are reluctant to add new
>    tests to it, nor fix existint rules, because the Perl

existing

> 
> The 'prohibit' rule is matched line-wise across every .c source
> file. If any violation is found, the contents of that line are
> printed, and 'message' is shown as a error message.

Can we add an exception regex as well: the prohibit rule is ignored on
lines that also match the exception rule, allowing us to write a rule
that would recognize magic comments on lines where we intentionally
break the normal rule?

> +++ b/tests/style.py
> @@ -0,0 +1,218 @@

> +
> +# Expand a regular expression from the config file which
> +# can be in several formats
> +#
> +#  - a plain string - used as-is as a regular expression
> +#  - a list of strings - each element is joined with '|'
> +#  - a dict containing
> +#      - 'terms' - interpreted as a string / list of strings
> +#      - 'prefix' - added to the front of the regular
> +#      - 'prefix' - added to the end of the regular

'suffix'

> +
> +# Evalate the rule against the designated sources
> +#
> +# Returns: 1 if the rule failed against one or more sources, 0 otherwise
> +def evaluate(sources, name, rule, ignored=False):

Rather large, but looks like a nice translation of much of gnulib's
maint.mk rule engine.

> +
> +    if len(proc.stdout) > 0:
> +        print("\033[31;1mFAIL\033[0m ❌ (%0.2f secs)" % delta)
> +        print(proc.stdout.strip())
> +        print("\033[31;1mERROR\033[0m: %s: %s ❌" % (name, rule["message"]))
> +        return 1
> +    else:
> +        print("\033[32;1mPASS\033[0m ✅ (%0.2f secs)" % delta)
> +        return 0

Do we need to make the colorization dependent on whether output is a
terminal or a specific flag is in use?

> +++ b/tests/style.yml
> @@ -0,0 +1,88 @@
> +# Source code style checking rules
> +#
> +# Each top level key defines a new check, that is
> +# exposed as a test case in the meson 'style' test
> +# suite.
> +#
> +# Within each check, the following keys are valid
> +#
> +#  * files
> +#
> +#    A regular expression matching filenames that
> +#    are to be checked. Typically used to filter
> +#    based on file extension. If omitted all files
> +#    managed by git will be checked.
> +#
> +#  * prohibit
> +#
> +#    A regular expression matching content that is
> +#    not allowed to be present in source files. Matches
> +#    against single lines of text, unless 'multiline'
> +#    option overrides. Either this option or 'require'
> +#    must be present
> +#
> +#  * require
> +#
> +#    A regular expression matching content that must
> +#    always be present in source files. Matches against
> +#    single lines of text, unless 'multiline' option
> +#    overrides. Either this option of 'prohibit' must
> +#    be present
> +#
> +#  * multiline
> +#
> +#    A boolean controlling whether 'prohibit' and 'require'
> +#    regular expressions match single lines or the entire
> +#    file contents. Defaults to 'false', matching single
> +#    lines at a time.
> +#
> +#  * ignore
> +#
> +#    A regular expression matching files to exclude from
> +#    the check. This is typically used when certain files
> +#    otherwise checked have known acceptable violations

s/have/that have/

> +#    of the test.
> +#
> +#  * message
> +#
> +#    A string providing a message to emit when the test
> +#    condition fails. Must be present
> +#
> +#  * enabled
> +#
> +#    A boolean providing a way to temporarily disable
> +#    a check. Defaults to 'true' if omitted.
> +#
> +# For all the keys above which accept a regular expression,
> +# one of three syntaxes are permitted
> +#
> +#  * string
> +#
> +#    The full regular expression to match
> +#
> +#  * list of strings
> +#
> +#    Each element of the list will be combined with '|'
> +#    to form the final regular expression. This is typically
> +#    useful to keep line length short when specifying matches
> +#    across many filenames
> +#
> +#  * dict
> +#
> +#    Contains the keys:
> +#
> +#      * terms
> +#
> +#        Either a string or list of strings interpreted as above
> +#
> +#      * prefix
> +#
> +#        A match added to the front of the regex. Useful when
> +#        'terms' is a list of strings and a common prefix is
> +#        desired
> +#
> +#      * suffix
> +#
> +#        A match added to the front of the regex. Useful when

s/front/end/

> +#        'terms' is a list of strings and a common prefix is

s/prefix/suffix/

> +#        desired
> -- 
> 2.36.1
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


