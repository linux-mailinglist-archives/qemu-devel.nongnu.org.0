Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7821149F43C
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 08:18:41 +0100 (CET)
Received: from localhost ([::1]:46758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDLWq-0006a9-HQ
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 02:18:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nDLIg-0002d0-9I
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 02:04:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nDLIe-0003Ms-8a
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 02:04:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643353439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RyPGh3mRmqePoPwxSLGOf5yiz1f2qJnlhAikREKN0RM=;
 b=b3iA0zd5cFaxGrBzMoChRgscCKYnmlEuAKG9c4JmFQP31lScSXWuCF+tYtwhq8VngWdmq1
 N+AanPemrc1cEOtjhAlpPb0KkKif/39bWqk1YO8T3w3t7g+MXYBQSRIUqK61AHBfZDjE3j
 5hvYArVYK/N2D2rKdvCDL+QNiPaIgWU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-SZ4MAM7_MG2Dd1PBoWl-Mg-1; Fri, 28 Jan 2022 02:03:58 -0500
X-MC-Unique: SZ4MAM7_MG2Dd1PBoWl-Mg-1
Received: by mail-wr1-f69.google.com with SMTP id
 c10-20020adfa30a000000b001d79c73b64bso1920268wrb.1
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 23:03:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RyPGh3mRmqePoPwxSLGOf5yiz1f2qJnlhAikREKN0RM=;
 b=py2aPH4p3g55g2QthSyZ5SzBmJj2DrB7p8sagoD3g4FeWnoaLDrxMSh5Q33gzDgRhn
 k9xDCiTq5zl2LAT3TdH3/Zsih+TM7TmNWb8nKXi2Yv+L0lmrjfN33nt7Pn0quRqfVV5P
 ObjNhZAeJ6VR762CzD65vzh5gFyek3nRUJNWrgzD6glaq6cB5V+lTgUFYgAZxJBoK1w9
 9QL8SB95JvH/b1PRPQNzTvO6rLleeYg6Vwn8bl57AxHrM6qMnSue1R4XVI67sGt+7Xg7
 lk86zoaAyehvOpAZQZHe5k8K5t9y799AeCjHK8f3u1r/sV5OKGvwRrT9uS5UHfijYAzC
 Ts3A==
X-Gm-Message-State: AOAM5307V81h7i3JBeLXNN1UVVXrJVDFVxWiNmmpj4pCjlQZJiq/EDzL
 pfN3UkVDK2KtHTc0Z03dsaFTs8XvtP5KlC8OcREUMIoMEcS78nsUdlFrn/G7rsOrO+1CfDQtwhe
 yFK+pU/D4ArFX+1Y=
X-Received: by 2002:a1c:1f0c:: with SMTP id f12mr6118110wmf.44.1643353436838; 
 Thu, 27 Jan 2022 23:03:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/1V2zHHX98XTPPPQaS4d2Jgk0FUVPh48aMUJMDzOxj1TDEpfnRBB3zOpy0NwFXh4bBE89tQ==
X-Received: by 2002:a1c:1f0c:: with SMTP id f12mr6118100wmf.44.1643353436648; 
 Thu, 27 Jan 2022 23:03:56 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id i9sm4789471wry.32.2022.01.27.23.03.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 23:03:56 -0800 (PST)
Message-ID: <94e2290b-e31b-15d0-4f44-3c33ffbbfcf1@redhat.com>
Date: Fri, 28 Jan 2022 08:03:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 11/11] 9p: darwin: adjust assumption on virtio-9p-test
To: Will Cohen <wwcohen@gmail.com>, qemu-devel@nongnu.org
References: <20220128005611.87185-1-wwcohen@gmail.com>
 <20220128005611.87185-12-wwcohen@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220128005611.87185-12-wwcohen@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Fabian Franz <github@fabian-franz.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


-EMISSINGPATCHDESCRIPTION

Please avoid sending patches without patch description. E.g. explain here 
*why* this needs to be adjusted.

  Thanks,
   Thomas


On 28/01/2022 01.56, Will Cohen wrote:
> Signed-off-by: Fabian Franz <github@fabian-franz.de>
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---
>   tests/qtest/virtio-9p-test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> index 41fed41de1..6bcf89f0f8 100644
> --- a/tests/qtest/virtio-9p-test.c
> +++ b/tests/qtest/virtio-9p-test.c
> @@ -1270,7 +1270,7 @@ static void fs_unlinkat_dir(void *obj, void *data, QGuestAllocator *t_alloc)
>       /* ... and is actually a directory */
>       g_assert((st.st_mode & S_IFMT) == S_IFDIR);
>   
> -    do_unlinkat(v9p, "/", "02", AT_REMOVEDIR);
> +    do_unlinkat(v9p, "/", "02", P9_DOTL_AT_REMOVEDIR);
>       /* directory should be gone now */
>       g_assert(stat(new_dir, &st) != 0);
>   


