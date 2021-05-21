Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FCB38CA7A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 17:56:54 +0200 (CEST)
Received: from localhost ([::1]:44428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk7W9-000231-64
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 11:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lk7Uu-0001Ki-Cx
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:55:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lk7Us-0003uV-Oh
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:55:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621612533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZvXmF8oDrm4rchEcNu/hF5NAkzVQmpAqMoDa03+1Rw=;
 b=THs4ePy5mcHOZSjGe7bQYl9akDHB2Vt24TAJy+PWTROPNt8KTzCfuizLj4RPhtrK/G/exc
 v+eA2IQcXks1PMMDAXPC4odO98dRg6r2nAeOKcS3j3bXZ5cHfXMqNmSdu+YlWo/GOeMWPB
 jF2ir+jn0XB4i39aOFt+rbULPfNroLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-_chzuH9KPsmEKAKyRXeh_Q-1; Fri, 21 May 2021 11:55:32 -0400
X-MC-Unique: _chzuH9KPsmEKAKyRXeh_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 014261854E20;
 Fri, 21 May 2021 15:55:31 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 532F560C5B;
 Fri, 21 May 2021 15:55:30 +0000 (UTC)
Subject: Re: [PATCH 2/6] qapi/parser: Allow empty QAPIDoc Sections
To: Markus Armbruster <armbru@redhat.com>
References: <20210519191718.3950330-1-jsnow@redhat.com>
 <20210519191718.3950330-3-jsnow@redhat.com>
 <87y2c94gbp.fsf@dusky.pond.sub.org>
 <542e94f4-be9c-da6a-8307-1a36c8c6c7c4@redhat.com>
 <87v97cr6np.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <c4eeaccf-7b7a-cf11-fdd0-d917085c6a15@redhat.com>
Date: Fri, 21 May 2021 11:55:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87v97cr6np.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/21/21 1:35 AM, Markus Armbruster wrote:
> Does not fire for qga/qapi-schema.json.  Can you help?

Odd.

I did:

if self._section:
     ...
else:
     raise QAPIWhicheverErrorItWas(...)

and then did a full build and found it to fail on QGA stuff. You may 
need --enable-docs to make it happen.

It later failed on test cases, too.

--js


