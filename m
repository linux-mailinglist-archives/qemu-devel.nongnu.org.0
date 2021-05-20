Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CB638B975
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 00:24:57 +0200 (CEST)
Received: from localhost ([::1]:33072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljr68-0002rX-Nt
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 18:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljr5N-0002Bi-2v
 for qemu-devel@nongnu.org; Thu, 20 May 2021 18:24:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljr5H-0001t2-SU
 for qemu-devel@nongnu.org; Thu, 20 May 2021 18:24:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621549442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fXko0t59D4iqL3fGTvUWqzKn8A2ivjP1VmYuzi7Za+w=;
 b=R6lV9MYJ0f6RggukINnxShancjeNobtHdQfivFeEO4ukmzWTiasYu54DxCKE+vZ9Lp4jPz
 s/DM4limzuYeEJXNjNPJ5kNaPF9xGXCE1BG9IDfUis9jIgVgm/hEDzbroVJxNz7BOoXExs
 lu2j+BzdPZ7J06gkL/ZbUIii/2j/ujw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-EIHqB4_PPt6NsxP2FKedDQ-1; Thu, 20 May 2021 18:23:58 -0400
X-MC-Unique: EIHqB4_PPt6NsxP2FKedDQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6441D107ACE8;
 Thu, 20 May 2021 22:23:57 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0317E167;
 Thu, 20 May 2021 22:23:56 +0000 (UTC)
Subject: Re: [PATCH 2/6] qapi/parser: Allow empty QAPIDoc Sections
To: Markus Armbruster <armbru@redhat.com>
References: <20210519191718.3950330-1-jsnow@redhat.com>
 <20210519191718.3950330-3-jsnow@redhat.com>
 <87y2c94gbp.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <542e94f4-be9c-da6a-8307-1a36c8c6c7c4@redhat.com>
Date: Thu, 20 May 2021 18:23:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87y2c94gbp.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/21 10:42 AM, Markus Armbruster wrote:
> First step is to find out how _end_section() can be called twice in a
> row.  It isn't in all of "make check".  Hmm.

Ah, maybe not twice in a *row*. It does seem to be called when we have 
an "empty section" sometimes, which arises from stuff like this:

Extension error:
/home/jsnow/src/qemu/docs/../qga/qapi-schema.json:1143:1: ending a 
totally empty section

## 

# @GuestExec: 

# @pid: pid of child process in guest OS 

# 

# Since: 2.5 

## 

{ 'struct': 'GuestExec',
   'data': { 'pid': 'int'} }

Without the newline there, it seems to get confused. There's a few like 
this that could be fixed, but then some of the test cases break too.

No appetite for barking up this tree right now.

Can I fix the commit message and leave the patch in place? Maybe with a 
#FIXME comment nearby?

--js


