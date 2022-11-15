Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA141629B8B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 15:07:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouwb3-0004dM-4F; Tue, 15 Nov 2022 09:07:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouwaf-0004WO-Fv
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:07:20 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouwab-00021A-Oz
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:07:03 -0500
Received: by mail-ej1-x62e.google.com with SMTP id t25so36232386ejb.8
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 06:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3sMscB6jqooFoawxCrp3+4GNSGVIkFG6mpUHcB8j9Rc=;
 b=aZJpvCIJZdY9UgUJxr2BWCjZc3Db86i0uv8Djcoh8P4t1JLP+XlL/e6ujsbA0HbXow
 n57ETukEojdqJBq56aTVV0p+CkYHVX2O6+mL1xOUKp1LA4uBgkf8M2gTyXjznUCLvGP4
 YaHkN3ez5JBguLuQW+le1zZBMhe77OQBc8xkZI4Efae8qaU2Dl/grzhbh0AT+2EYhhB6
 QFbx1iqHXltsJa1AVSwYtHq4/eoK0gFfNuP3GQ6PJ7JjeIkaLCd791NS8M0YPeVtB2SH
 02viYpE6R+KPapEtToyyce4tCXZXJlxCDPC2zXT1Pxke9bU2I7k5WvxYcaLUnzhoaH5+
 WWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3sMscB6jqooFoawxCrp3+4GNSGVIkFG6mpUHcB8j9Rc=;
 b=66pFZfldCQHjGuEUuODbT8LDhnSK7mmpTRVqSv2cjxaGGKXqA7kT3TCCVNCgT35o3P
 iDqTMuNkKYWdtaricLJ0DMzVPIZVksC01kyXrC8LHG7qmumjalAX7bzeMvF1ehWC/xr0
 PLEzk+94OLSVHPmWOT7WhSf/DRKYPxUl03Exa5+Ngb8bLCidCRnDLefcrnxRXq0F7mNC
 L4pw+1fw0afbQY/BPrSbaxmNC/LgEB5NcMwVqffPCzvoFHtC1nENQv1V7Apj2xreseBy
 5uDPvgHBgxbIqlke2dhqS4t690Mj6butwSXLrxo39/6wzcOvULiJo+O4/pksALB2Uwd8
 ZaJQ==
X-Gm-Message-State: ANoB5pmQd4P8fDUeiARgkGb7JftQgfsxBtWBvU3Qx5+xuaFW28EjNtj6
 zx+eBWvU4QIcWr6lq/PPioEA0w==
X-Google-Smtp-Source: AA0mqf7Bb83jeK2qXO9WkKz8S+GJ/phZhxkUYM9tu/BxGNzscpG/QLbmbJoyKynNICltuPAaNibcOg==
X-Received: by 2002:a17:907:9a85:b0:7ad:b45c:dbca with SMTP id
 km5-20020a1709079a8500b007adb45cdbcamr14269009ejc.388.1668521210702; 
 Tue, 15 Nov 2022 06:06:50 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a50ec0d000000b0045b3853c4b7sm6210682edr.51.2022.11.15.06.06.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 06:06:49 -0800 (PST)
Message-ID: <58687845-716a-76d0-a294-ffa26114ada0@linaro.org>
Date: Tue, 15 Nov 2022 15:06:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH 0/1] hw/arm/aspeed: Automatically zero-extend flash images
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Delevoryas <peter@pjd.dev>
Cc: peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, patrick@stwcx.xyz,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
References: <20221114190823.1888691-1-peter@pjd.dev>
 <890395fe-ed58-8a5d-be76-b28d99e6289a@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <890395fe-ed58-8a5d-be76-b28d99e6289a@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 15/11/22 14:06, Cédric Le Goater wrote:
> Hello Peter,
> 
> On 11/14/22 20:08, Peter Delevoryas wrote:
>> I've been using this patch for a long time so that I don't have to use
>> dd to zero-extend stuff all the time. It's just doing what people are
>> doing already, right? I hope it's not controversial.
> 
> I simply run :
> 
>     truncate --size <size>
> 
> on the FW file when needed and it is rare because most FW image builders
> know the flash size of the target.
> 
> However, the current error message is confusing and the following could
> be an improvement :
> 
> @@ -1606,6 +1606,13 @@ static void m25p80_realize(SSIPeripheral
>       if (s->blk) {
>           uint64_t perm = BLK_PERM_CONSISTENT_READ |
>                           (blk_supports_write_perm(s->blk) ? 
> BLK_PERM_WRITE : 0);
> +
> +        if (blk_getlength(s->blk) != s->size) {

'!=' -> '<' ?

> +            error_setg(errp, "backend file is too small for flash 
> device %s (%d MB)",
> +                       object_class_get_name(OBJECT_CLASS(mc)), s->size 
>  >> 20);
> +            return;
> +        }
> +
>           ret = blk_set_perm(s->blk, perm, BLK_PERM_ALL, errp);
>           if (ret < 0) {
>               return;
> 
> I can send a patch for the above.
> 
> 
> <hack>
> 
> I mostly run the QEMU machines with -snapshot, this hack  :
> 
>    blk_set_allow_write_beyond_eof(s->blk, true);
> 
> makes it work also ...
> 
> </hack>
> 
> 
> Thanks,
> 
> C.

