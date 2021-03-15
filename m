Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB48433C5F7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:44:33 +0100 (CET)
Received: from localhost ([::1]:48584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsCe-0002wu-VN
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lLs2y-0006Xs-Fe
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:34:32 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:45468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lLs2w-0004VM-C9
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:34:32 -0400
Received: by mail-io1-xd34.google.com with SMTP id a7so34446948iok.12
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 11:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QSNwBVax6qRWT0QDQ3UFEthjPS0Q7Z8eTuLF0JjOKCA=;
 b=os3GID2CabbLQmnjkeSlbxerYZ0IRx3zy8MMuDcSc0nANtF1fcjvLjGT5bRSxXdK/A
 fIvDKF1KSOSXkFmOXP43H4RjknEf84U1kpJBNcsm9pLyh9ksSLXKi/pWIp8EaoYb3ZH5
 3jS+m6aG+wPojKYKVK4DZWbXupwz1K3ZzwE6dQteTTjZ0rHaxa7ygTHOvbgGuJO+a4xh
 KCH3X0OEHVEFmlM1zs7Ym98qbnAV5lXtmnIDX+F/tV5nGRkE56Gkk3pU7W5OppRezEpd
 5yomZkA6YjLLK33OJkPda178r0UUcszBiKbNAVdins0oLNqo6uO2c09+GljA2SAqiaK6
 ddCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QSNwBVax6qRWT0QDQ3UFEthjPS0Q7Z8eTuLF0JjOKCA=;
 b=FLqnfc7AG9r5du1LVzFeYjOdOWBAj8S5vYmnwDPv2nebik7WV0+wwXY2QnPfE2apnO
 pMI7oFQWZCk5Qnu2nF0Na4ZxMRtbC255I/ekWwVTxkl0M1B9l5qVES2rVm+WdJEciYeE
 DxFqIIfi2vUjV02h6+zs6GlK63yLd4PuYVJBIbZjXAZsA+mU6epwN1Ui/XN+SLQPIVc+
 HKXa8Pe9nwvP0PWqv5cEV3dinZ++0hDvOpZY96DHYy+58aidP7c9xsQIjN9UcjFOy5jg
 oeOrrNw/PaS670FeJdj4rpWa17H+zhJcfAzXBPazcUmC0u+S40v/BW0dvK1WZrfrvCAm
 KBTQ==
X-Gm-Message-State: AOAM533TDfZ48oVe5bLHKvEVoPVknKP3zPIH/Nj+66w+L7DOys3yabep
 ABZHfjAmCTpgeutKb3vvtPcwT/GcUH7Sk8lvy9aJXbldO9V6xSzVQOOdQqBgnyJFrKftTL9Ou06
 udNN3daiPzDQyH5+mUIPd8b7TIQN7Y4/glM5eyCKlrT9NVdKt42ploXlBPsgUejTvlAPmado=
X-Google-Smtp-Source: ABdhPJyVzhTaLrjIJcViyio/qYJpqyiZDGn1630T0R5lbDwbQej64hTRQjosdTgb+lynsD/pwmRnag==
X-Received: by 2002:a05:6638:e93:: with SMTP id
 p19mr10716435jas.10.1615833268486; 
 Mon, 15 Mar 2021 11:34:28 -0700 (PDT)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id f15sm8259675ilj.24.2021.03.15.11.34.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 11:34:28 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] target/arm: Add support for FEAT_TLBIRANGE
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20210310002917.8876-1-rebecca@nuviainc.com>
 <20210310002917.8876-2-rebecca@nuviainc.com>
 <3930c2d8-8972-0acf-7a48-71803072a559@linaro.org>
From: Rebecca Cran <rebecca@nuviainc.com>
Message-ID: <a1fff12e-eef3-f742-be40-3eee395972e7@nuviainc.com>
Date: Mon, 15 Mar 2021 12:34:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <3930c2d8-8972-0acf-7a48-71803072a559@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=rebecca@nuviainc.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 12:24 PM, Richard Henderson wrote:
> On 3/9/21 6:29 PM, Rebecca Cran wrote:
>> +void tlb_flush_page_range_by_mmuidx(CPUState *cpu, target_ulong addr,
>> +                                    unsigned int num_pages, uint16_t 
>> idxmap)
> 
> I am not keen on this interface.  I think you should take either 
> start+end addresses (inclusive) or start+length (in bytes).
> 
> Using num_pages, and as an unsigned int, seems too easy to fail when 
> applied to a different guest.

Do you mean pushing the knowledge of the number of pages to invalidate 
down to cputlb.c? Because I'm thinking there has to be a loop somewhere 
that invalidates each page if a full flush isn't being done?

-- 
Rebecca Cran

