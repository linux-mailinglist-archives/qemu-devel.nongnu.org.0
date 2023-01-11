Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0912665400
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 06:51:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFU0h-0002Ja-Fu; Wed, 11 Jan 2023 00:50:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pFU0e-0002IR-Hy
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 00:50:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pFU0c-00045d-Jo
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 00:50:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673416245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8XSk03PmbwzSAtgGNm22IF6n86rx+E2B+OHSn/12IHA=;
 b=BbF0fRkw6ZRQCikZATi9Kasg7exvKhdmuIAGxvYK02ZU5M3iAlfFIF5tyMANPi5ytqcQC2
 dvSjnkSW0/uJCqFc+FUcObN0ilLgtA6+dRU6htv68yDt/XG2HNg8uODj8cbcwihPIRC4Kq
 s080oSLrG9U98zf9x/Vf27aRvAODa2s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-CspZBOe7PYWuqL9M2Auqaw-1; Wed, 11 Jan 2023 00:50:43 -0500
X-MC-Unique: CspZBOe7PYWuqL9M2Auqaw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81C81101A521;
 Wed, 11 Jan 2023 05:50:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E8C940C2064;
 Wed, 11 Jan 2023 05:50:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 398F021E675B; Wed, 11 Jan 2023 06:50:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: make vm-build-freebsd appears to require . in PATH
References: <87tu0yo458.fsf@pond.sub.org>
 <CAFEAcA8ugDcG_e_DWgbz7MW_cK6xuCMcps7MgqyWF=bXjT8CmA@mail.gmail.com>
 <87358inyoe.fsf@pond.sub.org>
 <CAFEAcA-5dbeuw9XJu-2n3hufZBt9P-tnGnZeuGCMN5MrK8GO8Q@mail.gmail.com>
Date: Wed, 11 Jan 2023 06:50:42 +0100
In-Reply-To: <CAFEAcA-5dbeuw9XJu-2n3hufZBt9P-tnGnZeuGCMN5MrK8GO8Q@mail.gmail.com>
 (Peter Maydell's message of "Tue, 10 Jan 2023 16:37:52 +0000")
Message-ID: <87k01tk4b1.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 10 Jan 2023 at 16:26, Markus Armbruster <armbru@redhat.com> wrote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>> > Does it actually require '.' on the PATH, or does it just want
>> > a qemu-img binary on the PATH? (eg your distro one in /usr/bin).
>> > I don't have '.' on my PATH and it works for me.
>>
>> Do we want to use qemu-img, qemu-system-x86_64 and so forth from PATH,
>> or the one in the build tree?
>
> There's no guarantee there is one in the build tree at all.
> I usually use these like
>  (cd build && ../configure)
>  make -C build  vm-build-openbsd
>
> in which case it doesn't need to build anything in the build
> tree at all (neither qemu-system-x86_64 nor qemu-img).
>
> It's nice to be able to do "test this build on *BSD" with
> a known-good QEMU running the VM rather than having the
> code-under-test affecting both the outer QEMU and the
> build-and-make-check running inside the VM.

True.

>> The former could well be old, which feels like a potential source of
>> problems.
>
> In practice we only use it for very simple operations
> ("create a qcow2 image" and "resize this qcow2 file"),
> so using the distro qemu-img has never been an issue for me.
>
> I think I have in the past run into problems because the
> system's qemu-system-x86_64 was super-old, but it was easy
> to just build a known-good QEMU version and put that on
> the PATH. (And now that system has had a host distro
> upgrade, so I have gone back to using the system binary.)

I since came to understand this line in output of vm-help:

    QEMU_LOCAL=1                 - Use QEMU binary local to this build.

So the intent appears to be "use (presumably known-good) QEMU tooling
from $PATH by default, pass QEMU_LOCAL=1 to use the build tree instead,
and pass QEMU=... QEMU_IMG=... QEMU_CONFIG=... when you need even more
control."

Thanks again!


