Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AB446B612
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 09:35:04 +0100 (CET)
Received: from localhost ([::1]:35160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muVwF-0003y7-QD
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 03:35:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muVvF-0002at-Tt
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 03:34:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muVvD-0005TR-KO
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 03:34:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638866036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z5CEQiZvPLnuiaZkvSAftty3qCXlgzd5/XY4vfL7viw=;
 b=IYp0v117MF6WFZGnmIdEiDN74t8ZWwDxgIt2DRl0bMXCj3o5/zswsdXRt2dnSLo5zZRcUO
 d7fhgbvSYrB4EuHSEerhGn6hhSb29xKK7xHhulrbBR25i7yGISv8smuOBNGoBnOaAOrP2P
 zY5eXeA3jrYlKtnpB+skKD7pEvsB1Ow=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-1JhPaKKvOe6Q3f6TtB-yIg-1; Tue, 07 Dec 2021 03:33:55 -0500
X-MC-Unique: 1JhPaKKvOe6Q3f6TtB-yIg-1
Received: by mail-wm1-f69.google.com with SMTP id
 m14-20020a05600c3b0e00b0033308dcc933so1041311wms.7
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 00:33:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z5CEQiZvPLnuiaZkvSAftty3qCXlgzd5/XY4vfL7viw=;
 b=3U+AxaEu3UD2iTKg/9yjfEEqYLI96+NDXhwS9Quw+lSEZAn7zu9yXjsMUZEgZ/f8Ha
 DIn9+g8F9rLC5k+w0isU9Ueh5gG7/89g+ctKaeiULpcuLN/IY7QPJgWz4W0tlyzDhf7k
 vq4W5fhuvBgbI2Vszjb9sST+q3DmkdqaHQdHSLEO0MA+sZ7sRvi2ozXIEsuUXYR7yKQr
 /Vf2PMMWxBD8RsHW7BcldKru/8EhdMR3aRkcrIVQKoaRpB7P/yR3D+x18gRYJWQqkvzi
 Gv2oKjI1hOryRB+PYSphf0r+wzbBzKYd9z25bm3+lFxFESv63XWs1OUYiXLIEt4qIQdx
 Aeyg==
X-Gm-Message-State: AOAM530PYiwbW4uuPCfUySKU7AB+TBoJZ0viYFlLkGx/3aZ647LaoM/5
 UzhbxKAAImCWMUcjKU3KoQHqyXqg/bCkM/E4KlQD9ZjTyCvIUVoZPLiLO/YU5fFZ+IpKsEMrNny
 Xjgo465uVgln8A10=
X-Received: by 2002:a05:600c:510d:: with SMTP id
 o13mr5153309wms.104.1638866033899; 
 Tue, 07 Dec 2021 00:33:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1eDDx0gFIac8XDVqP0Orn002/36dpFrI8xMmKqf9H67IoYnwgnY3OLF6RI8cdG5V3V9CADg==
X-Received: by 2002:a05:600c:510d:: with SMTP id
 o13mr5153289wms.104.1638866033710; 
 Tue, 07 Dec 2021 00:33:53 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id h15sm2074072wmq.32.2021.12.07.00.33.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 00:33:53 -0800 (PST)
Message-ID: <99a0a6fb-f8c7-a882-f8cd-f7a56d4f2a30@redhat.com>
Date: Tue, 7 Dec 2021 09:33:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 4/6] tests/libqtest: update virtio-net failover test
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20211206222040.3872253-1-lvivier@redhat.com>
 <20211206222040.3872253-5-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211206222040.3872253-5-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/12/2021 23.20, Laurent Vivier wrote:
> Update the migration test to check we correctly wait the end
> of the card unplug before doing the migration.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   tests/qtest/virtio-net-failover.c | 34 +++++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
> 
> diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
> index f8f5fbb3c7fe..c88f8ddec39a 100644
> --- a/tests/qtest/virtio-net-failover.c
> +++ b/tests/qtest/virtio-net-failover.c
> @@ -560,6 +560,40 @@ static void test_migrate_out(gconstpointer opaque)
>   
>       qobject_unref(resp);
>   
> +    /* wait the end of the migration setup phase */
> +    while (true) {
> +        ret = migrate_status(qts);
> +
> +        status = qdict_get_str(ret, "status");
> +        if (strcmp(status, "wait-unplug") == 0) {
> +            break;
> +        }
> +
> +        /* The migration must not start if the card is not ejected */
> +        g_assert_cmpstr(status, !=, "active");
> +        g_assert_cmpstr(status, !=, "completed");
> +        g_assert_cmpstr(status, !=, "failed");
> +        g_assert_cmpstr(status, !=, "cancelling");
> +        g_assert_cmpstr(status, !=, "cancelled");
> +
> +        qobject_unref(ret);
> +    }
> +    qobject_unref(ret);
> +
> +    if (g_test_slow()) {
> +        /* check we stay in wait-unplug while the card is not ejected */
> +        int i;
> +
> +        for (i = 0; i < 10; i++) {

10 seconds is quite long already, even for slow mode... I wouldn't expect 
any difference after 2 or 3 seconds anymore anyway, so maybe just wait for 5 
seconds?

> +            sleep(1);
> +            ret = migrate_status(qts);
> +            status = qdict_get_str(ret, "status");
> +            g_assert_cmpstr(status, ==, "wait-unplug");
> +            qobject_unref(ret);
> +        }
> +    }
> +
> +    /* OS unplugs the cards, QEMU can move from wait-unplug state */
>       qtest_outl(qts, ACPI_PCIHP_ADDR_ICH9 + PCI_EJ_BASE, 1);
>   
>       while (true) {
> 

Acked-by: Thomas Huth <thuth@redhat.com>


