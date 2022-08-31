Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEAE5A8448
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 19:25:31 +0200 (CEST)
Received: from localhost ([::1]:55444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTRT0-0006Ai-GL
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 13:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTRRf-0004o3-0t
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 13:24:07 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTRRb-00037e-EJ
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 13:24:06 -0400
Received: by mail-wr1-x42b.google.com with SMTP id n17so19174531wrm.4
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 10:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=qqDiIi34BDvLReEKYiiDkXzAKaLH7/rDBJD/asaAsWA=;
 b=ow8qbW04npfAH5LekMI6AIZDTCTnEnEt1N+bUgJCW6oNoWD/Di/ZFYfzB8KKzbvF/8
 srAMLPL28dgavmVKtns93V7zNQ6pw8piw5r3R9vWlDSJlIvDX3jqGRZ9V0/d/KtgtKue
 TxptHPS4Z+cqhDDk3F5UmFtjKxsGno6kGDopBUAuxS5aWw+y2/aoFeEIQLXIMmObLN51
 UASZGuVX05gc89FzhGgaVD+ZjZjc59ZlJj2Iafm2zFbdiman9frDJEt9OPz0zja8LBKF
 PpVzpqdkCIp4aXQPVMstIPhLShSEwN3bYsfKrXNxGb+ZDlwOuYM1BhV/TsNws+e4JZ3+
 h6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=qqDiIi34BDvLReEKYiiDkXzAKaLH7/rDBJD/asaAsWA=;
 b=pFj1bRIhrjhc2OSqFt9bjNBEVYuFA7Jvj2J3kYHwXhY0ZDpNeY+QfsfI4pdTKyaUbq
 42mxSiwrTpUF+yqWvfICKYmE/26TM03yhtzuVM8j40yu4B2M/Ktjn7un5sXaoN9cK9Sc
 +PU+Iq3Ph80H5B3E0CJyL75HD7ZxjjRfiztFzpEpYuWGuqipf+BJohJdPK9aC+VD7syh
 +041gL1m71ntN70BVjJn86NpV1qGhzcEe9F/S2yedFj8RI7i0pq6PQpNSRaJIO7laDMQ
 QnZVyBMakftDADH4gcD6Nzu4WMP5+4SQSBH54meN1CDiX8dGbbsiFqSLAyjVCLxEidVn
 7uRA==
X-Gm-Message-State: ACgBeo2xTaFp3dFs+uGzzuc4Hxb9Owne0wd4BBNtq8HW7RODBSK3LyGN
 AjDd4csyyIrvacxGiAPUvxu1KA==
X-Google-Smtp-Source: AA6agR6tw/YtRTEuJ+nkBmu4Zz51agqN5X5g/BV/qVcvuz6MtBt30hOgrxSNXAnYC4ZG3PQ64SG5Fw==
X-Received: by 2002:adf:eecc:0:b0:226:dfe8:12e with SMTP id
 a12-20020adfeecc000000b00226dfe8012emr6692514wrp.713.1661966642052; 
 Wed, 31 Aug 2022 10:24:02 -0700 (PDT)
Received: from [192.168.30.32] ([87.192.221.83])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a05600c34ce00b003a5f54e3bbbsm2792208wmq.38.2022.08.31.10.24.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Aug 2022 10:24:01 -0700 (PDT)
Message-ID: <65dc5777-e40a-2733-db65-233aa6a82e2d@linaro.org>
Date: Wed, 31 Aug 2022 18:23:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: QEMU 7.2 release schedule
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: michael.roth@amd.com, peter.maydell@linaro.org
References: <Yw59JU3ja/EU3HL6@fedora>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Yw59JU3ja/EU3HL6@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
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

On 8/30/22 14:12, Stefan Hajnoczi wrote:
> Please check the proposed release schedule and let me know if they fall
> on inconvenient dates:
> - 2022-08-30: Beginning of development phase
> - 2022-11-1: Soft feature freeze. Only bug fixes after this point. All feature changes must be already in a sub maintainer tree and all pull requests from submaintainers must have been sent to the list by this date.
> - 2022-11-8: Hard feature freeze. Tag rc0
> - 2022-11-15: Tag rc1
> - 2022-11-22: Tag rc2
> - 2022-11-29: Tag rc3
> - 2022-12-06: Release; or tag rc4 if needed
> - 2022-12-13: Release if we needed an rc4

Looks good to me, matching the 6.2 cycle well in having the release completed with a 
comfortable margin before the Christmas & New Year's seasons.


r~

