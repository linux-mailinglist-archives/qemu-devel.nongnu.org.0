Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7A25296C6
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 03:34:54 +0200 (CEST)
Received: from localhost ([::1]:54250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqm6v-0007vK-G2
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 21:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqm5a-0006EW-2a
 for qemu-devel@nongnu.org; Mon, 16 May 2022 21:33:30 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:39492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqm5Y-000286-4r
 for qemu-devel@nongnu.org; Mon, 16 May 2022 21:33:29 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 t11-20020a17090a6a0b00b001df6f318a8bso1021251pjj.4
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 18:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HGoxzI4jnvVcf7zS47tdiPBWgz41Ine7m3t7TzQGDms=;
 b=kVPPN4AcO/oAP6CmvhOM4HISsWCxczByhu5u4mvYD5KCliGeW21/iNplsbaNRdlvnT
 8maENtnBe/sCJvcJbXhr1ImWteNzIJacew6m8wEEgVRtmBeJuMxdMobTQQAs0Z7YKkNb
 Ew8zLgSvBNFJjDtxPTyEzivx6MCwk1UWE5vE9wshqdO1Q4zvGNbUlFyA4OOKzKrHBgjo
 BxIHl14XvrJ+yQdmeu1FNxM5Cv15Mc6DdpQrXTuWxEUy9TASl8S95+HfRV+0AnMNDc2J
 CMywVBo2sYjS+cBOMJep+fl/yvuUrHNoiY+xy1I65hUPFTcOyksW9ex5ImrZq2sgLGE+
 1R1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HGoxzI4jnvVcf7zS47tdiPBWgz41Ine7m3t7TzQGDms=;
 b=Ehg/2XeEogxvIENcoAdWU2unLlxCyxnF8VMXf8iJ9OlV7faqSJ0iVRXY8aDmdlKI6x
 h1MM6tuZQDRTFv7A419ha3lvdiMBRqx11ssIivN4t2aYToRd9kBasE5+OniezSDEdo8Y
 dTpbAmsFQDMhYKJidk42ZpP0tZ1Uy6U2MX3YB39/Fa2edkswnDchOnS9FcmCpyZkWjTN
 yl6MCneqGgYZGXoTNbCTPQ/nsI4hA4jqhUITFJ+JLSkzzT0AwfvMHtBg9mitGTCYp0kE
 K2oro7CQkXoRfNJsWLGtVqYaWJGEIxx+cfdQJ8bj+JNyztE3OFAcLIU2Mp/WJgcpigDp
 hmaQ==
X-Gm-Message-State: AOAM530nAO2H6Cb/Ukz440Bdnt3MKefBTi1YMY6hgBMvz/Gq1jebAM89
 9BprNd50H6RL+rml2VVP0Khapg==
X-Google-Smtp-Source: ABdhPJy9xTqppvrq8ncES/Ql2D1CqDE/ukf16/Tlv6v+1FKVmcQww/sqzxR7vbXELvxOE0AqzLZPYQ==
X-Received: by 2002:a17:90a:5908:b0:1df:1232:d47c with SMTP id
 k8-20020a17090a590800b001df1232d47cmr15112051pji.5.1652751206667; 
 Mon, 16 May 2022 18:33:26 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a1709029a0c00b0015e8d4eb242sm7627439plp.140.2022.05.16.18.33.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 18:33:26 -0700 (PDT)
Message-ID: <bc79112d-f0c5-7f3f-5818-a024b966c585@linaro.org>
Date: Mon, 16 May 2022 18:33:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 05/74] semihosting: Add target_strlen for
 softmmu-uaccess.h
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
 <20220503194843.1379101-6-richard.henderson@linaro.org>
 <CAFEAcA-Ne6c8AjretP4cuSEajOHSbFwFCTVFm3a=w8gm+zzkbw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-Ne6c8AjretP4cuSEajOHSbFwFCTVFm3a=w8gm+zzkbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/16/22 08:11, Peter Maydell wrote:
>> +        chunk = -(addr | TARGET_PAGE_MASK);
> 
> 'chunk' is unsigned but we're assigning it a negative number here...
> I assume this is doing some clever bit-twiddling trick but it isn't
> very obvious.

Number of bytes left in page -- I'll rename the variable.

> In any case, rounding to a page boundary isn't sufficient to
> avoid problems, because we don't mandate that RAM-to-device
> MemoryRegion boundaries happen on page boundaries. I think you
> either need to do this at a low enough level that you can
> look at what MemoryRegion types you're reading from, or you need
> to do it byte at a time.

Easy enough to use probe_access_flags.


r~

