Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FF231F901
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 13:06:18 +0100 (CET)
Received: from localhost ([::1]:56300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD4Y4-0008Lt-VW
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 07:06:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lD4W1-0006aG-SB
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:04:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lD4W0-0001qK-2A
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:04:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613736247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+FrlIy095/wCLQR1ipgEd8xVKsEAaYP1gKMaSuJPU8I=;
 b=Ii9kIFi0qHkbHg4EBBkBN9LpOOkm9XUTGGpNvPKCOE+v8XG/aQHXRIRqikInLrY2q3LwRT
 //webt+kkJtAhL3kqOucukOLcsX4YXTpkW5yOPjumVOrNEABQYvpaX1lMCbZyY6KHHsWdB
 rWDRuWO5IRKmvLmOZXsY3yDu0iKpX8Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-F4D7eU6XMsa4Wr1sHPTxSA-1; Fri, 19 Feb 2021 07:04:05 -0500
X-MC-Unique: F4D7eU6XMsa4Wr1sHPTxSA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D05C192AB78;
 Fri, 19 Feb 2021 12:04:04 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-112-191.ams2.redhat.com
 [10.36.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60FEF60BE5;
 Fri, 19 Feb 2021 12:04:02 +0000 (UTC)
Subject: Re: [PATCH] iotests: Drop deprecated 'props' from object-add
To: Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org
References: <20210216171653.6543-1-berto@igalia.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <ff22d21d-ccd8-77e5-1b4c-786e3df79400@redhat.com>
Date: Fri, 19 Feb 2021 13:04:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216171653.6543-1-berto@igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.02.21 18:16, Alberto Garcia wrote:
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>   tests/qemu-iotests/087     |  8 ++------
>   tests/qemu-iotests/184     | 18 ++++++------------
>   tests/qemu-iotests/218     |  2 +-
>   tests/qemu-iotests/235     |  2 +-
>   tests/qemu-iotests/245     |  4 ++--
>   tests/qemu-iotests/258     |  7 +++----
>   tests/qemu-iotests/258.out |  4 ++--
>   tests/qemu-iotests/295     |  2 +-
>   tests/qemu-iotests/296     |  2 +-
>   9 files changed, 19 insertions(+), 30 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>

Two Python syntax nit picks below.

[...]

> diff --git a/tests/qemu-iotests/218 b/tests/qemu-iotests/218
> index ae7c4fb187..cbb38923cf 100755
> --- a/tests/qemu-iotests/218
> +++ b/tests/qemu-iotests/218
> @@ -152,7 +152,7 @@ with iotests.VM() as vm, \
>       vm.launch()
>   
>       ret = vm.qmp('object-add', qom_type='throttle-group', id='tg',
> -                 props={'x-bps-read': 4096})
> +                 x_bps_read = 4096)

To stay consistent, I think there shouldn’t be spaces around '=' here.

(flake8 thinks so, too)

>       assert ret['return'] == {}
>   
>       ret = vm.qmp('blockdev-add',

[..]

> diff --git a/tests/qemu-iotests/258 b/tests/qemu-iotests/258
> index 9a2d33ae5e..65ce02501a 100755
> --- a/tests/qemu-iotests/258
> +++ b/tests/qemu-iotests/258
> @@ -103,10 +103,9 @@ def test_concurrent_finish(write_to_stream_node):
>           vm.qmp_log('object-add',
>                      qom_type='throttle-group',
>                      id='tg',
> -                   props={
> -                       'x-iops-write': 1,
> -                       'x-iops-write-max': 1
> -                   })
> +                   x_iops_write=1,
> +                   x_iops_write_max=1
> +                   )

This indentation looks weird to me now.  Unfortunately, flake8 finds 
this is the only correct indentation, so I have no reason to complain.

Perhaps putting it on the preceding line would be better?


