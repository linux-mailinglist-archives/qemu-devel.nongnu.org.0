Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B6C4E32A9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 23:34:31 +0100 (CET)
Received: from localhost ([::1]:51654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWQbe-0006NM-Hn
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 18:34:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWQaB-00051l-9P
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:32:59 -0400
Received: from [2a00:1450:4864:20::433] (port=37848
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWQa6-0002Ai-K1
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:32:58 -0400
Received: by mail-wr1-x433.google.com with SMTP id u16so21598330wru.4
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 15:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nU+x9Hcd4YDUPnDdNre/unhZv4XScgOMqi7ZYYntXw0=;
 b=XhASWWRfGBxW/eW2OB48DWcgbCOCSJOrCY3iJ8Bjht12SWOlJ6gj2Qw08cOdJgzCiq
 OEf4tN5JlOomdM2btgoXGg1lMK6ELixu2ol2sB+vBQasGhZ/XhxwSfPAxq6b4C7T0VKI
 qkYS85ucp0qJW1VBIqVMRpMrf4qSoXRdYdJFnMAEuBgjQw9t7WMzBrOiLlAM+Qwqk7pD
 C3TqsiteH6t9+5uWMcPp8vbh50gLsEq0uCQR0wA0mirU+APWwxbRn4D2rXjTP/k4q8IO
 ID5RiNNB2CsDA4raAfHl1AsnSqyuk7e1KWjbryaDrLYDe8Tny1V3Zqf8s33dKwpN1Uhu
 GLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nU+x9Hcd4YDUPnDdNre/unhZv4XScgOMqi7ZYYntXw0=;
 b=RPIqBAXyYHGDFia2NUN9bQmmsTbu7JjbksPfuCHJ8VjTtwWxvTo/qoy+SqoqMlMNax
 7GqPGFVGm2vo6/x1RW/SrzQmWopDbQjGAZOtk4y7E0UNomG6usHA1qMB0Ay38fTOADR/
 ASclFKmIVrsZWJ+ucSn4S0xq/MfXP+5gb7USRhiI88HWIgCAFtdfxMc8SgCIjabVjGEG
 X51EKW7VkuHsBtn+BNY+A2PwfeiicVzJlEb5LUt/L8ogWkEGoJR4XLRIE15XXXnap1/J
 G1qcVRuODh+em7AOU9zMJI9+3DUfv2IH61/TJBXtGSZutBkAUqNj2R2c7cXJdJ5GEqqY
 xEgw==
X-Gm-Message-State: AOAM531GJvO0PpSFvAcggxnL3Zj+oI9NH/BAGsQ188zrUJOKvRFnfucy
 OVH0bKFZcaofkFDvH/nplbI=
X-Google-Smtp-Source: ABdhPJw2/XALTo92vwM+knxwhxw6HVhIuge1suBpiPPPJK0Lo6YODJk4ueWYtQnACGy7jMDP1tm/kQ==
X-Received: by 2002:a05:6000:1142:b0:203:fe14:e313 with SMTP id
 d2-20020a056000114200b00203fe14e313mr11576133wrx.448.1647901973106; 
 Mon, 21 Mar 2022 15:32:53 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 o11-20020adf9d4b000000b001f0077ea337sm14417682wre.22.2022.03.21.15.32.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 15:32:52 -0700 (PDT)
Message-ID: <ac657a9f-a217-ee01-616d-85d8c960bb58@gmail.com>
Date: Mon, 21 Mar 2022 23:32:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v1 11/13] contrib/vhost-user-blk: fix 32 bit build and
 enable
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220321153037.3622127-1-alex.bennee@linaro.org>
 <20220321153037.3622127-12-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220321153037.3622127-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: slp@redhat.com, mathieu.poirier@linaro.org, mst@redhat.com,
 viresh.kumar@linaro.org, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 stefanha@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/3/22 16:30, Alex Bennée wrote:
> We were not building the vhost-user-blk server due to 32 bit
> compilation problems. The problem was due to format string types so
> fix that and then enable the build. Tweak the rule to follow the same
> rules as other vhost-user daemons.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   meson.build                             | 2 +-
>   contrib/vhost-user-blk/vhost-user-blk.c | 6 +++---
>   contrib/vhost-user-blk/meson.build      | 3 +--
>   3 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 282e7c4650..0435419307 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1326,7 +1326,7 @@ have_vhost_user_blk_server = get_option('vhost_user_blk_server') \
>              error_message: 'vhost_user_blk_server requires linux') \
>     .require('CONFIG_VHOST_USER' in config_host,
>              error_message: 'vhost_user_blk_server requires vhost-user support') \
> -  .disable_auto_if(not have_system) \
> +  .disable_auto_if(not have_tools and not have_system) \

s/and/or/?

>     .allowed()

