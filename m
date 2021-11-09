Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A990744B23E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 18:59:07 +0100 (CET)
Received: from localhost ([::1]:54498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkVOk-0000Sj-Qq
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 12:59:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mkVN3-00086Y-Ea
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 12:57:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mkVN1-0001ky-A4
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 12:57:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636480638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VJ2KJF6rWpfL3zUXpasnMknLh/mv8IbZSlcyO3UZluc=;
 b=cedFdMihE9lI4UVoBBMi4w3e8/+ySHRCaHcTlvVEgSwZayZwcljvadM/W65CLyCY8fGTCN
 wBzr8V8NKyCHu4ugVQhVs6/hbIf9dwkWWoHmD15pDdnL3i/DVdxMcRmp02JPpzS0+67X9I
 mJM/UYenbQLOlPN5kk9UvX+jV2jnNkQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-j9KRMJjDO7mzhjXfHwXVPw-1; Tue, 09 Nov 2021 12:57:17 -0500
X-MC-Unique: j9KRMJjDO7mzhjXfHwXVPw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 447E119057A5
 for <qemu-devel@nongnu.org>; Tue,  9 Nov 2021 17:57:16 +0000 (UTC)
Received: from [10.39.194.213] (unknown [10.39.194.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F632226E9;
 Tue,  9 Nov 2021 17:57:15 +0000 (UTC)
Message-ID: <8918a268-9fe7-fc7e-3c7a-066a4b028b9b@redhat.com>
Date: Tue, 9 Nov 2021 18:57:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] target/i386: sgx: mark device not user creatable
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211109175021.17813-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211109175021.17813-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.364, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/11/2021 18.50, Paolo Bonzini wrote:
> The device is created by the machine based on the sgx-epc property.
> It should not be created by users.
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   hw/i386/sgx-epc.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
> index 55e2217eae..e508827e78 100644
> --- a/hw/i386/sgx-epc.c
> +++ b/hw/i386/sgx-epc.c
> @@ -154,6 +154,7 @@ static void sgx_epc_class_init(ObjectClass *oc, void *data)
>       dc->realize = sgx_epc_realize;
>       dc->unrealize = sgx_epc_unrealize;
>       dc->desc = "SGX EPC section";
> +    dc->user_creatable = false;
>       device_class_set_props(dc, sgx_epc_properties);
>   
>       mdc->get_addr = sgx_epc_md_get_addr;
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


