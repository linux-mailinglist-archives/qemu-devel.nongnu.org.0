Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA174E32A5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 23:32:21 +0100 (CET)
Received: from localhost ([::1]:47436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWQZY-0003Xh-Jl
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 18:32:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWQXS-00023y-SC
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:30:10 -0400
Received: from [2a00:1450:4864:20::42b] (port=36442
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWQXR-0001lU-GI
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:30:10 -0400
Received: by mail-wr1-x42b.google.com with SMTP id r10so22634305wrp.3
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 15:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=P3a7WzfLV6Yk4Tvv598KmibdOA+aIvOVZgo2UgCEVBs=;
 b=F3zGdDqfSKvNnuwEIA+20bvGZeepJ5m7Wcc1H/ElgU5si0wsUc6iM4PinQxPKFAh4H
 oYnsIMBTj+ZKBIlMtI6ORjU7Apxf4MWCuVPzDP+NWPY6DoPEBl9lV2vd82HpxETh/cdK
 Er3V+IDvLhHkiF5W/j2TKmocvQEvYOWADM8Fc3sPEcr6/euVPejHzHYvZasbsAQRmryK
 fbL0AuPxkzICVDluTxDxpuIdZ0isrLgfw9ugCVZXnkFuUoTWpn/nDghTlGUwx0xRDolt
 jVbx1I1vyKikNNDFN9Olu9MsB300kBBZUF29oYSNDlI2q6HI50AMcukPCsHM+h8X6vek
 kYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=P3a7WzfLV6Yk4Tvv598KmibdOA+aIvOVZgo2UgCEVBs=;
 b=YRuEcKwLHyP4QqPWtlztmfp8k7f7IWt0LOCR1ozQ2xiir7KphotJgswQer89/KaJ+g
 5JI2fZHVZzXwo82XpLm8i1B6uAIHwZw5auCVsOpcQkT3aCW03cVXu0P4oTPU/HUcHhmy
 aQUzG/aeooAqwKnDFxxGtU7HM3n0+KG2ZD/yC4RSRPvttOeOH1BthqMkT0VjZLDr/9Io
 KQZq1In7dlCucadO/P7PRsknlPu+YXmgjmwwT1MMKR4lCL31Rn2syJS+lO2dSfjKIyPU
 PlJoby0rr1IfsLRWN36WpMhBPdKtazc9yLkO4OhNi/k3ql+LXtJvrq5Ri7bGtNN25djp
 SSIg==
X-Gm-Message-State: AOAM531nNpkkOqLBZJakGzfP2ojZnmsDjDoXi7dmWQTJEOHWcLsDPiWs
 TjhVLh27BSP8OGkG085H3zE=
X-Google-Smtp-Source: ABdhPJxgQzXY0RwgRPz31hzxoVjVFJVWP0CelibceITjo9ns29aEOItDeVOoMI/grEZde1zT28g1vw==
X-Received: by 2002:a5d:58d6:0:b0:203:de3f:e648 with SMTP id
 o22-20020a5d58d6000000b00203de3fe648mr19973788wrf.292.1647901808319; 
 Mon, 21 Mar 2022 15:30:08 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 x3-20020a5d6b43000000b001e317fb86ecsm14754657wrw.57.2022.03.21.15.30.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 15:30:07 -0700 (PDT)
Message-ID: <cfd053d5-ad1f-5fe4-141e-6ce536d84e51@gmail.com>
Date: Mon, 21 Mar 2022 23:30:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v1 04/13] docs: vhost-user: clean up request/reply
 description
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220321153037.3622127-1-alex.bennee@linaro.org>
 <20220321153037.3622127-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220321153037.3622127-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: slp@redhat.com, mathieu.poirier@linaro.org, mst@redhat.com,
 viresh.kumar@linaro.org, stefanha@redhat.com, marcandre.lureau@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/3/22 16:30, Alex Bennée wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> It is not necessary to mention which side is sending/receiving
> each payload; it is more interesting to say which is the request
> and which is the reply.  This also matches what vhost-user-gpu.rst
> already does.
> 
> While at it, ensure that all messages list both the request and
> the reply payload.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Message-Id: <20210226143413.188046-2-pbonzini@redhat.com>
> ---
>   docs/interop/vhost-user.rst | 163 +++++++++++++++++++++---------------
>   1 file changed, 95 insertions(+), 68 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

