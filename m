Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C80100046
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 09:24:31 +0100 (CET)
Received: from localhost ([::1]:59156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWcKk-0003qj-Ur
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 03:24:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49994)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iWcIf-00026R-0l
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 03:22:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iWcIe-0007Nf-5E
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 03:22:20 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42374)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iWcId-0007Mj-Ve
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 03:22:20 -0500
Received: by mail-wr1-x442.google.com with SMTP id a15so18266695wrf.9
 for <qemu-devel@nongnu.org>; Mon, 18 Nov 2019 00:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KS617bRuEXYSwYUjb3T1IV48FWmTG5btP2p9u78JA9w=;
 b=czQSfvVFGF2x2QztpbFh+gf72roloQGH07RdY3Ncke7LxDlAl1W14/ZKLgT/K3Jytp
 qEV+ArbZ5IQT9ew0i0qYckMCn12Gt2SK8vgHNXP4uVbfHuHuYeirG+68ptxhfLXiWTZf
 9sTX9V8ZzTUyYx7FGVTgMCCX2pHecbvzQ4lXJMwyWtVUUSr3i2VdSPw1PyekujrUCnkH
 82nt0gOKDG9kFbcMySMdF5wpyYPCVSGJBLJRBzMgb1OPnzmmRzHr0tq4zSN7Tr+8Uydk
 7dzpvokmnfjZ9RIOHOACOkpPLC3lKXMIRtC6JLrR6iz9vctrLwJo6q6pCBiChsOnKyLJ
 H1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KS617bRuEXYSwYUjb3T1IV48FWmTG5btP2p9u78JA9w=;
 b=lLB6Zz/aPBg/FgwXsgMheWQQ3GM89VeOvBJMGw86VyMbyiYeVqP17LaO0RafIy+CQ1
 SXPzsE+41YlTRLQka9dSitOxzMT41ZcOhe7XUn06v0zPcuTgk4rgGBAyQGktqzLDOKrK
 3KB3wwfuLtDfr2nHmRWeAfUwi+1NhMQ2bQDWSzpGbqd2fm5Dm1KS1Ld5iEQ+8fDy9svd
 7foZC5TK4HGNDUq9+UnSxGvqI6iwet4wKZ+gw0OlUFJeq01RBd/kXw2OOcKx+PZMnu9a
 BI1D4Cst6lVPMw+os5Uz7mE9ZgHZBDXg6ELpUtqfXh9I+E1fAEu73FAWdJcXLvRN8k1R
 0o6Q==
X-Gm-Message-State: APjAAAXzcfv3co91nTX/79WckfD1NeZDm3VMqEddqf32a7chjVJAmT7q
 NCzQ6qeOt4vK/3GZKjqNlG+LtA==
X-Google-Smtp-Source: APXvYqytsNnPih5LWhIWPpJN9BFI5oF9SCpHjecQ2RzqqaDLw+FAQFUUxIgDnIaD2Q7cVpnkXjh2bg==
X-Received: by 2002:adf:de0a:: with SMTP id b10mr29081237wrm.268.1574065339026; 
 Mon, 18 Nov 2019 00:22:19 -0800 (PST)
Received: from [192.168.8.102] (65.red-79-149-41.dynamicip.rima-tde.net.
 [79.149.41.65])
 by smtp.gmail.com with ESMTPSA id w4sm18520526wmi.39.2019.11.18.00.22.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Nov 2019 00:22:18 -0800 (PST)
Subject: Re: [RFC PATCH 07/11] target/m68k: use gdb_get_reg helpers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20191115173000.21891-1-alex.bennee@linaro.org>
 <20191115173000.21891-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3f1c722d-24f4-0c7d-3009-c694a27131a3@linaro.org>
Date: Mon, 18 Nov 2019 09:21:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191115173000.21891-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: damien.hedde@greensocs.com, luis.machado@linaro.org,
 Laurent Vivier <laurent@vivier.eu>, alan.hayward@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/19 6:29 PM, Alex Bennée wrote:
> This is cleaner than poking memory directly and will make later
> clean-ups easier.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/m68k/helper.c | 29 +++++++++++------------------
>  1 file changed, 11 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

