Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9D734BE85
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 21:20:45 +0200 (CEST)
Received: from localhost ([::1]:53382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQaxo-0002l3-NP
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 15:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQaul-0001Et-6d
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 15:17:35 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:37790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQauj-0006nS-Kv
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 15:17:34 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so10275325otr.4
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 12:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qzz4uVb3a/yxCrpvp9HSfjgnEo7mkNyP/jvpBteMCgw=;
 b=EFki+BkFuNFsad0NSAPL7/nVO/b78CTNdAfJfdzJVYQFm0MELRQfZ2uoOaSHS8oqBl
 yMbRwLnSaCUy57ubjQMPX4YlFtHYYVGVsPxNKv4gZ6ROcpvJuNLZ/mxM2G3S2yHVZhHS
 KdnHAEEe+Nixxg8v4DqxIGlGVC+75I5Mk3sSJmjAZj3JtVQYfsMtS6jRUTxr8Ojrlb0/
 7kn19rC1lrarOdbaA3ujhofFOA2LRXdgRUoGtbwlGuH9DbtfnAapbI70TZsSQxroWMgH
 ltpQq+1InxxSFDBgiX/CXzDSno0Y31TrDibS/OOVepD+Q3onrfJC3PW5dMCkcv4S6J0x
 gEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qzz4uVb3a/yxCrpvp9HSfjgnEo7mkNyP/jvpBteMCgw=;
 b=R2zOhvyivQKbGupfAaJrewBAm9ZFRUB1BLhJxUpVsV5vT/SMEMS7ZP4FM68fvSj1J/
 vgq9dwYml6PHgNYJHXrCko4dzX42H/6wDHBDRmrOYWZRlLkH8idB2txDlh56Ofg9UBrj
 FfhfKUd/zVRU9dflzv5KMEy/dR10/8waEfLMgF7l8GWO5uAHs2o67ImUjJnTTN72VWT7
 b4URKmfHZawZT/B9bvhMNAasKZ0FeD9AaB3iyjiQNxqE9L07biLGL2at2amc4PfsC16T
 liXpD16qdqg/4yWGeWwvizKe7Vi6B7xp3uggXHZLHdNCw45Pyg4ASFZ8ck/mrOB8hlrx
 tSMw==
X-Gm-Message-State: AOAM5302PP/Gbb5vJBJ9A5UW9gbczMtxwJbf3FS2QgkDAIV6mW5kT+wD
 Zv5/P33MziQvH32sXeF+bEsGcA==
X-Google-Smtp-Source: ABdhPJy4Qenib4BfV0GOe6KUQ02rnFqU/QqC8MVYYNJ+FwMfxwS80CMuzIzoCQPR3/HrWoJ+qB2PFA==
X-Received: by 2002:a9d:4584:: with SMTP id x4mr20193444ote.255.1616959052581; 
 Sun, 28 Mar 2021 12:17:32 -0700 (PDT)
Received: from [192.168.44.35] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id x25sm3749715oto.72.2021.03.28.12.17.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 12:17:32 -0700 (PDT)
Subject: Re: [RFC v12 65/65] target/arm: remove v7m stub function for
 !CONFIG_TCG
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-66-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ecc17fe0-1568-fed0-eef8-95bd5c719586@linaro.org>
Date: Sun, 28 Mar 2021 13:17:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-66-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/26/21 1:37 PM, Claudio Fontana wrote:
> +#ifdef CONFIG_TCG
>       if (arm_feature(env, ARM_FEATURE_M)) {
>           return arm_v7m_mmu_idx_for_secstate(env, env->v7m.secure);
>       }
> +#endif /* CONFIG_TCG */

Better done with tcg_enabled.


r~

