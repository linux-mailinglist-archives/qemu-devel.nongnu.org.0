Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 311F54FA972
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 18:12:31 +0200 (CEST)
Received: from localhost ([::1]:60710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndDhO-0007Wx-AM
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 12:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndDei-0006ns-FY
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 12:09:45 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:38496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndDeg-0007aP-UT
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 12:09:43 -0400
Received: by mail-pg1-x531.google.com with SMTP id s137so7669940pgs.5
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 09:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=5CpG9Pqlh10p4P3AXukFYpfbEktb45YNxvNAm6OHUSU=;
 b=h8NEg7FQOPZ2/MUIJFvbHlfKf23+LZ0VUbg3Z+/nEk6ggLcZiyTaxkkDjCqrlDKf2W
 jDN9IqeKHeOytsP45xP/exPCFSHH9dPbfzrD0gQjgKQcOSVk9DDDIwc2iagP8QgfIkZa
 2PJ4C+7sXmYQK8C2WyOzDx+21MVS6pHis3p1UqpyzJtMEwKK2mRbKzwU6BdUJZMuO7K1
 +d6YM+YutnbJysnA1H8tYg42H0iIxop0+JawUnCRb8sTTVtwI4nVtfUrKb2ngXpeG6fO
 KuEqS3FOaICd4p2kcw7Sby/ofQLtCjfKR+U+uW7+dBTIso5CW8V+9SSByDnZe4fU71Qs
 jy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5CpG9Pqlh10p4P3AXukFYpfbEktb45YNxvNAm6OHUSU=;
 b=E8NwEN3ONTIhZs77evaPmaEb7cFyXqdTlbhIZV6hQqIoQGQqFYJLXOE8iVZ1MXJTVa
 0stiQ+6X59bZBrTHG4TuxGPvPCtRYBh8V6qsvm9FuPVz9W8uV4lEPIeWRPP/tzLG+pko
 RYRW160Vr7F4FDhxKOA3uMqrGUd8qj7RWs6IYNqjXjzYVBhd3eYOix+2LDAm9enzycrT
 tUeALiKnw1L5Ud0ljC5d9PzaXAxM6jtJ/qWKLbkUW5ngErvfzKH5YTKKMxOxBsaXEPfr
 Utz/G6reLKePvoa+NvnyI6Tk+bHaYMONmAXo+zTNhE4tkmNaE4bufu0aqp3zTUmE+HbI
 9aYQ==
X-Gm-Message-State: AOAM533KRasFSL/zKTogIaP+onAl1h2NdPEvLvHrbBf/gZrg6rUwEG5z
 mK9lTrwGeDEkGtvbuFlLDmlqRQ==
X-Google-Smtp-Source: ABdhPJwD0zg53/qwgSZbCGpPYNbOndr4wQz+3P0DSfRJFpd/7Oq1SbmgxS5b7LsXa9QfoD/kfd1lcQ==
X-Received: by 2002:a63:194b:0:b0:39d:f8e:9bb0 with SMTP id
 11-20020a63194b000000b0039d0f8e9bb0mr5052850pgz.56.1649520581035; 
 Sat, 09 Apr 2022 09:09:41 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a17090a390d00b001c995e0a481sm15587975pjb.30.2022.04.09.09.09.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 09:09:40 -0700 (PDT)
Message-ID: <6b8f02c4-a58f-a5b2-8a96-9e118daecb2f@linaro.org>
Date: Sat, 9 Apr 2022 09:09:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 09/15] cputlb: add tracepoints for the
 protect/unprotect helpers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220408164742.2844631-1-alex.bennee@linaro.org>
 <20220408164742.2844631-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408164742.2844631-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

On 4/8/22 09:47, Alex Bennée wrote:
> This helps track when pages are tagged for detecting code changes.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   accel/tcg/cputlb.c     | 14 ++++++++++----
>   accel/tcg/trace-events |  3 +++
>   2 files changed, 13 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

