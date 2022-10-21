Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 382016074C1
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 12:13:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olp25-0008L0-7Z
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:13:41 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olon7-0000ba-50
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olomY-0007kU-5R
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:57:52 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olomW-0005LK-68
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:57:37 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 c7-20020a05600c0ac700b003c6cad86f38so4478554wmr.2
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 02:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KF896TDIzcUGMhQJo9DTAWDEyHZePXKhDAxN7g2Jyxs=;
 b=VIwroNG58M68IPtsIx+/OP8ioqN4b7ePq46iBFfXrY4JedsR/IqR+dO/wS4iuPyPYO
 wrf7rLOwe2q3RjuZYEAJwubEi1+IwdJJrbp1kmqOKnvsvvZGwx3rORsyIC4LIcZYl7QF
 G1YuJmynJW9XCKme7Inf/zp0y7CisU+qkKW63r17Pvk6Rl8zFsvY8AAEkpNEEC/U2I2q
 hFdzQdBSAiASgW7QDskxEot59h1Dnlpx4nHcLE2OXhPBBsgMSklN0q6K0Hrq7U3jOD1T
 6GXq45IurtBS7hKNftkPvDTV9r7XAVsNaWSSaqKok6PQa+yYI9OPkAwF3I1KrzHUaL1S
 o4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KF896TDIzcUGMhQJo9DTAWDEyHZePXKhDAxN7g2Jyxs=;
 b=jIFxisf5aF1c8R7gofhGsUHJK/X6bi+SOovmZg0U6O5XUOog9AcVdEP+DOXBRts4D5
 iiQPmlKfg63Xr3ljbKHmZevaAWYirv3ndBrAuaPgBJqoNazjS53NCsMKvq3RMz/3DT5G
 yy6ByBdnkc0Laun1jzpDyL3aCRYbS2UxafkF/l2xXDyqws9GyjwSM5tzd4K2cpehAhrn
 sg+1tzsF0mUxERNmux75m7hWi0oBooCGzlYr2MNRcF+2DA8ZqtZhtsLJ6HB5xgp99585
 VTtbHGS+BQyAwaTjausAQKbsphEhwhYvcIrqRL9O+/1ZhWlIhRqScXSwMDw3f3xo0/Cs
 0I3w==
X-Gm-Message-State: ACrzQf2K3nYPAkMbJ+hnFY/RgKtJJ6uzR1Ll6GfbJVNf5pJKQJQSFpSi
 9KMMdUtQjNipgQ4kIuv6DoZtmA==
X-Google-Smtp-Source: AMsMyM7csx+/LWxUuooXx8Gh7lFNJApks0pj/97wal0ep//azIabvB6nAdvsH9rqJ5WE2hHWvFZjtg==
X-Received: by 2002:a05:600c:19cc:b0:3c6:fbb9:caab with SMTP id
 u12-20020a05600c19cc00b003c6fbb9caabmr14039355wmq.182.1666346253902; 
 Fri, 21 Oct 2022 02:57:33 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 a15-20020adfeecf000000b00228692033dcsm17878281wrp.91.2022.10.21.02.57.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 02:57:33 -0700 (PDT)
Message-ID: <bc6579b9-0ec4-44b9-4f83-56e50929be5a@linaro.org>
Date: Fri, 21 Oct 2022 11:57:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v5 10/14] target/arm: Consider GP an attribute in
 get_phys_addr_lpae
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
 <20221020223548.2310496-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020223548.2310496-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/10/22 00:35, Richard Henderson wrote:
> Both GP and DBM are in the upper attribute block.
> Extend the computation of attrs to include them,
> then simplify the setting of guarded.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


