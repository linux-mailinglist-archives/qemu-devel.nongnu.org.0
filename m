Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA343088AF
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:58:10 +0100 (CET)
Received: from localhost ([::1]:60952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SPh-0008Fw-G7
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:58:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l5SMu-0006Y3-Fb
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:55:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l5SMq-0004pa-D4
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:55:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611921310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ElBCiwihzEnLp9k5HTNmbD98dJD+n9yI/cLIg0TigEI=;
 b=XSnwBM1BmDz3S6a4xeq3BCpWdCf6ayGZGzUmYD8q0iGoRF9lkXIOcFDdrjgARkrVkVcb+Y
 bo64HeKtV5FrILSjI3JfhE3746KmypG/kfuY0udu8ztZA4iQIb+pz5dW6TF+zo6Pu3AxtE
 QBbVPkgOSHr8AFbhTO+Hvm1mLqjirgg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-ZF13kt_0O3OK48LxpS4tLg-1; Fri, 29 Jan 2021 06:55:07 -0500
X-MC-Unique: ZF13kt_0O3OK48LxpS4tLg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89C901800D41;
 Fri, 29 Jan 2021 11:55:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8055F620D7;
 Fri, 29 Jan 2021 11:54:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E51F5113865F; Fri, 29 Jan 2021 12:54:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH RFC 0/1] QOM type names and QAPI
References: <20210129081519.3848145-1-armbru@redhat.com>
Date: Fri, 29 Jan 2021 12:54:52 +0100
In-Reply-To: <20210129081519.3848145-1-armbru@redhat.com> (Markus Armbruster's
 message of "Fri, 29 Jan 2021 09:15:18 +0100")
Message-ID: <875z3g2c1f.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 frederic.konrad@adacore.com, kraxel@redhat.com, edgar.iglesias@gmail.com,
 jcd@tribudubois.net, qemu-block@nongnu.org, quintela@redhat.com,
 andrew.smirnov@gmail.com, marcandre.lureau@redhat.com, atar4qemu@gmail.com,
 ehabkost@redhat.com, alistair@alistair23.me, dgilbert@redhat.com,
 chouteau@adacore.com, qemu-arm@nongnu.org, peter.chubb@nicta.com.au,
 jsnow@redhat.com, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> QAPI has naming rules.  docs/devel/qapi-code-gen.txt:
>
>     === Naming rules and reserved names ===
>
>     All names must begin with a letter, and contain only ASCII letters,
>     digits, hyphen, and underscore.  There are two exceptions: enum values
>     may start with a digit, and names that are downstream extensions (see
>     section Downstream extensions) start with underscore.
>
>     [More on reserved names, upper vs. lower case, '-' vs. '_'...]
>
> The generator enforces the rules.
>
> Naming rules help in at least three ways:
>
> 1. They help with keeping names in interfaces consistent and
>    predictable.
>
> 2. They make avoiding collisions with the users' names in the
>    generator simpler.
>
> 3. They enable quote-less, evolvable syntax.
>
>    For instance, keyval_parse() syntax consists of names, values, and
>    special characters ',', '=', '.'
>
>    Since names cannot contain special characters, there is no need for
>    quoting[*].  Simple.
>
>    Values are unrestricted, but only ',' is special there.  We quote
>    it by doubling.
>
>    Together, we get exactly the same quoting as in QemuOpts.  This is
>    a feature.
>
>    If we ever decice to extend key syntax, we have plenty of special
>    characters to choose from.  This is also a feature.
>
>    Both features rely on naming rules.
>
> QOM has no naming rules whatsoever.  Actual names aren't nearly as bad
> as they could be.  Still, there are plenty of "funny" names.  This
> will become a problem when we
>
> * Switch from QemuOpts to keyval_parse()
>
>   QOM type names must not contain special characters, unless we
>   introduce more quoting.  Which we shouldn't, because the value of
>   special characters in names is negligible compared to the hassle of
>   having to quote them.
>
> * QAPIfy (the compile-time static parts of) QOM
>
>   QOM type names become QAPI enum values.  They must conform to QAPI
>   naming rules.
>
> Adopting QAPI naming rules for QOM type names takes care of both.
>
> Let's review the existing offenders.
>
> 1. We have a few type names containing ',', and one containing ' '.
>    The former require QemuOpts / keyval quoting (double the comma),
>    the latter requires shell quoting.  There is no excuse for making
>    our users remember and do such crap.  PATCH 1 eliminates it.
>
> 2. We have some 550 type names containing '.'.  QAPI's naming rules
>    could be relaxed to accept '.', but keyval_parse()'s can't.

Thinko: keyval_parse() copes.  QOM type names occur as *value*, not as
key.

One more thing on QAPI naming rules.  QAPI names get mapped to (parts
of) C identifiers.  These mappings are not injective.  The basic mapping
is simple: replace characters other than letters and digits by '_'.

This means names distinct QAPI names can clash in C.  Fairly harmless
when the only "other" characters are '-' and '_'.  The more "others" we
permit, the more likely confusing clashes become.  Not a show stopper,
"merely" an issue of ergonomics.

>    Aside: I wish keyval_parse() would use '/' instead of '.', but it's
>    designed to be compatible to the block layer's existing use of
>    dotted keys (shoehorned into QemuOpts).
>
> 3. We have six type names containing '+'.  Four of them also contain
>    '.'.  Naming rules could be relaxed to accept '+'.  I'm not sure
>    it's worthwhile.
>
> 4. We have 19 names starting with a digit.  Three of them also contain
>    '.'.  Leading digit is okay as QAPI enum, not okay as
>    keyval_parse() key fragment.  We can either rename these types, or
>    make keyval_parse() a bit less strict.
>
> Of the type names containing '.' or '+'[**], 293 are CPUs, 107 are
> machines, and 150 are something else.  48 of them can be plugged with
> -device, all s390x or spapr CPUs.
>
> Can we get rid of '.'?
>
> I figure we could keep old names as deprecated aliases if we care.
> Perhaps just the ones that can be plugged with -device.
>
>
> [*] Paolo's "[PATCH 04/25] keyval: accept escaped commas in implied
> option" provides for comma-quoting.  I'm ignoring it here for brevity.
> I assure you it doesn't weaken my argument.
>
> [**] They are:
>     603e_v1.1-powerpc-cpu
[...]


