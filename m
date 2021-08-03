Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39173DF447
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 20:03:56 +0200 (CEST)
Received: from localhost ([::1]:33184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAylf-0007mU-QK
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 14:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAykA-00063l-Nx
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 14:02:22 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:38585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAyk9-0002xK-7y
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 14:02:22 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so4995155pjb.3
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 11:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w3jxaJKsn59OMH0CPVcdLicMAgzVBrNTlAQ+b+DByHA=;
 b=Cl25CtKuf4OCjYf2QA+Yt+nI9BxCY6rj0p/BzBsBy+jMLNe8f1rmga5wrZQ8xjy1Kw
 JMxJ1vdCmRK+riDbDevkI+Ecny3rKZP8KginTZ8RSTtVVEBrcTgjfpZUUU6eruUkPReR
 hJKD4nfKY2p6kkA7TDX8b2wnhAbUkhlW9PBejgSXce3Xgp6kjPhSe0sKP0z8XAbszsNY
 pfLaIB0JlusW6qWoC+6TO+UYN8HlWjufFSKiTIKQcUd0r7qw9k3op8YjqtOjF4xKbc/K
 OFZEcHzKXSQcMLQDkQ+eIoEC+yGY8kSIPigy0J8DMs+NoBUPmRr15lkCyNdBlhZeV0uS
 7asQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w3jxaJKsn59OMH0CPVcdLicMAgzVBrNTlAQ+b+DByHA=;
 b=BkCuNWNvd8cv8c5z4uzfQM66nFA9yoSkK2bg8WyA5pfzFYAShPIwqop5iVs+HkpM6G
 qvrmNv7q1+nznlw7ufrGXb/oHJ3v7jF71wjjxqjW7V0m3oamEaXxTCo+jOkiz6cqbtKC
 34e5qhgzL4nardLhunIT0BKKZKHNxud2eqll9KeUHQQGvgDV5uVzSXnBkwZ+87QPLiFi
 LoZCAxmelW9ZjD+l4WatXp5R8pZZPPtpBoch9hP7dbZ2zpnYyTPSVPO8LcEHv/whZptM
 CFqSNc807iluabMZfOmqQ5BFGF3VCEFrGOHW2tVTSxT1WS76qvN0d1PlRZqUhGjLnW3c
 JVSQ==
X-Gm-Message-State: AOAM530yMkGoIvPxVRnHCQxeAKb934yuHgGzFRcs3bDhMy5omEyebJWG
 yHhMcFs5yZz2jMN7rpi1h/dBUtYuJl1+Wg==
X-Google-Smtp-Source: ABdhPJzreHm/IFjkUdvyi0apJTThniKVMNeQztrgZmiLmbKuLtCHdPKcPxYgX5yBe++vGwgwctRTeA==
X-Received: by 2002:a17:902:a9c7:b029:12b:349:b318 with SMTP id
 b7-20020a170902a9c7b029012b0349b318mr19479379plr.13.1628013739608; 
 Tue, 03 Aug 2021 11:02:19 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id l13sm8863350pjh.15.2021.08.03.11.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 11:02:19 -0700 (PDT)
Subject: Re: [PATCH v2 01/55] hw/core: Make do_unaligned_access noreturn
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-2-richard.henderson@linaro.org>
 <87r1fafrxd.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7c741ea6-ea24-1e58-972d-4e5d7e63ccf9@linaro.org>
Date: Tue, 3 Aug 2021 08:02:16 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87r1fafrxd.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/21 5:47 AM, Alex Bennée wrote:
> These trailing QEMU_NORETURN's seem to be fairly uncommon in the
> existing code.

Showing my age, I suppose.  Once upon a time it was the only place you *could* put it in a 
declaration (as opposed to definition).


r~

