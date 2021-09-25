Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA064180FD
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 12:19:08 +0200 (CEST)
Received: from localhost ([::1]:51100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU4lv-0004mT-JB
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 06:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU4kQ-0003xW-Ca
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:17:34 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU4kO-0005uI-T0
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:17:34 -0400
Received: by mail-wr1-x435.google.com with SMTP id g16so35063801wrb.3
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 03:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C8lR3x4ycCbbGr47Ba8LOalWDpw5q0ROhTbR5WD5rLA=;
 b=ISiNBNcxOBNo6hDBT7kMYM1V9qff2VON9g1PgH+mkFzc28vyMXAjwYQM4PnpO459ZC
 eUcohQ5Rcp0f9mdrdK/TP7XYw20D8ugNcKqPVUKFqDLpth+28e60I5PS+BfwYbbomhZx
 2MnwLFPa/6r/Y5B3oyyo4trFRiXTKuhluF1tTPLJNhGMAQaasKGRg8Pfdexd1BEQXdp6
 H1L72BfWn7mQqjsQSevAakVFqqOaz3gsxLjXY2hWAhXbWgQDusDOOZLRqU4rz5ulYqUh
 ZRzhX/vfE89WgFxKwBJyIkO5AkpPF9wH81ZB/WwT7ravOP9gyh3rzSceMlNV6VTPPpyV
 Lw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C8lR3x4ycCbbGr47Ba8LOalWDpw5q0ROhTbR5WD5rLA=;
 b=7WqJ/4LnbZ0zP7nIpX3AcwbnHSyf6BS0KP0VWX8fCRwfUspAC6B0q67O0oj9fZhFyC
 MB4RGuD2zKHUsI1XFKxUHddHyXvCHhA6SZ7wfFlmcFHX4+4Ds9NIzZErRbHgU070G0/6
 dz0vSXR6sSgfdBqfdm8CM6Oizr4D9HZCASfZ8v0oAkt4SarZATkoQA6DHopu1wEyzSc2
 KnODOAWlUc+hYKabmMEIKLfBsWdwKfmuD4o7L/VHt4RTG+R8hX59wlsU1xnYONBA9hIy
 +iz4eomdlZ53pbFp8kX6y5of3eA22xlituRsC0w5xL8Gz9ogyuCA2MB1XYdL6KbVCm1/
 aIzQ==
X-Gm-Message-State: AOAM5310/YWX28LSp3Yxbl2TZ2spTOc5KEDPLZC4/MSal80pj2OVA/Is
 eFugw5AhdRpnWxn2fHY9zf0NWbYROjk=
X-Google-Smtp-Source: ABdhPJzk4PFlotz3vSWgfp7PBW0Hfj1Yc0CRmJdo1aBbrl076P49vq7VjTss3ouL4J9+q6XoEbgh9A==
X-Received: by 2002:adf:e68e:: with SMTP id r14mr4354936wrm.344.1632565051511; 
 Sat, 25 Sep 2021 03:17:31 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id m29sm10966549wrb.89.2021.09.25.03.17.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 03:17:31 -0700 (PDT)
Message-ID: <6e49cc93-50b8-02ec-bdaf-b231d1a47790@amsat.org>
Date: Sat, 25 Sep 2021 12:17:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 22/30] tcg/loongarch64: Implement simple load/store ops
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210924172527.904294-1-git@xen0n.name>
 <20210924172527.904294-23-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210924172527.904294-23-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 19:25, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-target-con-set.h |   1 +
>   tcg/loongarch64/tcg-target.c.inc     | 131 +++++++++++++++++++++++++++
>   2 files changed, 132 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

