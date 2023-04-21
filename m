Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC936EB140
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 19:55:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppuxN-00024B-Om; Fri, 21 Apr 2023 13:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppuxL-00023J-Nr
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 13:53:59 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppuxJ-0001Sh-Ex
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 13:53:58 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2fde2879eabso1858152f8f.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 10:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682099636; x=1684691636;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=03B2mBgyGNXDvur0BdNOnKF8TZiflUVanf9eQfWsihQ=;
 b=ULEKuwCB6aSu0NAOEPPfs7d/0Nuzm2cXejyo3ZLDo1jMP4azNkirfo7dCmz+V1b4pV
 dx9fjWMnRf5uzDN3zLSTJupn7qVMz7hiheSS7Yov0P6kLH4mAzW7bHqDrPbYp0rloHSW
 R9BX3xLJ5Ckp0fEErT2uwwUtIDNiqRx1Gyjw3t6xYq9mc/UNSORE5TC6PPNipJ7QQtR/
 6a2NGsQpcVlcZWYY1+0+wVClxlEVoPnbWd1w25iLowFWOUFakUqa8hdOMLE9S/HoVatg
 9Jin1xO2SbM6Pw2uxfrC5OSyeUqKFrbmBoGv342DVvNUQO3FlK3pEsZN33YJo8iNafiQ
 tmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682099636; x=1684691636;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=03B2mBgyGNXDvur0BdNOnKF8TZiflUVanf9eQfWsihQ=;
 b=T1A6vYt7BKuOX1Quj59NPH8+o+G65KMfYPY5gXi+Bfry6JusAxF3b7DVFiLDmkohcY
 80FwYoFrQykNsxhhTMb+s59YpBM8b+wsKlhv4241rO4OUewfeJDeKeU8tvP2zu+3lag0
 5ng/yRN808RW54uXqMWlrpM7iP1tQffZXVirpXfnQe5wTGzyboogFGNielwevLGBVwm1
 PJG/9YHE+GPoGb8yIXBOEpKTmlwYlS+73uxS8dndSmWT7uLNiblKXkGHRTwc9HCsvmUy
 QNpHgFXnM6NdeoqRNXVrrv0+dda0h5HMOjtto9GNNf9hkvt65Lmnw/o0jFL4ORXQzESy
 yuaA==
X-Gm-Message-State: AAQBX9cO0rTKZ6ahH5CaM8Vhu54WkKZhdARCPEJKu10qRnNZq+cdSRGI
 dLE+RgQOU/XqpKJMeMQ3XpiJaw==
X-Google-Smtp-Source: AKy350abM6zOxTQwplMPZ+L5xDn8pRJ/C5W15ziqARV0AeMHlCvQ7ywdm5OvaesyXvLsjewFuQVqFg==
X-Received: by 2002:a5d:4bcf:0:b0:2ef:eba4:e208 with SMTP id
 l15-20020a5d4bcf000000b002efeba4e208mr4694757wrt.45.1682099635825; 
 Fri, 21 Apr 2023 10:53:55 -0700 (PDT)
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr.
 [176.184.28.119]) by smtp.gmail.com with ESMTPSA id
 r3-20020a05600c35c300b003f1836c98b7sm6524522wmq.48.2023.04.21.10.53.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 10:53:55 -0700 (PDT)
Message-ID: <6d0e4b13-e143-d899-5960-dbc23f3dba5f@linaro.org>
Date: Fri, 21 Apr 2023 19:53:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v10 02/11] target/arm: Remove dead code from
 cpu_max_set_sve_max_vq
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230412121829.14452-1-farosas@suse.de>
 <20230412121829.14452-3-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230412121829.14452-3-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/4/23 14:18, Fabiano Rosas wrote:
> The sve-max-vq property has been removed from the -cpu max used with
> KVM, so code under kvm_enabled in cpu_max_set_sve_max_vq is not
> reachable.
> 
> Fixes: 0baa21be49 ("target/arm: Make KVM -cpu max exactly like -cpu host")
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/cpu64.c | 6 ------
>   1 file changed, 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


