Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A088A617EC3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 15:03:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqanQ-0003NA-Je; Thu, 03 Nov 2022 10:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oqanM-0003MT-91
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 10:02:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oqanK-00059N-Hg
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 10:02:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667484129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M+06UHPSmLRpdx7YcqMO59ecqtPv2uX59Tw1JtucUYQ=;
 b=PfGjGEtGHiwUf7LYYqxfLsfR57UoJyEnE72w1pz+Ftlvu7DhP3GRyufwdYbeHbT/1tjioU
 SOp/EzwQzJ6EgskX0ElO6p9Q3HbSdkLaBeQAWSJ38gRLjfgWoeQaog0Xrz1i+tvSkwAopL
 nYBb4WtzxpshvcWJ7CVHQPy3mgh9Zbk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-UCMeUhFwPKKL-jVm19SY6A-1; Thu, 03 Nov 2022 10:02:07 -0400
X-MC-Unique: UCMeUhFwPKKL-jVm19SY6A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53EE1857D0A;
 Thu,  3 Nov 2022 14:02:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 27326111F3B6;
 Thu,  3 Nov 2022 14:02:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DC89921E6900; Thu,  3 Nov 2022 15:02:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org,  stefanha@redhat.com
Subject: Re: [PULL v2 00/28] QAPI patches patches for 2022-10-25
References: <20221026183532.487708-1-armbru@redhat.com>
 <CAJSP0QV0_jwZWU93VKNjycicD8ng2NPczzXmCU4QCNJm+nvB+w@mail.gmail.com>
Date: Thu, 03 Nov 2022 15:02:03 +0100
In-Reply-To: <CAJSP0QV0_jwZWU93VKNjycicD8ng2NPczzXmCU4QCNJm+nvB+w@mail.gmail.com>
 (Stefan Hajnoczi's message of "Sun, 30 Oct 2022 15:04:55 -0400")
Message-ID: <87sfj05e78.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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

Stefan Hajnoczi <stefanha@gmail.com> writes:

> On Wed, 26 Oct 2022 at 14:44, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> The following changes since commit e750a7ace492f0b450653d4ad368a77d6f660fb8:
>>
>>   Merge tag 'pull-9p-20221024' of https://github.com/cschoenebeck/qemu into staging (2022-10-24 14:27:12 -0400)
>>
>> are available in the Git repository at:
>>
>>   https://repo.or.cz/qemu/armbru.git tags/pull-qapi-2022-10-25-v2
>>
>> for you to fetch changes up to c0f24f8f31ca82e34ef037bfe34ef71eeecb401d:
>>
>>   qapi: Drop temporary logic to support conversion step by step (2022-10-26 20:08:52 +0200)
>>
>> ----------------------------------------------------------------
>> QAPI patches patches for 2022-10-25
>>
>> ----------------------------------------------------------------
>> Markus Armbruster (28):
>>       docs/devel/qapi-code-gen: Update example to match current code
>>       qapi: Tidy up whitespace in generated code
>>       docs/devel/qapi-code-gen: Extend example for next commit's change
>>       qapi: Start to elide redundant has_FOO in generated C
>>       qapi tests: Elide redundant has_FOO in generated C
>>       qapi acpi: Elide redundant has_FOO in generated C
>>       qapi audio: Elide redundant has_FOO in generated C
>>       qapi block: Elide redundant has_FOO in generated C
>
> This commit breaks qemu-iotests 056 in CI. I have included
> instructions for reproducing it locally below. I will drop this pull
> request for now. Please note that the QEMU 7.2 soft freeze is on
> Tuesday.

I finally managed to debug this one.  I think a v3 is best.  And then
we'll see whether the series can still go in, or needs to wait for the
next cycle.

Thanks!


