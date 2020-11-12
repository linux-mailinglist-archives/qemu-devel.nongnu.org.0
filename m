Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD722B0072
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 08:42:23 +0100 (CET)
Received: from localhost ([::1]:36744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd7FO-0006hm-PW
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 02:42:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kd7By-000553-8n
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 02:38:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kd7Bw-00048B-Fr
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 02:38:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605166727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rg1MH0xKrgji/zEAY3MwmLwrWW5lQmXkgY/iZDyz7O8=;
 b=FY0SMbEGKJyQz5p5hybQXoeYKZueP/UFx+h4IWX6mLCR+hX5Qm/Cm6L/8lUVI5M78tQzMh
 kzbJLBTq65mBQEjEGbLznv90s6AVHdSre8KtPIHHWwLc9x8JlCsf7kQPHzDf1qTRGXegVO
 UvddrPtMwKzxnmy9CKw9IrUsYL/DtBo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-b3zecu8uNrm_daPY3JRy9w-1; Thu, 12 Nov 2020 02:38:45 -0500
X-MC-Unique: b3zecu8uNrm_daPY3JRy9w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5ABB718CB72C;
 Thu, 12 Nov 2020 07:38:44 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-74.ams2.redhat.com [10.36.112.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C75834691;
 Thu, 12 Nov 2020 07:38:42 +0000 (UTC)
Subject: Re: [PATCH v2 3/4] nand: put it into the 'storage' category
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201111164710.644863-1-ganqixin@huawei.com>
 <20201111164710.644863-4-ganqixin@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4942269b-86bd-ce1b-eeaa-bebe27a4f0fb@redhat.com>
Date: Thu, 12 Nov 2020 08:38:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201111164710.644863-4-ganqixin@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: zhang.zhanghailiang@huawei.com, Qemu-block <qemu-block@nongnu.org>,
 laurent@vivier.eu, armbru@redhat.com, kuhn.chenqun@huawei.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/2020 17.47, Gan Qixin wrote:
> The category of the nand device is not set, put it into the 'storage'
> category.
> 
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
>  hw/block/nand.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/block/nand.c b/hw/block/nand.c
> index bcceb64ebb..1d7a48a2ec 100644
> --- a/hw/block/nand.c
> +++ b/hw/block/nand.c
> @@ -449,6 +449,7 @@ static void nand_class_init(ObjectClass *klass, void *data)
>      dc->reset = nand_reset;
>      dc->vmsd = &vmstate_nand;
>      device_class_set_props(dc, nand_properties);
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>  }
>  
>  static const TypeInfo nand_info = {
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


