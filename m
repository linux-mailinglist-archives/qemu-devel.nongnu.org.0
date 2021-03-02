Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB44329693
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 08:04:54 +0100 (CET)
Received: from localhost ([::1]:41706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGz5R-0007Vn-QW
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 02:04:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGz1H-0004su-Ie
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 02:00:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGz1C-0008OC-I8
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 02:00:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614668430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h5ePk+D7UHi06HVRD9vH0xS2azwIMe1MeA2ZaP93H70=;
 b=VUOedDV1zp+6a5JBSoTvz6KzwirbOxbphtp7Tq6RQwbT/EKtSdPhkBVJpBGrr88x9OWZIv
 C76/p/6ogw7DqbkUsEPn8gKg+CIiqNUj3eb3Z/3j5z8A8tCi5ufQYWHm+i0LZjg8WZWojH
 5mpFi4RTF/KPRAVv0qj8tLklv7Lcwss=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-UiZ-QIJ_N7K1lQIhbLFZiQ-1; Tue, 02 Mar 2021 02:00:26 -0500
X-MC-Unique: UiZ-QIJ_N7K1lQIhbLFZiQ-1
Received: by mail-ej1-f72.google.com with SMTP id hx26so8028387ejc.3
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 23:00:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h5ePk+D7UHi06HVRD9vH0xS2azwIMe1MeA2ZaP93H70=;
 b=AHkix+JxStp7AvulkPxhGRMjW+ITbRjBqu1KbbQRxpQ9EyVA8kd6oRfmEj9O5Xsu7E
 +9XIk+Lao3HLWnXBCp0SxWm6fiAljHuu1SM1AnE1NeeZfG6C5fomB3FfNzSk6shD/KbX
 s/zDd4W/57IUnaMxTJ/CdOymGnncF0wiS9sDorrT/fynZ737XTT679q6FRNIsVCmI6II
 36s/URr9DLYDTAK9cguwixxusxpq3JCbf5na4XQtKqf9vPLmuIR5DassUMTFuifqlvVX
 xSzNmf/IlbBf9x13OXx4WxX/6LPbPKORNT5zDYH2AzjvYG+qqc1oiyG6+mpT5Oz4W1uA
 t32Q==
X-Gm-Message-State: AOAM532fd8y2VpmluHeYjOxWMqzkIkejUz+4M3kz+DumES1I7yz2GVh9
 Cws9oMpsatU1sutJ6EqKus7OkHfz6GgM9u291wcJ9FhohPEMg+PFcQz2zDL2tQEeHhxOq4rPnHT
 tyL23SgGcJs3ZWf0=
X-Received: by 2002:a17:906:3648:: with SMTP id
 r8mr2947144ejb.58.1614668425264; 
 Mon, 01 Mar 2021 23:00:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9iCTcYa+BTihHfdp+mW+974R1I4GqqmftYN7V85pLV4y/eHVwdQV18Q8bW36MLIIUrneGKg==
X-Received: by 2002:a17:906:3648:: with SMTP id
 r8mr2947128ejb.58.1614668425164; 
 Mon, 01 Mar 2021 23:00:25 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b17sm16572486ejj.9.2021.03.01.23.00.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 23:00:24 -0800 (PST)
Subject: Re: [PATCH V3 03/10] dp8393x: switch to use qemu_receive_packet() for
 loopback packet
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <20210302055500.51954-1-jasowang@redhat.com>
 <20210302055500.51954-4-jasowang@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c3fc759b-99a3-7348-7a2a-c71b0031e93c@redhat.com>
Date: Tue, 2 Mar 2021 08:00:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302055500.51954-4-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: alxndr@bu.edu, qemu-security@nongnu.org, ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 6:54 AM, Jason Wang wrote:
> This patch switches to use qemu_receive_packet() which can detect
> reentrancy and return early.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/net/dp8393x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


