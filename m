Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BECE5206B7
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 23:36:30 +0200 (CEST)
Received: from localhost ([::1]:42950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noB3N-0001W1-5i
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 17:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1noAz3-0003wM-30
 for qemu-devel@nongnu.org; Mon, 09 May 2022 17:32:01 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:35622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1noAz1-0001jx-Ne
 for qemu-devel@nongnu.org; Mon, 09 May 2022 17:32:00 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso295600wma.0
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 14:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FqI3ECKnOagYECD0Mk3DxNkb/5yJyBe5PAf8v2QhLl4=;
 b=oZKbGfog1DY704nMNMreDUoTh88lPIveNIFLsecbfjDQnLN/BB4UpZqNlya+lfK2Av
 gV+egpyp0En95wFcsH3yYClUkE5trxlbv3rsVCGO4YeEIH68smTKeN294IHWbInQZ12i
 y6CwdX1UhFfX/+A6VN5L67q0N3LLmnwItjF+NQTO5iJO+vp3WVhnnxAXPTNV5zj1Fkg6
 5C2kdo5y7hChEkrHcVvVy5xBKnkb4gLLlaklhR6nzrmE7S3GIYhQ2HNf+sfmN09/lvVt
 n2Ihhs4rWfwBnyZTTv+y6uHtqdiTOo8bBI2dX6uE0t+OL0lhteaDOBWdBJCxdTTWkBWM
 BxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FqI3ECKnOagYECD0Mk3DxNkb/5yJyBe5PAf8v2QhLl4=;
 b=KEGMzEmIq+xcn4oYt358vFM+RCP8opiiYVqZjTUAM7iNe+JlJNQah3NgAljxiW4AKW
 tCLd+fsM1dNFlVjihy8RZ42wUqVu1jE88kSuO/6QiZADnzJ58LRsDZNazMIOFi+bmCnZ
 0D9OvQ8/SJRzXaZoOJ8zbPP1eN2W/9VHZNuW+B7wXzhirTtzbhcr7DUTp68lz8ntorUK
 mBA8imzmUpc6LJkCF+6SiIUOqqpGgMUBjkPFUvKhNeVMA1EbfcK3CQH90ac7wI7Bx4R/
 WT/7GcSeFx3cBRXElDuAB0gRaZPc26RQTDqWQeyzSEFlaXMbwz3jo1zhiX1m9YRtWWrG
 QWaw==
X-Gm-Message-State: AOAM532O0+O8pOKqsgCbnzsoKLfxpYWCj++8DRu7ZM6WzGNNoTn9Q9S7
 /9xNudOKLNGu+n5NWG04OlDXd18uSYo=
X-Google-Smtp-Source: ABdhPJzGdAfHcm1mFJzDHXoaxSBUK2G9JJl6LAk9JVOhsk83/7v3OUmIyXjrEXHj7T9izqth4KQ4EQ==
X-Received: by 2002:a05:600c:3658:b0:394:725:be12 with SMTP id
 y24-20020a05600c365800b003940725be12mr18240071wmq.192.1652131918513; 
 Mon, 09 May 2022 14:31:58 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d510b000000b0020c5253d8c9sm11941854wrt.21.2022.05.09.14.31.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 14:31:58 -0700 (PDT)
Message-ID: <8d97dabc-f341-6fbb-695f-434d87b2e041@amsat.org>
Date: Mon, 9 May 2022 23:31:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH] Hexagon (target/hexagon) remove unused encodings
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, ale@rev.ng, bcain@quicinc.com,
 mlambert@quicinc.com
References: <20220509211405.18581-1-tsimpson@quicinc.com>
 <20220509211405.18581-4-tsimpson@quicinc.com>
In-Reply-To: <20220509211405.18581-4-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 9/5/22 23:14, Taylor Simpson wrote:
> Remove encodings guarded by ifdef that is not defined
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/imported/encode_pp.def | 23 -----------------------
>   1 file changed, 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

