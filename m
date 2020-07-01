Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F2A2113D9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 21:47:31 +0200 (CEST)
Received: from localhost ([::1]:51662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqihe-0007gH-Jr
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 15:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jqigA-0007DQ-Pn
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 15:45:58 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:39362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jqig8-0005qs-Rz
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 15:45:58 -0400
Received: by mail-pf1-x442.google.com with SMTP id x72so2005456pfc.6
 for <qemu-devel@nongnu.org>; Wed, 01 Jul 2020 12:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=KEU7VUbXjhqhhiz+EZtsZi3weFu4/u9EgIfErRMjNc0=;
 b=jKOanLv3jqn2CxxMcu6znpSW44WZoZUBOpSSxBssa7Wxm3mdETcUhBq1zeZ2AM8mrQ
 3W6Gi+Ig9rglKIDsoUbng5ddsphYXJsUqWkaotQzVxI5KIKqoSXU0knfxRy0+JScA9vY
 TeQAW53tgGxPxIZAgcuBOZVQM8BwA9mI4MgH1yUHqi4dwYBnc2GWcTIEjG/n29c7xseP
 DBQW6qGhhz5iw3scItqLnJwHXJOj4+hcIpxh/u0GSlSLiZnfBAuQBn7J/2bbun7sHJvF
 huYYQ01Oj6sx23/kVzqFr+XZw2yJ6Nv6lj5dPzq98sF50DjBiOpYFSN3vkKDGdO5Tctm
 mm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KEU7VUbXjhqhhiz+EZtsZi3weFu4/u9EgIfErRMjNc0=;
 b=n3rMKUNdUjD0YyPIV1W0vRAicPTN29ywmpZHz77N/e5jPN45jcyUEqGmnm85ED8CSM
 b4QHBtuq7/D9Cq4IPMc4nRvE5uUba/fAUf5h+5xiBakKgzvqsSJ43/kMguSfquix8hbq
 /dW2WFCH5NLC2n5eykldv/i4DhtntyGm9638KzhMprd12YHbxckXHZ4UukwBESdkNQk+
 mEXiQwUX1xf3g4Q26AUQq573JSWGJ5svQShx/KuKs6xVEL77CzZhy3pBPrEEe3CeRtF3
 XkrNYZDnjUFr8cbyp5yr1H9Qz6LXOlFaaPNKZxlt38r5neNbPDusJ0piZnrw7pwUGFnJ
 JS+w==
X-Gm-Message-State: AOAM530SgHGvRo+kesCi3OQJFAZgW7BrMwwxMJ95GQf2ALFmwmbtuwBu
 2i1WkDOKn6iKr4EF2OiKW+IXPU9Z/WI=
X-Google-Smtp-Source: ABdhPJwMEmux8h/mrN//Ezpa1oa3cWvbbMXLSnsZz/cs7eT51DKBlNMeJoKOM7RbRvCOxymiTwNDZw==
X-Received: by 2002:a63:f541:: with SMTP id e1mr20757509pgk.375.1593632754550; 
 Wed, 01 Jul 2020 12:45:54 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id z25sm6611940pfg.140.2020.07.01.12.45.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 12:45:53 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] docs/booting.rst: start documenting the boot
 process
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200701161153.30988-1-alex.bennee@linaro.org>
 <20200701161153.30988-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <56bd2532-a949-456b-bf70-025864439f41@linaro.org>
Date: Wed, 1 Jul 2020 12:45:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200701161153.30988-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

On 7/1/20 9:11 AM, Alex Bennée wrote:
> While working on some test cases I realised there was quite a lot of
> assumed knowledge about how things boot up. I thought it would be
> worth gathering this together in a user facing document where we could
> pour in the details and background to the boot process. As it's quite
> wordy I thought it should be a separate document to the manual (which
> can obviously reference this).
> 
> The document follows the socratic method and leaves the reader to ask
> themselves some questions in an effort to elucidate them about any
> problems they may be having.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20190308211557.22589-1-alex.bennee@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

