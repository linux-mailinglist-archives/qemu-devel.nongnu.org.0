Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E82C233A780
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 19:23:51 +0100 (CET)
Received: from localhost ([::1]:54214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLVP4-0005S6-TB
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 14:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV4H-0004eY-Fd
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 14:02:21 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:45113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV4F-0003TJ-U0
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 14:02:21 -0400
Received: by mail-qk1-x735.google.com with SMTP id m186so12966980qke.12
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 11:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IaY9vJY/fOJ+ouUhfEKBQaMgVda+cVfrCeomuuB4ncc=;
 b=zs14oLA5qCcWczA3PFXbyX1+h8AlHUwvMMsWzD9i0kiNEQ0+QI9JkeM0KxirqBfYtx
 0anfsG8WJMD59JBgSBlO33vGYaKcJ3L9sIijgzpWSyK8+KGDkk7LnT1aQeNMTWORJncO
 JrfBMOIdMRDRZwa8RuDFdh0jf0t2e6vrmqduVckh+e5l7uVGRUTuJja275pJJeXzKbTv
 1vbm5v43IcB2JWk1JwFH40WFJs/kwEl1Y1gAAPKrYH4JbaMoTtOeBbCKZauIofRrMKyI
 0IMdgPVYpChVBAViqBbqB0O51b1H1l/47NQIbNFZyX2WEYGMu2L1Aq3O7hijIwhOiiME
 1IBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IaY9vJY/fOJ+ouUhfEKBQaMgVda+cVfrCeomuuB4ncc=;
 b=uEfdRknwu+ButyMFFeeK95AzPfGslTDIyIsU13BHNCj+bUmnc9IXVk8jXDztX5cl11
 y8MagwngRun5qip8g2W22m/becEpgVl7XGaRbz8q7ronfvmId7+he7VVIvuJqVnUJ/OB
 CzXollq0LoDjdTa6EOX8TzMUmE2GwV4Fo7c8z2PZHNhLdPBKk3WPJ1oe1kOyzNwJH8WF
 PDp6W4AmJcJ+yaJ7GcI4FiWAjnUpAru8UE2TTgGkvz6sAPptPGvqvpDaBLzOfJC9g/Pu
 cwh3ZNhvN2IAWk1uFl7AVsEuKEH4f1DPpie6T80f8vZ2sPE8lHuFUcNuKuL06cv4dMY8
 IKXA==
X-Gm-Message-State: AOAM533QGUbWJ+G+67xcna913mjGb69tBicfzbUNUjGubWvL6JIEYavL
 PP3Yyz3gbHqrEyHKCvDKBZJtyw==
X-Google-Smtp-Source: ABdhPJzAIn9DErZWKwaCwGKfNCtEPsZ4Sqv0Z6rtU06XyxupN9cb42QJ2qeznY2P6aXB4Lv81o006A==
X-Received: by 2002:a05:620a:1679:: with SMTP id
 d25mr21941890qko.102.1615744939121; 
 Sun, 14 Mar 2021 11:02:19 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x17sm3665496qtw.91.2021.03.14.11.02.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Mar 2021 11:02:18 -0700 (PDT)
Subject: Re: [PATCH v8 27/35] Hexagon (target/hexagon) TCG for instructions
 with multiple definitions
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-28-git-send-email-tsimpson@quicinc.com>
 <d08c59c0-4cc5-0ffd-a1fe-11fe919a3394@linaro.org>
 <BYAPR02MB48866F4E9721399EEE58AE73DE6D9@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3f3b07b0-7026-b380-9459-8149fa50400a@linaro.org>
Date: Sun, 14 Mar 2021 12:02:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB48866F4E9721399EEE58AE73DE6D9@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
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
Cc: "ale@rev.ng" <ale@rev.ng>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "laurent@vivier.eu" <laurent@vivier.eu>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/21 6:41 PM, Taylor Simpson wrote:
>>> +#define fGEN_TCG_L2_loadrub_pr(SHORTCODE)      SHORTCODE
>>> +#define fGEN_TCG_L2_loadrub_pi(SHORTCODE)      SHORTCODE
>>> +#define fGEN_TCG_L2_loadrb_pr(SHORTCODE)       SHORTCODE
>>> +#define fGEN_TCG_L2_loadrb_pi(SHORTCODE)       SHORTCODE;
>>> +#define fGEN_TCG_L2_loadruh_pr(SHORTCODE)      SHORTCODE
>>> +#define fGEN_TCG_L2_loadruh_pi(SHORTCODE)      SHORTCODE;
>>
>> Why have some of these ; but not all?
> 
> The initial series only has overrides that are required for correct execution.

This does not answer the question re the semicolon inconsistency.


r~

