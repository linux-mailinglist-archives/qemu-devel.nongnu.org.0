Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B985EC08D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 13:07:11 +0200 (CEST)
Received: from localhost ([::1]:47232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od8Qg-0002Hn-NQ
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 07:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1od8Hf-0004BF-Gm
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:57:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1od8Hb-0002pl-KX
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:57:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664276266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CzAeSsm+3ZW0tKut8mGrHiuyeyG8X8+vcnz2bCF7Mng=;
 b=WSVf1Q7p+e35e/ZJMmrwrv4a7j01trgHHqL6gZV1vi/roLKyUjTP8zGcRdSVjOm4tsRFJC
 dqhXAsuBymMNTV+E8tSUCib+oib+Xrndpbv0T3Bufq+o2wL2G+jULTaAquVrXByMwRI9N+
 zv0a8UH4iLCcReMTA3fFt3PVViMzXZ4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-41-t4Xa-G06M8KKKDFv05Yu8A-1; Tue, 27 Sep 2022 06:57:44 -0400
X-MC-Unique: t4Xa-G06M8KKKDFv05Yu8A-1
Received: by mail-wm1-f72.google.com with SMTP id
 84-20020a1c0257000000b003b4be28d7e3so8461603wmc.0
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 03:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=CzAeSsm+3ZW0tKut8mGrHiuyeyG8X8+vcnz2bCF7Mng=;
 b=JBQRmJo7rF5en30QMhP0e7Jmwv/aLN5cD+nrtZ5+oKCUb1aw5vUyD85PIF3ltyLHOE
 GG7HS1tVPQk334CCwc+0TutQGvIX2PLE2HtiFRH7ZFx45dtB+cnLklsjCd1Ql5WHOErH
 89nNtRS+OB1/POBAOrM7UA1cUwi24zPtwsA8JmlGMDkDLI9MQZ4zmKbhYa2Zt2tzb8bg
 rNMe9tY8DQPkCZQ6Mknu6llBl6X13ZzQ3lLm67gFKC98EWB87xf1zUZxS9289QogDPII
 X55KZjq2J4HZSRHcSdV5iore9rOVParxfSYMO96pP6NPPtUe7nid8p4vMmRtraUbxGLD
 hAtA==
X-Gm-Message-State: ACrzQf0DUFpBj7xzk0z8fTU8xVgiW+vj/MCQO3KO+QA0n2tj2rCDXWx3
 7U8tmlxiMthzHK+jcoxnMbVV6HIZY3MWXllog1M7V+qhlFBK3yYx95i+5uAdre6Iq+6fuwuOIET
 8Q4+6lPieyUM+r0A=
X-Received: by 2002:a05:600c:1d89:b0:3b4:7554:defb with SMTP id
 p9-20020a05600c1d8900b003b47554defbmr2026605wms.21.1664276263548; 
 Tue, 27 Sep 2022 03:57:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4DjBmTHSTB5lVVlPUlYjfGHZ/2QHiewiCIDuM2+HgSQFLSL9oflf/Q53dZhMZat3/srPKxDQ==
X-Received: by 2002:a05:600c:1d89:b0:3b4:7554:defb with SMTP id
 p9-20020a05600c1d8900b003b47554defbmr2026586wms.21.1664276263343; 
 Tue, 27 Sep 2022 03:57:43 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-30.web.vodafone.de.
 [109.43.179.30]) by smtp.gmail.com with ESMTPSA id
 l3-20020adffe83000000b0022abc6ded45sm1087493wrr.13.2022.09.27.03.57.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 03:57:42 -0700 (PDT)
Message-ID: <55f0efff-2256-5755-afad-351b47a0d003@redhat.com>
Date: Tue, 27 Sep 2022 12:57:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Michael Labiuk <michael.labiuk@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com
References: <20220920104842.605530-1-michael.labiuk@virtuozzo.com>
 <20220920104842.605530-4-michael.labiuk@virtuozzo.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v4 3/7] tests/x86: Add 'q35' machine type to ivshmem-test
In-Reply-To: <20220920104842.605530-4-michael.labiuk@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 20/09/2022 12.48, Michael Labiuk wrote:
> Configure pci bridge setting to test ivshmem on 'q35'.
> 
> Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
> ---
>   tests/qtest/ivshmem-test.c | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/tests/qtest/ivshmem-test.c b/tests/qtest/ivshmem-test.c
> index 9611d05eb5..0f9755abc6 100644
> --- a/tests/qtest/ivshmem-test.c
> +++ b/tests/qtest/ivshmem-test.c
> @@ -378,6 +378,32 @@ static void test_ivshmem_server(void)
>       close(thread.pipe[0]);
>   }
>   
> +static void device_del(QTestState *qtest, const char *id)
> +{
> +    QDict *resp;
> +
> +    resp = qtest_qmp(qtest,
> +                     "{'execute': 'device_del',"
> +                     " 'arguments': { 'id': %s } }", id);
> +
> +    g_assert(qdict_haskey(resp, "return"));
> +    qobject_unref(resp);
> +}

Uh, this made me realize that we have lots of similar, yet quite different 
device_del functions around in the qtests... could we maybe unify them a 
little bit?

What about if you add your function above as qtest_qmp_device_del_nowait() 
in libqtest.c (in a separate patch) and change qtest_qmp_device_del() to 
call your new function before doing the qtest_qmp_eventwait() ?
A similar change could then be done to qpci_unplug_acpi_device_test() in 
tests/qtest/libqos/pci-pc.c and to device_del() in 
tests/qtest/drive_del-test.c ... ?

> +static void test_ivshmem_hotplug_q35(void)
> +{
> +    QTestState *qts = qtest_init("-object memory-backend-ram,size=1M,id=mb1 "
> +                                 "-device pcie-root-port,id=p1 "
> +                                 "-device pcie-pci-bridge,bus=p1,id=b1 "
> +                                 "-machine q35");
> +
> +    qtest_qmp_device_add(qts, "ivshmem-plain", "iv1",
> +                         "{'memdev': 'mb1', 'bus': 'b1'}");
> +    device_del(qts, "iv1");
> +
> +    qtest_quit(qts);
> +}
> +
>   #define PCI_SLOT_HP             0x06
>   
>   static void test_ivshmem_hotplug(void)
> @@ -469,6 +495,7 @@ int main(int argc, char **argv)
>   {
>       int ret, fd;
>       gchar dir[] = "/tmp/ivshmem-test.XXXXXX";
> +    const char *arch = qtest_get_arch();
>   
>       g_test_init(&argc, &argv, NULL);
>   
> @@ -494,6 +521,9 @@ int main(int argc, char **argv)
>           qtest_add_func("/ivshmem/pair", test_ivshmem_pair);
>           qtest_add_func("/ivshmem/server", test_ivshmem_server);
>       }
> +    if (!strcmp(arch, "x86_64")) {

I'd suggest to use qtest_has_machine("q35") instead.

> +        qtest_add_func("/ivshmem/hotplug-q35", test_ivshmem_hotplug_q35);
> +    }
>   
>   out:
>       ret = g_test_run();

  Thomas


