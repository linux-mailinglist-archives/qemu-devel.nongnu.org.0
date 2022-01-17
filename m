Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7633490927
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 14:07:25 +0100 (CET)
Received: from localhost ([::1]:46708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9RjI-0004ao-8F
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 08:07:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9RBx-0000OX-St
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 07:33:00 -0500
Received: from [2a00:1450:4864:20::32b] (port=39719
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9RBb-0000Ig-NU
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 07:32:51 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 d18-20020a05600c251200b0034974323cfaso23971963wma.4
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 04:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hLuxJCNBsQa8zQWxGVgKvZBec57S5JksLr7FFGldYh8=;
 b=NfDKP2irVS6FGHYsYvxUtp45lKYlZRuwp+oiAxaJy0EkfmKiRnfqCDqM6OneZxxNJu
 SINS0PyFSwtvr194/v8K3IOVELq7ZoA6r/EO3BBSxGK6mRfwdtWPAvjXlYvuuoUHktrx
 Gz1DWk/0ce28y6ZVQV9KxTKNPIAIRfKlZZ9Cc2ZSW0/8ufluFQgzG75VInUE75Ryrfib
 QTLGIFKvm90GGufq7YrwuCtKYgY67GQrgiA9peFzMl6/u86pvZ915puLaYwianY5u7HB
 ElcdfYt1ugWiznbRBkhcSNwvD24Ea6GwIa7GN/VtYvpkvOgSfO/S7qwvMnPv5mKMMryL
 0L7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hLuxJCNBsQa8zQWxGVgKvZBec57S5JksLr7FFGldYh8=;
 b=kHwRlHssHsSu3NLY2oQ2vX7ba+xUPCv1Gixoh0cNVd1V31A4g/+NQV2WbHxhIDDsIh
 KlSKr83AbtJbsqpz84WQMz9ziFWOxQacvMLNcfvqzU/Iq342i0ZFql+0b1Y69tlUsUy3
 uqUFVQuhfAgxD27q/TwQkUeVonJ3NiAl59hpJVhU8Dwy3vkxm/eIAYDdAjSxv14ADGeX
 y//noPNdMNsZV8wuKvu+01EfdAzEgD5lefS0AY2X6fpqYp71e6HNdkxRiykhvEdeoogZ
 D0ycPLJpW3ldUw/4Sip1a9F8k9bmFhsiFfkO106aEhWU1w3PKZfEFB/3N3xgSSn277dV
 WqPg==
X-Gm-Message-State: AOAM533GmDQKd/jUCSzmitzJeEED1E/LbQRh4iWqi/OwbW+uJKskB+YK
 nO94+IJQEVwV4g+h4jVM0gw=
X-Google-Smtp-Source: ABdhPJwzfAxj+2vSsCVHB2wTHyq/2DBUuFPd0OgmO84+pg0saL3anzgk2jh5nlguLuenkpI69JPnwg==
X-Received: by 2002:a5d:560e:: with SMTP id l14mr19693648wrv.619.1642422752118; 
 Mon, 17 Jan 2022 04:32:32 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id r11sm16170789wrz.78.2022.01.17.04.32.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 04:32:31 -0800 (PST)
Message-ID: <9da887d9-b2ad-82c1-e3af-1711b4a2d4ae@amsat.org>
Date: Mon, 17 Jan 2022 13:32:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 5/6] libvhost-user: prevent over-running max RAM slots
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>
Cc: "raphael.s.norwitz@gmail.com" <raphael.s.norwitz@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20220117041050.19718-1-raphael.norwitz@nutanix.com>
 <20220117041050.19718-6-raphael.norwitz@nutanix.com>
 <055d3a4e-521b-3f23-196a-40bdaeb96145@redhat.com>
In-Reply-To: <055d3a4e-521b-3f23-196a-40bdaeb96145@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/17/22 09:20, David Hildenbrand wrote:
> On 17.01.22 05:12, Raphael Norwitz wrote:
>> When VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS support was added to
>> libvhost-user, no guardrails were added to protect against QEMU
>> attempting to hot-add too many RAM slots to a VM with a libvhost-user
>> based backed attached.
>>
>> This change adds the missing error handling by introducing a check on
>> the number of RAM slots the device has available before proceeding to
>> process the VHOST_USER_ADD_MEM_REG message.
>>
>> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
>> Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
>> ---
>>  subprojects/libvhost-user/libvhost-user.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)

>> +    if (dev->nregions == VHOST_USER_MAX_RAM_SLOTS) {
>> +        close(vmsg->fds[0]);
>> +        vu_panic(dev, "failing attempt to hot add memory via "
>> +                      "VHOST_USER_ADD_MEM_REG message because the backend has "
>> +                      "no free ram slots available");
> 
> Maybe simply "VHOST_USER_ADD_MEM_REG failed because there are no free
> ram slots"
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

