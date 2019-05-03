Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFECB12710
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 07:20:09 +0200 (CEST)
Received: from localhost ([127.0.0.1]:34636 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMQcC-0005XM-Tl
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 01:20:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hMQb6-0005Dc-H8
	for qemu-devel@nongnu.org; Fri, 03 May 2019 01:19:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hMQb5-00036N-IF
	for qemu-devel@nongnu.org; Fri, 03 May 2019 01:19:00 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:39373)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hMQb5-00035d-5I
	for qemu-devel@nongnu.org; Fri, 03 May 2019 01:18:59 -0400
Received: by mail-pl1-x62a.google.com with SMTP id e92so2138388plb.6
	for <qemu-devel@nongnu.org>; Thu, 02 May 2019 22:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=BbQh5kaSNrtOxEqGr+eq9TmZN5oqGFwlws5wOD1E/Xs=;
	b=fEvOschzUNCYzMksJB4/ruFAXoLZB8z95aTAa7oNd1OKSLzWVcFhcT6ODF9gCdZej5
	KYo/DGsWgUwBtHPfQUA8+6h3dcu8T/gh/wYLh9LKPgUO6UTkJ6Yk2ljUZ/R3EASKC73E
	XQB5F8cUd5Izyl8dmZCcSxQcWWhTgOOIsjkCmMT1RiuQMFiS2ryX6I5LRc3w76X5//MU
	zkKDGE5qILW5rmXAR7KF/Fxjh/UONOkDcspfDtiRLOz6MRWFFeCegQTD860xZinndWFE
	CwMySyvTZ5xzpfft9Hlio0OefNq9uOKvyjnXSJry4dBqmCfyshkLZlEOro5p3mzbwkU7
	etGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=BbQh5kaSNrtOxEqGr+eq9TmZN5oqGFwlws5wOD1E/Xs=;
	b=uHBU/zKqHvP7IEirnrsZIqDne5eiaYdVJrucEH+eP9y+sPUH+fnjDM1fWhDm7+jJQX
	/ExzCKcZ55KWyT/cuRIcawsmCaiLTS8B+ssWSaeAwCgIPzTohnxr+mKXaYADOncOzg9w
	Imt1VWBrMMFoVch7O3gq1S7qvPCVuq8Jo5MMjnKsXt7GToOSVTwKlMMnp1Bz1fhrNJ/N
	wJj31buxKRnQW1c2+Rv5Nn5PoYnjNd38xCUnIYf1CCaASPYnim67bsc+VQ9tNfVZ/pMb
	2vGA9c9MiTZCshJ9aH9zMBBvTcCEETp9V6kqyW6DnRQBKNgSemLxTOHpL65XK/806XoO
	cjeQ==
X-Gm-Message-State: APjAAAUvHkzbQzqgeOrXUKFpqpfQ6C/rJMmrG87fnyUSkVP3fJhwrU7V
	Qc0f3+YpXZz+gtoD6TPhfgqbFg==
X-Google-Smtp-Source: APXvYqz/6ZDrkDbbF36RJySO/Vk8R1nPQNo6IEAqUnkLP7+vUHytrdn4svOrozgdo/1IbIrq/5xoKQ==
X-Received: by 2002:a17:902:e58a:: with SMTP id
	cl10mr7782631plb.226.1556860737710; 
	Thu, 02 May 2019 22:18:57 -0700 (PDT)
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
	by smtp.gmail.com with ESMTPSA id n9sm1076702pff.59.2019.05.02.22.18.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 May 2019 22:18:56 -0700 (PDT)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190502141019.6385-1-david@redhat.com>
	<20190502141019.6385-13-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f5e80e59-726f-831d-ae58-2e8b9e5a48f3@linaro.org>
Date: Thu, 2 May 2019 22:18:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502141019.6385-13-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62a
Subject: Re: [Qemu-devel] [PATCH v3 12/40] s390x/tcg: Implement VECTOR COUNT
 TRAILING ZEROS
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/2/19 7:09 AM, David Hildenbrand wrote:
> Implement it similar to VECTOR COUNT LEADING ZEROS.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/helper.h           |  2 ++
>  target/s390x/insn-data.def      |  2 ++
>  target/s390x/translate_vx.inc.c | 28 ++++++++++++++++++++++++++++
>  target/s390x/vec_int_helper.c   | 14 ++++++++++++++
>  4 files changed, 46 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


