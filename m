Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 075506FC062
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 09:26:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwHjK-0005r8-Aw; Tue, 09 May 2023 03:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwHjH-0005ql-Vs
 for qemu-devel@nongnu.org; Tue, 09 May 2023 03:25:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwHjG-0001ht-AY
 for qemu-devel@nongnu.org; Tue, 09 May 2023 03:25:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683617145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=62s07icVezcB3RwthJA/z3lDKXfv8LZ7iSEzqm2gmvE=;
 b=bhmviIjPzNiEiuYAjZe0UWsV/fIxtQ76iiwXVKtRSzlcHeJq+sPKoCDEtXcoILunixT4dR
 90TQV4w9jCgHMbPDQdDTWdlsGArnAvoFbuSLtTv9yCYRXwmwhpVqS8myBVPtiSnPPtSONM
 cDdRh2C3quX7EsVVZQveuUtd/I4Tb3M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-XifXAIixN_2w7kfqP8rF7g-1; Tue, 09 May 2023 03:25:41 -0400
X-MC-Unique: XifXAIixN_2w7kfqP8rF7g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 039E61854CA7;
 Tue,  9 May 2023 07:25:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9782C15BA0;
 Tue,  9 May 2023 07:25:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8D99421E6924; Tue,  9 May 2023 09:25:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org,  michael.roth@amd.com,  peter.maydell@linaro.org,
 pbonzini@redhat.com,  marcandre.lureau@redhat.com,  berrange@redhat.com,
 thuth@redhat.com,  philmd@linaro.org,  mst@redhat.com,
 imammedo@redhat.com,  anisinha@redhat.com,  eblake@redhat.com,
 kraxel@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 arei.gonglei@huawei.com,  pizhenwei@bytedance.com,  jsnow@redhat.com,
 vsementsov@yandex-team.ru,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  wangyanan55@huawei.com,  peterx@redhat.com,
 leobras@redhat.com,  jasowang@redhat.com,  yuval.shaia.ml@gmail.com,
 pavel.dovgaluk@ispras.ru,  jiri@resnulli.us,  stefanb@linux.vnet.ibm.com,
 stefanha@redhat.com,  lukasstraub2@web.de,  kkostiuk@redhat.com,
 qemu-block@nongnu.org,  victortoso@redhat.com
Subject: Re: [PATCH 10/17] tests/qapi-schema/doc-good: Improve argument
 description tests
References: <20230428105429.1687850-1-armbru@redhat.com>
 <20230428105429.1687850-11-armbru@redhat.com>
 <87edo37ubz.fsf@secure.mitica>
Date: Tue, 09 May 2023 09:25:38 +0200
In-Reply-To: <87edo37ubz.fsf@secure.mitica> (Juan Quintela's message of "Fri, 
 28 Apr 2023 20:08:48 +0200")
Message-ID: <87mt2ej79p.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Juan Quintela <quintela@redhat.com> writes:

> Markus Armbruster <armbru@redhat.com> wrote:
>> Improve the comments to better describe what they test.
>>
>> Cover argument description starting on a new line indented.  This
>> style isn't documented in docs/devel/qapi-code-gen.rst.  qapi-gen.py
>> accepts it, but messes up indentation: it's stripped from the first
>> line, not subsequent ones.  The next commit will fix this.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
>
>>  ##
>>  # @Alternate:
>>  #
>> -# @i: an integer
>> +# @i: description starts on the same line
>> +#     remainder indented the same
>>  #     @b is undocumented
>>  #
>>  # Features:
>
> Just curious, what is trying to convey this
>    @b is undocumented
> At the same indentation that the description of @i?

Writing it like

    # @i: description starts on the same line
    #     remainder indented the same
    # @b is undocumented
    #
    # Features:
    # @alt-feat: a feature

fails with "unexpected de-indent (expected at least 4 spaces)".  That's
because the @b line is part of the argument section @i, and the doc
parser insists its indented consistently.  Guards against some editing
accidents, like forgetting the ':'.

Writing it like

    # @i: description starts on the same line
    #     remainder indented the same
    #
    # @b is undocumented
    #
    # Features:
    # @alt-feat: a feature

fails with "'@alt-feat:' can't follow 'None' section".  That's because
the @b line is now a section of its own, and the doc parser requires
sections to be in a certain order.  Similar guard against editing
accidents.  Not foolproof; it only works here because a feature section
follows.  If we wanted sane syntax, we would've stuck to TexInfo.

The error message is bad; I'll improve it.

Thanks!


