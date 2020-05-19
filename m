Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A443A1DA002
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 20:52:35 +0200 (CEST)
Received: from localhost ([::1]:50368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb7Lt-000565-6s
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 14:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jb7LA-0004da-L4
 for qemu-devel@nongnu.org; Tue, 19 May 2020 14:51:48 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:42524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jb7L9-0007oO-FW
 for qemu-devel@nongnu.org; Tue, 19 May 2020 14:51:48 -0400
Received: by mail-pl1-x643.google.com with SMTP id k19so253553pll.9
 for <qemu-devel@nongnu.org>; Tue, 19 May 2020 11:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nBBPffgVKLIkxJLraiw3rpKYl3hitk0dPuLLq1AlijI=;
 b=uzUP7PpBTbqO9uKW5I9lMI1wWQcO+pM2PiYX0PGVOYVgtks66a+mTBNb8xQkN5NvQf
 KJEJjy+SRWfldN1QMpMuE+tsl86PnTMR/w8SdgRiKW6eyrFM59UScf8bnQyGKUInlWwN
 I64fWrHSfCqtaP+CcH/YUHsKyaB1b0zVxKhRtJ1QYSu+ie0WjY/SdoCU0H4IkUcFLhu3
 xCYLgXOCa4jGzht7NWlpRZho7fGku9aceBQxlYGMQTzE9ePHQ8IaBZCs3vIvoVAfv38z
 opHeVYLZT0cjLuhevLlcE4ZwoSyGUj1AMaRGWvChoVrN7kK1HYj4vo9geIrBcxPSFsy+
 sG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nBBPffgVKLIkxJLraiw3rpKYl3hitk0dPuLLq1AlijI=;
 b=tPe+i2G0pfdOpicgdSjbbSnC26NN1we2z6Y13l3x/vHF6281+/I98OPgZmRVUtMabB
 81u4FU6u724D3WGdQtY/bYlNz1sZ/0qtngnWWgfQzDawQXbQmAgpZA/xuEVqJoGL7vbS
 7Bn11kCWW1HtH5ETDX97x8MVRIPol/7OdKNhxew7cxvrP2spgXTZ0ZceQNh6pkcI0P8j
 hLqOmwGqWYMT8TNgTcuX5RAKXMyhBDwIGwW2wMQOS/P51riQHwsICTMnt6MP8oOtIyDQ
 lhH12C6wqYdZhxsQDKVmVCYrsDtjXqteg464cgYkKCy+6iLcW4FduGJqittG5STmpqZr
 DoQQ==
X-Gm-Message-State: AOAM532iUuzIJaSNLa2fV3KSe2F/8gSCJwqs6Wa23riRJoK+FbA+3+Jv
 shlRwU7GzDAKeguqgCcBIQxzug==
X-Google-Smtp-Source: ABdhPJxZKFwDQhw1Pxp9n7n6EHbuU0LSBUFHaeYWyku7Xkr+aKt+SF36lvnEnQBnuuH2UivVB3tzPg==
X-Received: by 2002:a17:90a:6581:: with SMTP id
 k1mr1049043pjj.118.1589914306078; 
 Tue, 19 May 2020 11:51:46 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id l4sm156762pgo.92.2020.05.19.11.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2020 11:51:45 -0700 (PDT)
Subject: Re: [PATCH 0/2] Update use_goto_tb() in hppa and rx targets
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200519162144.10831-1-ahmedkhaledkaraman@gmail.com>
 <a0f3967f-e125-d888-bc6d-44414edbfd5b@linaro.org> <87r1vfhisb.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b02cee0d-3fb3-ee9c-90bb-4d9419249028@linaro.org>
Date: Tue, 19 May 2020 11:51:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <87r1vfhisb.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: ysato@users.sourceforge.jp, qemu-devel@nongnu.org,
 Ahmed Karaman <ahmedkhaledkaraman@gmail.com>, aleksandar.qemu.devel@gmail.com,
 stefanha@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/19/20 11:38 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 5/19/20 9:21 AM, Ahmed Karaman wrote:
>>> The issue arose because the page crossings check in use_goto_tb()
>>> function is required only in the system mode. Checking it in both modes
>>> causes an unnecessary overhead in the user mode.
>>
>> It is not only required in system mode.
>>
>> You can see failures in user-mode if you modify executable pages, or change
>> their permissions with mmap.  Such as if the guest program contains a
>> JIT.
> 
> If we kept better track couldn't we just tb_flush() if a new +x region
> gets mmaped? I guess that would be sub-optimal compared to having a
> translation cache per mmap region.
> 

Yes, this could definitely be improved.  Noticing changes to PROT_EXEC via
mprotect, for one.


r~

