Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ECE2B2070
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 17:28:25 +0100 (CET)
Received: from localhost ([::1]:37476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdbw0-0005Vp-Dc
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 11:28:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdbsu-0002TF-9k
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 11:25:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdbss-00028a-TJ
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 11:25:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605284709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uOmIT/dAtqIaGktXAeFPkp28GNp6m0sblqtiuHmi6rI=;
 b=e9LmFKMbn0jfNMeQPt657Hz7oOSUanS7qm/tSK2Q+28WXoBNgO8mO8p6hZhkO1xZNK2Htj
 EHQSLNdfigbPksUgNNJeRgrm82tSauwb3O7eS75Y7UrRmzQrm4qfFCCQ2valPTZvmlNwkL
 EMOd5eJBSeEdV/PXMnYvDJ2XTv54iAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-sFyakRVGP9ilcTjF25bdig-1; Fri, 13 Nov 2020 11:25:05 -0500
X-MC-Unique: sFyakRVGP9ilcTjF25bdig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69FEC8049DF;
 Fri, 13 Nov 2020 16:25:04 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-96.ams2.redhat.com
 [10.36.114.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 731BB55793;
 Fri, 13 Nov 2020 16:24:59 +0000 (UTC)
Subject: Re: [PATCH v7 21/21] scripts/simplebench: add bench_prealloc.py
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201021145859.11201-1-vsementsov@virtuozzo.com>
 <20201021145859.11201-22-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <7ac2a1e3-19a3-5d84-49fc-369f8ac2b696@redhat.com>
Date: Fri, 13 Nov 2020 17:24:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201021145859.11201-22-vsementsov@virtuozzo.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
> Benchmark for new preallocate filter.
> 
> Example usage:
>      ./bench_prealloc.py ../../build/qemu-img \
>          ssd-ext4:/path/to/mount/point \
>          ssd-xfs:/path2 hdd-ext4:/path3 hdd-xfs:/path4
> 
> The benchmark shows performance improvement (or degradation) when use
> new preallocate filter with qcow2 image.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   scripts/simplebench/bench_prealloc.py | 132 ++++++++++++++++++++++++++
>   1 file changed, 132 insertions(+)
>   create mode 100755 scripts/simplebench/bench_prealloc.py

Reviewed-by: Max Reitz <mreitz@redhat.com>


