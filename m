Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 028454E73DA
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 13:57:16 +0100 (CET)
Received: from localhost ([::1]:38716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXjVC-0002JJ-Jh
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 08:57:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nXjS7-0000m1-Jd
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 08:54:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nXjS6-0004uK-6K
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 08:54:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648212841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YDaL8ifGJQjr1eTlhK1EJLQWLtiyksv6A6dOsOudk88=;
 b=Gt+c4JZLDSlBmmjpLfUs4ysNfaekd/jSy+fimu2bqihqietQkYdmygn1pX+DiZ+xssmdjI
 42t9NLbo8dG75mu4Hwak6sHM+S46Pb7gx/+jLlwtFrNH1Gkj9W2FFs9JJywMGiPAqQrw7u
 +VEY+tayITKem4hegC9Zf70wm4eETGk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-oanNBMRsOPu7WPeggisNrw-1; Fri, 25 Mar 2022 08:53:57 -0400
X-MC-Unique: oanNBMRsOPu7WPeggisNrw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84ABF899ED9
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 12:53:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F29842166B18;
 Fri, 25 Mar 2022 12:53:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2DAED21E6742; Fri, 25 Mar 2022 13:53:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 05/14] qapi: fix example of DUMP_COMPLETED event
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-6-victortoso@redhat.com>
 <CAFn=p-bO0Q7466J7SRyDd6eTM_6N8UKLZK38PrucAZqXUxgYeQ@mail.gmail.com>
Date: Fri, 25 Mar 2022 13:53:50 +0100
In-Reply-To: <CAFn=p-bO0Q7466J7SRyDd6eTM_6N8UKLZK38PrucAZqXUxgYeQ@mail.gmail.com>
 (John Snow's message of "Thu, 24 Mar 2022 16:53:51 -0400")
Message-ID: <87fsn6nqg1.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

> On Thu, Mar 24, 2022 at 1:50 PM Victor Toso <victortoso@redhat.com> wrote:
>>
>> * Timestamp is not optional, let's add for completeness.
>> * Add '<-' to signalize it is receiving the data
>> * While at it, add extra space before "result" and "total"
>>
>> Signed-off-by: Victor Toso <victortoso@redhat.com>
>> ---
>>  qapi/dump.json | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/qapi/dump.json b/qapi/dump.json
>> index f7c4267e3f..d3ed79e8cd 100644
>> --- a/qapi/dump.json
>> +++ b/qapi/dump.json
>> @@ -161,9 +161,10 @@
>>  #
>>  # Example:
>>  #
>> -# { "event": "DUMP_COMPLETED",
>> -#   "data": {"result": {"total": 1090650112, "status": "completed",
>> -#                       "completed": 1090650112} } }
>> +# <- { "event": "DUMP_COMPLETED",
>> +#      "data": { "result": { "total": 1090650112, "status": "completed",
>> +#                            "completed": 1090650112} },

Add a space after 1090650112, too?

Aside: I don't actually like our use of spaces in JSON, but consistently
ugly beats inconsistently ugly.

>> +#      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
>>  #
>>  ##
>>  { 'event': 'DUMP_COMPLETED' ,
>> --
>> 2.35.1
>>
>
> Other events seem to use the timestamp as well, so go for it. I agree
> that being able to programmatically verify docstrings is pretty
> valuable in an API test suite.
>
> (What date did you choose? Does it mean anything to you? :p)

Copied from some other example, I suppose.  I'd probably use time of
writing, but that's just me.

> Reviewed-by: John Snow <jsnow@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


