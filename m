Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C372D1F467B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 20:42:44 +0200 (CEST)
Received: from localhost ([::1]:34416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jijCt-00054p-S2
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 14:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jijC3-0004R9-DP
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 14:41:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47107
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jijC2-0000u8-P8
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 14:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591728110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cetEHzQ6pF/1SL8BImHQM13VtGbcY36V77QD5k3eb/Y=;
 b=TeDeIwwPZH/altBt2AHTsizx02rE0X4y7xVW+XihfxPCOYYsdyktNemm+izWndQ1wrUqbS
 QaGcwNDB9ZC/Tmt6yZv+kBZJtftOcHOGP9PrwtEzp1pf6eljTugUnO1BvEDi5Hm/loAj39
 D8ARCH4crU2RWK4zpou/7BlUcjHWfNQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-ZHvlZ7SMNwiLhYqwa1kaCQ-1; Tue, 09 Jun 2020 14:41:27 -0400
X-MC-Unique: ZHvlZ7SMNwiLhYqwa1kaCQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1AAB461;
 Tue,  9 Jun 2020 18:41:25 +0000 (UTC)
Received: from [10.3.113.22] (ovpn-113-22.phx2.redhat.com [10.3.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4411C7BE60;
 Tue,  9 Jun 2020 18:41:25 +0000 (UTC)
Subject: Re: [PATCH 1/2] nbd/server: Avoid long error message assertions
 CVE-2020-10761
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
References: <20200608182638.3256473-1-eblake@redhat.com>
 <20200608182638.3256473-2-eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <2547a325-74e4-426b-9ec6-c8ad05028139@redhat.com>
Date: Tue, 9 Jun 2020 13:41:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608182638.3256473-2-eblake@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 01:38:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, xuwei@redhat.com, qemu-stable@nongnu.org,
 Max Reitz <mreitz@redhat.com>, ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/20 1:26 PM, Eric Blake wrote:
> Ever since commit 36683283 (v2.8), the server code asserts that error
> strings sent to the client are well-formed per the protocol by not
> exceeding the maximum string length of 4096.  At the time the server
> first started sending error messages, the assertion could not be
> triggered, because messages were completely under our control.
> However, over the years, we have added latent scenarios where a client
> could trigger the server to attempt an error message that would
> include the client's information if it passed other checks first:
> 
> - requesting NBD_OPT_INFO/GO on an export name that is not present
>    (commit 0cfae925 in v2.12 echoes the name)
> 
> - requesting NBD_OPT_LIST/SET_META_CONTEXT on an export name that is
>    not present (commit e7b1948d in v2.12 echoes the name)

Note that this patch does NOT scrub the client's export name for control 
characters.  Then again, the qcow2 file format does not (currently) 
prohibit control characters in bitmap or internal snapshot names, and 
'qemu-img info' blindly outputs there too.  We may want to do followup 
patches that further scrub qemu error messages to avoid scenarios where 
a user can attempt to coerce qemu into producing an error message 
containing control characters.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


