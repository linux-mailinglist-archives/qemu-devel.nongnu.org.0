Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11C7B168B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 01:04:07 +0200 (CEST)
Received: from localhost ([::1]:39750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8Y8E-0005cv-TE
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 19:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48614)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.weiyang@gmail.com>) id 1i8Y6z-00059B-M2
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 19:02:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.weiyang@gmail.com>) id 1i8Y6y-0005rk-Iq
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 19:02:49 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:37910)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
 id 1i8Y6y-0005qz-CJ
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 19:02:48 -0400
Received: by mail-ed1-x544.google.com with SMTP id a23so23174135edv.5
 for <qemu-devel@nongnu.org>; Thu, 12 Sep 2019 16:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KOI/nyuTce2Bu5SrmAw8pPdDvAeWq5HQDyv4RefAR4U=;
 b=R8+vRlfSbTyMvkZsSWgvzuVOGtKBguue16CaLVs3Cd3Awpsqsg9uZuPEcIMnF3qTbE
 Wx4ylbNbqNIi43z55dJJn8eju/ELoljIE4g9mT6IONf37Q9RE6nulPjUuKH6qfYFT/th
 nPEQPz9ZEXrx2Yq4dnZrrvfSEO9HAXwrSAolx6Ns8Lu+lcBGvSgm/lkUktjVvyhijk8U
 ilnHz7yZ8KR6HBrhwYeh8iR/CFLIy2CfiM12Rxmr+R4QflI0PniH7SzObp5cXwXC7tR6
 MWYGLid5UzI/P1xo2OU3tpOuyKdn3qoqgcxj+eX+gnsuty+Lq6lWeO4b4q/DlT1T3g7/
 65sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=KOI/nyuTce2Bu5SrmAw8pPdDvAeWq5HQDyv4RefAR4U=;
 b=fLd9+WkR+naylMcyJR4ct3q28vJ7YQlX7timmZQ4IIxMZMfOV6pELCsV1XDb5dp5XS
 BlfZuvYk4u3lmlxNdmToZI2YekSOg9SQmILKHJqdiwO8KRuf/WKxPu5n2uWPjpQmvPER
 jZeasXzGzzJal74JxfaUAlxMrI0y1vbYN9xRNamegVBRNeglC/PgBcko+axjveBwqkrc
 aY370pjxiuoVu6FWe1Dp9EO31iXNe0ya93el8j/aAzbHTnr+zDTxRi7TN2jo3emgUgxk
 +efCuEh8sj7VB6R5359EQ0gcXQp0YrQ6NkmWVj6Hkz5QsnmevVdpp45mN+f8VfZQX+FK
 bsHA==
X-Gm-Message-State: APjAAAXMNmD+sMTqt6HlTDRKbUwTKGRmDQ4Hvd1ovT2L6KnQGbj2n/KY
 WFrM6NkXt+9c9ENDrc+xDHhYAVOM
X-Google-Smtp-Source: APXvYqyjwpmWtWZyRONfLs7eokLpahoGSm/pLpS4EjuLcsjFmpqF6kBVPM9KbVFFcykdBaE5LviBGA==
X-Received: by 2002:aa7:de0b:: with SMTP id h11mr43988160edv.109.1568329366336; 
 Thu, 12 Sep 2019 16:02:46 -0700 (PDT)
Received: from localhost ([185.92.221.13])
 by smtp.gmail.com with ESMTPSA id e52sm5043487eda.36.2019.09.12.16.02.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Sep 2019 16:02:45 -0700 (PDT)
Date: Thu, 12 Sep 2019 23:02:44 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190912230244.6puc4hwfxxwejx6m@master>
References: <20190321082555.21118-1-richardw.yang@linux.intel.com>
 <20190321082555.21118-3-richardw.yang@linux.intel.com>
 <d5fb9e01-acb9-06ab-edf9-57e2b80bd880@redhat.com>
 <20190823010750.GA21179@richard> <20190912025150.GA25169@richard>
 <c9f18d8e-b7cc-b9d1-1e10-ddbbb4cfd43a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9f18d8e-b7cc-b9d1-1e10-ddbbb4cfd43a@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::544
Subject: Re: [Qemu-devel] [PATCH 2/6] exec.c: remove an unnecessary assert
 on PHYS_MAP_NODE_NIL in phys_map_node_alloc()
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com,
 Wei Yang <richardw.yang@linux.intel.com>, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 12, 2019 at 02:42:26PM +0200, Paolo Bonzini wrote:
>On 12/09/19 04:51, Wei Yang wrote:
>> On Fri, Aug 23, 2019 at 09:07:50AM +0800, Wei Yang wrote:
>>> On Thu, Aug 22, 2019 at 12:24:32PM +0200, Paolo Bonzini wrote:
>>>> On 21/03/19 09:25, Wei Yang wrote:
>>>>> PHYS_MAP_NODE_NIL is assigned to PhysPageEntry.ptr in case this is not a
>>>>> leaf entry, while map->nodes_nb range in [0, nodes_nb_alloc).
>>>>>
>>>>> Seems we are asserting on two different things, just remove it.
>>>>
>>>> The assertion checks that this "if" is not entered incorrectly:
>>>>
>>>>    if (lp->skip && lp->ptr == PHYS_MAP_NODE_NIL) {
>>>>        lp->ptr = phys_map_node_alloc(map, level == 0);
>>>>    }
>>>>
>>>
>>> Hmm... I may not get your point.
>>>
>>> phys_map_node_alloc() will get an available PhysPageEntry and return its
>>> index, which will be assigned to its parent's ptr.
>>>
>>> The "if" checks on the parent's ptr, while the assertion asserts the index for
>>> the new child. I may miss something?
>>>
>> 
>> Hi, Paolo,
>> 
>> Do I miss something?
>
>Sorry, I was on vacation.  phys_page_set_level can be called multiple
>times, with the same lp.  The assertion checks that only the first call
>will reach phys_map_node_alloc.
>

Ah, I am just back from vacation too. The mountain makes me painful. :-) 

So I guess you are talking about the situation of wrap around.
PHYS_MAP_NODE_NIL is an indicator that this lp is not used yet. And we are not
expecting any valid lp has its ptr with value equal or bigger than
PHYS_MAP_NODE_NIL.

If this is the case, I am thinking this won't happen in current
implementation. Because if my understanding is correct, the total number of
PhysPageEntry would be less than PHYS_MAP_NODE_NIL.

First let's look at the PHYS_MAP_NODE_NIL's value

    PHYS_MAP_NODE_NIL = 2^26 = 6710 8864.
    
So we could represent 6710 8864 PhysPageEntry at most.

Then let's look how many PhysPageEntry would be. The PhysPageEntry structure
forms a tree with 9 nodes on each level with P_L2_LEVELS levels. This means
the tree could have 9^P_L2_LEVELS nodes at most. 

Since

#define ADDR_SPACE_BITS 64
#define P_L2_BITS 9
#define P_L2_LEVELS (((ADDR_SPACE_BITS - TARGET_PAGE_BITS - 1) / P_L2_BITS) + 1)

And TARGET_PAGE_BITS >= 12, so P_L2_LEVELS is smaller than 

    7 = (64 - 12 - 1) / 9 + 1.

This leads to 

    9^P_L2_LEVELS <= 9^7 = 478 2969

It shows PHYS_MAP_NODE_NIL may represents more node the tree could hold.

The assert here is not harmful, while maybe we can have a better way to handle
it?

>Paolo

-- 
Wei Yang
Help you, Help me

