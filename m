Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E50049F6D4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 11:06:42 +0100 (CET)
Received: from localhost ([::1]:57768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDO9Q-0007rF-Ox
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 05:06:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nDO4e-0006Nt-HO
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 05:01:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nDO4c-00043C-9Z
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 05:01:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643364100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v68MJEoDCvAlfTpX+eF/vA70bwnzsgjAdyequeEm8OU=;
 b=eYqxbfwPGnVteVoIFvQHiCBUpX3ZFu3Z+gauAHDeVuuvaRwZ3Vr0vbDvcjsJT0+KQ2Rd3Z
 MhEgU1jSh9asDv9uxsfTdOKDSjlP7YNvF6QlZeqi6MbHykKJvsaR6F0WYUFNGYWvPFwH6+
 P+m0dY91je5e4cwJAOGjz/krEbNHIEU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-sYh-_xpuPh-CKlh4jVTXxg-1; Fri, 28 Jan 2022 05:01:37 -0500
X-MC-Unique: sYh-_xpuPh-CKlh4jVTXxg-1
Received: by mail-wr1-f70.google.com with SMTP id
 r27-20020adfb1db000000b001d7567e33baso2051483wra.12
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 02:01:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=v68MJEoDCvAlfTpX+eF/vA70bwnzsgjAdyequeEm8OU=;
 b=NP68Y47ccy6Xel2ZN1xbRTS/4ttzNRJ+YgZdH+uj0xs6ZeAAOtKWCPYp510yEIwo3d
 DEPxs+20GYOZRKSV+x6BkWEBt2HrTV+9Nj/wMx7knA4NogduHlytFhCrf5p/0Nz+3EAN
 AxcC/XniK1q/3zSJLW9ZYBl9oEXmxEnai1SobBQpmGDuuVliqf+NAxbmzenXp4G9gsfj
 xbdvlUeIek6VIL7vH4hNwrTQ5QbsIxJ7i0NHwZYHNKLluVWrDj0/IV3RIW1r4MOTDMTN
 fxIvMdJnusW+FmpCNL1/N7XTH5ns981IoTvmKWEG0OG/Fh4c21JLXrtgR/f4YVtGZuaV
 +ZMA==
X-Gm-Message-State: AOAM530DhjFgnZ/hiBSLDzBHKhTQ4lYObz/5k1n5nh0/cknI2+hbj2ME
 OaI//W/IcI40eqyWBWPG+EXLSy5Jdp0kmjRn7CVvyPdZ4YmcNE4AZNXEgSoU3Sj5MYvheS9Z+qn
 AdvnIbeM+J84we1o=
X-Received: by 2002:a5d:6f13:: with SMTP id ay19mr6549684wrb.142.1643364096509; 
 Fri, 28 Jan 2022 02:01:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPMVqmcjgdQvzbSAcg8Lt4tnZKlahOkes8AhdNGV97MHEExIeL5qWlk93V87mi5ayhXV7/Hg==
X-Received: by 2002:a5d:6f13:: with SMTP id ay19mr6549666wrb.142.1643364096270; 
 Fri, 28 Jan 2022 02:01:36 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id t14sm1555187wmq.43.2022.01.28.02.01.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jan 2022 02:01:35 -0800 (PST)
Message-ID: <db8200f2-8c67-f0ed-931c-7406412a6024@redhat.com>
Date: Fri, 28 Jan 2022 11:01:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH qemu v2] s390x: sck: load into a temporary not into in1
To: David Hildenbrand <david@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, Nico Boehr <nrb@linux.ibm.com>,
 qemu-devel@nongnu.org
References: <20220126084201.774457-1-nrb@linux.ibm.com>
 <a90563ea-2740-d4ca-d2f3-6b6861faf0de@linux.ibm.com>
 <463337d3-dad9-abbc-b0e3-544e08160234@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <463337d3-dad9-abbc-b0e3-544e08160234@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: linux-s390@vger.kernel.org, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/01/2022 11.45, David Hildenbrand wrote:
> On 27.01.22 11:32, Janosch Frank wrote:
>> On 1/26/22 09:42, Nico Boehr wrote:
>>> We previously loaded into in1, but in1 is not filled during
>>> disassembly and hence always zero. This leads to an assertion failure:
>>>
>>>     qemu-system-s390x: /home/nrb/qemu/include/tcg/tcg.h:654: temp_idx:
>>>     Assertion `n >= 0 && n < tcg_ctx->nb_temps' failed.`
>>>
>>> Instead, use in2_la2_m64a to load from storage into in2 and pass that to
>>> the helper, which matches what we already do for SCKC.
>>>
>>> This fixes the SCK test I sent here under TCG:
>>> <https://www.spinics.net/lists/kvm/msg265169.html>
>>>
>>> Suggested-by: David Hildenbrand <david@redhat.com>
>>> Signed-off-by: Nico Boehr <nrb@linux.ibm.com>
>>
>> @David: Was this already broken when it was implemented?
>> I.e. do we want a "Fixes: 9dc67537 ("s390x/tcg: implement SET CLOCK ")" tag?
> 
> That sounds about right.

Thanks, queued to my s390x-next branch now:

https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas



