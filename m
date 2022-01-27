Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EFB49E4D8
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:42:12 +0100 (CET)
Received: from localhost ([::1]:53194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD5yV-0005TJ-AI
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:42:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nD5cM-0004vb-4g
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:19:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nD5cK-0002ow-DU
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:19:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643293155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tlOSoRGBvnxsEHW6pC8Gl/0BVdwVfgc5FfijSg/gk/A=;
 b=ZeQJU/lNVW4dhlAIJ62dRqCfYE7N6bpK7J0apMzQH5sChQCtYe9ZBFFz9EvrsFFQKfl4CK
 paWaiB/r8WEfFZOXkfl6fQrc7mJu0NcgURLncGp90aM92a/iUAKsTU0vInc/rCziPAjrd5
 i0Kf6DpqzosxB3G31GbCD+l1bA/XIDc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-Kl2SLLdfOLujCfr1tHttHQ-1; Thu, 27 Jan 2022 09:19:14 -0500
X-MC-Unique: Kl2SLLdfOLujCfr1tHttHQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 158D2192FDA0;
 Thu, 27 Jan 2022 14:19:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAE028049B;
 Thu, 27 Jan 2022 14:19:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6DEAA113864A; Thu, 27 Jan 2022 15:19:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PULL 0/8] QAPI patches patches for 2022-01-27
References: <20220127112859.222484-1-armbru@redhat.com>
 <CAFEAcA-63VsRor-FbOo7KhR-5R1a2AeBmJc=GzNTZmPoq5kWWQ@mail.gmail.com>
 <d80654f3-9da9-e3f0-3968-a0658627e6e1@virtuozzo.com>
Date: Thu, 27 Jan 2022 15:19:11 +0100
In-Reply-To: <d80654f3-9da9-e3f0-3968-a0658627e6e1@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 27 Jan 2022 16:55:38 +0300")
Message-ID: <87pmodntwg.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> 27.01.2022 15:56, Peter Maydell wrote:
>> On Thu, 27 Jan 2022 at 11:29, Markus Armbruster <armbru@redhat.com> wrote:
>>>
>>> The following changes since commit 48302d4eb628ff0bea4d7e92cbf6b726410eb4c3:
>>>
>>>    Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20220126' into staging (2022-01-26 10:59:50 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>    git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2022-01-27
>>>
>>> for you to fetch changes up to 5161c168b44f3a8fcae8c4f29c81f374ab0af8e1:
>>>
>>>    qapi: generate trace events by default (2022-01-27 11:28:44 +0100)
>>>
>>> ----------------------------------------------------------------
>>> QAPI patches patches for 2022-01-27
>>>
>> 
>> Fails to build on the CI jobs that build docs, eg:
>> https://gitlab.com/qemu-project/qemu/-/jobs/2022584945
>> https://gitlab.com/qemu-project/qemu/-/jobs/2022585026
>> 
>> Warning, treated as error:
>> /home/gitlab-runner/builds/CMuZxyfG/0/qemu-project/qemu/docs/devel/qapi-code-gen.rst:1634:undefined
>> label: tracing (if the link has no caption the label must precede a
>> section header)
>> 
>
> Sorry :/ again, me not enabling docs compilation to save my time and waste others one :(

I'm not blaming you for that.  I disabled it myself after the conversion
to Sphinx wrecked my compile times due to "touch any schema file,
reformat truckloads of docs".

I normally test pull requests with a tree that has it enabled, but
forgot.

>
> The fix should look like this (squash to "docs/qapi-code-gen: update to cover trace events code generation" patch):
>
> diff --git a/docs/devel/tracing.rst b/docs/devel/tracing.rst
> index ba83954899..4290ac42ee 100644
> --- a/docs/devel/tracing.rst
> +++ b/docs/devel/tracing.rst
> @@ -1,3 +1,5 @@
> +.. _tracing:
> +
>   =======
>   Tracing
>   =======
>
>
> Than link works. For example, in docs/devel/build-system.rst we have :ref:`kconfig` and docs/devel/kconfig.rst starts with
>
> .. _kconfig:

Thanks!


