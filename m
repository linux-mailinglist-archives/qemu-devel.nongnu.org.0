Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 986B0329692
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 08:03:04 +0100 (CET)
Received: from localhost ([::1]:38118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGz3f-00062i-Kl
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 02:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGz0x-0004fv-2m
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 02:00:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGz0t-0008A2-ED
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 02:00:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614668410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p9Jz7litXZWBgZF30qKB0Wsl03VQSlvwArEDcUAmPu4=;
 b=A7pja+79Z63scsNjSQ+v0pcp258AtZCGVOvBxm3BmTtU/KQD+ZnJzomH9kCGeGejglCeah
 IdXO9+3lDTKZpb7159sEWkwY9M1ilvN26AmmCL8tGZAaL4KV2xewTCjjSxwatN/xyp5T/F
 QeFqLlQew8CcMNbpGX3agXA8iqxFwoA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-f-F13FblMt6rVYRvtCSmUw-1; Tue, 02 Mar 2021 02:00:08 -0500
X-MC-Unique: f-F13FblMt6rVYRvtCSmUw-1
Received: by mail-ej1-f70.google.com with SMTP id ml13so8014016ejb.2
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 23:00:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p9Jz7litXZWBgZF30qKB0Wsl03VQSlvwArEDcUAmPu4=;
 b=izSqh7tPbmBWmy5ipdI4C4p3h5Ywlb1qgtQnLlSWMOO2pBOB/xOEesd3mIfsSLg6GI
 rxpApauDDa3VcZR388mvnc3W8NrD81PNkfOKGoPZ8rNGxlrGKHojEaDwuu6tlnuKh9L8
 UoV9UOv0/mK37O24tIO+6sJCT/YBDjAQoYNersav3KKdMm+AB7QaOGJYHkBerF7G3aw1
 1KjyRzxQLNNBn2iJWiB0z3go3nEFr+pDBGZ2+LAR6eu/hw5n52EanWVMUJh2w04YD9p3
 ND7Qm4Ka+NduD5VaPLa0YvBoAwKFnHJV8NUQ9pWCNsZVv0mINYbtVY9rDdqE4DO12552
 X9VA==
X-Gm-Message-State: AOAM532TcAbqcE1ch+Rs6oGzD+YAPB0+IagVTJv9LnCIhqgqFWnNZK9v
 a755wMo3NAweyiAXUIHCX/fYMrTyExMYwW7f0iFupd3Y9FUztfGD1NYQOZDcKVt+CX33JxLFLD9
 dPNntN7Z5j8YpOQs=
X-Received: by 2002:a17:906:ecaa:: with SMTP id
 qh10mr8886539ejb.425.1614668407763; 
 Mon, 01 Mar 2021 23:00:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFwIVTphChENnIRwm4yhoBq/c1AiVVh6pvMbCv+c3VwnJQoykAhkFxepLledIXsbehWir6/g==
X-Received: by 2002:a17:906:ecaa:: with SMTP id
 qh10mr8886513ejb.425.1614668407549; 
 Mon, 01 Mar 2021 23:00:07 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f22sm16573787eje.34.2021.03.01.23.00.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 23:00:07 -0800 (PST)
Subject: Re: [PATCH V3 10/10] lan9118: switch to use qemu_receive_packet() for
 loopback
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <20210302055500.51954-1-jasowang@redhat.com>
 <20210302055500.51954-12-jasowang@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e4954759-6803-eba3-6842-d347b20b5594@redhat.com>
Date: Tue, 2 Mar 2021 08:00:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302055500.51954-12-jasowang@redhat.com>
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
Cc: alxndr@bu.edu, qemu-security@nongnu.org, ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 6:55 AM, Jason Wang wrote:
> From: Alexander Bulekov <alxndr@bu.edu>
> 
> This patch switches to use qemu_receive_packet() which can detect
> reentrancy and return early.
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  hw/net/lan9118.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


