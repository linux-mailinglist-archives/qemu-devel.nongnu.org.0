Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C470F49112A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 21:58:48 +0100 (CET)
Received: from localhost ([::1]:52374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Z5T-0001KC-Fv
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 15:58:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n9YxN-0002H4-71; Mon, 17 Jan 2022 15:50:26 -0500
Received: from [2607:f8b0:4864:20::231] (port=38627
 helo=mail-oi1-x231.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n9YxL-0007vg-OE; Mon, 17 Jan 2022 15:50:24 -0500
Received: by mail-oi1-x231.google.com with SMTP id g205so25364640oif.5;
 Mon, 17 Jan 2022 12:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2h9Ljg/csysAJNX4KNjjyHpI9U7wGxwBQ4g33qC93+U=;
 b=VVrUs/8Gig9r2hpq5MhxDvRENvZzzz8LLlMdgajYfG2gsNcJAXHwDrhQfkOc8o8Ghj
 l8VuMVLMF5tOJW/81+Mi3QV/omVd/GTnkX4PrC+9dJrFfgujd16h7FzQJpouJ37X8I/q
 RvT4fHodj26aYOspJZU1ziPLKaSXQovO9yZNDyAJeh3V/Sr4qpxLh+zhBed8Fke+u04L
 trQPxy+ZnPdcFLs35FnCUs4E2cmwiXPhdrdkiMRZP/q/CZo6KTCdCt7m03dyvSc3KK1R
 00Vv61CtsWzE6bk5tZmuDzUyzJ7CWczhaS29AJuC5AjpSgMJOEUMDRVnvzlPf4VXK1DX
 NFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2h9Ljg/csysAJNX4KNjjyHpI9U7wGxwBQ4g33qC93+U=;
 b=hxFc1pwB85Z5EDWX4Mb8g0AtNd7+tldMuSDxgcS2ewE5ppKpRzHpNsnBYiyyQm5Smo
 GW3pJ7Y3QQX5gopTF8zmKiWT0XuZ1TMwyssp0bZndTudMTQLLSnsoS5+HsTkcUPNZBL+
 DMmcpqruKbACdY+JNjMtTaoItUZ84pu2ZHdrfKecYnkqpsDgyIvFoLGo/0s/8OXrtzPu
 IW9BG6UXYsNml0Sf0IE+wS6HMC/hcttEKTe0SKBwk5cNVTZNsIdEh/AXGVak7iNZEiQh
 VAQRY1dS7WqK2BGll1NT4s10U6x6FLyjErZtuvOyGJJ2Qt5HY/07vh3QDILBNSp30LEL
 uHTA==
X-Gm-Message-State: AOAM530wsoXfMJhWG8ZPhNbKTKUvjUq4BjaC8G/GMtBAlx2j7dHZtXtN
 kiASKMhBbrVwRwSfZuYF7T8=
X-Google-Smtp-Source: ABdhPJzeRU5WykgbsXEl518+64j75lZXYPbfVCEDeHuKjZMkZ57aJ/oNo7FlECiHidrJ4O7CrFtZZA==
X-Received: by 2002:aca:bd04:: with SMTP id n4mr24948195oif.142.1642452622135; 
 Mon, 17 Jan 2022 12:50:22 -0800 (PST)
Received: from [192.168.10.222] ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id bj3sm5144438oib.11.2022.01.17.12.50.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 12:50:21 -0800 (PST)
Message-ID: <383cd8f1-1179-5376-0d60-bcf65d013014@gmail.com>
Date: Mon, 17 Jan 2022 17:50:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/3] Rename ppc-spapr-uv-hcalls.txt to
 ppc-spapr-uv-hcalls.rst.
Content-Language: en-US
To: lagarcia@linux.ibm.com, qemu-ppc@nongnu.org
References: <cover.1642446868.git.lagarcia@br.ibm.com>
 <ea1554e3a02e093eaa64d1260faf01d525c9ecdc.1642446876.git.lagarcia@br.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <ea1554e3a02e093eaa64d1260faf01d525c9ecdc.1642446876.git.lagarcia@br.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::231
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/17/22 16:19, lagarcia@linux.ibm.com wrote:
> From: Leonardo Garcia <lagarcia@br.ibm.com>
> 
> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   docs/specs/{ppc-spapr-uv-hcalls.txt => ppc-spapr-uv-hcalls.rst} | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename docs/specs/{ppc-spapr-uv-hcalls.txt => ppc-spapr-uv-hcalls.rst} (100%)
> 
> diff --git a/docs/specs/ppc-spapr-uv-hcalls.txt b/docs/specs/ppc-spapr-uv-hcalls.rst
> similarity index 100%
> rename from docs/specs/ppc-spapr-uv-hcalls.txt
> rename to docs/specs/ppc-spapr-uv-hcalls.rst

