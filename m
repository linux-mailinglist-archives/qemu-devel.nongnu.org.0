Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F4A42AFA6
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 00:29:25 +0200 (CEST)
Received: from localhost ([::1]:44058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maQGy-0007ww-B6
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 18:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1maQFr-0007Gu-SD
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 18:28:15 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1maQFq-0006ce-De
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 18:28:15 -0400
Received: by mail-wr1-x431.google.com with SMTP id u18so1807403wrg.5
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 15:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Qvi9n9pzSLhkc+t2JUsE1yQsFwZii5J+CIzCP99cV68=;
 b=bV0/x3/KDW5RPzMK62oYQUd8cK389F2sVSqr6zTkIyHdQuFkk1Y+VTx49LGqNgd2bO
 yLzk17B+DhlWTrxLEok6GZuJL3SaMMnjUIRzexHBfigSr33PtotsiF7gNXnkQiRbPIjU
 jSs7s6Bkmio105/1vpinzge2/XXBwLleAxnX6+Ar2ROWZcsBddJL3H8x4uq1XZwq443l
 QPuBSKb6VgVgRpRVe9K5oOsKPUvMomq0XCAFDg3ROlhDVkOEhSihvog/wpNY+F0/2u9Z
 fP6gsDzXs4Geil2RWnDc0jOrWlfOzP0/Epj9jbK1AUNQaccvZyggI0IAbb04N8eV3vnS
 Vj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Qvi9n9pzSLhkc+t2JUsE1yQsFwZii5J+CIzCP99cV68=;
 b=5IJNs0pws3T5VFgwFgKIiZpC/eHxP5yIa1wPL9S8pOEZOXHtV5QyKqAwLnczx5lqQQ
 WJBwPvwGIP7DnTI+dKmKzdD5Ztq3sg9Kmcqy+Bd5jIVyAP3Xj+SeKwBGrpAAAQLZzvm5
 NXZ5vB7gku2jLNZiDRionv4McMauY+jUyQXHZZjOolrWZZOo4LwPVBOE7URpW2laf1C/
 H08WtBDZ5M9V2vckVe2aXxSYIgOFOr99B2/ifC52O4xEOkEV0uB4+h57V9+gTuIVaL1q
 TBci2Ig//25yvG7aajRAD4PL80QilyCaN12lj/7lj4IAzj6fRrkkKO3ODFBX9jQ1sXPT
 mgxg==
X-Gm-Message-State: AOAM532ueCub2dQnAjGFO4qmUG3wJnY0D+6tMLdvR61PoQh+Ys4XiXQd
 GNWfaVIAWM1OfvsuT/ImeCY=
X-Google-Smtp-Source: ABdhPJyjcveGD3bKMwclCmVpkQVpvuN9UwqFNPWWKhJUKeJoqDfAdanmCmsGXofBvbiV8v/PJRT8Cw==
X-Received: by 2002:adf:fc8c:: with SMTP id g12mr30676469wrr.309.1634077692852; 
 Tue, 12 Oct 2021 15:28:12 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id o1sm11908098wru.91.2021.10.12.15.28.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 15:28:12 -0700 (PDT)
Message-ID: <1d09e8d6-9d81-42d4-b333-63c4baa2306b@amsat.org>
Date: Wed, 13 Oct 2021 00:28:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 19/23] target/rx: Drop checks for singlestep_enabled
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211012162159.471406-1-richard.henderson@linaro.org>
 <20211012162159.471406-20-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211012162159.471406-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 10/12/21 18:21, Richard Henderson wrote:
> GDB single-stepping is now handled generically.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/rx/helper.h    |  1 -
>  target/rx/op_helper.c |  8 --------
>  target/rx/translate.c | 12 ++----------
>  3 files changed, 2 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

