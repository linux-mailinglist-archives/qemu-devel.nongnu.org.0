Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AD95FB265
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 14:26:45 +0200 (CEST)
Received: from localhost ([::1]:51940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiELL-0004m4-MV
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 08:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiCzj-0005W3-Jd
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:00:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiCzg-00033S-T3
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:00:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665486015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v1RLzGM9DCGl8KoTWg3f8sCJHZxHMBl1oKrmzDc1dag=;
 b=TAUfVY+QDayu1QN7+Bme+VX4HmEma/ZGrgHIu1FSMbZnSPdmx/TpEem8Brbg7r3fgd7o4G
 UgTMM00ThpjaVbe3NMtGqcWQjtMNZ+zlf2zG3y0WIJDj6uc4oBDZvAeE3IgmgYytK2Xoze
 xygjM2K5tYLXUaXvR9mZcsh1qo8AMf4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-201-ZQLL99psMyaK6IB1icU8xg-1; Tue, 11 Oct 2022 06:59:55 -0400
X-MC-Unique: ZQLL99psMyaK6IB1icU8xg-1
Received: by mail-wr1-f71.google.com with SMTP id
 h4-20020adfa4c4000000b0022ec3966c3aso2734544wrb.6
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v1RLzGM9DCGl8KoTWg3f8sCJHZxHMBl1oKrmzDc1dag=;
 b=1Rf4wkCxJzEa/t/eEwZLdArfoVb4Z4b1/lmJUQPVBEfbxljQgD0QaQB//fvs3R8MUI
 Nvl5OBJUO5CxcvbFE1+Zr7GR4OXSpXNEGRDKvBrA7mADD6q7aGCqUS8I5VL/v1gTPtEU
 r3QjPD1+QkVCuJtjkswMWvwT9e+urykWzok1Ydywo9/1C6vQ81fEeXiI9pEBuBkdkhp1
 v4cufzE8JWQUVVFsprEUs+P43FnpKjUvvc0RElRyF9z0cql4ugYITwZsRY6gf1cf3N3k
 D8F/oPGq5dgZZvTtOLj4k+06Z/YJ3b9/USVP2MM0gnIGqE0MjzCBWScZIQUElZu9Tl3S
 /LpA==
X-Gm-Message-State: ACrzQf0FCXjbP9DPdajl0ndX5mmMBbokC4IwmqX33wl7xLSwuTz2+2UD
 sc62A7O6gk4T7gweKk7VtZHEF2Rzcqns2rHZ770ImLRqS34wcBnAPgWF98IymQjM6K9XBYXxMDw
 wOKAAtNteec6Ga48=
X-Received: by 2002:a05:600c:6003:b0:3b5:aef:d8d7 with SMTP id
 az3-20020a05600c600300b003b50aefd8d7mr15938214wmb.50.1665485990515; 
 Tue, 11 Oct 2022 03:59:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6iPygyh4NRrj/dXyw6+F6x4c+qtlqsqJAm8AMCgwlqJvyBi1fhUCS1TlRhRO3IbSPR5AFUrQ==
X-Received: by 2002:a05:600c:6003:b0:3b5:aef:d8d7 with SMTP id
 az3-20020a05600c600300b003b50aefd8d7mr15938197wmb.50.1665485990291; 
 Tue, 11 Oct 2022 03:59:50 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-11.web.vodafone.de.
 [109.43.176.11]) by smtp.gmail.com with ESMTPSA id
 n11-20020a05600c3b8b00b003a540fef440sm20478970wms.1.2022.10.11.03.59.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 03:59:49 -0700 (PDT)
Message-ID: <63cddf91-606d-cdb1-e569-6b450443c62f@redhat.com>
Date: Tue, 11 Oct 2022 12:59:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 1/9] tests/x86: add helper qtest_qmp_device_del_send()
Content-Language: en-US
To: Michael Labiuk <michael.labiuk@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com
References: <20220929223547.1429580-1-michael.labiuk@virtuozzo.com>
 <20220929223547.1429580-2-michael.labiuk@virtuozzo.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220929223547.1429580-2-michael.labiuk@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.934, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 30/09/2022 00.35, Michael Labiuk via wrote:
> Move sending 'device_del' command to separate function.
> Function can be used in case of addition action is needed to start
> actual removing device after sending command.
> 
> Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
> ---
>   tests/qtest/device-plug-test.c | 15 ++-------------
>   tests/qtest/drive_del-test.c   |  6 +-----
>   tests/qtest/libqos/pci-pc.c    |  8 +-------
>   tests/qtest/libqtest.c         | 16 ++++++++++------
>   tests/qtest/libqtest.h         | 10 ++++++++++
>   5 files changed, 24 insertions(+), 31 deletions(-)
[...]
> diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
> index 3abc75964d..29ea9c697d 100644
> --- a/tests/qtest/libqtest.h
> +++ b/tests/qtest/libqtest.h
> @@ -761,12 +761,22 @@ void qtest_qmp_device_add(QTestState *qts, const char *driver, const char *id,
>   void qtest_qmp_add_client(QTestState *qts, const char *protocol, int fd);
>   #endif /* _WIN32 */
>   
> +/**
> + * qtest_qmp_device_del_send:
> + * @qts: QTestState instance to operate on
> + * @id: Identification string
> + *
> + * Generic hot-unplugging test via the device_del QMP command.
> + */
> +void qtest_qmp_device_del_send(QTestState *qts, const char *id);
> +
>   /**
>    * qtest_qmp_device_del:
>    * @qts: QTestState instance to operate on
>    * @id: Identification string
>    *
>    * Generic hot-unplugging test via the device_del QMP command.
> + * Waiting for command comlition event.

Typo: "comlition" should be "completion", I guess?

Apart from that, patch looks fine, so with that fixed:
Reviewed-by: Thomas Huth <thuth@redhat.com>


