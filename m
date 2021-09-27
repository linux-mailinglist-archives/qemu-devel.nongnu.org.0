Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFD9419482
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 14:44:41 +0200 (CEST)
Received: from localhost ([::1]:45698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUpzr-0008UH-Ro
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 08:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUpwp-0006gG-O9
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 08:41:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUpwm-00036J-SN
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 08:41:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632746487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QQDHbzTB1Ha82uLynbnt4eSS6xpD5663HauuCKPj8JM=;
 b=NupLKptJgm48oe4AijJQ/aruZ3FaJCDkz/qOjeVrGTidnrJMj/lvMO3rb1I16+vduBKzAv
 swC7PIDZqqiCXZGon1WSg2c4IoCJO4wPInQXvWOuUxLHNbxrM8QxWQjI1AejDEwccuDIfg
 uNLjOtlNY/1iavVPHDUI5rHsMHAmX+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-HVAsS2sdMgm8GWINP3tE3Q-1; Mon, 27 Sep 2021 08:41:23 -0400
X-MC-Unique: HVAsS2sdMgm8GWINP3tE3Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E761835DE2;
 Mon, 27 Sep 2021 12:41:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29AED4180;
 Mon, 27 Sep 2021 12:41:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C69F7113865F; Mon, 27 Sep 2021 14:41:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/25] QAPI patches patches for 2021-09-25
References: <20210925062525.988405-1-armbru@redhat.com>
 <CAFEAcA9YRXCKxZJ=LiGqoKRmrk_JdB16ch140dh9ACYPuwTo4w@mail.gmail.com>
Date: Mon, 27 Sep 2021 14:41:20 +0200
In-Reply-To: <CAFEAcA9YRXCKxZJ=LiGqoKRmrk_JdB16ch140dh9ACYPuwTo4w@mail.gmail.com>
 (Peter Maydell's message of "Sat, 25 Sep 2021 09:44:49 +0100")
Message-ID: <871r5agphr.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Sat, 25 Sept 2021 at 07:25, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> The following changes since commit 11a11998460ed84d9a127c025f50f7234e5a483f:
>>
>>   Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20210921' into staging (2021-09-24 13:21:18 -0400)
>>
>> are available in the Git repository at:
>>
>>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-09-25
>>
>> for you to fetch changes up to 5757c0904e2e8a7f5d9ff359b30542cfcb70556b:
>>
>>   tests/qapi-schema: Make test-qapi.py -u work when files are absent (2021-09-25 07:00:50 +0200)
>>
>> ----------------------------------------------------------------
>> QAPI patches patches for 2021-09-25
>>
>
> Fails to build, all hosts except x86-64 Linux:
>
> In file included from qapi/qapi-visit-char.h:17,
>                  from qapi/qapi-commands-char.c:19:
> qapi/qapi-types-char.h:500:5: error: unknown type name 'ChardevSpiceChannel'
>   500 |     ChardevSpiceChannel *data;
>       |     ^~~~~~~~~~~~~~~~~~~
> qapi/qapi-types-char.h:507:5: error: unknown type name 'ChardevSpicePort'
>   507 |     ChardevSpicePort *data;
>       |     ^~~~~~~~~~~~~~~~
> qapi/qapi-types-char.h:514:5: error: unknown type name 'ChardevQemuVDAgent'
>   514 |     ChardevQemuVDAgent *data;
>       |     ^~~~~~~~~~~~~~~~~~

Sorry about that.  Respin on the way.


