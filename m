Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 470014B9436
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 23:55:11 +0100 (CET)
Received: from localhost ([::1]:47212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKTCY-0002wu-CW
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 17:55:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nKTAh-0001Zv-Mb
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 17:53:15 -0500
Received: from [2607:f8b0:4864:20::102d] (port=40921
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nKTAf-0004Tz-3C
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 17:53:14 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 n19-20020a17090ade9300b001b9892a7bf9so7749786pjv.5
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 14:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wk5GwAEn92AhNtHexLGSoQji9LZyDgHKd1e1OhndGvw=;
 b=PdwhqoqrnUsVQq+LmcMC/I4hEiGht4RYYuUL/6DCtlIVHA/BWGaV07o0T/IL2xs84I
 wlq6CDk2LHgr6ZUCIS06bXNrWV41QQqyRAuRIOBVwNE6SFGD2oD8UGf29BHZkLux69hS
 5IG+msTxZCH5QXYLKB6WtafHM+5PmHmi25LkeSYgOqLuRLTR7/HIQ6fROF+VI8UEo7H/
 vtekNKISml5cDFIaVTjIdxNTlXcu/gcVTz8vHUgy8+eSwqsz+V7tdf/6vjlsDF2saFHX
 k6h5FkUAz9Bt3LIJpBqR/wSNJrjoyH+jqjpB0wfBW+KRYQOjuehNVCPCcGhEvQkdR8A6
 mvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wk5GwAEn92AhNtHexLGSoQji9LZyDgHKd1e1OhndGvw=;
 b=DM7lPkSG5/MB1loCY4ISCfTINeSlFgEvrcXm5JGrTgeaYAooidrvGQwV9wqyW8cUgS
 rWMNEHFQ+SLjwKIm8Gr1RSTdUJTn6Y5rmEXdrcrFfcpmaxyzfDTVsrUzUuK5m7YbfB3S
 v3G916RHnc/f2JuAmO6dIxpSF3M+BqqhJ9PyoN68xbM/GmH9bM8sE/T6Tdhp/NWCekq7
 v4+0mRsvZzbGsBkz0hLwiaxyAuvELZMfzcdj3ncmVhYL8epWMKDGf6SGPTVOjgGtT+Jh
 V+oYMhad9oYp9EozrQ+Mw8qEIhT/Hoo2Xalu0ZULPQQ3o4OGB81YyoKYdbbw6nAoHifq
 9zbw==
X-Gm-Message-State: AOAM533xf7RAvqUtOOnxmHbIjr0nT6dvp0xvGUg0KTVA+M2telyYysy0
 x07zvpb7z0Nr1MLqPar4Hxpsog==
X-Google-Smtp-Source: ABdhPJyxaQNrKVScga+0GjHhIqDU6/WqVWCA8K1U5/2kTso/iKqesLmYb8GXRDwFhNqq+C4S39Gtiw==
X-Received: by 2002:a17:903:183:b0:14f:2e5:4a85 with SMTP id
 z3-20020a170903018300b0014f02e54a85mr157269plg.45.1645051985211; 
 Wed, 16 Feb 2022 14:53:05 -0800 (PST)
Received: from ?IPV6:2001:8003:3669:700:d582:3903:1efa:60e3?
 ([2001:8003:3669:700:d582:3903:1efa:60e3])
 by smtp.gmail.com with ESMTPSA id h10sm47040812pfc.103.2022.02.16.14.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 14:53:04 -0800 (PST)
Message-ID: <9d21dc04-0010-2ab9-9bc5-d42fa2f06fc0@linaro.org>
Date: Thu, 17 Feb 2022 09:52:59 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] Hexagon (target/hexagon) properly handle NaN in
 dfmin/dfmax/sfmin/sfmax
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <20220216043939.25339-1-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220216043939.25339-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: ale@rev.ng, bcain@quicinc.com, mlambert@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/22 15:39, Taylor Simpson wrote:
> The float??_minnum implementation differs from Hexagon for SNaN,
> it returns NaN, but Hexagon returns the other input.  So, we use
> float??_minimum_number.  For double precision, we check for QNaN and
> raise the invalid flag.

I'm surprised that the behaviour for double differs from single, but the docs are light on 
the subject.  Anyway,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

