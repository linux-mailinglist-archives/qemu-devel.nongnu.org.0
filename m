Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDC26A8017
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 11:42:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXgNv-0005tC-Sv; Thu, 02 Mar 2023 05:42:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXgNi-0005mf-Is
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:41:50 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXgNg-00038i-R0
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:41:50 -0500
Received: by mail-wr1-x42a.google.com with SMTP id bw19so16010016wrb.13
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 02:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677753707;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AmvD0+KNHlilXkSHgx/SUoS0tZFl84xsVJ6KTtsOYHk=;
 b=ecblB0z5eFdSB9OnFPwPDhJfl41Xisy/OkCADxpUVDlwctPHXDsuT2shwXlfJ0Wird
 ry/Fyh5k0zR2XH4GknQQcTbrQ8JsyyeYGWFKp2gK3It70nKgiaMDqf8/8zV4ItzNTDxG
 wWJQg5Vhih/avF2gdU0W3196WKDh21PiFmU+7Nuj3FOPephLLaiIEmsZZClJDWTNn7xv
 RVt3ivALr/1vMM0qa6rdkvN4KoFMjk1QSe7CIQ9hsOjC9EAzAdOJdFfXuzBuidwWgRG1
 /KDBjvBdcbBVj0A66q79nMp7+8F6Nk8s7PIXo0g5swtDGAHaGbavf4JGbwH+ZH+ktGhO
 MY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677753707;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AmvD0+KNHlilXkSHgx/SUoS0tZFl84xsVJ6KTtsOYHk=;
 b=EuxjjHbp+c1DTCMwiuJTlbym4lpGQ7JEXdM+nljrXts6yoCz5pDALvyUTme9N0iamN
 blsUjIBtItPIaJ0s7R12z5xb+R7hyYY3k7S3U3OLupelrw53VIDJIWCqiv5q7f+jhOai
 aoTvFmODho05DcEpSN2FD7Fn10/mRHdkxlX5QkzD0Yi7oaAMDlLEeQgcqu00zVSCi5FI
 exeqiq824mqRpzkNcnrZGZzJfeAu0GQJlsYnYomi0htlKCAcpiCiL8sS6RWFpvbxhaO3
 r2c0LJtJcFffKMEIzDgoQLsJCZFWOaDCULOhEkw+Fh2U2W80RGsyK5kHsx+YAtBDGG4o
 Q+OQ==
X-Gm-Message-State: AO0yUKXDoscx9Bd4GphBMxDCkuHzmMtq10x1zhOkaHm4aOtKyApE+5xM
 hXGrKUW5z0Qq+1EsIbYabB0vjA==
X-Google-Smtp-Source: AK7set8tmIts6w3rpZHRsn/92SUrLilm/JhH3LlCOd4UgL0CHI/xQsy0/poxWcv5GvmDnx+ALDKvFg==
X-Received: by 2002:a5d:4dc3:0:b0:2c7:659:3cb1 with SMTP id
 f3-20020a5d4dc3000000b002c706593cb1mr7170356wru.70.1677753707047; 
 Thu, 02 Mar 2023 02:41:47 -0800 (PST)
Received: from [192.168.74.175] (89.red-88-28-21.dynamicip.rima-tde.net.
 [88.28.21.89]) by smtp.gmail.com with ESMTPSA id
 s4-20020a5d6a84000000b002c551f7d452sm15227131wru.98.2023.03.02.02.41.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 02:41:46 -0800 (PST)
Message-ID: <7ae0ae69-817e-7100-beed-ed610b3135cb@linaro.org>
Date: Thu, 2 Mar 2023 11:41:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v5 2/7] Revert "hw/isa/vt82c686: Remove intermediate IRQ
 forwarder"
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, ReneEngel80@emailn.de
References: <cover.1677628524.git.balaton@eik.bme.hu>
 <cdfb3c5a42e505450f6803124f27856434c5b298.1677628524.git.balaton@eik.bme.hu>
 <709f5780-97e5-0cee-d776-4558cf39e000@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <709f5780-97e5-0cee-d776-4558cf39e000@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/3/23 01:33, BALATON Zoltan wrote:
> On Wed, 1 Mar 2023, BALATON Zoltan wrote:
>> This partially reverts commit bb98e0f59cde846666d9fddc60ae74ef7ddfca17
>> keeping the rename of a state field but reverting other cahanges which
>> break interrupts on pegasos2.
> 
> I've found this with just booting the MorphOS iso which now hangs 
> without this revert when trying to read from the ide device.

Can you add an Avocado test booting the MorphOS iso?

> I think 
> I've mentioned that I've also tried this way first but then ended up 
> adding this because it was needed in a review of the patch earlier but I 
> can't find that message now. For now it seems the easiest is to revert 
> this and think about it later.
> 
> Regards,
> BALATON Zoltan
> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>> hw/isa/vt82c686.c | 10 +++++++++-
>> 1 file changed, 9 insertions(+), 1 deletion(-)

