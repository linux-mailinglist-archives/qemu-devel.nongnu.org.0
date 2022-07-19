Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C3E5794E1
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 10:09:04 +0200 (CEST)
Received: from localhost ([::1]:45290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDiHv-0001ya-4L
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 04:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDiDk-0005ys-QX
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:04:44 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:38550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDiDj-0003nK-4M
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:04:44 -0400
Received: by mail-qt1-x833.google.com with SMTP id y9so7104488qtv.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 01:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=peQoZPsM8Q7WcCKrmq7WyiG3jAN3P8LYbVxt8oqne4c=;
 b=wWOF14yDQUjtq6YTGHSJVVwNCKy7GfX8ej9po/8IeSg/qcvgg9QBOAiJY3SXxkuS/D
 Myn3UJk8ZJit5aTq9uUTD1SFBZaB8El/NNuL5sWqeKQOQCj2CCypXv3WjM84CGbTswvI
 aBAgh4n3ELLmvsOeu7A5BEqu67VBaBNCNa5x7J4Sh8gWJ2j/YtNIpT3qGGLlm5A4M54J
 GTBuArS9NWBI/xEtzCDItG6BAADOEN90JnPtRPfFbUnJ/6JqGEY5mbt43ooVy8uqe3Y0
 JMd2NenUJqIsnXgcJTiLjDT3V5LU6peg9egW06SBEBQlqyVPxBLAcl9m1zSF21hgnVMy
 iPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=peQoZPsM8Q7WcCKrmq7WyiG3jAN3P8LYbVxt8oqne4c=;
 b=aLC9iPeJlkfYH/6AxESPyXY0oJBozOSNSOchBPiB5dgc1mnOgHFLXQ6StlyG/jo8iY
 owcSCmbrq2tl+mfAhW2U3Ana52eXXCKiu41EDmyxGL44pyNqKwn5+5BiDnCeRiqirMS7
 2Ae/7Q4bLiPepvAryGVi/9tYQLSt+fowkiZsTcdbfoebCP61Gzqg41dnJdb8Q7a1WccA
 qCk3dMbl5xeQt3UchtKnHtzjOjlQDV4tw6h+6Bbcv/ds4fhI4NJG5TG7rz5se5VTP15L
 Gh5iPToBYGf0ddBMLaFDSt7XoiRWU8a/1uWR2ldnkpCnffkp+U88k3+wRZdqhGy/PVEy
 u/Qw==
X-Gm-Message-State: AJIora8I13YrWP8RBC+f0rTRp8tLqPViq26dne4rjLx1pFq2NTHOd0zD
 jkEitNPcTpSVfEPrPLSDDtt+HQ==
X-Google-Smtp-Source: AGRyM1uhai1uRw/l5xqBNV1R/QmiKu7JOdlFh1nBjNgcXfsRxuXj2GksL5zaFKaBPdzFAyN7L42nrw==
X-Received: by 2002:a05:622a:613:b0:31e:f64a:6d88 with SMTP id
 z19-20020a05622a061300b0031ef64a6d88mr4097271qta.321.1658217881030; 
 Tue, 19 Jul 2022 01:04:41 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.163])
 by smtp.gmail.com with ESMTPSA id
 z12-20020ac8710c000000b0031d3d0b2a04sm10433687qto.9.2022.07.19.01.04.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 01:04:40 -0700 (PDT)
Message-ID: <b910a692-b835-517c-9abd-7905b354b2df@linaro.org>
Date: Tue, 19 Jul 2022 13:34:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 4/6] hw/loongarch: Add smbios support
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220712083206.4187715-1-yangxiaojuan@loongson.cn>
 <20220712083206.4187715-5-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220712083206.4187715-5-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
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

On 7/12/22 14:02, Xiaojuan Yang wrote:
> Add smbios support for loongarch virt machine, and put them into fw_cfg
> table so that bios can parse them quickly. The weblink of smbios spec:
> https://www.dmtf.org/dsp/DSP0134, the version is 3.6.0.
> 
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> ---
>   hw/loongarch/Kconfig        |  1 +
>   hw/loongarch/loongson3.c    | 36 ++++++++++++++++++++++++++++++++++++
>   include/hw/loongarch/virt.h |  1 +
>   3 files changed, 38 insertions(+)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

