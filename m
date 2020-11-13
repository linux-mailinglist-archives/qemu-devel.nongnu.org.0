Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BCB2B2035
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 17:24:09 +0100 (CET)
Received: from localhost ([::1]:55726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdbrs-0001DJ-Rn
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 11:24:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdbqq-0000jx-Ki
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 11:23:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdbqp-0001Xn-2k
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 11:23:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605284582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O5p8k1Ca1bsZzK9MoSb8Bv4uWXKLppIbgyDaqVVrruw=;
 b=Y9/n5amLDE3Df9h/M/BINorfbDqwnKMFaZqyFZPMPTPBmo0U0dWMNFM8JiCJIbu8HbbAT7
 8K8RPQvEQtxdGaSzXhW7cy6rgDiqtKKay8a1XOT1y6BxGXv+3Ypt2qL6WcvGBwgJBA36Qb
 xwPDnqeuIyAVOkYI6/yqeUhtLQmqaOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-VJlkUUyRODu8KHlZSQLYWQ-1; Fri, 13 Nov 2020 11:22:57 -0500
X-MC-Unique: VJlkUUyRODu8KHlZSQLYWQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 493D41006C8A;
 Fri, 13 Nov 2020 16:22:56 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-96.ams2.redhat.com
 [10.36.114.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DA3C60C11;
 Fri, 13 Nov 2020 16:22:51 +0000 (UTC)
Subject: Re: [PATCH v7 20/21] simplebench/results_to_text: make executable
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201021145859.11201-1-vsementsov@virtuozzo.com>
 <20201021145859.11201-21-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <20f93a4a-8016-002e-7f0e-735860516ced@redhat.com>
Date: Fri, 13 Nov 2020 17:22:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201021145859.11201-21-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, den@virtuozzo.com, qemu-devel@nongnu.org,
 armbru@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.10.20 16:58, Vladimir Sementsov-Ogievskiy wrote:
> Make results_to_text a tool to dump results saved in JSON file.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   scripts/simplebench/results_to_text.py | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>   mode change 100644 => 100755 scripts/simplebench/results_to_text.py

Reviewed-by: Max Reitz <mreitz@redhat.com>


