Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F66D390CF0
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 01:24:18 +0200 (CEST)
Received: from localhost ([::1]:40808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llgPJ-0006Pd-Dg
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 19:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llgNp-0005j3-Pz
 for qemu-devel@nongnu.org; Tue, 25 May 2021 19:22:45 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:35378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llgNo-0002R0-29
 for qemu-devel@nongnu.org; Tue, 25 May 2021 19:22:45 -0400
Received: by mail-pf1-x42f.google.com with SMTP id g18so23155022pfr.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 16:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=DQJGn+u2HS3+MG5N/QZffhrDms2Mi0N3fTVYYGFwrWE=;
 b=DB45tbrPbrbpIEpA7YnkU38VsCqblDuCv+z5MWVtLZ41QiCDtv+C6FnMDVMciBkkP+
 MD6DJe1PacoDHkRkikIofy9aXMnk6dPEILH/JsPFNHtUd/nQ4JE4bBgz5OUTFtZvft5u
 XDuLfUszUtbIR9DTEBYcyElAmmk55RyOqOXjYeTKub03RKnn2AOsdFskgOfK3yoEOS4z
 FEZj1nX312N9CqwrLnUBJafgl52vSYbCOwNkzYDHIfvDF+Egq12elJuoP20FcGvz5XHP
 KSOTUfZ1oux76OSBxw2itMOQlB7ghfuZskC5rSewqw4N2nHHaoHbpiI22A4feyo2PbOI
 Kaqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DQJGn+u2HS3+MG5N/QZffhrDms2Mi0N3fTVYYGFwrWE=;
 b=ocz4qbTKOZj4BWtFwfk+BK/2tOidVtPbEkQIyqRqzIlqT97pNRbLkJyMqrap+6nc6C
 jndxjXg7ubKoSVRDEgWEdDL+Vwprs3WUb6AvEcBknKe37ddBd9a61mFN248kGqnMXhix
 0dtUhxTVBsFgFcQAQYv7wF3asaogVNRxTkwUgWm8PIDVtBhoNQ5qdXVdNWg7CdftVEu2
 4/P1xw2qA2rNyrMh+XWfZ0AqSKjTjfWWQc8BuC2/cIY8S5OPu0caJUsHObj0Q6pjmb03
 RHMUKufyTGxjDpmuT0o5OhXIWa4Nbghluw8NQkDYkyCjupVOc4XuC8sgSi/Ag5Er+moe
 xv1w==
X-Gm-Message-State: AOAM532HaY60XnDVDaBb9op3Q7cl8A3maRiJRKrI0jlYOHlo2cQGnHFg
 5du8VORm02GaK8BUFBnKuFru6cJmWujEmA==
X-Google-Smtp-Source: ABdhPJxW1lMNit8r9bTxQXqF39+EIEfQM6NlJ5huvoFdP7BegfcVEaIsKbzCKDUbqdyWd+bSP2xmZg==
X-Received: by 2002:a62:5c1:0:b029:2a9:7589:dd30 with SMTP id
 184-20020a6205c10000b02902a97589dd30mr32247139pff.66.1621984962384; 
 Tue, 25 May 2021 16:22:42 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 p23sm2916048pja.12.2021.05.25.16.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 16:22:41 -0700 (PDT)
Subject: Re: [RFC PATCH] configure: Do not add --warn-common to the linker
 flags anymore
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210525111149.131222-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c98d9300-c0dc-c0bd-7b78-009c5fb1986d@linaro.org>
Date: Tue, 25 May 2021 16:22:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210525111149.131222-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 4:11 AM, Thomas Huth wrote:
> We are compiling with -fno-common since commit 4c288acbd6 ("configure:
> Always build with -fno-common"), so --warn-common (which had been added
> in commit 49237acdb725e in 2008 already) should not be necessary anymore
> nowadays.
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   Marked as RFC since I'm not 100% sure whether I'm missing here something...
>   but IMHO the --warn-common does not buy us anything if we also compile
>   with -fno-common...

I agree.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

