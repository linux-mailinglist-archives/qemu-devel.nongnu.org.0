Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B23CF66E32D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 17:13:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHoZw-0000zL-7c; Tue, 17 Jan 2023 11:12:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHoZs-0000vi-Pk
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:12:48 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHoZr-0003sw-8D
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:12:48 -0500
Received: by mail-wr1-x42f.google.com with SMTP id b7so5126921wrt.3
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 08:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x0WpP5FRTLl5e1gnkjl+ZBTHfCSRjtJNZqOplEFmejA=;
 b=upG3CPDN3MTSQnCesYLQlvgjH74u99HJSKHJnqwV06hCd9JGCEpLne63gPkhEVld7a
 pWtDtwVIwSauv68ADOZynl8Wm6HZTPmZwtFVHyLskYC3UtBaMrWE95YOPmgBoHFw18tt
 0laglJUU7FfBr38P0pWnOCr/FZ2gyoBCwBape47qfMaNacg1XUU6cf5S9Djc8C0v4L/O
 K2TY5TcqJ+Vyf1iuXRcND3gpoAOThpkIsFkh1vhNedKa7BPZ4GpFooKKMH6TZ1fMDf85
 vopo5aGvXwCnbFhTjHUKNKtOIIp9CW10tx0Erb93JQgKbeg8MWaLOC1X5bIFtwjx+TZ+
 ORjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x0WpP5FRTLl5e1gnkjl+ZBTHfCSRjtJNZqOplEFmejA=;
 b=W9Lp9EyTehSebf+BngQeGkwVhZMlGQwfI4gcohqq+rvM6rx8N9efwg7AMUG46R8z8t
 ZkDEWC6c+YZQPzrYdCAUn+kmxCkFzAgeRY2ZKixoLuLFLYVuN3fEFZtzhoS57uk4a3Yr
 2fUMd4g84vp3oLHrqXUwukgR4wW+03tMFMSxMjPsjs7Bq4zVeml3/FDCHkve/AYb5DPF
 xqt2KZL+H+XpbU3eTeT28wsUaJThrOx2HOM5ZhrBLWWlGSxcDqlbf2yrYQiM7rkOpvBv
 cCsyO/ED3sCJQV+WXjJnIfRWPEu6p6qL60J3wZnLj1dAvRALLJIy8qvIGpSHIUCKzv65
 rnBQ==
X-Gm-Message-State: AFqh2kq/zBUrKeYkWNPllWLtApA6bNNUdKVjFcaqCzdwwoYoDS49KNHu
 w8BH7jEujAoNS4xs3mwGJyeUWQ==
X-Google-Smtp-Source: AMrXdXvdQlBjuURLYUiUE3/5D7xq/v+Px9wItKPmqvGQkb3/rrSvql/7cOJsrn6pZY9wvOO+VDhjYA==
X-Received: by 2002:a5d:620a:0:b0:2bb:6b92:d4cc with SMTP id
 y10-20020a5d620a000000b002bb6b92d4ccmr3150112wru.53.1673971965713; 
 Tue, 17 Jan 2023 08:12:45 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q18-20020adfdfd2000000b002bdc129c8f6sm17706990wrn.43.2023.01.17.08.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 08:12:45 -0800 (PST)
Message-ID: <b1322ca3-096d-505a-ca64-0767cbb9d519@linaro.org>
Date: Tue, 17 Jan 2023 17:12:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v3 05/28] target/arm: Move cpregs code out of cpu.h
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-6-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230113140419.4013-6-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 13/1/23 15:03, Fabiano Rosas wrote:
> Since commit cf7c6d1004 ("target/arm: Split out cpregs.h") we now have
> a cpregs.h header which is more suitable for this code.
> 
> Code moved verbatim.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/cpregs.h | 98 +++++++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu.h    | 91 -----------------------------------------
>   2 files changed, 98 insertions(+), 91 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


