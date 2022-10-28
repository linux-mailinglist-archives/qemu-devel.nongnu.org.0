Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4ED61095B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 06:41:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooH7c-0005Va-HQ; Fri, 28 Oct 2022 00:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ooH7b-0005VA-8j
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 00:37:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ooH7Z-0007e8-KW
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 00:37:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666931847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HevUNu4VTikP1BMjmTn5V8YmUzjfRoIqIjueXrq84+E=;
 b=GP76/WvuQ/8r9Z1fZYsnG3J3NCvTy3t5cQX0nEUy9quZMGfpQeH6D6RIocJrhjyf48R6wG
 R9ANEczRBuhODjDpeOVCcXZPUJGQtItnEG6PCyrRPii6Ne0CZlyXn3K0yOstC/pmYpaoWa
 4MErWRiCmpa2q6v/xh+I1yvhK0kTa50=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-DA71Fa3MMBKhJn64oNvr3g-1; Fri, 28 Oct 2022 00:37:23 -0400
X-MC-Unique: DA71Fa3MMBKhJn64oNvr3g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99AE63C0D86A;
 Fri, 28 Oct 2022 04:37:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D3D77492B16;
 Fri, 28 Oct 2022 04:37:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C171721E6921; Fri, 28 Oct 2022 06:37:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>,  Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>,  Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org,  Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,  Cornelia Huck <cohuck@redhat.com>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH 0/3] target: Rename headers using .def extension to .h.inc
References: <20221025235006.7215-1-philmd@linaro.org>
 <87bkpxl4a1.fsf@pond.sub.org>
 <CAFEAcA_WefVz8fefKTVq8vkiOkdXhrXkcwj4G6bSZPaFoRTSMg@mail.gmail.com>
 <87r0ytjie3.fsf@pond.sub.org>
 <CAFEAcA_-udYfzGNzfARvK1G2ZVKCP+_spEUKa3THroRQ+9SMMQ@mail.gmail.com>
Date: Fri, 28 Oct 2022 06:37:13 +0200
In-Reply-To: <CAFEAcA_-udYfzGNzfARvK1G2ZVKCP+_spEUKa3THroRQ+9SMMQ@mail.gmail.com>
 (Peter Maydell's message of "Thu, 27 Oct 2022 18:24:16 +0100")
Message-ID: <87pmecimx2.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 27 Oct 2022 at 18:17, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Thu, 27 Oct 2022 at 15:40, Markus Armbruster <armbru@redhat.com> wrote:
>> >> I wonder why we use any of .def, .h.inc, .inc.h, .c.inc, .inc.c.  Why
>> >> not .h and call it a day?  No need to configure each and every editor to
>> >> tread these as C code.
>> >
>> > It says "this isn't actually a header in the usual sense". That's
>> > useful for automated scripted checks (eg we don't want
>> > scripts/clean-header-guards.pl to add the standard #include header
>> > guards to this sort of file) and for humans (if you see one of these
>> > files included as part of the normal #include block at the top of
>> > a .c file that's probably a mistake; if you see it being used then
>> > you know there's likely multiple-inclusion shenanigans going on.)
>>
>> scripts/clean-header-guards.pl needs exclude patterns anyway.
>
> Yes, in theory instead of having a systematic convention for
> filenames we could instead give the files names that don't
> let you easily distinguish them from plain old header files and
> require every use like this to update clean-header-guards.pl,
> but that seems to me to be clearly worse than maintaining the
> filename convention that we already have.

Handle that just like for plain .h: when you re-run the script, you fix
its complaints either by fixing the header or by adding it to the
exclude pattern.

>> Comments would likely work better for humans than obscure naming
>> conventions.
>>
>> Make them stylized, and they work for scripts, too.
>
> We already have a stylized convention, it's the filename...

True.  But its opaque both for tools (editors mostly) and humans.  Tools
need to be configured, and humans need to be taught.

Moreover, we don't have *a* stylized convention, we have *two*: funny
filenames (several patterns, but that's fixable), and exclude patterns.

> Comments inside the .inc file are also helpful, of course.

Let's add a third!  Stylized comments!

I'll shut up now :)


