Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCE057BDF0
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 20:41:07 +0200 (CEST)
Received: from localhost ([::1]:49086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEEd8-0000PS-8N
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 14:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1oEEa2-0005og-Uh
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 14:37:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1oEEZz-0004BZ-BA
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 14:37:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658342269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OzxoHG0NmAKDZ6rIjrRjegOkMwYdUXokW5QAqPxCW+c=;
 b=OWgeQK6t6MML/gerXjy/oaouwUIDNkaD9FEHJ2nSLLtkizBR4jqFYdrX4K2HxTJgNrLCYA
 gG0nPQCziZWdfG/yUWMYzRXj6NO93rh5SB1V0mthTTV6d5llgw+ywyg7dlNhhOBBEYXm3u
 yAT41/uxYZh6W5mKxGmIcJh/wQcw8KE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-lBIOir5oMk6-5Ac-Hr2zkA-1; Wed, 20 Jul 2022 14:37:40 -0400
X-MC-Unique: lBIOir5oMk6-5Ac-Hr2zkA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 328FE852AC3;
 Wed, 20 Jul 2022 18:37:40 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E52D2166B2A;
 Wed, 20 Jul 2022 18:37:39 +0000 (UTC)
Date: Wed, 20 Jul 2022 13:37:37 -0500
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 3/5] configure: Don't use bash-specific
 string-replacement syntax
Message-ID: <20220720183737.ib7awdtbilmjtp5a@redhat.com>
References: <20220720152631.450903-1-peter.maydell@linaro.org>
 <20220720152631.450903-4-peter.maydell@linaro.org>
 <20220720162954.hzrv4ypgobcgwmeu@redhat.com>
 <CAFEAcA_COkEZSoy6jRYBmyfwFc787vFs+Nn3s5RWB5AKX62LxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_COkEZSoy6jRYBmyfwFc787vFs+Nn3s5RWB5AKX62LxQ@mail.gmail.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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

On Wed, Jul 20, 2022 at 06:32:22PM +0100, Peter Maydell wrote:
> > > +    # backslash escape any '\' and '"' characters
> > > +    printf "%s" "$e" | sed -e 's/\([\"]\)/\\\1/g'
> >
> > You've fixed the bashism, but at the expense of a non-POSIX use of
> > sed.  POSIX says the input to sed must be a text file (ending in a
> > newline; but $e does not), and as a result it always outputs a newline
> > (but you don't want a newline before the closing """).  GNU sed
> > happens to do what you want for input not ending in a newline, but I
> > don't remember off-hand whether BSD sed does, and I know that Solaris
> > sed does not.
> 
> I just copied the approach we already take in quote_sh:
> 
> quote_sh() {
>     printf "%s" "$1" | sed "s,','\\\\'',g; s,.*,'&',"
> }
> 
> Is that also relying on this non-portable sed use?

Yep. And since no one has complained, BSD sed probably handles it the
way we want (input without a trailing line getting substituted and
re-output without a trailing newline).

If we cared, this one could also be fixed:

quote_sh() {
    printf "'%s'" "$(printf '%s\n' "$1" | sed "s,','\\\\'',g")"
}

Also note that we are depending on $1 never containing newlines, because
this change would alter the existing:

$ quote_sh "a
c"
'a'
'c'

into:

$ quote_sh "a
c"
'a
c'

which is probably more what you wanted.

> 
> > If this passes on BSD, then I'm okay with it; but if we want to avoid
> > non-POSIX altogether, this should work (using the shell's $() to strip
> > the trailing newline we added to keep sed happy):
> >
> > # backslash escape any '\' and '"' characters
> > printf '"""%s""",' "$(printf "%s\n" "$e" | sed -e '/s/\([\"]\)/\\\1/g')"
> 
> Mmm.

Given that no one has complained about quote_sh, insisting on POSIX
compliance (with its resulting increase in line noise and length) is
not winning any maintainability arguments ;)

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


