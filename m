Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6812A484A3B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 22:48:50 +0100 (CET)
Received: from localhost ([::1]:59478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4rfk-0002Gx-W1
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 16:48:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4rdg-0000u3-M0
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 16:46:40 -0500
Received: from [2607:f8b0:4864:20::102b] (port=54161
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4rdf-0003oh-5a
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 16:46:40 -0500
Received: by mail-pj1-x102b.google.com with SMTP id mj19so32333006pjb.3
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 13:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BoFV9Blo576nw3Y1CvG3G0WXqSFK50FDpctKxg5CBT4=;
 b=gzFxdgZTZiyaXvc+xt4ZUY15DJMo8OPrwpDwZQ4/d1JwzjX6GompKVR3tE5MHlXVr9
 kW89D2kJecYfh1MVdRi8cwd/Pblfdh7Jn5x8XL3oi+j7QRAQqPzMX9U3fGK/m2pIGtYV
 hDwR9Wz9/vBsl0SvMWrebqUjYnlTrsiONC9dxEF+kkVoByg7VGR/IxsdWrl6AyGktvwB
 FcmzI9TI0mH+NPvq4DYmk2AQ9xa8CyZ09kFDRNlI7eRdTvouaddX9nzoiFCXpGemX17n
 +yIK4JYA+AHnVIoUOi9G22n5oo9OpWeFcBIyB/xFqqL3kG7ykSbDotQbptp4IoQIowil
 QM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BoFV9Blo576nw3Y1CvG3G0WXqSFK50FDpctKxg5CBT4=;
 b=1xfFHPMn5bBcOLNZ4135reqx67M0bLF9fCHg1plm91iq66D4CKITTEdThArPH1XEWg
 oXp7DTixFzF7on7X9UzlMbNXoBrE4eBpNG5N+Yml375C/UzprvugSUnJWKJ3EkCzStGX
 Uy4x9ozxQ2sNN5GAqv7NFX9Y0eMUAMKS4yH+u315ncEbBaM/6waKF8vQuGF0lFAq9zSb
 pXyWIVvBEEdB8AG05jm+Ne9CQ+pnhGbc8n/UCKh1LHVkETFE38bxdWeRshxWL803lRmV
 fGnpYQWkLcB3zZIl5yICvFK3mtbbO6FNcEpp9qryNp37K4jj8yXcuHZh+mJAxlsQTejL
 wNew==
X-Gm-Message-State: AOAM53188hS+0FEONotZ1Tq8Hm9s010UgI1DadGJLoEBHCZN9hD4VTjw
 yGFDcJUCIuLluy2dUUqGEpU=
X-Google-Smtp-Source: ABdhPJyyEo+C4pXrg9bTJbcO+ujXS0ubSQawW8RQAOYsCv17olpmXqno2L2yTNXTrq+YTkn8J/kHrA==
X-Received: by 2002:a17:902:ea83:b0:148:95f3:4f4d with SMTP id
 x3-20020a170902ea8300b0014895f34f4dmr51400958plb.54.1641332796085; 
 Tue, 04 Jan 2022 13:46:36 -0800 (PST)
Received: from [192.168.1.33] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id j8sm44722153pfc.11.2022.01.04.13.46.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 13:46:35 -0800 (PST)
Message-ID: <0d345d30-9860-568f-7fd9-2fb3ce71408f@amsat.org>
Date: Tue, 4 Jan 2022 22:46:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH] net/tap: Set return code on failure
Content-Language: en-US
To: Patrick Venture <venture@google.com>, jasowang@redhat.com
References: <20220104211827.3260431-1-venture@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220104211827.3260431-1-venture@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Foley <pefoley@google.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Daniel

On 4/1/22 22:18, Patrick Venture wrote:
> From: Peter Foley <pefoley@google.com>
> 
> Match the other error handling in this function.
> 

Fixes: e7b347d0bf6 ("net: detect errors from probing vnet hdr flag for 
TAP devices")

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Peter Foley <pefoley@google.com>
> ---
>   net/tap.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/net/tap.c b/net/tap.c
> index f716be3e3f..c5cbeaa7a2 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -900,6 +900,7 @@ int net_init_tap(const Netdev *netdev, const char *name,
>               if (i == 0) {
>                   vnet_hdr = tap_probe_vnet_hdr(fd, errp);
>                   if (vnet_hdr < 0) {
> +                    ret = -1;
>                       goto free_fail;
>                   }
>               } else if (vnet_hdr != tap_probe_vnet_hdr(fd, NULL)) {


