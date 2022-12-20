Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75897652891
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 22:50:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7kVC-00020H-O6; Tue, 20 Dec 2022 16:50:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7kUx-0001vz-MX
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 16:50:14 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7kUv-0003lD-HR
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 16:50:07 -0500
Received: by mail-ej1-x633.google.com with SMTP id fc4so32371830ejc.12
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 13:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mZ4kdR/w3Nh6qOF4bW+17rnbpcWpXaSNmtYvo8NbKO4=;
 b=DqpXgjUvajMRxue9Mv36qXTNCsKrGzs+v/5zrN2SU7LIuweZXkwCZk47ugWXrVgseY
 CHTYxkWQ32NIJsbClq/62zkiJmKPXo18M5cX1IjnKxZjU1rb3uSWVoDHOScXGz4nXEGi
 Dv2vRPqG4E2o5ASQbZ29PlbdqPkMV2EspDl8+5T36vo1tZJUttNZ9F7KHlP4dj7EdvRK
 DIf2TfC7jnMByTYCCGBrHUYg/I9VXN1Ye8v5sPk2I436NKpjS4wYMsBf7pggLto6kNFC
 lHt3G6DAQxTBpk/0eHjmQADO3u73xLVd29BXJK3TszjkLzSrC/HIO8BPUSM0sSpBchZO
 rwxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mZ4kdR/w3Nh6qOF4bW+17rnbpcWpXaSNmtYvo8NbKO4=;
 b=5MDlSJ6NhTjgRixkMXXuL1Zhe3NSFnJnSzvE+L1x6mkcs6ux0S1FlZBWLOsMtlQV6Y
 gPNMXa/lSn5R9kDwPDcQYRxwl7MuuvCSlzRGSkwOvVu+SiV2Sr5CRNsPdF/9WUy26X6R
 u4DFrhJL9/04/gNK3bMTx08az+PUJOlWKgsK+vNKm2iVdLngN5MbAneBM3fRtvtaBEhM
 yTdKVPav4Ns1gGNfDqRGZKrcqQaFPKXYb/e+x6HgtDPJmlZh7R/ruD31xkVDAKBauYs9
 Rc8H2T8HIGByLWMVdEmdcff99pxdM2JgehuU0f9D8f6jfkXHfoJPWzh2Esxmo6XSOlsw
 Am9Q==
X-Gm-Message-State: ANoB5plmHuDAM/8/4CVhYOXml4hnIuDIioMQp7QUSog142GTJSmFTwUy
 S1OvpJ4fZEOH5ZQFt7zk3O9DDQ==
X-Google-Smtp-Source: AA0mqf7/cU0CxfAbL2kxQYJileL8pbOjm3m9X+zbfxbxye0vm2zPtO88mdXh2ZkeRAsw55n/91b4vg==
X-Received: by 2002:a17:907:c78f:b0:7c1:4e8f:df2f with SMTP id
 tz15-20020a170907c78f00b007c14e8fdf2fmr61060837ejc.17.1671573003764; 
 Tue, 20 Dec 2022 13:50:03 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a1709061ba900b00816edcb4e59sm3862800ejg.146.2022.12.20.13.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 13:50:03 -0800 (PST)
Message-ID: <d5dd2d56-d717-a13f-237e-372f7ba9c4bb@linaro.org>
Date: Tue, 20 Dec 2022 22:50:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2 06/10] libvhost-user: Change dev->postcopy_ufd
 assignment to make it C90 compliant
Content-Language: en-US
To: Marcel Holtmann <marcel@holtmann.org>, qemu-devel@nongnu.org,
 mst@redhat.com, xieyongji@bytedance.com
References: <cover.1671563795.git.marcel@holtmann.org>
 <f0653315f8d27ec85e02504fdb7f282921d9743d.1671563795.git.marcel@holtmann.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <f0653315f8d27ec85e02504fdb7f282921d9743d.1671563795.git.marcel@holtmann.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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

On 20/12/22 20:27, Marcel Holtmann wrote:
> The assignment of dev->postcopy_ufd can be moved into an else clause and
> then the code becomes C90 compliant.
> 
>    CC       libvhost-user.o
> libvhost-user.c: In function ‘vu_set_postcopy_advise’:
> libvhost-user.c:1625:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
>   1625 |     struct uffdio_api api_struct;
>        |     ^~~~~~
> 
> Understandable, it might be desired to avoid else clauses, but in this
> case it seems clear enough and frankly the dev->postcopy_ufd is only
> assigned once.
> 
> Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
> ---
>   subprojects/libvhost-user/libvhost-user.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



