Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A63C758ACEA
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 17:07:11 +0200 (CEST)
Received: from localhost ([::1]:35456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJyus-0006px-GU
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 11:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJytL-00053C-Q2
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:05:37 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:41904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJytE-0005AY-3n
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:05:31 -0400
Received: by mail-pg1-x536.google.com with SMTP id 13so2885556pgc.8
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 08:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Uk5rqI5pWGrGp1CYZtWwHjDoXBVjHldQGDw1Al89pXI=;
 b=f+fuTboKKYHdK7EtsxpzVw0cTV4d/paQlFkhS7tC2Rw4u41Ugl0GpDoxdSoP3hXbgJ
 xLeNW+bANicU64SRbP0B5AdksRqYo70RHvOws/E/thnNiavLx4Not1VpV5XQ1zE98Pds
 hQUUliqqducT/MHCX7zovJhGRq95Mh9YCMg3UIZrNiMuDB3XTchlEebhh2LZlScv+5aZ
 qUIMs2EIC9wQ62fKMAp0/1K01zMY5rnRi9ETejoTzOi9vvne1jKquWsw+HgmUJxf+VKF
 3cRux7/L9gqSo7t0ZQHpVKSHQP6Z50olythfszjX/bgro79BF2pe7fI5+Qh8zWxinUM8
 uRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Uk5rqI5pWGrGp1CYZtWwHjDoXBVjHldQGDw1Al89pXI=;
 b=E8x8ixdrJWejvKswkK8A/VZ/4KclOkpTQoKD2aZE886ijgJGO3aEprwA5d/7CFiDKQ
 3d6TAzOgkUKYcfdG2quvkFqNZOY7S2+EuATo4uaUg/DMZVusSTNHGz2M1ZmpCwJVd+sH
 ko/L8ja8SHC160oLB7+5Ll+Rnts4M8KwsP/05y2FfkGBUNExCAF2ospZajDT1qMpMYbG
 fRaE5qcUdJ62441eBTotZaLpvDlDP3ohI3uCNOvvy1xYf/PjPRmCS7AotkbfwIT/Ee0e
 XmDec3oI9yXHEIvqy6/+S9z2bKncLvWvQxEy2TPkxhZNgmGZE9gRSm6aLVUyE038Y3I4
 nc8Q==
X-Gm-Message-State: ACgBeo1/b490j510midJho4dTbGM1aZZD6CSFEqsGVi22RSM3LelWpY1
 e82ssGV0L2WDt8uSjMVRzEwAwg==
X-Google-Smtp-Source: AA6agR4rmXC0BShnyX1Tms0MoXZS7cdoDo61CndyYfF5BeWOmHgGFWvlmcGaDKiZ1eiz8m75uxcFEw==
X-Received: by 2002:a63:d55:0:b0:41c:86b0:59b5 with SMTP id
 21-20020a630d55000000b0041c86b059b5mr6086425pgn.351.1659711926127; 
 Fri, 05 Aug 2022 08:05:26 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:abf8:e436:f4c:9089?
 ([2602:ae:154e:e201:abf8:e436:f4c:9089])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170902c20d00b0016e808dbe55sm3101957pll.96.2022.08.05.08.05.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 08:05:25 -0700 (PDT)
Message-ID: <9ce9aa46-dacd-d7de-dc68-872351b49699@linaro.org>
Date: Fri, 5 Aug 2022 08:05:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1 v2 4/5] target/loongarch: Update loongarch-fpu.xml
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, f4bug@amsat.org, alex.bennee@linaro.org,
 yangxiaojuan@loongson.cn
References: <20220805033523.1416837-1-gaosong@loongson.cn>
 <20220805033523.1416837-5-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220805033523.1416837-5-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

On 8/4/22 20:35, Song Gao wrote:
> Rename loongarch-fpu64.xml to loongarch-fpu.xml and update loongarch-fpu.xml to match upstream GDB [1]
> 
> [1]:https://github.com/bminor/binutils-gdb/blob/master/gdb/features/loongarch/fpu.xml
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   configs/targets/loongarch64-softmmu.mak |  2 +-
>   gdb-xml/loongarch-fpu.xml               | 50 ++++++++++++++++++++++
>   gdb-xml/loongarch-fpu64.xml             | 57 -------------------------
>   target/loongarch/gdbstub.c              |  2 +-
>   4 files changed, 52 insertions(+), 59 deletions(-)
>   create mode 100644 gdb-xml/loongarch-fpu.xml
>   delete mode 100644 gdb-xml/loongarch-fpu64.xml

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

