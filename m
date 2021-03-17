Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB3233FB50
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 23:36:26 +0100 (CET)
Received: from localhost ([::1]:40132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMemA-0004JF-10
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 18:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lMel5-0003jW-Ph
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 18:35:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lMel2-0007e9-8B
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 18:35:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616020514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N6pAXfXXt4HCa9YMGTLf7j8JdDWvRh6rCorP58F93V4=;
 b=Dsg5jsf3gRStsMI54SbVUVKWsh8+bp2th+TMGQj0wldBFoR1FCOnnsErSLbyIFkNFL1FAq
 sx51nI55WC8IttEPpcbNq9GD/Uzl3pCgiD+dbm/BpGbs6MoWmyeN69xL2cp1kLd7QJ8G6d
 +ph+h2LnwmhdzuaZB6Ja7YIeVCtDot4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-ddogPq-hOEKUSWWPI0n5Ow-1; Wed, 17 Mar 2021 18:35:12 -0400
X-MC-Unique: ddogPq-hOEKUSWWPI0n5Ow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2B9080006E;
 Wed, 17 Mar 2021 22:35:11 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B29B19C66;
 Wed, 17 Mar 2021 22:35:11 +0000 (UTC)
Subject: Re: "make check" broken with everything but tools disabled
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <877dm7jkib.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <f0e41b5f-c98f-db46-abc9-30530592ee26@redhat.com>
Date: Wed, 17 Mar 2021 18:35:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <877dm7jkib.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 9:28 AM, Markus Armbruster wrote:
> Watch this:
> 
>      $ mkdir bld-tools
>      $ cd bld-tools
>      $ ../configure --disable-system --disable-user --enable-tools
>      $ make check
>      [...]
>      make: *** No rule to make target 'tests/qemu-iotests/socket_scm_helper', needed by 'check-block'.  Stop.
> 
> 

One more thing to add a CI job to check, I suppose.

--js


