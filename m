Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6050443B583
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:26:27 +0200 (CEST)
Received: from localhost ([::1]:50910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfOLK-0007K5-GL
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfOBg-0001Cv-71
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:16:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfOBe-0006Kv-5Z
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:16:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635261385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QzWJ3IRIlNxM5tYAGhKCHigNvBE2Ya/X/GCGuWUWLJw=;
 b=YM04Hr2NsYSSSkYGm8MhPF9vttdWlW0uGlYCmOqgdFCtY5ZJisyvuRQBNVVANU9znrHDTM
 thcUJ5Dx+wl533mZxYQllUF+fj8HsbbESjT4WpcQOGlFFuc22X90t4pGtv9FJi7E3UMaSw
 2/VHUuLBx/hojO1pb5ezBJFruLfQgUw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356--yRNtiSHM2GW5ZUfm3toBw-1; Tue, 26 Oct 2021 11:16:22 -0400
X-MC-Unique: -yRNtiSHM2GW5ZUfm3toBw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E32718414A6;
 Tue, 26 Oct 2021 15:16:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D6BF60C5F;
 Tue, 26 Oct 2021 15:16:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B65F711380A7; Tue, 26 Oct 2021 17:16:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 2/2] docs/devel/qapi-code-gen: Belatedly document
 feature documentation
References: <20211026111023.76937-1-armbru@redhat.com>
 <20211026111023.76937-3-armbru@redhat.com>
 <YXgY5flIoi1rwUzh@redhat.com>
Date: Tue, 26 Oct 2021 17:16:18 +0200
In-Reply-To: <YXgY5flIoi1rwUzh@redhat.com> (Kevin Wolf's message of "Tue, 26
 Oct 2021 17:04:05 +0200")
Message-ID: <875ytjg6kd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: qemu-devel@nongnu.org, eblake@redhat.com, mdroth@linux.vnet.ibm.com,
 Markus Armbruster <armbru@redhat.com>, marcandre.lureau@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 26.10.2021 um 13:10 hat Markus Armbruster geschrieben:
>> Commit 6a8c0b5102 "qapi: Add feature flags to struct types" neglected
>> to document how to document feature flags.  Make up for that.
>> 
>> Cc: Kevin Wolf <kwolf@redhat.com>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  docs/devel/qapi-code-gen.rst | 23 +++++++++++++++--------
>>  1 file changed, 15 insertions(+), 8 deletions(-)
>> 
>> diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
>> index 1f6805a705..4b79623f51 100644
>> --- a/docs/devel/qapi-code-gen.rst
>> +++ b/docs/devel/qapi-code-gen.rst
>> @@ -949,15 +949,16 @@ definition must have documentation.
>>  Definition documentation starts with a line naming the definition,
>>  followed by an optional overview, a description of each argument (for
>>  commands and events), member (for structs and unions), branch (for
>> -alternates), or value (for enums), and finally optional tagged
>> -sections.
>> +alternates), or value (for enums), a description of each feature (if
>> +any), and finally optional tagged sections.
>>  
>> -Descriptions of arguments can span multiple lines.  The description
>> -text can start on the line following the '\@argname:', in which case it
>> -must not be indented at all.  It can also start on the same line as
>> -the '\@argname:'.  In this case if it spans multiple lines then second
>> -and subsequent lines must be indented to line up with the first
>> -character of the first line of the description::
>> +The description of an argument or feature 'name' starts with
>> +'\@name:'.  The description text can start on the line following the
>> +'\@argname:', in which case it must not be indented at all.  It can
>> +also start on the same line as the '\@argname:'.  In this case if it
>> +spans multiple lines then second and subsequent lines must be indented
>> +to line up with the first character of the first line of the
>> +description::
>
> I'm confused. Are @name and @argname really two different things? What
> does each one mean?

Editing screwup!  I meant to use @name every time.


