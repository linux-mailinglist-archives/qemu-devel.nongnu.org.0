Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1102DFBA6
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 12:51:42 +0100 (CET)
Received: from localhost ([::1]:59928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krJj2-0000Us-RS
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 06:51:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1krJhg-0008Iv-6T
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 06:50:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1krJhV-0004Te-1F
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 06:50:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608551402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/YpPwvHu5hWJcgCbNxz8FpmKnelzC6+3W0R98BFkFBA=;
 b=Fbfv1eDQqZFe22YPkOtLU26fcPciDVnblGh8ji2X/G7j/4dPiStbPqscSxeTW5ivfW0CW2
 71QnhHJrcGkAV0tEGfnnpFfzUNC4g8KQOZwAbqNNPaI1PSbruxBhcAOluLkAgTl5sVTvPw
 NaW3X6+dERTT0h6vsszpPq8ZveP98Vo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-eDJZjLIsNDWsk3vck5oJCw-1; Mon, 21 Dec 2020 06:50:01 -0500
X-MC-Unique: eDJZjLIsNDWsk3vck5oJCw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7650280EF8D;
 Mon, 21 Dec 2020 11:49:59 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-232.ams2.redhat.com [10.36.113.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9591F1001E73;
 Mon, 21 Dec 2020 11:49:57 +0000 (UTC)
Subject: Re: [PATCH v2 03/12] vmmouse: put it into the 'input' category
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201130083630.2520597-1-ganqixin@huawei.com>
 <20201130083630.2520597-4-ganqixin@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <57b39663-df53-5dc8-454f-45caabb91257@redhat.com>
Date: Mon, 21 Dec 2020 12:49:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130083630.2520597-4-ganqixin@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.299, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
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
Cc: kuhn.chenqun@huawei.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 zhang.zhanghailiang@huawei.com, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/11/2020 09.36, Gan Qixin wrote:
> The category of the vmmouse device is not set, put it into the 'input'
> category.
> 
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Michael S. Tsirkin <mst@redhat.com>
> ---
>  hw/i386/vmmouse.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/i386/vmmouse.c b/hw/i386/vmmouse.c
> index a3556438f0..df4798f502 100644
> --- a/hw/i386/vmmouse.c
> +++ b/hw/i386/vmmouse.c
> @@ -308,6 +308,7 @@ static void vmmouse_class_initfn(ObjectClass *klass, void *data)
>      dc->reset = vmmouse_reset;
>      dc->vmsd = &vmstate_vmmouse;
>      device_class_set_props(dc, vmmouse_properties);
> +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
>  }
>  
>  static const TypeInfo vmmouse_info = {
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


