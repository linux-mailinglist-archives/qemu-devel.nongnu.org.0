Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1119B440307
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:18:29 +0200 (CEST)
Received: from localhost ([::1]:37694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgXOW-0007hA-2l
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgXGk-0004wM-9A
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:10:27 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:36798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgXGh-0006v9-Ut
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:10:25 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 75so10780789pga.3
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 12:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nRFWmhLHmt8TNpQr2+1gPgSqa6RYXEyXp59dloRwdmo=;
 b=B4Zv4k05uy837asLrhlOYwFYAGshw5k/qA9TWZ1XCSz6X/fie43BIUuGaMClBZEpwm
 Mk1XAvxv2ih0MgxGil6YswFusQlowHpIByaB7N6vMXIS7UCYsr8ssrqGi3wcgwD1Avpp
 oh78M67RHThFH73Gt61TLD6MfO86GFAvbRLTmZMNxBIypbVjZxNF5kHHrCy2mpu+MRAD
 8ClAMbWcnHnlWpmc5+4SF2Hm6gsDhW+iVGrqF+oOMoITK6SM/OD749DkNjWu9aAzqxh6
 NpMq5QbLgAAB3grbImV9kMjPtIL3gMAZPJNS/iQ3fsTPITPgBqwvSPAXqiMnpweI4MjH
 aXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nRFWmhLHmt8TNpQr2+1gPgSqa6RYXEyXp59dloRwdmo=;
 b=I8ATNpN2j9cbDiEVcvJYQfQkmANUL78029Qa8wnSg2IkNAEhMzebpOdB5h8AcIelPt
 7CQ3CxV5ocRW/xw7iiGHEkpztxQerIY5GoQYM1DwACf4iLHnXZOp7z/PJsQiKLstdunR
 7Zdj+buwWeyNTyQMA4LGc6cLre8Yx+Y6hawxSZi0oz0IsdJkQ3x1xjWK1DpzFYELMV06
 z/99Kn8HwKDODWWM9XnJakIcoDo52Yj7nFLO0m24llyw3cxUBkX/jqhP0TdC/lU5bqcp
 NIxdJNoa0JYXNlQS/HFtQaSgKvuk2WJslft5LBNrL6XMQbYoHcVqfdyKaLym6d+zFEJ/
 MVjA==
X-Gm-Message-State: AOAM530OLYe4efq6zUkbd7l3ibXNraQeacWJomhOCCksVJfDwrhG41Do
 4Pjq58EjDyy35jQGERQiUwOSrw==
X-Google-Smtp-Source: ABdhPJyCuXgaCB8OEHWCSMpsLh0WjijAMlzyuz1mGHfjmYd8wmBf46BziHCkUy5jzUp5zVMcRVRcoA==
X-Received: by 2002:a63:370c:: with SMTP id e12mr9482440pga.359.1635534621435; 
 Fri, 29 Oct 2021 12:10:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id fv9sm11524053pjb.26.2021.10.29.12.10.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 12:10:20 -0700 (PDT)
Subject: Re: [PATCH v4 27/30] Hexagon HVX (tests/tcg/hexagon) vector_add_int
 test
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1634033468-23566-1-git-send-email-tsimpson@quicinc.com>
 <1634033468-23566-28-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <846c6ab0-10cc-03ee-5310-dec65f1c1f09@linaro.org>
Date: Fri, 29 Oct 2021 12:10:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1634033468-23566-28-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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
Cc: ale@rev.ng, bcain@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 3:11 AM, Taylor Simpson wrote:
> Signe-off-by: Taylor Simpson<tsimpson@quicinc.com>

"Signed"

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

