Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BBD53FB1A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 12:23:51 +0200 (CEST)
Received: from localhost ([::1]:56548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyWNK-00061d-0d
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 06:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nyW8T-0002yT-6a
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:08:29 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:45027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nyW8R-0007IC-Px
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:08:28 -0400
Received: by mail-pf1-x436.google.com with SMTP id g205so15097848pfb.11
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 03:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y9QcK3JQwWi0Dh9+oZO4c+aF7TMN5DBVBvdUgjbgpiA=;
 b=TEv5MQkiwkrY3fl0QWlEBtzGHoZ60F6j1RYgLi/s2t3PtzOn9S0hKRCDHIA0EXrwg7
 QIJlbVBiZ59sW5rw7yDkMlN4y+h2Ax3853A6x2VMaQXcGT+zLQpGhHx0MMu3MnOUV2GF
 dC1/MMEDjmY6988cSTsXxvOI2SNu34YwCAlinqeDkBTynPbZ8CzUMlGsQ7ZZRdpfEa7f
 wYbvg+Xr+mBEFdDlUACl1gxFVw/lgKwaIjkewsY4iV7Sc0HD/MZoJclGGKAxGV3JbzAH
 ntoK699SCO9BiLvkbv7DoUBi1B5CdnmeE7+QJGqUFfWmX0Yidk+MSoWxZkul9SzuhkAH
 iGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y9QcK3JQwWi0Dh9+oZO4c+aF7TMN5DBVBvdUgjbgpiA=;
 b=h8u6pLZ+lrI+QRaX03eluXbOU5lmSOhropQI0zAyJDoM2WNg3ijRt1+hRxupz/veOX
 Rc3UcgPZpKo+QxVXVSitlbDGQdOqb6cFQq97MFVYQGn9gKwq/gBasfK6mUVzkPJINmOk
 HAV9PlJuAHk40VxzV77CxWQOhNoOP50oVFKRgZFeIq3HNOesg4lyEWGojzGwAMh4iADX
 rc4sFBmkK0MwMq5n1nwMl22mXh5HLt/fH1ooN28ZaAz39HuK5xS+4gzFQwQNfFh+a6Z3
 QLuuVJAYFnST48DgXKpOyxIzDFdMZM2b9/CYknegMnqB9FeEPp7fUJbJ45/I/TuQpJT7
 /nlQ==
X-Gm-Message-State: AOAM530oa6YwxV3hWaUfgwqdh7FeUqWTPKEyc70u/8ALucN84Emilamv
 61q4UKBiYMvIA4Wl8s/WZwPDRiojJGE=
X-Google-Smtp-Source: ABdhPJzOE6hU+3XO1di2h+tZIm0dFx9Ue232RVI35cTAanORcJrRYHPUcSlZH8R2gvUSwwuO/jT71Q==
X-Received: by 2002:a65:4c0c:0:b0:3c1:5bb1:6701 with SMTP id
 u12-20020a654c0c000000b003c15bb16701mr25131386pgq.136.1654596506018; 
 Tue, 07 Jun 2022 03:08:26 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a170902a3cb00b0015f0dcd1579sm12135103plb.9.2022.06.07.03.08.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 03:08:25 -0700 (PDT)
Message-ID: <157d1eaa-5895-5660-2a6d-243bb80cfa06@amsat.org>
Date: Tue, 7 Jun 2022 12:08:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] Hexagon (target/hexagon) remove unused encodings
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, ale@rev.ng, bcain@quicinc.com,
 mlambert@quicinc.com
References: <20220606222327.7682-1-tsimpson@quicinc.com>
 <20220606222327.7682-4-tsimpson@quicinc.com>
In-Reply-To: <20220606222327.7682-4-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 7/6/22 00:23, Taylor Simpson wrote:
> Remove encodings guarded by ifdef that is not defined
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/imported/encode_pp.def | 23 -----------------------
>   1 file changed, 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>



