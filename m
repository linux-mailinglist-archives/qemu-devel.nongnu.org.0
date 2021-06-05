Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E4A39C597
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 05:54:28 +0200 (CEST)
Received: from localhost ([::1]:57228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpNOF-0003O0-Kt
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 23:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpNMk-0002SF-Rz
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 23:52:54 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:33784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpNMi-0004kE-Hw
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 23:52:54 -0400
Received: by mail-pl1-x631.google.com with SMTP id c13so5671429plz.0
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 20:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L1gom5IMTTGQCgkbERZIWS2Ac0AV86l1CCiwTuO/joI=;
 b=XFCKQiV4FtaUqIaJ1utvHsb1sFX4hEHw3yAXyBhfah6KvZeT4Pj247N8Ij3aql+ytv
 H0V/NTn5eaarYvjhUMh9gtKiQqgRk/EBZNzuOVrTMl0PbS6icaXSI1QOhpTw6w7GTT3v
 08tq9JauI1VVcZW0SYrDATDp9ekApxYmzcMDbzDIYi6gZFGgoCYJB5dyrP1B7ZK2t94H
 +qB537fHHlyWjrBovLrdbZUk6gStsTTW0AV0rkN0ozPknI4H1UryOySzV95sSEKOnbC/
 i0gPB4/TiMPFIkyYxQ+MffBzQbvl0Iba53i4FsI5VgLPwfT333o6aIuj76sKJ4/SnM1s
 +cQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L1gom5IMTTGQCgkbERZIWS2Ac0AV86l1CCiwTuO/joI=;
 b=GWQxhEQk2jb3n8HUCrjlbxb5254ZWreRVpm4fXCaWqv76qCJa+lsIUY6yqAMTaXXdd
 UWAqnFpXvY1jjbc9PlemdIlAYiUkmHdKHo65XX0RgwTxIkdpbYYd7pbq/huVqPLxd8BJ
 EMKdeUkUmTDwEy/M7UxkcrInHALDfdoDMsnZH7FcCQEISZ9FrVH5u5piwCYS0gOmyqkB
 ta6wiRRSD7Vj1xJSlME8kN9N3dinhkFaH1tvnt79fUfbeXeTDkSQFoTkc531Y3Z5xq+e
 udBlioSIsB60mB7f+f6HsQUZIq+2g9jb5wYwJ6nPs647qeitK2vLTjAyXdicbpu/xzkr
 x3mA==
X-Gm-Message-State: AOAM5303f6Rp9Tsz3LwuNFUe0g2v4NkxfwriGodACyHdYGP5jxeK+17t
 24ruk8JHwN2+0o3j7NeUPL9LSg==
X-Google-Smtp-Source: ABdhPJwmT1Z++t9qr6DJtu7zNtH9mevoC2r4iGDbM+uJ5/qBWESZQbtJQhU7Cpxt9UFIL0CMDqcgvQ==
X-Received: by 2002:a17:902:bb8e:b029:f8:b497:825c with SMTP id
 m14-20020a170902bb8eb02900f8b497825cmr7432977pls.82.1622865170570; 
 Fri, 04 Jun 2021 20:52:50 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 i1sm2713601pfc.206.2021.06.04.20.52.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 20:52:50 -0700 (PDT)
Subject: Re: [PATCH v16 59/99] MAINTAINERS: update arm kvm maintained files to
 all in target/arm/kvm/
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-60-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1bb22a16-2698-8530-d3d8-1308fadfdcbf@linaro.org>
Date: Fri, 4 Jun 2021 20:52:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-60-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

