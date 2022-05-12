Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2CF524B97
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 13:24:51 +0200 (CEST)
Received: from localhost ([::1]:58982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np6w6-0000H0-P1
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 07:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1np6uh-0007t2-Vf
 for qemu-devel@nongnu.org; Thu, 12 May 2022 07:23:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1np6uc-0001lT-PK
 for qemu-devel@nongnu.org; Thu, 12 May 2022 07:23:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652354597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=26BZORu+Gjs6ZmwfsVJID0I+HO2AjfSxeuZ8mBcma5Y=;
 b=iyrHMdFkCp6+Rk5uPFJRoIwOJxzl1XoAJcKb3gn4RCtXvEvDySQg2OtTEH0UNvxYHKr+j5
 ikgg84AAVCJryi9g3JU0jsaIKs1s1h5KSQU3/4vRhazbYpCHYy8A6jsOpVgHfFQhB4cfvW
 /8tCKssd5rzma51Wglkv+Yj8VNOUZSE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-OgVx9QMoPw6UUd8rgvCgvQ-1; Thu, 12 May 2022 07:23:14 -0400
X-MC-Unique: OgVx9QMoPw6UUd8rgvCgvQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C266811E78;
 Thu, 12 May 2022 11:23:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2980153CE20;
 Thu, 12 May 2022 11:23:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BC9A021E6880; Thu, 12 May 2022 13:23:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: Andrea Bolognani <abologna@redhat.com>,  qemu-devel@nongnu.org,  Juan
 Quintela <quintela@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  qemu-block@nongnu.org,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Eduardo Habkost
 <eduardo@habkost.net>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>,  Yanan Wang <wangyanan55@huawei.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,  Gerd
 Hoffmann <kraxel@redhat.com>,  John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 8/8] qapi: Stop using whitespace for alignment in
 comments
References: <20220503073737.84223-1-abologna@redhat.com>
 <20220503073737.84223-9-abologna@redhat.com>
 <20220503162533.bjdgj5ggp4ipqeqw@redhat.com>
Date: Thu, 12 May 2022 13:23:12 +0200
In-Reply-To: <20220503162533.bjdgj5ggp4ipqeqw@redhat.com> (Eric Blake's
 message of "Tue, 3 May 2022 11:25:33 -0500")
Message-ID: <875ymb9eqn.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Eric Blake <eblake@redhat.com> writes:

> On Tue, May 03, 2022 at 09:37:37AM +0200, Andrea Bolognani wrote:
>> Perfectly aligned things look pretty, but keeping them that
>> way as the schema evolves requires churn, and in some cases
>> newly-added lines are not aligned properly.
>> 
>> Overall, trying to align things is just not worth the trouble.
>
> I'm in favor of commiting 7+8 squashed as a single patch.  7 alone is
> indeed a churn magnet, so I'm either for stopping the series at 6, or
> going all the way to 8 via a single additional step.

Understood.

Diffstat for 7+8:

 qapi/block-core.json | 53 ++++++++++++++++++++++++++--------------------------
 qapi/block.json      |  6 +++---
 qapi/char.json       |  6 +++---
 qapi/control.json    | 10 +++++-----
 qapi/crypto.json     | 42 ++++++++++++++++++++---------------------
 qapi/migration.json  |  8 ++++----
 qapi/sockets.json    |  4 ++--
 qapi/ui.json         | 17 ++++++++---------
 8 files changed, 72 insertions(+), 74 deletions(-)

Considering we have >16k comment lines in qapi/*json, the churn feels
quite tolerable.

> Reviewed-by: Eric Blake <eblake@redhat.com>

Last call for objections: Kevin, Hanna, Gerd?


