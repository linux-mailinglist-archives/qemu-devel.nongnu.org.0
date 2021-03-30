Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C8C34EE01
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 18:36:18 +0200 (CEST)
Received: from localhost ([::1]:48200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRHLl-0000OS-5g
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 12:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRHJH-0007oe-Tg
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 12:33:45 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:45588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRHJE-000739-Kv
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 12:33:43 -0400
Received: by mail-pf1-x42f.google.com with SMTP id h3so12494249pfr.12
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 09:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JO1kK3TqZoUdlLZWfP4FNByL8qI8oxeoWBGz0gOqgHo=;
 b=JS6sqlpfJRpcKuEuyvJeB81VZhb5KacpH0uSP0z7yIGNeY+wOypnHpRlHg+CHztffF
 0ZZVjmcW5DctXBhLFTPnwpKjFJyBeqESr5WN2rSqPziociqF5icEpBBT23bZXdp65Nuk
 YrEtav/gR3DswzKLrqP00OFscs5F+NjeXy8ijnv2u/yafNqkswrF/BhXeODc9VsFUm3Q
 uFtaIG3VYrQ2y3fxp4mtbG/is7jpn6+fSWnrn+h9fN+XTVu8d1gLL9+2F4Ra9C/fG1GR
 zcMsoEs9ZKNi8rz+vXhEJSOklrqqq1KQq4vFeI6aaVnRUp5w8wX8gXHqubF8vdDOncYv
 RwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JO1kK3TqZoUdlLZWfP4FNByL8qI8oxeoWBGz0gOqgHo=;
 b=NDGTwW9UlTvizWnBkyZnoBDDT1XTt61bdL2OeSXjanqQ2udvUBQAtaUmHYzc3fmjnp
 HFLWPJ/DQEiyvvv0m9tN7G8IasUKeg6JhBBIybN+jJRw68SD5aDZlr9XwtJjUUEImxen
 BANSm4aQN5IvGHbAuKPowFPVR/Yybjh1Y+rviv9F+t3oaWDAWl8RlkVpLsz2MseKOkpF
 eUdK2ddNlBicdVBPjgy2whLolrVpwQ7wGuvSTXEWM6MKNvtXNOr1gbAWAXI/I2OORTkP
 kCu/jTNN1DilT/BtHhLXOicY6lIi87rkA07dSKP56AayAuw4Dlpkip5nP0V+1qUopyq8
 Benw==
X-Gm-Message-State: AOAM5301nqcv4as/9PSPxJQZLtEKuihXaFYM3Nl02JYC4pY5LbBGraYD
 ow0bt46Y/oIBbLDSgkJTF42ejQ==
X-Google-Smtp-Source: ABdhPJzcvFlKVmopiLa7w34mLkyoYdCh4LtwkDqNGXp0kjb0HJQVr9GE9KrBFo++ubmwtXttM5/gqA==
X-Received: by 2002:a63:af05:: with SMTP id w5mr30359288pge.153.1617122014515; 
 Tue, 30 Mar 2021 09:33:34 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id bj15sm3200710pjb.9.2021.03.30.09.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 09:33:34 -0700 (PDT)
Subject: Re: [PATCH 1/1] Remove flatview_simplify()
To: FelixCuioc <FelixCui-oc@zhaoxin.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20210329121408.17862-1-FelixCui-oc@zhaoxin.com>
 <20210329121408.17862-2-FelixCui-oc@zhaoxin.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <68af8e22-0380-8459-64c9-cbc5051cd04a@linaro.org>
Date: Tue, 30 Mar 2021 09:33:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210329121408.17862-2-FelixCui-oc@zhaoxin.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: RaymondPang-oc@zhaoxin.com, qemu-devel@nongnu.org, CobeChen-oc@zhaoxin.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/29/21 6:14 AM, FelixCuioc wrote:
> Flatview_simplify() can merge many small memory ranges
> into a large one and contains EHCI dma buffers.
> For example,the merged range maybe0xc0000-0xbfffffff.
> When seabios write PAM register to change the properties
> of part of the merged range from RW to readonly,
> this action cause the merged IOVA mapping will be
> unmapped.But EHCI device still send DMA cycles
> and then IOMMU blocks the DMA cycles of EHCI device.

You've described the problem, and it is quite obviously *not* in memory.c.


r~

