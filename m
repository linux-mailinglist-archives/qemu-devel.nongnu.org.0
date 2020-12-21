Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DB42DFBA9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 12:55:04 +0100 (CET)
Received: from localhost ([::1]:36876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krJmJ-0002j5-Pp
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 06:55:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1krJlA-0002Bh-HH
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 06:53:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1krJl8-0005qz-HU
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 06:53:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608551629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OUGC+NKltmfm3rlDk/RDHcIQDho9GnfRJzExabP6syY=;
 b=GZ07/0NTvusw2zmeQ7kb3eTr6afbOZET0TjSu15wm44HiQw1WGWMlu4/71VdjPWrM8LUAz
 tHL7hSryqc4H2Z7mtj7HKo7tRWLAgBa30+VjVoa+OUrgmvuvESDuRit882P3wavUWC7adK
 zw1Hi9FTqPHv4KVArEHYsQbhPrTrb6o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-8jTYiodMO72_9RCTpBti1g-1; Mon, 21 Dec 2020 06:53:47 -0500
X-MC-Unique: 8jTYiodMO72_9RCTpBti1g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81F81192CC43;
 Mon, 21 Dec 2020 11:53:46 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-232.ams2.redhat.com [10.36.113.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA68860862;
 Mon, 21 Dec 2020 11:53:41 +0000 (UTC)
Subject: Re: [PATCH v2 05/12] mc146818rtc: put it into the 'misc' category
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201130083630.2520597-1-ganqixin@huawei.com>
 <20201130083630.2520597-6-ganqixin@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8c45ab34-2534-d5ad-ca0b-43b49a681e55@redhat.com>
Date: Mon, 21 Dec 2020 12:53:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130083630.2520597-6-ganqixin@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.299, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: kuhn.chenqun@huawei.com, zhang.zhanghailiang@huawei.com,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/11/2020 09.36, Gan Qixin wrote:
> The category of the mc146818rtc device is not set, put it into the 'misc'
> category.
> 
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Michael S. Tsirkin <mst@redhat.com>
> ---
>  hw/rtc/mc146818rtc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
> index 7a38540cb9..39edca0996 100644
> --- a/hw/rtc/mc146818rtc.c
> +++ b/hw/rtc/mc146818rtc.c
> @@ -1039,6 +1039,7 @@ static void rtc_class_initfn(ObjectClass *klass, void *data)
>      dc->vmsd = &vmstate_rtc;
>      isa->build_aml = rtc_build_aml;
>      device_class_set_props(dc, mc146818rtc_properties);
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>  }

I wonder whether this device should be user_creatable at all (e.g. it uses a
hard-coded IO port)... Anyway setting the category certainly does not hurt,
thus:

Reviewed-by: Thomas Huth <thuth@redhat.com>


