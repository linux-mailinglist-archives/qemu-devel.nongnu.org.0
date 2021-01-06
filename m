Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 695382EBBD6
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 10:51:44 +0100 (CET)
Received: from localhost ([::1]:40464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx5Tj-00041t-Ey
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 04:51:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kx5RN-0002z2-SY
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 04:49:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kx5RK-0004ot-9k
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 04:49:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609926553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OonxGaZIzAs/uNpg5Hk4TN0dFzH5/Lo1CShPZrmMK2o=;
 b=X8LW7tekGpQj70WcJ7OgL9pvCLcDKavblfeFEldZdT8MeWVB483RuDlhJbHNArOKap3el0
 AMdrUJDd3bmph81RyAVEjNHfkCswOmBYi/LO7/tenpUUnOKV7yUYD7QTuloC4i8cCNMGDI
 cdlEvBdTx38+enhvwfr0DESQxRJYuOE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-SscCcJZ4NluQPaUZZnzWhw-1; Wed, 06 Jan 2021 04:49:09 -0500
X-MC-Unique: SscCcJZ4NluQPaUZZnzWhw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6CD2107ACE3;
 Wed,  6 Jan 2021 09:49:08 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-112-89.ams2.redhat.com
 [10.36.112.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 97DCD6268B;
 Wed,  6 Jan 2021 09:49:07 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] tests: Collapse echoed JSON input to a single line
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20201221134931.1194806-1-david.edmondson@oracle.com>
 <20201221134931.1194806-3-david.edmondson@oracle.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <b69093d7-359c-77e4-201a-29a1948796fd@redhat.com>
Date: Wed, 6 Jan 2021 10:49:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201221134931.1194806-3-david.edmondson@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.12.20 14:49, David Edmondson wrote:
> When sending JSON to running qemu, qemu-io, etc. instances, flatten
> the echoed input to a single line to ensure that comparisons with the
> expected input (which is always a single line) are successful.
> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>   tests/qemu-iotests/common.filter | 6 ++++++
>   tests/qemu-iotests/common.qemu   | 2 +-
>   2 files changed, 7 insertions(+), 1 deletion(-)

I think this is superseded now by commit 0e72078128229bf9efb54.

Max


