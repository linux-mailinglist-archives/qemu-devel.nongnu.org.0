Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6FFD6858
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 19:22:37 +0200 (CEST)
Received: from localhost ([::1]:54376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iK43I-0001jd-ES
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 13:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38665)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iK2yD-0007eM-Ur
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:13:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iK2yC-0003Vz-VP
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:13:17 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:43259)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iK2yC-0003VU-Pj
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:13:16 -0400
Received: by mail-pl1-x643.google.com with SMTP id f21so8210680plj.10
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2019 09:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PZHCWSGmCsPNoUR/KBBu5TBF2nwi8jPZplJhDwr1wQA=;
 b=dqG22rycYzUVGNqbEld/SvFMR4/9PDC+Hh6J90tRI/PM04d2oJgl+lDuhlma5IZPlf
 uj3llzqzYtHxmCqmLrCrvLLL7vjNH8jXf6dEU8IXg5KOlf9qfVTNPrGC8tQ2PZxn42n9
 uhTp1cbe4Za+UXPB/nO9+cS4TOGXqGmECauEMZ6bQIFZLcuGvpg8uZUJAQSu1n9EXnFq
 GFtxbGxsV0cRb+95dJYmS2yUtERA+uFsmHxuYciIXZyk4JY9loGHNmqn0oUbL3a4jsAO
 ww/GYJKzfxUG/ocHPIBolNjXISthoOSs/2LjWBH9jsAKCHB6vWL1xqHx7F9AvLHRZy7X
 g5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PZHCWSGmCsPNoUR/KBBu5TBF2nwi8jPZplJhDwr1wQA=;
 b=XAOIuf4WQe5t0ZvUfiND/LU/VOslY1lz+iJVP2Dzq8O2a04bQV7ie1BA/aTYWXtBnU
 5X00DY6ueuqM5XA2sZVJGw8Y1qdFf4SYnXf8vcF18Ga7bRYdJlycTLVYP0jMFgqmNY3R
 udu1bfSzJXDy9pR6OkDytbkxiDjRwGzgJNMInT3SJyWVk9ec6Bp7XleXtFzW4HclGiu9
 TclNKQDZ5hqmHUXgLYo9SmvTjztMvdJy5bYILnokCPQm+le+3VtrIClGqezr8yLJJNZV
 ilanw7eaNL8wNsCqAhX9AZMM14KdvX9T9/8L8oHnBFlGiTvfMnAQ8DkzUkg7Qyfmw8gY
 O1ww==
X-Gm-Message-State: APjAAAXRtyckePq1ka7wKi9CdESh5MZi99pvMNszOTFzYKTJYh5TrBKt
 nrlHRgOvgG5INUCK6368MlADkQ==
X-Google-Smtp-Source: APXvYqwM7Gsx7D9mzgV3wOzeFb6b1naULBdXi44QfwF7kfOEzpFPRwKq2GtBRctxhdlsAce46i3N1g==
X-Received: by 2002:a17:902:9a06:: with SMTP id
 v6mr30928388plp.221.1571069595648; 
 Mon, 14 Oct 2019 09:13:15 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id n15sm15175689pjt.13.2019.10.14.09.13.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Oct 2019 09:13:14 -0700 (PDT)
Subject: Re: [PATCH v5 36/55] plugin: add API symbols to qemu-plugins.symbols
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20191014104948.4291-1-alex.bennee@linaro.org>
 <20191014104948.4291-37-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <aa2d3ca2-1f79-8605-191b-50afa08c1baa@linaro.org>
Date: Mon, 14 Oct 2019 09:13:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014104948.4291-37-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
Cc: aaron@os.amperecomputing.com, cota@braap.org, robert.foley@futurewei.com,
 peter.puhov@futurewei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/19 3:49 AM, Alex Bennée wrote:
> From: "Emilio G. Cota" <cota@braap.org>
> 
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> [AJB: moved into plugins]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v3
>   - moved to plugins/
>   - include qemu_plugin_reset
> v5
>   - re-trigger configure if symbols are updated
>   - wrap ld checks inside if static = no
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


