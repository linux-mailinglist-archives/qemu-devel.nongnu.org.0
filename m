Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A59F340D1F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 19:35:47 +0100 (CET)
Received: from localhost ([::1]:35404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMxUo-0006XN-A8
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 14:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMxSB-0005af-Vw
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 14:33:05 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:40828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMxS9-0000XL-Js
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 14:33:03 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 w31-20020a9d36220000b02901f2cbfc9743so5831214otb.7
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 11:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xdr37AyOpoadFzx4GHMula98eVX4WzgKXazcq3VdT7w=;
 b=dpvW23X9ep/F5YPmGjITXD7VkvHrDUf3iNrB/58yHk4ypxX8YtIXDq7uCF5remUYD3
 pVYS6so0HIw6jyvuvLwbcbmBZ1TPn628sdCW+kPccgdDo+aGebS4l++xrbfw8/nboy2g
 6mdgw24w7FfEcZ59x4E0HS9NbtVi1NViMHcdeE6Ypode1zGGVmPLJUt/K/i5EQCl4Lub
 l8oMUUzhTIHEtwhv5QSmGP+tZYlCM1PULRGcooHQTH80mEP/hNYYbvd019+ED7ymt6IV
 17M4VmyMFfzO6GNY7N1eAg/brE0Z+t7VWMFxATxbeh7g/fVp7ALocBOR7Zxl4HWA+Ctz
 vKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xdr37AyOpoadFzx4GHMula98eVX4WzgKXazcq3VdT7w=;
 b=pvmTM+RkwcGIzLoineuRagwGELwiRFvZ3y8nniFmdUj9iuCr6DkWVOKNfnFl4KUy11
 rTDKsnQgf6vuR4OgPSkVWMqAxpAtBzqANKHILTBfVPCOO+xsa/0U/RZ9tKp3Oy0tPxJE
 0m8Li74Et891oqJyArEVIivRBdolxPyBpixPq46hFf5EA7SxDNy0USVhrx1JkKS5vCE1
 TqCBhgsL9zCBz6AnC4Ug3gA/JEynlolcJ403wmrm4Uj6jYPExNTdk/wAMu+qaHjKZuRs
 UxXYsq54bG7Y91SbLlBoHaHs0pNMoG1XU2OgBT1slKPfTaImsKDX+0lPtdiLRDtYMqQJ
 HkwQ==
X-Gm-Message-State: AOAM531pQr24UhoAb8PVcAvu/VErh7OXuxE95zbT12utWg6j1U+AlOfy
 aEXWXuydMvatExMud8GuMHr43g==
X-Google-Smtp-Source: ABdhPJwZC2rAYVUSEXtrtJG1njjzUFuqjkpDlwqFQov9wsxe+N9FIPd2iT2pClvQpq7gnTERGR3IYg==
X-Received: by 2002:a9d:470b:: with SMTP id a11mr8327844otf.254.1616092380148; 
 Thu, 18 Mar 2021 11:33:00 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id r22sm646290otg.4.2021.03.18.11.32.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 11:32:59 -0700 (PDT)
Subject: Re: [PATCH v8 16/35] Hexagon (target/hexagon/conv_emu.[ch]) utility
 functions
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-17-git-send-email-tsimpson@quicinc.com>
 <f0ff8663-9ea2-e8be-9123-4afffc41bad2@linaro.org>
 <BYAPR02MB4886A70EA367526D5834F501DE699@BYAPR02MB4886.namprd02.prod.outlook.com>
 <75d9fed2-ac04-846b-1426-6cd9fe657924@linaro.org>
 <BYAPR02MB4886CE42E5E7E79CD9C5006FDE699@BYAPR02MB4886.namprd02.prod.outlook.com>
 <db5eac2a-09fc-bf74-9738-8f058c439f82@linaro.org>
 <BYAPR02MB4886AE3C4E1D8606ED6D350DDE699@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1f548c9a-6d33-1330-c8eb-be4c78fc24b7@linaro.org>
Date: Thu, 18 Mar 2021 12:32:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB4886AE3C4E1D8606ED6D350DDE699@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "ale@rev.ng" <ale@rev.ng>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "laurent@vivier.eu" <laurent@vivier.eu>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 12:03 PM, Taylor Simpson wrote:
> Here's an example from float_convs
>      from single: f32(-0x1.31f75000000000000000p-40:0xab98fba8)
> Softfloat:to uint64: 0 (INEXACT )
> Hexagon:to uint64: 0 (INVALID)

Ahh, so an ieee conformance issue in hexagon -- failure to defer the sign check 
til after rounding.

> So, just looking at the float_convs tests the Hexagon version of f32->uint64 would be
>      if (float32_is_neg(RsV) && !float32_is_any_nan(RsV)) {
>          float_raise(float_flag_invalid, &env->fp_status);
>          RddV = 0;
>      } else {
>          RddV = float32_to_uint64_round_to_zero(RsV, &env->fp_status);
>      }

Looks good.  Just add a comment too.


r~

