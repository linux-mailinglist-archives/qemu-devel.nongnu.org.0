Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2582C13D021
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 23:32:40 +0100 (CET)
Received: from localhost ([::1]:33426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irrDL-0000Iu-4s
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 17:32:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37671)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1irrBz-0007t6-7I
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 17:31:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1irrBy-0005Z1-16
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 17:31:15 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:34985)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1irrBx-0005XX-Qv
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 17:31:13 -0500
Received: by mail-pg1-x543.google.com with SMTP id l24so8874318pgk.2
 for <qemu-devel@nongnu.org>; Wed, 15 Jan 2020 14:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pVPBsqE8MJvYXtbTzgz0iptqaOAX+Rr+QBlHSf1JYjQ=;
 b=HVSjk8S6IlsJeApEbJtMDD2g5qytnvudBV4F+m0l09OF99q85gJQhGbfWi/rjoi0vZ
 z9QSaCKixz563Tr+nEigxdPbuCGLbSkx6NheqWFmD+IJ7BYz1L/NjWeG3uViLzMa8ETC
 5vIzIYbvV+mcuxc+dSOjs3o6HhR1E/S0HLhnb6+NAHck+D74Oy1FACgCWEitIEHG2HFA
 AIUR3GUfnlFwIF0V9pVJGd21hXhJUxHnRgfMppzjv5qvZPaWY+rh8/aVVmZkEmvm/EtG
 WH5PfcMVmZiEtjYG0/0QbZtwp8/57qdYjKd7p88NMUKEsLpZLpX2sG7WvDnE4RxvSOyo
 eFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pVPBsqE8MJvYXtbTzgz0iptqaOAX+Rr+QBlHSf1JYjQ=;
 b=dCNO+GFKPDY5krPqmn2nEOUNFAwFroyg+749i9/bZhN4exs6mnpVDXZuK6sMkj+DF8
 HiRVMu1AaGbJHArcniinFSXHPrYBO0s7HH+Pb4x4U2h+Rtwux3nMqJ/ONx+ukc22d4ML
 k1Ivp+gWjC5jXTgNJffSmsG/tBqHWalLsX9v5dioxX9R11kxDeISM1Grd9YWdLnPt5oe
 ReFZ+hic2H3tRNUypOGUa2VsW7AOm/AYJh6Gi6MIQn9YpISI4rdC8eyTjMx3eag0LFBV
 Zg/baRmpku9t7wyG62DWtSw5N0bQVR30AZr+OKEnwN0yN9ThXm7Ry474n2ShoAkedOED
 XXFg==
X-Gm-Message-State: APjAAAXJ4vyVwUFc+q+541xVY8phrmJElhTOmibV41/tl4COi0OSwcOG
 qitKcjoFOlmutKh4aKmCXbv6lQ==
X-Google-Smtp-Source: APXvYqwXN1FGfCj/HRciISFsBdrvE4/WHeYaFGhcJHRr5+egvGJYfvPD5v1CV8rTkbdQZvDXWWtspA==
X-Received: by 2002:a65:5ccc:: with SMTP id b12mr35171139pgt.124.1579127472984; 
 Wed, 15 Jan 2020 14:31:12 -0800 (PST)
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com.
 [66.91.136.155])
 by smtp.gmail.com with ESMTPSA id b15sm22846927pft.58.2020.01.15.14.31.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 14:31:12 -0800 (PST)
Subject: Re: [PATCH v5 16/22] configure: allow user to specify what gdb to use
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200114150953.27659-1-alex.bennee@linaro.org>
 <20200114150953.27659-17-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2b0acf88-131e-5145-03ab-b33bc13a85bc@linaro.org>
Date: Wed, 15 Jan 2020 12:31:08 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200114150953.27659-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/20 5:09 AM, Alex Bennée wrote:
> +  --with-gdb=GBB-path      gdb to use for gdbstub tests [$gdb_bin]

s/GBB/GDB/

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

