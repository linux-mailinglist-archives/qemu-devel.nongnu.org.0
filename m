Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D27D370496
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 03:00:13 +0200 (CEST)
Received: from localhost ([::1]:58760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcdzP-0003Wi-Rs
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 21:00:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcdy7-0002x0-DO
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 20:58:55 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:56005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcdy5-0003Nt-TJ
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 20:58:51 -0400
Received: by mail-pj1-x102c.google.com with SMTP id gj14so5425039pjb.5
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 17:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qTOxGTDBeYhRFjSZDBRvGb7NqwAKuXR+FYD2lQgFcP4=;
 b=vp5iuYHyHK6uJYa5ReqB984aQhRV/qcex+QUmw/5zPUzzuE0qRa5nOIliymYJ/KeeH
 Zy0bZpquk2IyRPfVYh2pr3323mGoCTPqRFYzJKVBw2pQzoENz3k/2fudZ2WOLFFwop3Q
 3OH2RWbu54o1K9h6Bv6msQ08dZrZu4KCkgkRXkJmNkL8NIhJ2gnqnNJPMAmoVz9FBJF6
 s8k6O6hPr4JgGaMCrzJQOgNa+LwYpE999DjNb8Hz2bqJtnOrJapDmzdQM6zixx+FD0k7
 I9RcOKuaBOFMsBa9Lw6yT9RYeSt6VZq/yBeEDfivx1S+qAyw3eGD86krtzMDjX5zfJYD
 xKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qTOxGTDBeYhRFjSZDBRvGb7NqwAKuXR+FYD2lQgFcP4=;
 b=qM+Amt8DtIMVSiaL37tOFoXwGvamkhV3QeRkthJV88d3b3AJr6Q84gpNAtjP9lbN1V
 t4RkZamObN5mMqlUPPh4J7pSrA7+htb1h2DQXJ1oMBmBeG+mm0wU3KZbnrlsBsFwV/5Q
 hr7ExfTMmxL+6p1pEzSrCLl9pWMwLfuvvlpnIpzqu1kZsGHV42tdoRJIPlcTgyfKEjqp
 cQ+7ATai9d1PqwDfWHO9yUr1NvyZWMLoRcrJbDQLWyupap1uGRdeRCuMpgBL2BvzOKsH
 NaJp1eS6sBZz6wgBx8PZEe41SHYYGOzNl2eLde+w8XSpxrda5o96sphrzo96OK4CJGa2
 m18A==
X-Gm-Message-State: AOAM530f3IxT66Fk5ZmFvtKVS6u0eZZ2/F3cg/2r6sh5PbROeAT9VWs3
 v9aAn1zBBS/SFK1CgcnrxWptmg==
X-Google-Smtp-Source: ABdhPJzF5ccLJFJpWXlT1Gp7XhidPTIlzhXDb9/kd5pcwSzTtBysbBFOrfxqPkbl65QpjaqnO3IaAQ==
X-Received: by 2002:a17:90a:2d8e:: with SMTP id
 p14mr1382381pjd.121.1619830728632; 
 Fri, 30 Apr 2021 17:58:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 123sm3062626pfz.127.2021.04.30.17.58.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 17:58:48 -0700 (PDT)
Subject: Re: [PATCH v3 3/7] target/ppc: remove unnecessary SPR functions
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210430193533.82136-1-bruno.larsen@eldorado.org.br>
 <20210430193533.82136-4-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8d2f4db4-ebf9-cf6f-ed3a-293f271ed34e@linaro.org>
Date: Fri, 30 Apr 2021 17:58:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210430193533.82136-4-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 12:35 PM, Bruno Larsen (billionai) wrote:
> Removed functions gen_read_xer and gen_write_xer, moving their logic
> directly into spr_read_xer and spr_write_xer, respectively.
> 
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---

"Unnecessary" makes me believe that the code isn't used at all.
A better description for this patch is

---
target/ppc: Fold gen_{read,write}_xer into spr_{read,write}_xer

Fold these functions into their single caller.
---

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

