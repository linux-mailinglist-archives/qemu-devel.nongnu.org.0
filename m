Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A46046C4C07
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 14:41:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peyhI-0003kP-Jy; Wed, 22 Mar 2023 09:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peyhA-0003jh-2V
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 09:40:09 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peyh7-0007cx-Ax
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 09:40:03 -0400
Received: by mail-wr1-x434.google.com with SMTP id d17so8682119wrb.11
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 06:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679492398;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xw3DgkTIiKvWogeJs16YdjjccKhLvmlrdVCVLFEZKRA=;
 b=p/PjFwdfNcpJYuQoXjTMn5sLvWwWqTMb90HNoJgTjlZFYHzDwpAe2+G7wclkqAnV3b
 5QGMHKtmU1tSaxtXw5fZlyzCKaADyL0+NjdDqmhQICcs3aUcmHthZkwTVTXJnG+Swj/w
 8OKKm9Am5U74Z5yNQhG5QL4cGPqHl3f2/fZaI8BdPo9/kBTjRAsqV2jpbdV/rOg8SIyY
 0T2z0ktyM5pSok8fjkZzee/7yYLufkFsOToomyWs0l71SXmxH5WU7YnDGfzbgaVDVM58
 keu2GXy8kxNBJqBOhIY/dHbSuCMoDBc6dMHW5boAIkGo0l/y4rqqj+CsvmGkUGLnRarq
 dRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679492398;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xw3DgkTIiKvWogeJs16YdjjccKhLvmlrdVCVLFEZKRA=;
 b=gv7/SmL59WUHv7a13tQZK6i/ZRcp9CYhFKd4lWtQYfCn7689s2OkNRku+Hs9SVEKuC
 qpHBfu/NjSd0g/cu6j2hqs5QLrW1aGmKIMKvsmPUgsHuw8GIQyDYbXa6QrHX+EJ74cCY
 bNPQQFIe/HX/1Txn5EgbtmECzsEgrnt6PeJvPoMTuRT4/E8TTi+5yrsR4i3x3sNyGa+b
 xi2HB/MeRWtriWqI2pm8wW2khekRLU8SJdXfQI1gY6R99nvxD8bu9wzEV8hnhkhs/kfi
 cVdgbTVy+SsjJ/Ll9FPbTFvh3PP6J517VXKrVpIev4Ij6wUHwrU6Kd1l13VQTT6FcjdV
 Eo4Q==
X-Gm-Message-State: AO0yUKUb3eNFEowSgRS87xVtLHqvclY90k4AGG70hkq9LizhTmIZpzzg
 SFQDx4PGPoVyey/k/zBQZ1kJ0g==
X-Google-Smtp-Source: AK7set/D1B/0VhpR1SkB/ZpCh0821DKbVsqZlp9c2xgfNYSvY1NiLPsejlax1we6+yL+EjvdprDGCg==
X-Received: by 2002:a05:6000:1376:b0:2d2:5971:68b0 with SMTP id
 q22-20020a056000137600b002d2597168b0mr5436113wrz.22.1679492398230; 
 Wed, 22 Mar 2023 06:39:58 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s11-20020adff80b000000b002d6f285c0a2sm7693860wrp.42.2023.03.22.06.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 06:39:57 -0700 (PDT)
Message-ID: <7cd8ed61-ef48-aa62-b8a6-24c445cfa9e2@linaro.org>
Date: Wed, 22 Mar 2023 14:39:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] tests/vm: custom openbsd partitioning to increase
 /home space
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230322123639.836104-1-berrange@redhat.com>
 <20230322123639.836104-3-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230322123639.836104-3-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/3/23 13:36, Daniel P. Berrangé wrote:
> The openbsd image is 20GB in size, but the automatic partitioning
> done by the installer leaves /home with a mere ~3.5 GB of space,
> wasting free space across many other partitions that are not
> used by our build process:
> 
> openbsd$ df
> Filesystem  512-blocks      Used     Avail Capacity  Mounted on
> /dev/sd0a      1229692    213592    954616    18%    /
> /dev/sd0k      7672220        40   7288572     0%    /home
> /dev/sd0d      1736604        24   1649752     0%    /tmp
> /dev/sd0f      4847676   2505124   2100172    54%    /usr
> /dev/sd0g      1326684    555656    704696    44%    /usr/X11R6
> /dev/sd0h      4845436   1445932   3157236    31%    /usr/local
> /dev/sd0j     10898972         4  10354020     0%    /usr/obj
> /dev/sd0i      3343644         4   3176460     0%    /usr/src
> /dev/sd0e      2601212     19840   2451312     1%    /var
> 
> This change tells the installer todo custom partitioning with
> 4 GB on /, 256 MB swap, and the remaining ~15GB for /home
> 
> openbsd$ df
> Filesystem  512-blocks      Used     Avail Capacity  Mounted on
> /dev/sd0a      7932412   4740204   2795588    63%    /
> /dev/sd0d     32164636        40  30556368     0%    /home
> 
> This will avoid ENOSPC failures when tests that need to create
> big files (disk images) run in parallel.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/vm/openbsd | 27 ++++++++++++++++++++++++++-
>   1 file changed, 26 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


