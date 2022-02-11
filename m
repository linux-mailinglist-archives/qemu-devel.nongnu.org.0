Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DC04B1DF1
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 06:34:33 +0100 (CET)
Received: from localhost ([::1]:40590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIOZk-0004JF-4F
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 00:34:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIOVD-0004zK-BQ
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 00:29:51 -0500
Received: from [2607:f8b0:4864:20::1035] (port=55035
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIOVB-0007dw-RJ
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 00:29:50 -0500
Received: by mail-pj1-x1035.google.com with SMTP id on2so7133015pjb.4
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 21:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6KywJYhRi1DO9q3P1bCNK0kkmsYRCU8GAiCpi/wDtAQ=;
 b=iZP1aCvlg7VajKswTvoHZMwj6xuWBKzCl2INaz5wHEjFSAKopnnnrfg7snrpX4eM+J
 JQDQ+1Hi7v5kpi80kWi6zlk4SwTcTvqHtVGMemktJBXjP8BTlwq6PJSCAitO+v/NJ4+C
 ZSq8B6SMZZtDPbkpQc7c12xkJBH0/egJjgiw3LNn0zlJ+r3RM+4THZYIFPZoYWWjtD9K
 l3jE3CUfZtZWe3Gp83B7Q1ZC+fCcFhpfDm+lJKHQm+4KF0G7w2GNd1ObQ6q2wjRhnu4e
 VyN7IhdfcozVluCiNb/0pYB85NT9vUlIOkcbPf5/VEKo2Rp5BsKA60ZJxVYsAPlJeBr5
 0VQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6KywJYhRi1DO9q3P1bCNK0kkmsYRCU8GAiCpi/wDtAQ=;
 b=pmX3nBv7FPrToWhua93R5sldAFYirvxwK5zv5uOBcZkJRQv1LKCptKEl766CoYdwsP
 Mzp/BM9CTf/kFd331EqGw5I26P72NtMJBp3GjVs7KOsiS32+R/8TcexFGKUCN8OmfI3A
 hg+RL6hPHJbKFiksNFOjIGSdVsJaKzV99I6xlFaESTdVwl85EtnAURXqO5jLOdyus8Ij
 iHdIJRpVDp0hXL5nzjyBaqzBXMXdafwGrqDmVs+Kx2dCpiTdj3In8uJoc1+s3alNee26
 nktgOehrQai3YwMQYsBK5UfdqpSMNN88AQOhVs5juzo7HToHi1SbiOY6sJhU39scGMTT
 yctw==
X-Gm-Message-State: AOAM530sKQwJceUy4n92RoQq8xgDFbr7DgnQi+tKCNh6B/I/GLPnnJT6
 FHtH+0C9IXYJ5soCKPj9SIOfkg==
X-Google-Smtp-Source: ABdhPJx6kx6AWMS3PhhDd/gxqiuwGXN/7IUsIB9ZjWV0ci/Q0O0hh0VHQoa1w61zN5q/k92L+le5wA==
X-Received: by 2002:a17:902:6b0b:: with SMTP id
 o11mr17216plk.169.1644557388613; 
 Thu, 10 Feb 2022 21:29:48 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id 10sm24826191pfm.56.2022.02.10.21.29.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 21:29:48 -0800 (PST)
Message-ID: <7d04f840-ca37-ec95-c46d-cb4ae9772e13@linaro.org>
Date: Fri, 11 Feb 2022 16:28:08 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 17/37] target/ppc: implement vcntmb[bhwd]
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220210123447.3933301-1-matheus.ferst@eldorado.org.br>
 <20220210123447.3933301-18-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220210123447.3933301-18-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 23:34, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            |  8 ++++++++
>   target/ppc/translate/vmx-impl.c.inc | 32 +++++++++++++++++++++++++++++
>   2 files changed, 40 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

