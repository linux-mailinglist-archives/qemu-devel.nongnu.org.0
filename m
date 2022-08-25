Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D865A0F99
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 13:51:38 +0200 (CEST)
Received: from localhost ([::1]:33922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRBOb-0001rq-7T
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 07:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRBDl-0001LL-Tu
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 07:40:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRBDi-0006eb-I1
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 07:40:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661427621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ag6uzflRluc+dP3JIR+k7ZerJ6Nb5ElcjpGAkWltDW4=;
 b=Yx1JWWqcat8+miLbuqN5HPVwT1oVSnpnWjRIm5AJ5SdzOPq56Wthok9UgvN+Dok1X12taY
 j8vRZWhoj8X4J7qbSW3qaYSodzCb3oK8zw1QJmv8OFop8YnqSHns/ogOAMV3e2vFAqT8UG
 bgxmj3UHItx/WfmzV0z92KiiFVUoygw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-66-TSag08QXMaKnapyQKjVhew-1; Thu, 25 Aug 2022 07:40:19 -0400
X-MC-Unique: TSag08QXMaKnapyQKjVhew-1
Received: by mail-wm1-f69.google.com with SMTP id
 b4-20020a05600c4e0400b003a5a96f1756so2376374wmq.0
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 04:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Ag6uzflRluc+dP3JIR+k7ZerJ6Nb5ElcjpGAkWltDW4=;
 b=g/5yoRnTxq0OC94y13/lcxf6PQypHxiwoFF+S8eRjN2qtGsGcAlDSM0YxrTpiLVASL
 PgyBkibaKNd6o7JFWEd8hHSt1VgMHHl1brKK4Z9kyYNvQsn74eX/TIBaOlA+98Z4kDyI
 Ey/eXo4JTP9sIZ78dW5jZu2wHsIJyVZ8ZfjVSKK7GfOgXqdXb4zxGrWhBMlSQC7sYSef
 FCc6WykMbyO6a42WX4+WfHPckCBxZbJ4aa1MCf86GD2G3UxW+Cz15sQsMq92A3EP1mOi
 NuFAoHuSMDltMzBLGt2ZK0feSjq+cDDum484Gv/4Tt3iTvYZk4d3YMSEGVCYOUCNObOB
 A7uA==
X-Gm-Message-State: ACgBeo0TcpGzshL1wzKq9CKVk/YuMvzF7528i3TDj0W3TqGG/06eCdsV
 fKr9AvjFZneuz/lONFO8txb2+z4yBwbA6Yol9+QyPb7PylVR26I3WMXxd1AFsD6L3B7huqZOKtL
 69P58vCRvJ22JBGQ=
X-Received: by 2002:adf:ed50:0:b0:225:4c37:5346 with SMTP id
 u16-20020adfed50000000b002254c375346mr2048325wro.207.1661427618906; 
 Thu, 25 Aug 2022 04:40:18 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4knPnZW18paFFSdRhaIqPh2zOU2/o4mVYHII+F2Oct+7doezaYaR8GLk2n4350mZBPTjdodw==
X-Received: by 2002:adf:ed50:0:b0:225:4c37:5346 with SMTP id
 u16-20020adfed50000000b002254c375346mr2048311wro.207.1661427618676; 
 Thu, 25 Aug 2022 04:40:18 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-177.web.vodafone.de.
 [109.43.177.177]) by smtp.gmail.com with ESMTPSA id
 y11-20020a5d470b000000b0022584ab85a8sm785203wrq.17.2022.08.25.04.40.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 04:40:18 -0700 (PDT)
Message-ID: <92862ee8-56b8-2a09-2e73-1b0e6b7fce20@redhat.com>
Date: Thu, 25 Aug 2022 13:40:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 20/51] tests/qtest: i440fx-test: Skip running
 request_{bios,pflash} for win32
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-21-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220824094029.1634519-21-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 24/08/2022 11.39, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> The request_{bios,pflash} test cases call mmap() which does not
> exist on win32. Exclude them.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   tests/qtest/i440fx-test.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/tests/qtest/i440fx-test.c b/tests/qtest/i440fx-test.c
> index 6d7d4d8d8f..3890f1237c 100644
> --- a/tests/qtest/i440fx-test.c
> +++ b/tests/qtest/i440fx-test.c
> @@ -278,6 +278,8 @@ static void test_i440fx_pam(gconstpointer opaque)
>       qtest_end();
>   }
>   
> +#ifndef _WIN32
> +
>   #define BLOB_SIZE ((size_t)65536)
>   #define ISA_BIOS_MAXSZ ((size_t)(128 * 1024))
>   
> @@ -396,6 +398,8 @@ static void request_pflash(FirmwareTestFixture *fixture,
>       fixture->is_bios = false;
>   }
>   
> +#endif /* _WIN32 */
> +
>   int main(int argc, char **argv)
>   {
>       TestData data;
> @@ -406,8 +410,10 @@ int main(int argc, char **argv)
>   
>       qtest_add_data_func("i440fx/defaults", &data, test_i440fx_defaults);
>       qtest_add_data_func("i440fx/pam", &data, test_i440fx_pam);
> +#ifndef _WIN32
>       add_firmware_test("i440fx/firmware/bios", request_bios);
>       add_firmware_test("i440fx/firmware/pflash", request_pflash);
> +#endif
>   
>       return g_test_run();
>   }

Reviewed-by: Thomas Huth <thuth@redhat.com>


