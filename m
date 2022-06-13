Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91925549E2A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 21:54:48 +0200 (CEST)
Received: from localhost ([::1]:43954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0q99-00085h-F2
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 15:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0q2R-0003Ly-G7
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 15:47:51 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:46671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0q2N-0004jj-Vb
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 15:47:49 -0400
Received: by mail-pl1-x62d.google.com with SMTP id d13so5921832plh.13
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 12:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=o1SDu3eKYprvBOm7tFi/htqtb8OxrC00v1zRrccZxWM=;
 b=JCSRScMkJc8BDgh+BEnSzUjvJrPwceyu6kpXsHQCm3XVPGxnweJqewZUH+eRO9TZdu
 A3X5MxhAt7DR8bRJ1T+MVKB2vpTBsbz0zYFeBRx4vlU5BI/DGN6irCQCLPeNCaWJzoYx
 ajjj4p47w6dqOneEtj6fYPkiQ2V/y4+wIQwEttdAH6E3FePJA9SyAeJ8XinUc+CoHqJj
 98HMRA9fzfc9C1bxkJSZZ1W/5X1tCEsQc9iQLJEMEY3WyIYyHy/vXrHv/hHOSd/DSLnf
 9/z4asSeDNc8h7tz44zbGC2zCpT5x4v+npD/DYLnETnqf75hEMf30bx6tfbkhXB0sZfg
 mErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=o1SDu3eKYprvBOm7tFi/htqtb8OxrC00v1zRrccZxWM=;
 b=r0LG9GzBCOICkDKMoy2pBKaANeZWOjqfgdCOZHSR12Tv3JWWgOew4HafIhCWjvpRg2
 ES7DPZTwp9FTVNfe+TVSzbhnla6T89hXdE+MeVqUheR2r8EMh++hMdQGJrOzRhl9lljT
 RzdpvqEdBwgZdNl5mxc8orJWXJY+OUDv7iGVP/1t2LCBEilFcBVgpyXjCxsQCBlGtYCk
 +/UGNi6X+nxbNekhVRUIj02pi42Okv7TyCT9nfE0vSCczu61I7Q0P/wHNy2/ka6SV1ht
 UNp+OaiKJjqyLbm4Me/xwas2FBa1sMRsVhC6Jz5wH7KwBFIvhmJDuZ2EonyShiJL8LFi
 4NcA==
X-Gm-Message-State: AOAM530LGF/EnuUrBQp5yOIaV88kJZGRzRzBGHzWfz4xUdM6L2x1b8jN
 5JWcXjSUBgNizHECbjlznZ7cEA==
X-Google-Smtp-Source: AGRyM1tyjL8Gsz0jMuP3dNlx3eMmNSNPms4w9TnsbT0+j0VThcPjV3AIG7nxR5UNb/8kJvBzYvDbyg==
X-Received: by 2002:a17:902:d904:b0:163:dd91:87 with SMTP id
 c4-20020a170902d90400b00163dd910087mr917918plz.34.1655149666181; 
 Mon, 13 Jun 2022 12:47:46 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 cd25-20020a056a00421900b0050dc76281f0sm5750606pfb.202.2022.06.13.12.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 12:47:45 -0700 (PDT)
Message-ID: <0c917c42-9daf-b9c5-17fc-cbca491aafab@linaro.org>
Date: Mon, 13 Jun 2022 12:47:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 03/11] bsd-user: Implement revoke, access, eaccess and
 faccessat
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, def@FreeBSD.org, arrowd@freebsd.org,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>
References: <20220612204851.19914-1-imp@bsdimp.com>
 <20220612204851.19914-4-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220612204851.19914-4-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

On 6/12/22 13:48, Warner Losh wrote:
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/bsd-file.h           | 53 +++++++++++++++++++++++++++++++++++
>   bsd-user/freebsd/os-syscall.c | 16 +++++++++++
>   2 files changed, 69 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

