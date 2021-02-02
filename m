Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4892330CD3E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 21:45:35 +0100 (CET)
Received: from localhost ([::1]:45580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l72YH-0003g8-Qq
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 15:45:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l72W0-0003Bt-UG
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:43:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l72Vx-00089a-LV
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:43:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612298587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N2GFGCuFGtYdUL1q6kmM93gDhZe9H63LzrnLut8KNO8=;
 b=jNIAYg/ofVVbpbdXmCDXhZXrgeUj+5rwJlQucVfGkWfl3ENA5cN97k4KqbvaT3+HLF6rYI
 yX3+CHXe/kzGbyRGeBWzXOSf61ZsIRWamlMxRg0+cfSIWaF0Ems/Fy9bJW50G9Pfk3kC/H
 0fqdO9iU84Le9g9AQmrqgEfObcCcABw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342--Pj0OqplMOa3fhD78ncyHA-1; Tue, 02 Feb 2021 15:43:05 -0500
X-MC-Unique: -Pj0OqplMOa3fhD78ncyHA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6DC1107ACF6;
 Tue,  2 Feb 2021 20:43:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B31C510016F4;
 Tue,  2 Feb 2021 20:43:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 48096113865F; Tue,  2 Feb 2021 21:43:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 07/16] qapi: use explicitly internal module names
References: <20210201193747.2169670-1-jsnow@redhat.com>
 <20210201193747.2169670-8-jsnow@redhat.com>
 <87pn1ig77h.fsf@dusky.pond.sub.org>
 <68cecf73-d60b-0868-973b-c456e891c4b4@redhat.com>
Date: Tue, 02 Feb 2021 21:43:00 +0100
In-Reply-To: <68cecf73-d60b-0868-973b-c456e891c4b4@redhat.com> (John Snow's
 message of "Tue, 2 Feb 2021 11:06:30 -0500")
Message-ID: <87lfc62obv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: Michael Roth <michael.roth@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 2/2/21 4:16 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> Use ./emit and ./init explicitly instead of "emit" and "init" and adding
>>> the prefix based on the specific method called, which later allows us to
>>> coalesce the two different methods into one.
>> "Bandwurmsatz" (literally "tapeworm sentence").  Perhaps something
>> like:
>>      QAPISchemaModularCVisitor._add_system_module() prefixes './' to
>> its name
>>      argument to make it a module name.  Pass the module name instead.  This
>>      will allow us to coalesce the methods to add modules later on.
>> Happy to tweak the commit message in my tree.
>> 
>
> Yep, with my blessing.

Done!


