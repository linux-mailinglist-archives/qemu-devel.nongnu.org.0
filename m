Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8919DCBC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 06:45:10 +0200 (CEST)
Received: from localhost ([::1]:46556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2TLx-00010d-QF
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 00:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35154)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shorne@gmail.com>) id 1i2TJq-0007sM-6l
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 00:42:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shorne@gmail.com>) id 1i2TJp-0004xr-8c
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 00:42:58 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:37328)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <shorne@gmail.com>) id 1i2TJp-0004xd-3E
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 00:42:57 -0400
Received: by mail-pl1-x642.google.com with SMTP id bj8so11130975plb.4
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2019 21:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=omk7DMGTX8FTDM3axsDfykAg+gac++3WQv7gXxihH7o=;
 b=uqZlUnvu1/P43kmPXiMlwUIZDk4NZZMycPcsAB4tO73ZTsnQZfTirqoCk3gTz7Y+Rl
 4y7nfhtegx5k4a5BYqSBWlk+NpI5y3ViLFCjm6lrqsOPl24co6Mn0skOC/weYTRw4TjK
 m9IGAlPYIqmmmjdqEvNL0UET/CzYGpJEFfqW9QdF7pWxHVsZ6XjuTqoTY8zCbljlaVSk
 ugFLdWnNL0n87dRER2XlsU0eu1ejNf/PIFfk5ct9yXjtfPcANVjD6WIE0ca59RfBCy7a
 Xe5tV49Mcoe+i92R+id+llkeFo2IUDBeixuAf78jM9FMvcJh57S+7XVWY9jGW4HGablF
 Biuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=omk7DMGTX8FTDM3axsDfykAg+gac++3WQv7gXxihH7o=;
 b=piK/1BckkgLQSwT8/zNxezkxvQ5ieUINpJAvPN+E26ZZrpmie85bjlMKTM39/RBCtx
 7EQrS49yxVjH0g+itHENiZ/oxXfs0uNYNQexgUVw0XEZezoNrh0PGSUnnAkZ+v1b6+wx
 sGqXufKZ2hoG4mUtu9APmPHwN8OLxYm4dhGu3on93nIzT8RjIHk5dLrsUBlXjTdF/vlo
 ZgGhrX61Rd5bV4IioAyucsRecAVuconJAdTIabmEySXH/Gk7mOeJAoC1XCfKgcJ3ldZT
 FqWjewR9/x02tojzWb+fgqbUrJSYf+eKqIPtWEIEj+OM40XynBSRdelZiCXSj1k6VAy1
 OvYg==
X-Gm-Message-State: APjAAAV9WxMbhtVP1K0+SfMBiO+xVjzrpTgAvcxULCGKJUZMBO5ctTV0
 n7apfTHlNB2Ea9g+VQKNLbyHAvvo
X-Google-Smtp-Source: APXvYqzm7XqZJn/WGsOsXdiokMK4zhdBFdbuk/yFw8geAZikcp8eN61LZom6V2mittqU5eEwAupELg==
X-Received: by 2002:a17:902:d888:: with SMTP id
 b8mr8877083plz.115.1566880976160; 
 Mon, 26 Aug 2019 21:42:56 -0700 (PDT)
Received: from localhost (g75.222-224-160.ppp.wakwak.ne.jp. [222.224.160.75])
 by smtp.gmail.com with ESMTPSA id
 185sm17498101pff.54.2019.08.26.21.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 21:42:55 -0700 (PDT)
Date: Tue, 27 Aug 2019 13:42:53 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20190827044253.GP24874@lianli.shorne-pla.net>
References: <20190827000745.19645-1-richard.henderson@linaro.org>
 <20190827000745.19645-12-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190827000745.19645-12-richard.henderson@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-devel] [PATCH 11/13] target/openrisc: Implement move
 to/from FPCSR
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 26, 2019 at 05:07:43PM -0700, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Stafford Horne <shorne@gmail.com>
 

