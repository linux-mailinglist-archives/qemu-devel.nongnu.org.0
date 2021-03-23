Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AC8346D27
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:34:00 +0100 (CET)
Received: from localhost ([::1]:43460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOpb4-0000mz-V9
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOpZ7-00079J-1s
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:31:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOpZ4-0001ee-E8
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:31:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616538713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1IhPPoMSN+TSqF94rnt4gepOdVKRXl8FaxD7hVf+PcE=;
 b=DN4+135o7/elPNi9Sdt6Lw7aKc+790kph3MJ9tNhlZx1Y/SjhGCuDFCOilAIqvbgXBIfeB
 6gBbNnWn9Xm1qJb/U60Cu9H1mFk92WKW5OmSu71bSb+axY75/3VWfp3lDPbmN3WK9u2xA8
 IeEB38zKmbepOgG1Xo8AlAb62UVLA+E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-IxL2jVuYM--_qXdo-wWBdQ-1; Tue, 23 Mar 2021 18:31:51 -0400
X-MC-Unique: IxL2jVuYM--_qXdo-wWBdQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2995A87139C;
 Tue, 23 Mar 2021 22:31:51 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52D5B5D6D7;
 Tue, 23 Mar 2021 22:31:47 +0000 (UTC)
Subject: Re: [PATCH 13/28] qapi: Enforce event naming rules
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-14-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <bd1b8230-30fd-a4a4-d38c-8650e645c586@redhat.com>
Date: Tue, 23 Mar 2021 18:31:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323094025.3569441-14-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: michael.roth@amd.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 5:40 AM, Markus Armbruster wrote:
> Event names should be ALL_CAPS with words separated by underscore.
> Enforce this.  The only offenders are in tests/.  Fix them.  Existing
> test event-case covers the new error.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   tests/unit/test-qmp-event.c               |  6 +++---
>   scripts/qapi/expr.py                      |  4 +++-
>   tests/qapi-schema/doc-good.json           |  4 ++--
>   tests/qapi-schema/doc-good.out            |  4 ++--
>   tests/qapi-schema/doc-good.txt            |  2 +-
>   tests/qapi-schema/doc-invalid-return.json |  4 ++--
>   tests/qapi-schema/event-case.err          |  2 ++
>   tests/qapi-schema/event-case.json         |  2 --
>   tests/qapi-schema/event-case.out          | 14 --------------
>   tests/qapi-schema/qapi-schema-test.json   |  6 +++---
>   tests/qapi-schema/qapi-schema-test.out    |  8 ++++----
>   11 files changed, 22 insertions(+), 34 deletions(-)
> 
> diff --git a/tests/unit/test-qmp-event.c b/tests/unit/test-qmp-event.c
> index 047f44ff9a..d58c3b78f2 100644
> --- a/tests/unit/test-qmp-event.c
> +++ b/tests/unit/test-qmp-event.c
> @@ -143,7 +143,7 @@ static void test_event_d(TestEventData *data,
>   
>   static void test_event_deprecated(TestEventData *data, const void *unused)
>   {
> -    data->expect = qdict_from_jsonf_nofail("{ 'event': 'TEST-EVENT-FEATURES1' }");
> +    data->expect = qdict_from_jsonf_nofail("{ 'event': 'TEST_EVENT_FEATURES1' }");
>   
>       memset(&compat_policy, 0, sizeof(compat_policy));
>   
> @@ -163,7 +163,7 @@ static void test_event_deprecated_data(TestEventData *data, const void *unused)
>   {
>       memset(&compat_policy, 0, sizeof(compat_policy));
>   
> -    data->expect = qdict_from_jsonf_nofail("{ 'event': 'TEST-EVENT-FEATURES0',"
> +    data->expect = qdict_from_jsonf_nofail("{ 'event': 'TEST_EVENT_FEATURES0',"
>                                              " 'data': { 'foo': 42 } }");
>       qapi_event_send_test_event_features0(42);
>       g_assert(data->emitted);
> @@ -172,7 +172,7 @@ static void test_event_deprecated_data(TestEventData *data, const void *unused)
>   
>       compat_policy.has_deprecated_output = true;
>       compat_policy.deprecated_output = COMPAT_POLICY_OUTPUT_HIDE;
> -    data->expect = qdict_from_jsonf_nofail("{ 'event': 'TEST-EVENT-FEATURES0' }");
> +    data->expect = qdict_from_jsonf_nofail("{ 'event': 'TEST_EVENT_FEATURES0' }");
>       qapi_event_send_test_event_features0(42);
>       g_assert(data->emitted);
>   
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index b5fb0be48b..c065505b27 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -45,7 +45,9 @@ def check_name_str(name, info, source):
>   
>   def check_name_upper(name, info, source):
>       stem = check_name_str(name, info, source)
> -    # TODO reject '[a-z-]' in @stem
> +    if re.search(r'[a-z-]', stem):
> +        raise QAPISemError(
> +            info, "name of %s must not use lowercase or '-'" % source)
>   

Does a little bit more than check_name_upper. Is this only used for 
event names? I guess so. Should it be inlined into check_defn_name_str 
instead in this case, or nah?


