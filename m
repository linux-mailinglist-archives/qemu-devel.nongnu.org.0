Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB3067358F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:33:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pISE6-0000qB-E7; Thu, 19 Jan 2023 05:32:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pISDy-0000gB-CJ
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:32:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pISDw-0002c8-VZ
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:32:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674124368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9wzC95ZnDRp60GF2ijaPtcUMTRj0kjZfFgtJY+2CTDA=;
 b=fovYihNxJ3IQeE8U+aATeDfbyIGVGyrj3x6/giaksepsv7R94A2EjJHWoOIncD9ewNfal1
 X7Khb63uAtKHk/ndM1Z/NxsHETQ46k0kAJG6DNXfsiK8F6xm2aCfj0Kf25T7RCRr1uUmmC
 PBczmt1+qMc3oL5Hw3W3zjE842zOZsQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-BUrjm2kjMSqgrYDQbZSDPQ-1; Thu, 19 Jan 2023 05:32:45 -0500
X-MC-Unique: BUrjm2kjMSqgrYDQbZSDPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBDC43813F35;
 Thu, 19 Jan 2023 10:32:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B5888C15BAD;
 Thu, 19 Jan 2023 10:32:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 97F4121E6A28; Thu, 19 Jan 2023 11:32:43 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>,  qemu-devel@nongnu.org,  Emanuele
 Giuseppe Esposito <eesposit@redhat.com>,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  quintela@redhat.com,  dgilbert@redhat.com
Subject: Re: [PATCH 2/2] MAINTAINERS: Cover include/sysemu/accel-blocker.h
References: <20230119091545.3116376-1-armbru@redhat.com>
 <20230119091545.3116376-3-armbru@redhat.com>
 <b0b5759b-db68-204c-fe41-48ad02de0a61@linaro.org>
Date: Thu, 19 Jan 2023 11:32:43 +0100
In-Reply-To: <b0b5759b-db68-204c-fe41-48ad02de0a61@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 19 Jan 2023 11:24:22
 +0100")
Message-ID: <87sfg6vmpg.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 19/1/23 10:15, Markus Armbruster wrote:
>> Commit bd688fc931 "accel: introduce accelerator blocker API" aded
>> include/sysemu/accel-blocker.h and accel/accel-blocker.c.  MAINTAINERS
>> covers the latter in section "Guest CPU Cores (other accelerators) /
>> Overall", but not the former.  Fix that.
>
> Doesn't this belong to "Read, Copy, Update (RCU)" or "Main loop"
> sections?

I have no idea, I merely aped the existing accel/accel-*.c line :)

>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   MAINTAINERS | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 0dfdf71d48..c888ccaf7a 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -437,7 +437,7 @@ M: Richard Henderson <richard.henderson@linaro.org>
>>  R: Paolo Bonzini <pbonzini@redhat.com>
>>  S: Maintained
>>  F: include/qemu/accel.h
>> -F: include/sysemu/accel-ops.h
>> +F: include/sysemu/accel-*.h
>>  F: include/hw/core/accel-cpu.h
>>  F: accel/accel-*.c
>>  F: accel/Makefile.objs


