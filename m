Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D0048DF16
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 21:39:38 +0100 (CET)
Received: from localhost ([::1]:57554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n86si-0004pT-1k
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 15:39:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n86mJ-0007Yd-4O; Thu, 13 Jan 2022 15:32:59 -0500
Received: from [2607:f8b0:4864:20::22d] (port=42958
 helo=mail-oi1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n86mH-000639-Ho; Thu, 13 Jan 2022 15:32:58 -0500
Received: by mail-oi1-x22d.google.com with SMTP id y14so9416118oia.9;
 Thu, 13 Jan 2022 12:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kdteD8sFdMQG6m8cPN57GLrE5P7amvl2qLIbYFMeAes=;
 b=OfAEhRNq5Vvy+wejwQpNEOzCrs4nInuw/cMw+7ZRsZDRxbnlKbGmKgkkBFJZgVIC5U
 uw5CfJILf5qXTA+ooeSrqCz34yAgkgrQKQfRB7w0J0q8pRu/T/ZSQ3DX3sc44kyZFTHw
 VzuhtzRH1ZPfmBd7mxqEwuVRTbr/J8PV4cC7G2/plh5FzwV5FFWxZESQTeCHX3HKLRTW
 BLeQJy7+wyTjdVo+a7NEbscW5HGxuv5F3WeUNT0k7zPvLhrGHlIh+K/1UV5zP7FyZfRx
 HR1kLZbHPa4/N/tRcG+sZAcPO8mU9hHpt5kU7xVWlm+6KhRb3PtzEbu5u7TjwlZ8iBY9
 m8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kdteD8sFdMQG6m8cPN57GLrE5P7amvl2qLIbYFMeAes=;
 b=Ven6SnHNFJQ5SDldA+5Dzs1bsBsMT+ICEkYHpfiQaOLcCx8K0klSmVzZ++FFBAmeAh
 kXG3qYHZp90NpRY3dmnwf+XL0iXGPG50M/MckjqsR6VdyE408KrqcZQXy1o9m9iXprUy
 arrK+ueWcz9uXwrIuWzOP8+PEjFLmNpr0A0FBi4emp9J3/m2uOEBYGMLwJ3iMWSNmX65
 uMQzehb6/S6K/Ea7jZn5VVQhdcwPQCAY52qUT3aJ+L0QkGhr9UpdVBh9BpINK4/Nos0H
 +iwsuiLip8rXGkXzFvliUNH6pWsqKXkR2LDyjGlPa5mvtur9LjLbCr9GLcZnlIvrz7jl
 Ei/A==
X-Gm-Message-State: AOAM530Fw3rPrye3vJMfhrZOdCem6sBPduQAxZhkALu7xox/at9Bo6RJ
 8nkQjClgA8rk9Dt37HlHYP8=
X-Google-Smtp-Source: ABdhPJyKNmjZFxCZ+rBQ1zkqJTLlI6SxhP3sIXWmDNUtp/ddYPJRciETM5vqA7UC/lIi7rFYVJuJMQ==
X-Received: by 2002:aca:1805:: with SMTP id h5mr4665788oih.106.1642105976258; 
 Thu, 13 Jan 2022 12:32:56 -0800 (PST)
Received: from [192.168.10.222] ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id c15sm866401ooq.30.2022.01.13.12.32.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 12:32:56 -0800 (PST)
Message-ID: <9908a915-e370-bc37-e8e6-8925e7208f7f@gmail.com>
Date: Thu, 13 Jan 2022 17:32:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/3] docs: Rename ppc-spapr-hotplug.txt to
 ppc-spapr-hotplug.rst.
Content-Language: en-US
To: lagarcia@linux.ibm.com, qemu-ppc@nongnu.org
References: <cover.1641995057.git.lagarcia@br.ibm.com>
 <1f5860217273f272fddadc68b5d205b4090f6b04.1641995058.git.lagarcia@br.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <1f5860217273f272fddadc68b5d205b4090f6b04.1641995058.git.lagarcia@br.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 1/12/22 10:52, lagarcia@linux.ibm.com wrote:
> From: Leonardo Garcia <lagarcia@br.ibm.com>
> 
> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   docs/specs/{ppc-spapr-hotplug.txt => ppc-spapr-hotplug.rst} | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename docs/specs/{ppc-spapr-hotplug.txt => ppc-spapr-hotplug.rst} (100%)
> 
> diff --git a/docs/specs/ppc-spapr-hotplug.txt b/docs/specs/ppc-spapr-hotplug.rst
> similarity index 100%
> rename from docs/specs/ppc-spapr-hotplug.txt
> rename to docs/specs/ppc-spapr-hotplug.rst

