Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D55EB4E21A6
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 09:01:03 +0100 (CET)
Received: from localhost ([::1]:44510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWCyL-0004gS-Gs
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 04:01:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nWCwQ-000414-9B; Mon, 21 Mar 2022 03:59:02 -0400
Received: from [2607:f8b0:4864:20::22e] (port=38541
 helo=mail-oi1-x22e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nWCwN-00088L-Vy; Mon, 21 Mar 2022 03:59:01 -0400
Received: by mail-oi1-x22e.google.com with SMTP id n7so15425720oif.5;
 Mon, 21 Mar 2022 00:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jieU4KFvYwIqe/gAdpz8BJ+Sr4Ve5oOalxGttFG7GdY=;
 b=nmWB8r8RxAaD/kc8jtXDWgZzWD9I7v3yECEjA5FpZBkmu2pZHsK5tmmIg5b7ZGdd48
 KqloVA9iYFkUxyXPiKLV0T1oNe77WJJX+KXfLy1v+hw4Io6YdgJNRoJq7YV4nVSVWRiF
 ZcNC34EGeuSLDGt0VVbXV9P8FpsPXacJE2e1mVk6wFMtqZ+/7c32En9gw3m47BOATNPu
 eBXoqMzPZi+3oxG/PC/UVpgoHMT14DHlWKGU3Q8V3/7HFQMilbdNLl1mn4NfoqWnuQ7Q
 fSXaI5khL9Ril22Z/NGZrEjx+Rbymt+yDG2CjvUReeQO+Cb5bDbSUmFljbN7CgQFfTMr
 C8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jieU4KFvYwIqe/gAdpz8BJ+Sr4Ve5oOalxGttFG7GdY=;
 b=H6jXkX6YQzT98YFJRGUjo7yNgasnhGc2ZdMxyq63FHl5RXQD5oG76g6+GxBQMQirnv
 c+/03rwa0AZiHAklH6NKv2ofLTndqG4VMLG7q79jpGFr/mOQAKcC629BCfR+rpRz/FiI
 GFtlQwObsBgwGtsdsdGXU8j8W45JhIu2D+QtpaQ+OgD2TlcZq3sw18Vi5f6GX+2wYfN0
 a/IKiwSGpfXuRN7fq4okpm7ftM7lgMIh09X/v/YWi6uiBubzrt67YKlpJZQniolgHGiR
 8/g7ISC6T/tUHozGyb6xAsn65zmYYJlVINtnBYFqoCCWGBRBxTJANExNrRE/oLcniMwh
 I0rA==
X-Gm-Message-State: AOAM530aIvRJgK70yelH1wnOIzd2W7E0OU6x/vI+wsgsjWi+AjyyLDRS
 z4tNj6sU/r/yJKfKTxEYRjI=
X-Google-Smtp-Source: ABdhPJymo7GXtHaXf/8liSrCYE1fpIyyIKusZDe1Z/r11oaWm9i2zS37S6nxUiahDg9GW9fRHYHDmA==
X-Received: by 2002:aca:4b88:0:b0:2d9:f709:2c07 with SMTP id
 y130-20020aca4b88000000b002d9f7092c07mr8770861oia.212.1647849536865; 
 Mon, 21 Mar 2022 00:58:56 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:daa8:d948:1d15:1451:398f?
 ([2804:431:c7c6:daa8:d948:1d15:1451:398f])
 by smtp.gmail.com with ESMTPSA id
 ga14-20020a056870ee0e00b000ddcf36aa56sm3506913oab.48.2022.03.21.00.58.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 00:58:56 -0700 (PDT)
Message-ID: <9b90b3a2-c4a1-1b3c-d6d9-2c96921d7d14@gmail.com>
Date: Mon, 21 Mar 2022 04:58:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH for-7.1 0/9] spapr: add drc->index, remove
 spapr_drc_index()
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
References: <20220318173320.320541-1-danielhb413@gmail.com>
 <Yjf3Ifdun+jaJ8zF@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <Yjf3Ifdun+jaJ8zF@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/21/22 00:55, David Gibson wrote:
> On Fri, Mar 18, 2022 at 02:33:11PM -0300, Daniel Henrique Barboza wrote:
>> Hi,
>>
>> I decided to make this change after realizing that (1) spapr_drc_index()
>> always return the same index value for the DRC regardless of machine or
>> device state and (2) we call spapr_drc_index() a lot throughout the
>> spapr code.
> 
> Hmm.. so, spapr_drc_index() wasn't ever intended as an abstraction
> point.  Rather, it's just there as a matter of data redundancy.  The
> index can be derived from the drc->id and the type.  Unless there's a
> compelling reason otherwise, it's usually a good idea to store data in
> just one form (if there's more it's an opportunity for bugs to let it
> get out of sync).


Hmm what if we store drc->index instead and derive drc->id from it? drc->index
is read from several places, while drc->id is used just in spapr_drc_name() to
write the DT (via spapr_dt_drc()).

I'll think more about it.


Thanks,


Daniel

> 
>>
>> This means that a new attribute to store the generated index in the DRC
>> object time will spare us from calling a function that always returns
>> the same value.
>>
>> No functional changes were made.
>>
>>   
>> Daniel Henrique Barboza (9):
>>    hw/ppc/spapr_drc.c: add drc->index
>>    hw/ppc/spapr_drc.c: redefine 'index' SpaprDRC property
>>    hw/ppc/spapr_drc.c: use drc->index in trace functions
>>    hw/ppc/spapr_drc.c: use drc->index
>>    hw/ppc/spapr.c: use drc->index
>>    hw/ppc/spapr_events.c: use drc->index
>>    hw/ppc/spapr_nvdimm.c: use drc->index
>>    hw/ppc/spapr_pci.c: use drc->index
>>    hw/ppc/spapr_drc.c: remove spapr_drc_index()
>>
>>   hw/ppc/spapr.c             | 18 ++++-----
>>   hw/ppc/spapr_drc.c         | 79 +++++++++++++++-----------------------
>>   hw/ppc/spapr_events.c      |  4 +-
>>   hw/ppc/spapr_nvdimm.c      | 10 ++---
>>   hw/ppc/spapr_pci.c         |  5 +--
>>   include/hw/ppc/spapr_drc.h |  2 +-
>>   6 files changed, 48 insertions(+), 70 deletions(-)
>>
> 

