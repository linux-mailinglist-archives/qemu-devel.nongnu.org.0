Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E20B28F7
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Sep 2019 01:48:54 +0200 (CEST)
Received: from localhost ([::1]:48178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8vJ6-0007ho-Kt
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 19:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37607)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.weiyang@gmail.com>) id 1i8vI8-0007EG-Oh
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 19:47:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.weiyang@gmail.com>) id 1i8vI7-0002xG-So
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 19:47:52 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:33517)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
 id 1i8vI7-0002tv-KX
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 19:47:51 -0400
Received: by mail-ed1-x543.google.com with SMTP id o9so28462462edq.0
 for <qemu-devel@nongnu.org>; Fri, 13 Sep 2019 16:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=C8vlDYZHqbyr6peJkyfAJ9jUJioWVzJ6fWP8YQ/4XUM=;
 b=qOVcKILK6Ww8bwnDx/ZMgkicfwBniAaGLam937lpePFyCEzy2ukWdBvNvlVlZRQuhe
 wiFx9Muu+K9T3ewdXnrR4+Galo7hFbTF4mwRRXeK56MK/qex6R3Mvar/dG/pnsZWlRQj
 TX/PGh8CQrP7zAQwa3bM4OyoHT6bIRBW5K9m7qf+ct9rj5ZNMxEauXygXP/THJzfywPB
 4XU+w0c9jkAroKLLAIh6wJMWWrrsIIS1dM4GGKVLzspSIjMS8sWEMWv8amEZyQrXNrqc
 1FWzLsiPCZ0CQuJ7vsZYYbi3FjH7yAx51xIscEaF5VcYkPr4cPQaoUQoxhOyvBTqsk4S
 zn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=C8vlDYZHqbyr6peJkyfAJ9jUJioWVzJ6fWP8YQ/4XUM=;
 b=f+qlqfP795gYVDBgE0lXDw2vXzIWajnSi5K6JHbucu0dmOo7qfNuYg16Olaiqq5fkB
 2L3AFbtJHS01Jh7bOuXHqv03efmp9SrSrG5BWnqBYD7Kmq4V+3HcEh1q5OYiKAkAPEh3
 8UoOZyAa/ERgbABv3RRzOKTrz33br0ShAjJi+yIB8AFLk5QAcMTI2TZ6ziNObDMsgGE2
 rjy7+wnv9MqY5P8k4WzQF3W2NjiZFnwo9WCbKk/tKGJp6WBTxTBEuEEA0aHDFLk7+jg3
 AszBP6zd1aV8egAzXQQFkKfoDzUOXEooUwfm2U8kqCI9rKREKjVFvjKs0BmRDeZNW/AY
 AOAQ==
X-Gm-Message-State: APjAAAUU/iw0Oo+l5hNB4WTivfpRXO62pQcXH9WSLIWvPh0M/QsIE+k+
 mv7JSWaLJ07hQXxOzjZItNgHc4XA
X-Google-Smtp-Source: APXvYqzkn9+V9qc6CnsrwLu0Kfh/dnos29onMHxkMJhDdkQx3xl5HplECzlLRETd517nI9tDrUn/7w==
X-Received: by 2002:a17:906:4a19:: with SMTP id
 w25mr42011649eju.239.1568418469891; 
 Fri, 13 Sep 2019 16:47:49 -0700 (PDT)
Received: from localhost ([185.92.221.13])
 by smtp.gmail.com with ESMTPSA id ga12sm3321858ejb.40.2019.09.13.16.47.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 13 Sep 2019 16:47:48 -0700 (PDT)
Date: Fri, 13 Sep 2019 23:47:46 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190913234746.jb5a5vlwl6cebudz@master>
References: <20190730003740.20694-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190730003740.20694-1-richardw.yang@linux.intel.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::543
Subject: Re: [Qemu-devel] [PATCH v2 0/2] refine memory_device_get_free_addr
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
Cc: imammedo@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 30, 2019 at 08:37:38AM +0800, Wei Yang wrote:
>When we iterate the memory-device list to get the available range, it is not
>necessary to iterate the whole list.
>
>1) no more overlap for hinted range if tmp exceed it
>
>v2:
>   * remove #2 as suggested by Igor and David
>   * add some comment to inform address assignment stay the same as before
>     this change 
>
>Wei Yang (2):
>  memory-device: not necessary to use goto for the last check
>  memory-device: break the loop if tmp exceed the hinted range
>
> hw/mem/memory-device.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>

Would someone take this patch set?

>-- 
>2.17.1
>

-- 
Wei Yang
Help you, Help me

