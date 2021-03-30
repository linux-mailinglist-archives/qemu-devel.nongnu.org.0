Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6CA34E65A
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 13:34:00 +0200 (CEST)
Received: from localhost ([::1]:48150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRCdC-0001A5-UK
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 07:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRCbv-0000e6-JZ
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 07:32:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRCbr-0006zg-KJ
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 07:32:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617103954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+VoYlmaUfyKKGJocgyfVfCJ13gS7xQTTUwy8OcBzGMo=;
 b=XZiHAEYNfOAujITW+wm/sFlfI0qScn2GAQKXARMuNuCmCddKstSrXi0otOfcjB0U9h+DAF
 QhDWHHscUtXVsJhLY8MAr/gv50dQF5gCwpGxX2XohjJOCke8RF7hiN/tZaJAb+JqHr+Cu8
 6NdfaCR+YV3fvNQlzSXTxv52db8qBqE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-JC0PfhfqNGymMfif3S_Jow-1; Tue, 30 Mar 2021 07:32:32 -0400
X-MC-Unique: JC0PfhfqNGymMfif3S_Jow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D28D8800D62;
 Tue, 30 Mar 2021 11:32:31 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-220.ams2.redhat.com
 [10.36.113.220])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5AA1709AF;
 Tue, 30 Mar 2021 11:32:30 +0000 (UTC)
Subject: Re: [PATCH v3 0/5] qemu-iotests: quality of life improvements
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210326142359.431127-1-pbonzini@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <6028fcec-ead5-bcc7-4c61-632322dbd2af@redhat.com>
Date: Tue, 30 Mar 2021 13:32:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210326142359.431127-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: eesposit@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.03.21 15:23, Paolo Bonzini wrote:
> This series adds a few usability improvements to qemu-iotests, in
> particular:
> 
> - arguments can be passed to Python unittests scripts, for example
>    to run only a subset of the test cases (patches 1-2)
> 
> - it is possible to do "./check -- ../../../tests/qemu-iotests/055 args..."
>    and specify arbitrary arguments to be passed to a single test script.
>    This allows to take advantage of the previous feature and ease debugging
>    of Python tests.
> 
> Paolo
Thanks, I’ve amended patch 4 and applied the series to my block branch:

https://git.xanclic.moe/XanClic/qemu/commits/branch/block

Max


