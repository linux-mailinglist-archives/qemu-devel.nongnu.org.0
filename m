Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8F36FB3A4
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 17:19:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw2e0-0001KM-0o; Mon, 08 May 2023 11:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw2dw-0001Ji-AH
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:19:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw2du-0002hs-O6
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:19:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683559153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fyH+UM+hDl2i0gW06V9az774cvFGYQFXrAAvVExuUtI=;
 b=hJp/MiG3g1JDCfdWHFDn2hcbT3maR/FqZb4JPxqrznoaffG1KTAp30brhSh6xDpoHCCKkY
 SfniFfXuCoTCapTNfuUMEcKnv6Zm0xwHlW19CuR5P9af5ieoQXcHhI1d/RQYAC8uIH+ow3
 M4xW1BDuTUKjkO2jupzLK2wfckpNhjU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-3ZMZF1dzNvCQLSCVqB8RSA-1; Mon, 08 May 2023 11:19:12 -0400
X-MC-Unique: 3ZMZF1dzNvCQLSCVqB8RSA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-30620ebd3c2so2834095f8f.0
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 08:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683559151; x=1686151151;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fyH+UM+hDl2i0gW06V9az774cvFGYQFXrAAvVExuUtI=;
 b=NMgk+IC01XqBazPWggAm4bIyX2ra02IKiuMFUG8WRBYfrPoudgfKpefLtFidezP9Ve
 LQqJePb8+zZwPcmIJe88ZeU2Eyf4RbkrbfkjnD8ayDp6EsvaoNriptIXGkk9qNYwavye
 B5r+O4+2kDEo46nSnxH2XGM3LtD4kmn/PMgCMKAKp6io8TBxcU/h5wVQ6m3Y2u4Ijm4o
 pSM0oAJde5OH7Gs9T6Cej6eyxEIHnrDlrDpYFtvi+h3LLQgchvWYCTpfM1TO6U4dKIMn
 vVHf2mK2V2fQJKyOil9sjIY9zCsTngFBrswZQNpxY1O+svCPRls8a2zy180LG7J4MJGL
 1UYA==
X-Gm-Message-State: AC+VfDwM28CSdWePUnFY8zsSrE0Xebjrg3p0SvJstlcYxOHdtUVJE1sS
 akz+yJhxtbBOmuzflV8XU2ErgIFsWub9ksoruU1UhIovwXuiScwuHE4qQBLWOcboj6QVmHRBVCA
 o8RLtQzMX8GSgd4h0z1l/ma4=
X-Received: by 2002:a05:6000:c1:b0:307:9473:fe26 with SMTP id
 q1-20020a05600000c100b003079473fe26mr2962894wrx.26.1683559151457; 
 Mon, 08 May 2023 08:19:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5a/BMaqua0TZAFqY9UcY0/z1DSr0zb/qDfGG+pFejpFLgDYzsknfpKLiWCsLCnA58AIq5rGQ==
X-Received: by 2002:a05:6000:c1:b0:307:9473:fe26 with SMTP id
 q1-20020a05600000c100b003079473fe26mr2962877wrx.26.1683559151149; 
 Mon, 08 May 2023 08:19:11 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-212.web.vodafone.de.
 [109.43.179.212]) by smtp.gmail.com with ESMTPSA id
 i8-20020a5d6308000000b003079ed1f0a0sm605368wru.44.2023.05.08.08.19.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 08:19:10 -0700 (PDT)
Message-ID: <b9739a63-0d87-1b74-c232-9c566ab821bf@redhat.com>
Date: Mon, 8 May 2023 17:19:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 83/84] exec/poison: Do not poison CONFIG_SOFTMMU
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-84-richard.henderson@linaro.org>
 <c0e49af2-21dd-03db-0604-194a298d7a58@redhat.com>
 <21998b5c-43a2-f7e5-9515-45745441a12e@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <21998b5c-43a2-f7e5-9515-45745441a12e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.802, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 08/05/2023 17.14, Paolo Bonzini wrote:
> On 5/8/23 16:27, Thomas Huth wrote:
>> On 03/05/2023 09.23, Richard Henderson wrote:
>>> If CONFIG_USER_ONLY is ok generically, so is CONFIG_SOFTMMU,
>>> because they are exactly opposite.
>>
>> I thought there was a difference ... at least in the past?
>> But looking at meson.build they seem to be handled quite equally now:
>>
>> common_ss.add_all(when: 'CONFIG_SOFTMMU', if_true: [softmmu_ss])
>> common_ss.add_all(when: 'CONFIG_USER_ONLY', if_true: user_ss)
>>
>> Paolo, do you remember whether there was a difference in the past?
> 
> No, I don't think so.  Really _none_ of them are okay in general, but now 
> that we have softmmu_ss/user_ss there is a usecase for using them in 
> "generic" sourcesets.  So perhaps we could have something like
> 
> /* One of these is always defined in files that can use them.  */
> #if !defined CONFIG_SOFTMMU && !defined CONFIG_USER_ONLY
> #pragma GCC poison CONFIG_SOFTMMU
> #pragma GCC poison CONFIG_USER_ONLY
> #endif

That's the thing that I had in mind:

https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg05269.html

... so instead of removing the poison from CONFIG_SOFTMMU, we should likely 
rather try to get CONFIG_USER_ONLY poisoned, too.

  Thomas


