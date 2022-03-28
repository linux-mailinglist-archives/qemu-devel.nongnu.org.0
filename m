Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C194EA308
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 00:36:36 +0200 (CEST)
Received: from localhost ([::1]:49112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYxyV-0006ry-RF
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 18:36:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYxx3-0005V4-Ge
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:35:05 -0400
Received: from [2607:f8b0:4864:20::42a] (port=46859
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYxx1-000703-Rj
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:35:05 -0400
Received: by mail-pf1-x42a.google.com with SMTP id s11so14134080pfu.13
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 15:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rVi5wBaYGVRhec3bBjG6/wWnk+oXrbLgRpQJ/k+Evn8=;
 b=Z0KotQJCS0mKVtrkhwd9HM2JFVFFw7sqlou4mTeDmotfAjl6zO4/xejlvTiSYyV3N/
 lNyFgxihZq6gyuXO8/9bEj83T68wIxnnKg/lhVy4Evy3Rf6nE8rZ7JX0NaFhTISic7PC
 zRpAxzaLbuca76phQtyKRpapAZtn5Wz2WbWMPo5CgOVSeiLszt+fhvxkDBUTeq2UpGIY
 FCBV8kPFK3hOlW8lpcV6MWNaWXa5AaiHl/SIEGVUt3tyrkMUQdTQAi9DeBz/vn4R1GDQ
 LTWxtQoeJnliQtd4FJ4PnfGrjg2YmpFLa631G73Ie64Qpc0wvf9rBQ4ErQGC6gUp4UL4
 KbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rVi5wBaYGVRhec3bBjG6/wWnk+oXrbLgRpQJ/k+Evn8=;
 b=5zBKcP9rV2BF3E2RWIs2AaAVpN2gVgyb+uEweQLk27NSY1ULwaWO0He88eZD0eA3Ow
 idO0CJcCKs8c9VWRCFA1Or255wMSUraLweQ6AbG9MzHbBnr3YB9fMMzSkfL5Xo+Bdmh2
 Tgsdb3IThALnkPa389XSKGATp8o4pslCUFJLadzVMyvMZ1QElKX/Cq415XxjtgW/zIDO
 dxaE7X3bRhyY3GCotCCnsjN9+zk61WuR82ML8wWtNoMjMdD2DDizgdWtwIom30Tx6uQl
 iRvQnC8kaoJOG1U+e5VAADBCgfIsMwbzPrmJBwqPmYxl9ULVn94oCiLnLlpwdVrUYEd2
 oZMg==
X-Gm-Message-State: AOAM533m3OC3O3boQgPabM19GSx2tO95vPa/5808qfx1yOkxRzzd7yjj
 vTXGpd/JIVMbfxrza91q5SulMTqJwTmPPw==
X-Google-Smtp-Source: ABdhPJxgH3ulJR47JRo55qQsqyjQ+d5t0LBrtBAnVpd4l1rxLBrgRRL/tBPH6D9b+TEmWvVzCQt/Ig==
X-Received: by 2002:a65:6943:0:b0:376:333b:1025 with SMTP id
 w3-20020a656943000000b00376333b1025mr11755901pgq.164.1648506902453; 
 Mon, 28 Mar 2022 15:35:02 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:3c84:1cd:456b:b750?
 ([2600:70ff:f07f:0:3c84:1cd:456b:b750])
 by smtp.gmail.com with ESMTPSA id
 bx22-20020a056a00429600b004fa936a64b0sm16293151pfb.196.2022.03.28.15.35.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 15:35:02 -0700 (PDT)
Message-ID: <513dbe5b-44da-8779-858c-6c4ef2664731@gmail.com>
Date: Tue, 29 Mar 2022 00:34:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 07/15] tests/docker: simplify docker-TEST@IMAGE targets
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220328140240.40798-1-pbonzini@redhat.com>
 <20220328140240.40798-8-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220328140240.40798-8-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/3/22 16:02, Paolo Bonzini wrote:
> No need to go through the shell when we already have the test and images at
> the point where the targets are declared.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/docker/Makefile.include | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

