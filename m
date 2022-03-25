Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 314924E73E7
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 14:04:56 +0100 (CET)
Received: from localhost ([::1]:46096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXjcc-0008DO-NG
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 09:04:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nXjYx-0006xR-Q1
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 09:01:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nXjYq-0006lc-4q
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 09:01:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648213258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SvsFOwyr1nL27IVBYgMCHgODLB8CHBjhKqNzPVSuv+k=;
 b=KqM4s2kxm9ZmRdz59RnNzpAKA1ldbt+z/8i5iNi9s71vEuVRWMSnC5Jrh0k9fuMzNqjSaa
 b1lTF9urUHe8C9BBbcRDSM566rB53DjLHTNCqTSk9P4judHIKpjokuo4Hr8+gYW4fP+JXz
 OaZNFcA697zz6tM8zYrcBOjnXsaWsCs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-10Tlh_jvN1CkajAt7Zz3MA-1; Fri, 25 Mar 2022 09:00:56 -0400
X-MC-Unique: 10Tlh_jvN1CkajAt7Zz3MA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEF6E811E81
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 13:00:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88CBC5F0C82;
 Fri, 25 Mar 2022 13:00:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4199521E6742; Fri, 25 Mar 2022 14:00:55 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 06/14] qapi: fix example of MEMORY_DEVICE_SIZE_CHANGE event
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-7-victortoso@redhat.com>
 <CAFn=p-Y3Jywf45CyaxwQ+SP6+_ToFJoZ1Lr=8tNQdNLQQaESCg@mail.gmail.com>
Date: Fri, 25 Mar 2022 14:00:55 +0100
In-Reply-To: <CAFn=p-Y3Jywf45CyaxwQ+SP6+_ToFJoZ1Lr=8tNQdNLQQaESCg@mail.gmail.com>
 (John Snow's message of "Thu, 24 Mar 2022 16:57:00 -0400")
Message-ID: <87bkxunq48.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, Victor Toso <victortoso@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On Thu, Mar 24, 2022 at 1:50 PM Victor Toso <victortoso@redhat.com> wrote=
:
>>
>> * qom-path is not optional

List of one item.  Recommend to scratch '* '.  Slightly less terse, like
"Event data member @qom-path is not optional" wouldn't hurt.

>>
>> Signed-off-by: Victor Toso <victortoso@redhat.com>
>> ---
>>  qapi/machine.json | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index 42fc68403d..9c460ec450 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -1356,7 +1356,8 @@
>>  # Example:
>>  #
>>  # <- { "event": "MEMORY_DEVICE_SIZE_CHANGE",
>> -#      "data": { "id": "vm0", "size": 1073741824},
>> +#      "data": { "id": "vm0", "size": 1073741824,
>> +#                "qom-path": "/machine/unattached/device[2]" },
>>  #      "timestamp": { "seconds": 1588168529, "microseconds": 201316 } }
>>  #
>>  ##
>> --
>> 2.35.1
>>
>
> I'll just assume this is a realistic qom-path and not actually try to che=
ck =F0=9F=98=85

I suppose a machine could exist where this path leads to a suitable
device.

> Reviewed-by: John Snow <jsnow@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


