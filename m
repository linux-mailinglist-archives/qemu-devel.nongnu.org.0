Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E61F2B006C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 08:39:21 +0100 (CET)
Received: from localhost ([::1]:60774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd7CR-0004hs-UR
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 02:39:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kd784-00023Q-B0
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 02:34:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kd780-0002bq-Rz
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 02:34:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605166482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OU87oq4YGrwHdDd1oO2kaBJjCZAeAstnv1QOyGUWjiE=;
 b=MCpY8PxZ2sWhVXgKGU9iRg2vJJm++7mJrYGCuZrfRIHh58Vuut01LBygaQvFslsspIix/k
 M/j1sw0c28DJ417N4/hFEfog+J1euL0sI0BlOdAxLDY9PUEVE68HRTQIUm7Polwx96MiqX
 0cxnkGehWdugjTnkC5/mV51f2/dGSsQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-BTYF1j8aOl6wI-jqilX8DA-1; Thu, 12 Nov 2020 02:34:40 -0500
X-MC-Unique: BTYF1j8aOl6wI-jqilX8DA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33CFB802B51;
 Thu, 12 Nov 2020 07:34:39 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-74.ams2.redhat.com [10.36.112.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86C7A1002391;
 Thu, 12 Nov 2020 07:34:29 +0000 (UTC)
Subject: Re: [PATCH v2 1/4] ssd0323: put it into the 'display' category
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201111164710.644863-1-ganqixin@huawei.com>
 <20201111164710.644863-2-ganqixin@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a9bffd4f-973f-2c35-58f2-7d0d6967c4ca@redhat.com>
Date: Thu, 12 Nov 2020 08:34:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201111164710.644863-2-ganqixin@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
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
Cc: Peter Maydell <peter.maydell@linaro.org>, zhang.zhanghailiang@huawei.com,
 mst@redhat.com, laurent@vivier.eu, armbru@redhat.com,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 kuhn.chenqun@huawei.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/2020 17.47, Gan Qixin wrote:
> The category of the ssd0323 device is not set, put it into the 'display'
> category.
> 
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
>  hw/display/ssd0323.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/display/ssd0323.c b/hw/display/ssd0323.c
> index 17d4b32ae3..cbfd21dfd5 100644
> --- a/hw/display/ssd0323.c
> +++ b/hw/display/ssd0323.c
> @@ -370,6 +370,7 @@ static void ssd0323_class_init(ObjectClass *klass, void *data)
>      k->transfer = ssd0323_transfer;
>      k->cs_polarity = SSI_CS_HIGH;
>      dc->vmsd = &vmstate_ssd0323;
> +    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
>  }
>  
>  static const TypeInfo ssd0323_info = {
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


