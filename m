Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9B4458D27
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 12:15:50 +0100 (CET)
Received: from localhost ([::1]:36414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp7Ib-0001JN-Vp
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 06:15:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mp7Gp-0006OR-Jw
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 06:14:00 -0500
Received: from [2a00:1450:4864:20::435] (port=46822
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mp7Gn-0003B4-Hx
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 06:13:59 -0500
Received: by mail-wr1-x435.google.com with SMTP id u1so31937024wru.13
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 03:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Z4/ewiFUUs8bciHGRf9CsCA8dO3/I0XRkPFE7WbZgP4=;
 b=ZrV15Sg/5sAig+5yyMR7MzmxG81/JrQSN0W4YKAqZLGXWwNMYnujP+lN3G1DH2/zIz
 key3YBrMBAWQq1FZPps0Rmml6K+f4tiijuEutC7kyIbwO7lWClSLg+EOJUlG81LWUaQZ
 rIfLiZchCMYcmNqJHFg/H23I8WpbcDmCe/QdLeiszb34xST+sMxEUGNhcM2BaEwMCCjR
 ezLlz4LU77EcbCXjhhcX54SUDtdnJRVkg/L3m1kqBv/6PYAYHJeSf3aAE7cabv/chQOH
 bVuUiWYYocOe20yycL++HrqnDezpabd4sgYis2nNf4r4nKehvIFOBGKn9S6WitVZr50a
 F1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z4/ewiFUUs8bciHGRf9CsCA8dO3/I0XRkPFE7WbZgP4=;
 b=wr41Irs01bdpKJ+GNGMUvhDyfmdnT68dd0Xzsmk7SIKsC71MhMdOyLtMkh5s+TqTbR
 QfUzu3zOhC8drJc4R7bLg8opqRo9I5/MJ19MMmamUwgg94AOwyrLtvKlKhiSFoHb8IqY
 f3EDDQbzEY7DgGyIGvrQVdmBtBuaBgx03RtWX1Bpk5kwMVHeKve0MxRRwp1ckdT5rHAr
 Nr2DfWv32fVoBzLK7IJwtMohoFc6ea2D+G97jsGIBn/U0Z3V8QhKLjwqQR3VNYv9seTo
 7plcADy9VZP9l5/xhI6LHtebUqjyP7deTnjP2Iv4v+XavDckE9c4gEF71pofbDVEW7B1
 GftA==
X-Gm-Message-State: AOAM5319RYYAsX4Ds/LrNfluJUEH79BJ/L1nKEhhSoX5XG+mC7po19I0
 /eSX1GjYkl53PoFeFnBwiFN09lsEsysiuVBzih4=
X-Google-Smtp-Source: ABdhPJzDbmskhS3fYDGwHIA5dmRFc7jRhG2qyjMrvA5e0Q78j9kJZ0qTKH57Ecu3nw+Ti72owKs6Kw==
X-Received: by 2002:a5d:58fb:: with SMTP id f27mr38085575wrd.10.1637579635192; 
 Mon, 22 Nov 2021 03:13:55 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id y15sm9121039wry.72.2021.11.22.03.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 03:13:54 -0800 (PST)
Subject: Re: [PULL 0/5] Linux user for 6.2 patches
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211122082310.377809-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <076a3d26-ca6c-0e6a-cef5-0c10cc44c3cd@linaro.org>
Date: Mon, 22 Nov 2021 12:13:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211122082310.377809-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 11/22/21 9:23 AM, Laurent Vivier wrote:
> The following changes since commit 8627edfb3f1fca24a96a0954148885c3241c10f8:
> 
>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2021-11-19 17:16:57 +0100)
> 
> are available in the Git repository at:
> 
>    git://github.com/vivier/qemu.git tags/linux-user-for-6.2-pull-request
> 
> for you to fetch changes up to 802ae45e94151a6d3ee20eadcb865cf6c875df34:
> 
>    linux-user: fix Coverity CID 1464101 (2021-11-22 09:17:08 +0100)
> 
> ----------------------------------------------------------------
> linux-user pull request 20211122
> 
> Fixes for CID 1464101 and gilab #704
> 
> ----------------------------------------------------------------
> 
> Laurent Vivier (1):
>    linux-user: fix Coverity CID 1464101
> 
> Richard Henderson (4):
>    linux-user: Split out do_getdents, do_getdents64
>    linux-user: Always use flexible arrays for dirent d_name
>    linux-user: Fix member types of target_dirent64
>    linux-user: Rewrite do_getdents, do_getdents64
> 
>   linux-user/elfload.c      |  10 +-
>   linux-user/syscall.c      | 314 +++++++++++++++++++-------------------
>   linux-user/syscall_defs.h |  12 +-
>   3 files changed, 172 insertions(+), 164 deletions(-)

Applied, thanks.

r~


