Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E325930C534
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:17:33 +0100 (CET)
Received: from localhost ([::1]:41170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6yMu-0001uX-Ts
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:17:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6yCi-0001WI-Ih
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:07:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6yCd-000749-VI
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:07:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612282013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X/z6bCv3+otazFmJ6dr6zV7WQKD+9hcnDLeASjSeq18=;
 b=dWa5k5AER63d2wvY4oPkZqRo8Drj0H7SPvYdcV4IHHoAnMgh6JlKdbWJrHMXIfdkkapUsL
 zXf17ykoHne3lgKj7UN2l6WJbW6yMugr11BZpLw1LzSmdkcfSovtKLfyTjz86tvoLbrPLx
 FIVYRSuoXd94j6vaeR9tJ2rqQdfzosM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-9UJLID-INMeMtNWZT7wQiw-1; Tue, 02 Feb 2021 11:06:51 -0500
X-MC-Unique: 9UJLID-INMeMtNWZT7wQiw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69211AFAB6;
 Tue,  2 Feb 2021 16:06:50 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51DB91F47A;
 Tue,  2 Feb 2021 16:06:31 +0000 (UTC)
Subject: Re: [PATCH v4 07/16] qapi: use explicitly internal module names
To: Markus Armbruster <armbru@redhat.com>
References: <20210201193747.2169670-1-jsnow@redhat.com>
 <20210201193747.2169670-8-jsnow@redhat.com>
 <87pn1ig77h.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <68cecf73-d60b-0868-973b-c456e891c4b4@redhat.com>
Date: Tue, 2 Feb 2021 11:06:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87pn1ig77h.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 4:16 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> Use ./emit and ./init explicitly instead of "emit" and "init" and adding
>> the prefix based on the specific method called, which later allows us to
>> coalesce the two different methods into one.
> 
> "Bandwurmsatz" (literally "tapeworm sentence").  Perhaps something like:
> 
>      QAPISchemaModularCVisitor._add_system_module() prefixes './' to its name
>      argument to make it a module name.  Pass the module name instead.  This
>      will allow us to coalesce the methods to add modules later on.
> 
> Happy to tweak the commit message in my tree.
> 

Yep, with my blessing.


