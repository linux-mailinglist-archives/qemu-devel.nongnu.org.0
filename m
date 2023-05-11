Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 708566FF067
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 13:11:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px4Ca-00050i-Nh; Thu, 11 May 2023 07:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1px4CY-00050O-U3
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:11:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1px4CV-00079A-DP
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:11:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683803470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KZZSn8QEWY8Yj7LDzSDUTboxLnfEWzM2lMtbUgLooiw=;
 b=cHhRj6LHB5tcDeX8Ak7VW2F2/18eK+0SQukJoSeeM99S3xiHnlUP9JQpcY0VhJ1NRdL1DF
 2ItpyGpCCsesZ7LC1QBL9i9SOgcphwWUwmBaar0brhzQfBaV0FYBRodTozpFneRer8qoH9
 +eAIih8SPjTId9MnzagfB+Yt7nXWGaI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-jaCyRlokOheN0Im-Zh-g0g-1; Thu, 11 May 2023 07:11:07 -0400
X-MC-Unique: jaCyRlokOheN0Im-Zh-g0g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE30D3828893;
 Thu, 11 May 2023 11:11:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A1B8141511D;
 Thu, 11 May 2023 11:11:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5FB9321E6806; Thu, 11 May 2023 13:11:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL v2 00/17] QAPI patches patches for 2023-05-09
References: <20230510081224.3588673-1-armbru@redhat.com>
 <e94e5411-66de-3aa6-3ed2-f16154ec5294@linaro.org>
 <877ctg2ov9.fsf@pond.sub.org>
Date: Thu, 11 May 2023 13:11:05 +0200
In-Reply-To: <877ctg2ov9.fsf@pond.sub.org> (Markus Armbruster's message of
 "Wed, 10 May 2023 17:22:02 +0200")
Message-ID: <87ttwjktrq.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

Markus Armbruster <armbru@redhat.com> writes:

> Richard Henderson <richard.henderson@linaro.org> writes:
>
>> I didn't notice earlier, because centos-stream-8-x86_64 failure is optional,
>> but this has another error:
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/4258751398#L4649
>>
>> Exception occurred:
>>   File "/home/gitlab-runner/builds/Jpwtyaz7/0/qemu-project/qemu/docs/../scripts/qapi/parser.py", line 566, in QAPIDoc
>>     def _match_at_name_colon(string: str) -> re.Match:
>> AttributeError: module 're' has no attribute 'Match'
>
> I'll take care of it.  Thanks!

I tried to reproduce locally with make target docker-test-build@centos8,
no dice.

I'll post a patch to make mypy happy again.  Perhaps it'll unbreak CI,
too.


