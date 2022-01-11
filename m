Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4373948B67C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 20:07:39 +0100 (CET)
Received: from localhost ([::1]:59286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7MUb-0007pt-Gq
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 14:07:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7MBP-0006Ci-RQ; Tue, 11 Jan 2022 13:47:47 -0500
Received: from [2a00:1450:4864:20::433] (port=40461
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7MBM-0006fq-V4; Tue, 11 Jan 2022 13:47:47 -0500
Received: by mail-wr1-x433.google.com with SMTP id x4so9553822wru.7;
 Tue, 11 Jan 2022 10:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tFrZXjbn33PJCvnOr9TQe2YHmZYMpQsfrKf2x0BIEpU=;
 b=LdFxYZ9Irpwtqlk4B31zipKVG+EcTpyRW2WZi4qWaGmDk14EK544nY3zUzARw1LNbI
 oD46wa6/7fp//xXPjgJXWHviAc3fByOZwBhPEog/CkeVqDtwA6xb5M+yHRU+KgF8Xx8M
 v1fj1uLQeSEq24Mx9iXGfFJcB8AFlby22tEH8ZmNbLfeEVgWDDkZRvM1iSF6419HzDff
 Bb97Jkl04DHl8/7S4BSPheG0RwT8RLQs3XuajK8ilJ2wtIA8MCRi2hPxpYcNDgJ3X/eM
 pvRqOZPAY9LwaQSnaE0cwXtlErwU4b6Rw6j1NbFEAso9hZdMlry5pOgk4lB1mNY5rlIs
 7HAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tFrZXjbn33PJCvnOr9TQe2YHmZYMpQsfrKf2x0BIEpU=;
 b=oawHWGIgc/SWhw4eRjYyj6Pxuy3MdceTC1kByj3oZcJi6N99gjfSxqP2pQ6V1Bpsz0
 WOfnUyCrYymvrI/8cK75kP6Kqq6QYVUyoVEC2WMk7mz6hxXuPyMdLKEY1155NrX9GSuT
 pp39LclKAXwX7DB5ktP9Est6gmZPGKrbBWC5o2oV7Ta6DLx4uoMqUjijujBze9fmRrn2
 YWboWHn9plIfyme+ki9ZmGViFaHRPzyK6zBUp11xuH8NFF2ipA1DfnITYhIC7JZrO0LH
 Jphs8Ugz0YJoPgbVw0PDacBRqKPQLtr3f/q44qWnkwyfpZ72KZ87wzPbRPuCFIq5tIRt
 7Mkg==
X-Gm-Message-State: AOAM531y4NT8i3l1IQeyBZlDQUvEg4ra3WFcpSX7hG8aCIUW+ybqPduF
 G9ho3Q9LR8poSBe9u50EQK8=
X-Google-Smtp-Source: ABdhPJzTuAleMbYNBtkAQ/oj+V02HE0DRaOX+1fJqMAK7cSTS95CaFrEev0pi8RRTe+VPj2qaiaDjw==
X-Received: by 2002:a05:6000:2a1:: with SMTP id
 l1mr4931268wry.412.1641926861925; 
 Tue, 11 Jan 2022 10:47:41 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id d4sm8046918wri.91.2022.01.11.10.47.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 10:47:41 -0800 (PST)
Message-ID: <70123c8b-3648-2168-d8fb-2727823f9387@amsat.org>
Date: Tue, 11 Jan 2022 19:47:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 0/9] hw/dma: Use dma_addr_t type definition when
 relevant
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20220104085431.2122999-1-f4bug@amsat.org>
 <20220106060800-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220106060800-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/6/22 12:08, Michael S. Tsirkin wrote:
> On Tue, Jan 04, 2022 at 09:54:22AM +0100, Philippe Mathieu-Daudé wrote:
>> Since v1:
>> - Addressed David review comment (stick to dma_addr_t type)
>> - Addressed Peter review comment (incorrect doc string)
> 
> 
> PCI things:
> 
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Thanks.

> who's merging all this? Yourself?

I just posted a v3 addressing review comments on this series.
Usually Paolo takes such patches, but I am happy to help sending
PR when this is trivial content (such this series).

Regards,

Phil.

