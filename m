Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89712DCA8F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 02:36:44 +0100 (CET)
Received: from localhost ([::1]:41554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpiDk-0006AQ-0d
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 20:36:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpiCK-0005bP-UH
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:35:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpiCG-0004EX-Qh
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:35:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608168908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XqVK0W/mspCN1coVVFthXTVgJs5BSni8teuvFkNeNoA=;
 b=SLgeF7KEe0a9TF7y7L98fvE9/gDtWX8XKn4T8dtO5CZNhpPw8Zo/BbyzHhYfWbarYB6FVD
 O/B+gfFWX4xjIDWPJg6lOTjnUep5C5uhkQJe/FWHgr0qw5AT+6dpwL6QdFQUdi3ohdfKjr
 BNl/oUrDMH8Ltt+NaYupEgwW7uLl0P4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-FQlGPTlgO1K8Yy_7NaSniA-1; Wed, 16 Dec 2020 20:35:06 -0500
X-MC-Unique: FQlGPTlgO1K8Yy_7NaSniA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAADA180A089
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:35:05 +0000 (UTC)
Received: from [10.10.112.131] (ovpn-112-131.rdu2.redhat.com [10.10.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A43F1E5;
 Thu, 17 Dec 2020 01:35:05 +0000 (UTC)
Subject: Re: [PATCH v2 05/11] qapi/introspect.py: add preliminary type hint
 annotations
To: Markus Armbruster <armbru@redhat.com>
References: <20201026194251.11075-1-jsnow@redhat.com>
 <20201026194251.11075-6-jsnow@redhat.com> <874kltnqx8.fsf@dusky.pond.sub.org>
 <995012d8-9b13-726a-fa05-844ec8ff61f6@redhat.com>
 <87v9d2tci9.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <0f1b6793-b91b-604a-c3c1-1c7e343b356b@redhat.com>
Date: Wed, 16 Dec 2020 20:35:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <87v9d2tci9.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 2:51 AM, Markus Armbruster wrote:
> 
> Is it too late to delay the introduction of type hints until after the
> data structure cleanups?
> 
> If yes, I have to spend more time replying below.
> 

No, I re-ordered the series again to delay typing until the end, or 
close to it.

Though I abandoned plans to slacken List[...] inputs to Iterable[...] or 
Sequence[...] like I had mentioned; I think it could still be done, but 
it's fine to just use List[...] for the inputs for now. We can worry 
about optimizing type flexibility later, I think.

Let's just get the dog hunting at all first.

--js


