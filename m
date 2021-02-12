Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A90E5319FAE
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 14:20:09 +0100 (CET)
Received: from localhost ([::1]:51042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAYMi-0004cm-PU
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 08:20:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lAYKv-00049d-Vz
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 08:18:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lAYKs-0007CG-9Q
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 08:18:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613135891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GU+izrbN1d5OEoc/eiabov5k/VISlRWbct1lr1mGD/E=;
 b=VZ+1Mx7wGB5By+x+kggie0W/Wvwe5NYi84E3YdaNBMmzZkQfhrM5HZ/Yj8qqbxCJs76Yg8
 aC0l6wb8leTyksQ6YShqtHpDYgd6Kvs9a7OJOQDu9CzyRJOHwHiuchtHvjOCrlhBs0pmEv
 t4qpX5KAJq6DyhfE73DgJY3By4DVLV0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-2T4DzT55MY-nROUBsLfzZA-1; Fri, 12 Feb 2021 08:18:10 -0500
X-MC-Unique: 2T4DzT55MY-nROUBsLfzZA-1
Received: by mail-wm1-f71.google.com with SMTP id x14so416238wmi.0
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 05:18:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GU+izrbN1d5OEoc/eiabov5k/VISlRWbct1lr1mGD/E=;
 b=ZzvAtSOaa7wRFzaJAxP22zwZccVLJNewvJcrYVplHEmW1G7inyUzYwa+22oMmNSLZ7
 qrjYcNGKld5ypnM8WgI/CqxX2v5qhzh03/J7VBR2BwcbX3DIxpLFi3GY/BpEeK4MWqHv
 uDWOrr4x/bJeydMA6vrYUuj7OjxcENsj9cxD8cYfevjtPOZ196bq5GW2r2xSkz14hOtp
 PJfYODMeh29YFRgPXsitR/d+D9IsG8VM/LDzmdqrsYYi9Ltkz3l2dVd8h483aIKUgeZ8
 JyEXNfGwvzgIpW/ImFY4FVRKP4iT1n9PEQLyeWqgeCdNUcGm81q37VMrCoBg+D6+t4T2
 QdtA==
X-Gm-Message-State: AOAM532zBETJlJnIjg5QO9ekQK8ZTNDrFxVN5DL/1aI7iXFpbODmZuWd
 8GyDOBy7m3HkVatorC5N7nN0dee4PC1bjvv+X4Qpoi6upK48k/JaVQ+wiQlhiIhHrSE9yUyMwpA
 TiMDmMzjBnb0SDorqtT493L78myrshcPq8oazgL+1OJy8ZnWnVF3j9EpEjcM9I9f6
X-Received: by 2002:adf:e5c6:: with SMTP id a6mr3353120wrn.400.1613135888617; 
 Fri, 12 Feb 2021 05:18:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrwISC8xBlV/FIk1T0vdekQ48QcLyW6KRV2+WJKqJ6MkBXsq5k3oIeVVLBtRyqVtbXIj1D1w==
X-Received: by 2002:adf:e5c6:: with SMTP id a6mr3353095wrn.400.1613135888391; 
 Fri, 12 Feb 2021 05:18:08 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z8sm10002918wrr.55.2021.02.12.05.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 05:18:07 -0800 (PST)
Subject: Re: [PATCH] tests/qtest/boot-sector: Check that the guest did not
 panic
To: Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>
References: <20210212113141.854871-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <32e75366-22fb-823e-2778-ad8fec102060@redhat.com>
Date: Fri, 12 Feb 2021 14:18:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210212113141.854871-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/21 12:31 PM, Thomas Huth wrote:
> The s390-ccw bios code panics if it can not boot successfully. In
> this case, it does not make sense that we wait the full 600 seconds
> for the boot sector test to finish and can signal the failure
> immediately, thus let's check the status of the guest with the
> "query-status" QMP command here, too.
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/qtest/boot-sector.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tests/qtest/boot-sector.c b/tests/qtest/boot-sector.c
> index 24df5c4734..ea8f264661 100644
> --- a/tests/qtest/boot-sector.c
> +++ b/tests/qtest/boot-sector.c
> @@ -138,6 +138,7 @@ void boot_sector_test(QTestState *qts)
>      uint8_t signature_low;
>      uint8_t signature_high;
>      uint16_t signature;
> +    QDict *qrsp, *qret;
>      int i;
>  
>      /* Wait at most 600 seconds (test is slow with TCI and --enable-debug) */
> @@ -155,6 +156,14 @@ void boot_sector_test(QTestState *qts)
>          if (signature == SIGNATURE) {
>              break;
>          }
> +
> +        /* check that guest is still in "running" state and did not panic */
> +        qrsp = qtest_qmp(qts, "{ 'execute': 'query-status' }");
> +        qret = qdict_get_qdict(qrsp, "return");
> +        g_assert_nonnull(qret);
> +        g_assert_cmpstr(qdict_get_try_str(qret, "status"), ==, "running");

Interesting idea. Does it make sense to have a similar (optional?) check
done in QEMUMachine? This could benefit integration tests, quicker exit
on failure.

> +        qobject_unref(qrsp);
> +
>          g_usleep(TEST_DELAY);
>      }
>  
> 


