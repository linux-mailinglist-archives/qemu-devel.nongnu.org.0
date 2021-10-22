Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFB14378F7
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 16:21:32 +0200 (CEST)
Received: from localhost ([::1]:58946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdvQJ-0008Bd-L7
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 10:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdvEB-0001jn-VP
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 10:09:01 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdvE6-0003NZ-K5
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 10:08:59 -0400
Received: by mail-wr1-x435.google.com with SMTP id z14so4042002wrg.6
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 07:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fE+AN6obiqV59tVqbKS4Ce7cEkejLhUl12zyjOeU8nk=;
 b=qz8FCTOmQcIKZib+DD6JuTZYnZzTPGdMGWQGZsxiJlcz2ePLErgD/cmbaYzCpFyFF/
 u35QyJENgbCu8iDmd9DwPtg+DznIm2SpE0VbvqQeVfViJ0Mseh8zSA77THJEhkpkLapv
 P6JwVdbpm74WCDY90U81reRwKSH834WAN09Bol54g0MwKqiTjQzFlRyiK3VQCKqltfaG
 +WQQCMs/MKkBNxmS942J/l+qRAGIy7gUN13SKzgkAYIOZ90AjCYKijILS8brAJJtdMQY
 Sml1uRGmwwZRQv67i07/jArVekrWEFKpeJN1aXvCl7Bfxry/5h+GWi0HxPx97iW2iNsK
 VAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fE+AN6obiqV59tVqbKS4Ce7cEkejLhUl12zyjOeU8nk=;
 b=nuntJ/hgHudGAK7SpW8XusOOUvLkuZCRUiF1M2ZIWOO+/oEbvdX7bB7WfSgMOICHLl
 bAE55HI9qqTmVTw9csZ2h9xvJhRnLtDJWBDZ8wmVqtvOxwZ8W7uvK5s1YGiTtYzaMqzP
 zeeeoHLX1ygcAU5WZfaPFJG2hYwDZQlXcROcdFcIBof1sB4m1G/ISdWDIA+Go1edadZ3
 jXWUI6PjbF7tPQQ2NWlAnSCSpaXkwis9PZywZI71cHDWZP4HU63GPmhRuCzHq3tlwx0D
 5k/wypjhdjdIJE92lmh+kuWs2q495Hsol4KCStnVhcLhdwwpswwW8P496b0mxOOAjvvQ
 Hu+A==
X-Gm-Message-State: AOAM530Uwbc2O4jsTEbRqtim06hxWdElAO5k+NBO8pC02xa/Go6I4Vha
 Z8/aCbRO7hOuo/xIAlKm7mRhpOXFaBQ=
X-Google-Smtp-Source: ABdhPJzRWdUepH8x+3zE39qOpw+qn/RMot6dovNbnOltYgo3V5tajTSHysJFyKeh20No3EyfuKpaXg==
X-Received: by 2002:adf:f98e:: with SMTP id f14mr75935wrr.247.1634911733365;
 Fri, 22 Oct 2021 07:08:53 -0700 (PDT)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id i8sm7907810wrv.47.2021.10.22.07.08.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 07:08:52 -0700 (PDT)
Message-ID: <f99b0fde-ccdf-9d73-fe9c-6b4e28d77e30@amsat.org>
Date: Fri, 22 Oct 2021 16:08:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 24/48] tcg/optimize: Split out fold_extract,
 fold_sextract
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-25-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211021210539.825582-25-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.742,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 23:05, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 48 ++++++++++++++++++++++++++++++------------------
>  1 file changed, 30 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

