Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD0443921E
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 11:14:15 +0200 (CEST)
Received: from localhost ([::1]:45446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mew3a-00037s-Ar
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 05:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mew2S-0002Hn-KZ
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 05:13:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mew2O-00015c-SU
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 05:13:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635153177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qvZTsEYBKGZA8O+LyiP14kUlEGbSfeV+rUfId51+uNs=;
 b=J4RbnZDG2sFm5w0TsrEyaJmtBt+3HXjWYyhFMnPP0smBXNNszNjFbapXqMSr4nt9iz+lob
 kDOsWspuv+5J+S7rrT+NQ0szdz+maXO38cNPGEOZKM8v2jlJkOnttx8oIjRRBoxY1S0H4z
 gCEF0E+vnaoY4tJDbMSpykCCRghgvy0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-p_Dwi044PKG63WpnHk-2jQ-1; Mon, 25 Oct 2021 05:12:56 -0400
X-MC-Unique: p_Dwi044PKG63WpnHk-2jQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D9A01007905;
 Mon, 25 Oct 2021 09:12:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E05F694B4;
 Mon, 25 Oct 2021 09:12:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0461F11380A7; Mon, 25 Oct 2021 11:12:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-trivial@nongnu.org
Subject: Re: [PATCH] Trim some trailing space from human-readable output
References: <20211009152401.2982862-1-armbru@redhat.com>
Date: Mon, 25 Oct 2021 11:12:44 +0200
In-Reply-To: <20211009152401.2982862-1-armbru@redhat.com> (Markus Armbruster's
 message of "Sat, 9 Oct 2021 17:24:01 +0200")
Message-ID: <87v91lii2b.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: jiri@resnulli.us, ehabkost@redhat.com, david@redhat.com, groug@kaod.org,
 qemu-devel@nongnu.org, jcmvbkbc@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nominating for qemu-trivial.

Tweaking the subject to

    monitor: Trim some trailing space from human-readable output

as Philippe suggested would be nice.

Markus Armbruster <armbru@redhat.com> writes:

> I noticed -cpu help printing enough trailing spaces to make the output
> at least 84 characters wide.  Looks ugly unless the terminal is wider.
> Ugly or not, trailing spaces are stupid.
>
> The culprit is this line in x86_cpu_list_entry():
>
>     qemu_printf("x86 %-20s  %-58s\n", name, desc);
>
> This prints a string with minimum field left-justified right before a
> newline.  Change it to
>
>     qemu_printf("x86 %-20s  %s\n", name, desc);
>
> which avoids the trailing spaces and is simpler to boot.
>
> A search for the pattern with "git-grep -E '%-[0-9]+s\\n'" found a few
> more instances.  Change them similarly.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>


