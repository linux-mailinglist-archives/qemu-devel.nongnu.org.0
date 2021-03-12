Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCCA338316
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 02:19:42 +0100 (CET)
Received: from localhost ([::1]:38838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKWSr-00083n-VM
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 20:19:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lKWRF-0007Wt-3T
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 20:18:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lKWRB-0006Wf-9m
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 20:18:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615511876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rDiRG32ShifL7Gj4EfxYQrDMKsAh/Hv+p/WAOfN6+wc=;
 b=Yyy5948x3sFFlhvi3q400OkFu13vzM6eCmOy9+GIY4WXbEvnzOxQE5H5wUMWPoLmxGIIeJ
 8uJTNEGbtjoQg6syOlYrfhO0oxDAZJIqsZZ00o75figV0c/3QQ+tV4sQworhvPX6R5nb65
 FOFdbzcuwgKlNgUiVa5Mnj4zY9FZG9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-6zxO9NuhO1OBVOlB-I2YTw-1; Thu, 11 Mar 2021 20:17:54 -0500
X-MC-Unique: 6zxO9NuhO1OBVOlB-I2YTw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EBF718D6A32;
 Fri, 12 Mar 2021 01:17:53 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72C615946B;
 Fri, 12 Mar 2021 01:17:49 +0000 (UTC)
Subject: Re: [PATCH v4 0/4] Drop deprecated floppy config & bogus -drive if=T
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210311075221.1795266-1-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <353e5606-ce1f-bdb1-bb1d-c29505c97ec9@redhat.com>
Date: Thu, 11 Mar 2021 20:17:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311075221.1795266-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, richard.henderson@linaro.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 2:52 AM, Markus Armbruster wrote:
> v4:
> * PATCH 3: Move a declaration into a loop [Richard]
> * PATCH 4: Drop a superfluous call to drive_check_orphaned() [Daniel],
>    fix comments [John]
> 
> v3:
> * PATCH 1: New [Daniel]
> 
> v2:
> * Rebased, straightforward conflict with commit f5d33dd51f
>    "hw/block/fdc: Remove the check_media_rate property" resolved
> * PATCH 2: Commit message fixed [Kevin]
> 
> Markus Armbruster (4):
>    docs/system/deprecated: Fix note on fdc drive properties
>    fdc: Drop deprecated floppy configuration
>    fdc: Inline fdctrl_connect_drives() into fdctrl_realize_common()
>    blockdev: Drop deprecated bogus -drive interface type
> 
>   docs/system/deprecated.rst       |  33 --
>   docs/system/removed-features.rst |  56 +++
>   include/sysemu/blockdev.h        |   1 -
>   blockdev.c                       |  37 +-
>   hw/block/fdc.c                   |  73 +---
>   softmmu/vl.c                     |  11 +-
>   tests/qemu-iotests/172           |  31 +-
>   tests/qemu-iotests/172.out       | 562 +------------------------------
>   8 files changed, 82 insertions(+), 722 deletions(-)
> 

Reviewed-by: John Snow <jsnow@redhat.com>

Tentatively staged, pending CI:
https://gitlab.com/jsnow/qemu/-/pipelines/269277138

--js


