Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8223A697C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:02:29 +0200 (CEST)
Received: from localhost ([::1]:50194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lso6e-0008IS-71
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lso5L-0006xu-6p
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:01:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lso5H-000497-PK
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:01:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623682862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=meUoz59nyBUqD5cn5mLlUikNv6JV2aZbjM8L5z1cVSw=;
 b=jHQS0v0MnAUpOunXdDgJDYP3vTvfxXMq8p5ejjcgmVgPm5iil7Y3wJgWRg7CAHkhwECadn
 wqDJ4p9kEDAc7p0tkPwJ1rHpkFHji6/pA+wQUqAvLyMqvHql4fKqqZhjBdE5ZyeLok3Gx5
 C4XFJpjQujPLV4Y8qTQlLKh9/d+9w78=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-RuUYfPYXMWiQ_wzfzDCnmA-1; Mon, 14 Jun 2021 11:00:59 -0400
X-MC-Unique: RuUYfPYXMWiQ_wzfzDCnmA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0A071937FC2;
 Mon, 14 Jun 2021 15:00:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FFEE5C1A3;
 Mon, 14 Jun 2021 15:00:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2B73D113865F; Mon, 14 Jun 2021 17:00:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] ui/gtk: Allow user to select monitor number to display
 qemu in full screen through new gtk display option
References: <20210614080542.5905-1-swee.aun.khor@intel.com>
 <20210614141129.plffhclmdczft3g6@redhat.com>
Date: Mon, 14 Jun 2021 17:00:56 +0200
In-Reply-To: <20210614141129.plffhclmdczft3g6@redhat.com> (Eric Blake's
 message of "Mon, 14 Jun 2021 09:11:29 -0500")
Message-ID: <87o8c8wkwn.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: sweeaun <swee.aun.khor@intel.com>, khairul.anuar.romli@intel.com,
 qemu-devel@nongnu.org, vivek.kasireddy@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On Mon, Jun 14, 2021 at 04:05:42PM +0800, sweeaun wrote:
>>  -display gtk,monitor-num=<value>
>> 
>> Signed-off-by: sweeaun <swee.aun.khor@intel.com>
>> ---
>>  qapi/ui.json    |  3 ++-
>>  qemu-options.hx |  2 +-
>>  ui/gtk.c        | 15 +++++++++++++++
>>  3 files changed, 18 insertions(+), 2 deletions(-)
>> 
>> diff --git a/qapi/ui.json b/qapi/ui.json
>> index 1052ca9c38..c3363c7ad5 100644
>> --- a/qapi/ui.json
>> +++ b/qapi/ui.json
>> @@ -1041,7 +1041,8 @@
>>  ##
>>  { 'struct'  : 'DisplayGTK',
>>    'data'    : { '*grab-on-hover' : 'bool',
>> -                '*zoom-to-fit'   : 'bool'  } }
>> +                '*zoom-to-fit'   : 'bool',
>> +		'*monitor-num' : 'int' } }
>
> Missing documentation of the new member.  Also, get rid of the tab damage.

Suggest to name it either @monitor-number or @monitor (because what else
than the number could 'int' be?)


