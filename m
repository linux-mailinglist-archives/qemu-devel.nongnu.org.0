Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 982474E1E12
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 22:56:13 +0100 (CET)
Received: from localhost ([::1]:60000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW3X2-00026r-Mi
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 17:56:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nW3Sq-00077c-UI
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 17:51:52 -0400
Received: from [2a00:1450:4864:20::433] (port=38871
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nW3Sn-0007PV-8c
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 17:51:50 -0400
Received: by mail-wr1-x433.google.com with SMTP id t11so18463511wrm.5
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 14:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=m65ItYr+tOCupuxRIBiEJZiUafKZnDGDzaPTaaU7S3c=;
 b=Ql9i9pWUnip4zUDbH1Xz2AF4ByJ/G7kxkVtbx0XPQ+FWiBv6YXKgtMzhEf68bNpdU6
 9QodxoOrBmhFE7AWiGg40tEuTIpKmyX5UF30YI03An3SJYLdy8KyCAdlOf/rKPCfebt3
 7FklOVkKEMQ9F04bGxG5NlW/bXyht4r18xj4998cz3u3xQInLtUHJK2JwuEvoT1Mta9L
 C+ZEruzJJyWNRoyBc5CnUeXojXZDpG2oNpTuky/k8Y1dHHNYLu6LsYUKFgQegJ568/iw
 O+xzeFh20pRtBg419O5ATncfdg/17Fo61T+EM/r1t7gPGsLE3A2Qvcj98lIixllGkSXF
 NndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m65ItYr+tOCupuxRIBiEJZiUafKZnDGDzaPTaaU7S3c=;
 b=NqVxqMyRXUhiPdr7UwFYuQEKPs4zbKtDl33iiCFo62zpA01Y0clUWy+Jf/ixUNO3Kq
 hGGPxp7j4fBpF2GMiUfwlNH3Z3IrQuhy+Jw5VFqP0Piy9OWmtCMm89OrRQwNBBOKje4A
 StVqik2lLTjk1/i4Jtrfv6ZM4bzTcTB+1aSn1QasJVicFy+wxT4cj/1Ot8bwDXr+fF5v
 lQI5ifF3go7sKGTHC/VWJ+D7c0wPHmHbJk2qkIRz3iYiNWgeoUrOJhbwDQ8u4l44WprD
 P2IE9AD4bPkzrE1JEFbd5hRgEy8lYsZSEvnVJz3e/ZM1vUjFP2qAa9xhnhh3CjHUCZ7I
 b3eg==
X-Gm-Message-State: AOAM532NjbTo74suouVpYgNBtQaoubTl+eCVPTQFwRzQl9WwJtjCBu4U
 6Jo7CXsKM0lQwASaoSEup0MBDieY3cHpug==
X-Google-Smtp-Source: ABdhPJx8KEPOp0ZUP1m4HIp5i8X6YWnYggOrZhr0iOpEbZmVOzEMLwS0i6rAjK+LErjHc547gmyhlw==
X-Received: by 2002:adf:f40c:0:b0:203:e768:ae54 with SMTP id
 g12-20020adff40c000000b00203e768ae54mr15198383wro.488.1647813107230; 
 Sun, 20 Mar 2022 14:51:47 -0700 (PDT)
Received: from [192.168.1.34] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 g1-20020a1c4e01000000b003899c8053e1sm15908329wmh.41.2022.03.20.14.51.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Mar 2022 14:51:46 -0700 (PDT)
Message-ID: <4379bc65-2ba3-0715-295f-c383e7029ad6@gmail.com>
Date: Sun, 20 Mar 2022 22:51:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PULL for-7.1 04/36] os-posix: Use qemu_log_enabled
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
 <20220320171135.2704502-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220320171135.2704502-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/3/22 18:11, Richard Henderson wrote:
> Do not reference qemu_logfile directly;
> use the predicate provided by qemu/log.h.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   os-posix.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

