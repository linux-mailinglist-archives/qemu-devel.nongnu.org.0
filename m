Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C3A2B163D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 08:17:19 +0100 (CET)
Received: from localhost ([::1]:52086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdTKf-00084A-My
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 02:17:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kdTIT-0007JP-Bl
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 02:15:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kdTIQ-0005Fc-P1
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 02:15:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605251697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I5DZVlKK4P6VCK3S3Ys+4gNkW3CdLa2jtpXyFx7mlbs=;
 b=M9HgprvYgxoQqt/Z+jl3jSLCo5wntAtyMdufjDcdHQnPwv8PHQWYirHuw2+5Q6YAuVYwAu
 +TIB5cf5pDFRt+3/GOTLqBKlRc8yQI1of9GGe5GjZi+ZPPGg9Jqj3iiZhg807JKXeqLPMo
 expBmOWzLdDuN1HUrCgsrQ61DHHxDI4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-kt1Ws3DkNJyhKRyhabkAkA-1; Fri, 13 Nov 2020 02:14:55 -0500
X-MC-Unique: kt1Ws3DkNJyhKRyhabkAkA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E2908049D4;
 Fri, 13 Nov 2020 07:14:54 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-177.ams2.redhat.com [10.36.112.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D12F360BE2;
 Fri, 13 Nov 2020 07:14:48 +0000 (UTC)
Subject: Re: [PATCH v3 4/4] max111x: put it into the 'misc' category
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201112125824.763182-1-ganqixin@huawei.com>
 <20201112125824.763182-5-ganqixin@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ed0e1207-b37d-7e6f-0bf1-4e473ac00df6@redhat.com>
Date: Fri, 13 Nov 2020 08:14:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201112125824.763182-5-ganqixin@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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
Cc: zhang.zhanghailiang@huawei.com, mst@redhat.com, laurent@vivier.eu,
 armbru@redhat.com, kuhn.chenqun@huawei.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/2020 13.58, Gan Qixin wrote:
> The category of the max111x device is not set, put it into the 'misc'
> category.
> 
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
>  hw/misc/max111x.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/misc/max111x.c b/hw/misc/max111x.c
> index 7e6723f343..eae0f9b598 100644
> --- a/hw/misc/max111x.c
> +++ b/hw/misc/max111x.c
> @@ -185,6 +185,7 @@ static void max111x_class_init(ObjectClass *klass, void *data)
>      k->transfer = max111x_transfer;
>      dc->reset = max111x_reset;
>      dc->vmsd = &vmstate_max111x;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>  }
>  
>  static const TypeInfo max111x_info = {
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


