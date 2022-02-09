Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1719C4AEE04
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 10:29:31 +0100 (CET)
Received: from localhost ([::1]:55004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHjI1-0007Iy-S7
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 04:29:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <like.xu.linux@gmail.com>)
 id 1nHj3n-0007wW-BQ
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 04:14:49 -0500
Received: from [2607:f8b0:4864:20::42a] (port=44975
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <like.xu.linux@gmail.com>)
 id 1nHj3h-0001SZ-OO
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 04:14:44 -0500
Received: by mail-pf1-x42a.google.com with SMTP id y8so460115pfa.11
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 01:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:cc:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eS24qNdegIWCdHUi8b2hejyGS+Oi29jL5tYMjfpE3SI=;
 b=TtrsaU40achQzujy1rNECYWMBqDpsytYbX5mv0c/WYCrSh7Df2smiRbELWG99GGaku
 P4rmxVMd6TOSSbnuHemBRH95HCVLvredGtjzAkKc3iIQQr85arjgELJSnKnYmDeSDLq0
 Pqr3HrQaK1hC6ku0vpFD/Fp1OYZVV1+ANLCL/Y0OL4X9S95vqp7ZHTI27VR653n8J8Fx
 d3YbMaIhYoRGYMPfzgageLQoJLbH8A0snx11xKUnPXsfkhdW5Eju+u+yg0tkOm35isyv
 7wZ2/IMXWHHk1tfrEtLPT0giISYycggTuntP0I3QAPJwY9oNsH6rVYwxQ/CZlLMfHllI
 3A4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eS24qNdegIWCdHUi8b2hejyGS+Oi29jL5tYMjfpE3SI=;
 b=NNfknKqCBCuECKog/tIw9mDi4dHcHI8yTZ8REP/k68DQ3vEW8uSEx/nIXU9hibEn+q
 FyKpNjyC1AUtXtvU8u2P8Wo5zNoMN59xIk5QUVV5HfLHIYxaL5Mw1C1BHeyIqaGRPkQo
 +mPLfVKZWjpKKAm/0O8Sm7bU+HvsxDr9HSfmoNd4rZLXAUAg34Qq7yn2tn5gRswV71Ib
 0rJYMjyuA9gLCwx+315kqYMrLuLhjH6EGkyi62LgqU+6ws0fO5qbWLGpw118g/hHWs5A
 rJkDmPbhj+jlXBwFW+uCzF88+MvE9N2f7jZhBA1aJiIbHunKnYGkLywF0e6pYEMU+Y9x
 tgAw==
X-Gm-Message-State: AOAM532Nm9s+y7TpqyuJBBvtoAAzr4vkI6j0JrU8wFPum42xZdzQNPlP
 cA54IGchbU5AmOza/f+Bc2g=
X-Google-Smtp-Source: ABdhPJw5UWH0anEoO2uEPvQY29O0uY8OHqH5jsXXXp7i9xHQQvi4zXUqhjJ8Kt5tQmCYKT/oXBXcxw==
X-Received: by 2002:a63:5166:: with SMTP id r38mr1137257pgl.99.1644398073469; 
 Wed, 09 Feb 2022 01:14:33 -0800 (PST)
Received: from [192.168.255.10] ([103.7.29.32])
 by smtp.gmail.com with ESMTPSA id d10sm18714695pfl.16.2022.02.09.01.14.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 01:14:33 -0800 (PST)
Message-ID: <e2c18d80-7c4e-6a0a-d37e-3a585d53d3f2@gmail.com>
Date: Wed, 9 Feb 2022 17:14:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v5 0/2] Enable legacy LBR support for guest
Content-Language: en-US
To: Yang Weijiang <weijiang.yang@intel.com>
References: <20220122161201.73528-1-weijiang.yang@intel.com>
From: Like Xu <like.xu.linux@gmail.com>
Organization: Tencent
In-Reply-To: <20220122161201.73528-1-weijiang.yang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=like.xu.linux@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: ehabkost@redhat.com, kvm@vger.kernel.org, mtosatti@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, wei.w.wang@intel.com,
 likexu@tencent.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Weijiang,

On 23/1/2022 12:11 am, Yang Weijiang wrote:
> KVM legacy LBR patches have been merged in kernel 5.12, this patchset
> is to expose the feature to guest from the perf capability MSR. Qemu can
> add LBR format in cpu option to achieve it, e.g., -cpu host,lbr-fmt=0x5,

Some older Intel CPUs may have lbr-fmt=LBR_FORMAT_32 (which is 0), would
you help verify that KVM is supported on these platforms ? If so, how do we enable
guest LBR form the QEMU side, w/ -cpu host,lbr-fmt=0x0 ?

> the format should match host value in IA32_PERF_CAPABILITIES.
> 
> Note, KVM legacy LBR solution accelerates guest perf performace by LBR MSR
> passthrough so it requires guest cpu model matches that of host's, i.e.,

Would you help add live migration support across host/guest CPU models when
hosts at both ends have the same number of LBR entries and the same lbr-fmt ?

Thanks,
Like Xu

> only -cpu host is supported.
> 
> Change in v5:
> 	1. This patchset is rebased on tip : 6621441db5
> 	2. No functional change since v4.

