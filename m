Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE52348112
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 20:00:00 +0100 (CET)
Received: from localhost ([::1]:54748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8jX-00008H-5p
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP8eK-0004B3-09
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:54:36 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:37619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP8eI-0005ru-6H
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:54:35 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so24020884otr.4
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q0K6ETGUs2yV7rTzJxSBccEcnCZD2lSgDDDzPOHWfpI=;
 b=FwDXpXuCNNavaEyTghi1IQJxxcJ+HLFzvwjsu4hgQ+akdA1GZrXFoVtO0QmtuzkQpi
 9+GerWxFq90PhKOPy/BGmsVR+y+D8GCeIebKAZ6EuCP3aUH1Gv0Gk0dAwNMNG8ASGTFt
 PwO3vqVsQyicFO3Ym18I0XX3ypIhAVzbelbYk1hogh+qNDZugSjpygGi3pIEdTs2nd/l
 lyC3gCiN/suSjPq8fiKY2Mqra/rvnyiHuvT9QbGbHgjA9MeZdFC+e8OilgGbHQJG8Ee6
 enh85KI0A2zgfVFuUJf5dJz0mm/hBh9AoDN8vBIHQxcZAEA7DRAqMBtLc/MXmhLS6dlG
 DOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q0K6ETGUs2yV7rTzJxSBccEcnCZD2lSgDDDzPOHWfpI=;
 b=kitXQe+CQGAgmCYdisAaHR9AX+XJ7ON7VquZ72o0hSVbURfL1+uTT/JaPte8Mbi33b
 E4Ko2G5fnZVNuvYDhsm/2ICYgJZd7EDCffhOS80rsE9o3Os+Oy3IY2WlQltEXRZ6F1D/
 SSZZlWN9RMMaqAor2DXqZ8yoU6Y4KpwubY+9urcnIWpnHS3fFuIZ4V2JEwF1CiaNFI9o
 euERdjJGQXHUHb64H25FNUEuBpJv9diMdAcNSeUB+7Mlg/cGFFhDRGrm7suAdM5VFBnn
 TM9l3LyI4T+zAT9/fPba9UE3QPXyt+h/Bp40zWqrdiLYgWASWonsar7dvy5OkD9/TZS4
 Kceg==
X-Gm-Message-State: AOAM532GLoB+HW0hJOyopTpxoa8bsKs5fZztS9yRTlxAjzkV2mLvXTJl
 Ibd469z97ZscEc3oPOrt60lhBg==
X-Google-Smtp-Source: ABdhPJyMVjaiXEBA8SdDs6MxuTjshWMNiviM3czGr7QAVAEeM7rkTN31UoXXRejX7vIC9CqtosLBig==
X-Received: by 2002:a9d:565:: with SMTP id 92mr4333524otw.109.1616612072854;
 Wed, 24 Mar 2021 11:54:32 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id k11sm748222otp.28.2021.03.24.11.54.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 11:54:32 -0700 (PDT)
Subject: Re: [RFC v11 17/55] target/arm: kvm: add stubs for some helpers
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-10-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2f9887d6-4afd-d197-9507-332694109093@linaro.org>
Date: Wed, 24 Mar 2021 12:54:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-10-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 9:46 AM, Claudio Fontana wrote:
> +/* return the effective value of HCR_EL2. For KVM, always 0. */
> +uint64_t arm_hcr_el2_eff(CPUARMState *env)
> +{
> +    return 0;
> +}

Oh, amusingly, patches for kvm nested virtualization,

https://patchew.org/QEMU/cover.1616052889.git.haibo.xu@linaro.org/

mean that the guest *can* run in EL2, and this always 0 comment isn't true.

So we'll need to keep the original copy of this function in an accelerator 
agnostic place.


r~

