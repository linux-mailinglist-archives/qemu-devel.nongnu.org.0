Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF40E16EABD
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 17:01:48 +0100 (CET)
Received: from localhost ([::1]:59568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6cea-0004l7-0q
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 11:01:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36890)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6cd4-0003mZ-96
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 11:00:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6cd1-0001FO-Ea
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 11:00:14 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:37391)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6cd1-0001Ex-7s
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 11:00:11 -0500
Received: by mail-pl1-x641.google.com with SMTP id q4so1535304pls.4
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 08:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NIjEmlzIoxEX8wD0uwi1dC8f6hSj0pPSYViBz77H6iI=;
 b=xDdUI7cQUYEfPBoguUrgoNxcvN/SXWTJRfWR6DFhsCn8ssc3Q+v8pSHXuLtwvT/68p
 r7u/3Gq2L+ZXUwTf5A4mqIckSLfEdntyPH/s3jqC9bljQ/avSrsh5l6jzxe/ufOd2kVd
 3ifFHMfIb4z5A37qoY+yBNMS8tkVy07E8dPSR5wVLIRiDqLQAmHnBvICeduMNZdTQ3Us
 OT9pMhJ0gfRhKiFMNXYgAgyv6B2Ujbj8ODRNgxYgEJG68ffgsyPfAcuTm+iBvbtY+PkS
 B3PMJT87N7rvbu2AY4+xVBEcnvATc032NlAskTx8XQJ4WgF8wxWlK/qTLq70DFp7BXhg
 d5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NIjEmlzIoxEX8wD0uwi1dC8f6hSj0pPSYViBz77H6iI=;
 b=qbfO8NcQaSqhFqOCnd4WIjT3XLwHhgfOzcJ6iw8/c5l5jWXe1BvuvSLXYhMLpw+4pB
 tg0H/JtFk/uh6FnjA5NXnIuNGIJQq4VNfkGUwCYJLK+06t021bqPHAPnmewyETagDE9S
 rnmP5yFHvVqHDOBjhWFZrCHWJrmgWD+GVgWI5r0+vTafW+T9Bi8kEufByX0WfdnrBe5+
 VA7rZHV0Xy2JHDjJSMboUpP7XayO27Hw7YJKSCAJQV5JVPjm4OpxjzxXHpUyX8jOKzc8
 kDL9zzV53bkxkps2wP9qw/IKhBDEU6Z13dCSm7YjfRerwoFI/PvIk4i0Je+9LQsfzSb0
 41Cg==
X-Gm-Message-State: APjAAAW/fX1yLQI5BwIY7U4C+xqNn+spO1KS+rLRZxsu4C4Zs1xc99HB
 PF3jkADscQg/iF7pJvPSFkXYbQ==
X-Google-Smtp-Source: APXvYqz0flc9GFx8Rv5U/Pk9W70j1zaiZ3wEjRogAVWXX9vuIVyJEqV+jFHTNWDRXTLysHE9SAsriQ==
X-Received: by 2002:a17:902:740c:: with SMTP id
 g12mr58691845pll.166.1582646410160; 
 Tue, 25 Feb 2020 08:00:10 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 h10sm17476563pfo.181.2020.02.25.08.00.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 08:00:09 -0800 (PST)
Subject: Re: [PATCH v2 05/17] target/arm: Improve ID_AA64PFR0 FP/SIMD
 validation
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200224222232.13807-1-richard.henderson@linaro.org>
 <20200224222232.13807-6-richard.henderson@linaro.org>
 <CAFEAcA9WZbZj_hPemTGr+Rkh--VmZt1eis189+ExuPVNipgo_A@mail.gmail.com>
 <49741058-7dbf-d20f-95ce-5bf9b5e5bdb2@linaro.org>
 <CAFEAcA9nZx0eCnQtjCdG2OZRK=pF-Afb9jtvGZ=dJTAbaVAL1Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ede96361-bc42-8ba3-4a63-fc37f02faa9e@linaro.org>
Date: Tue, 25 Feb 2020 08:00:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9nZx0eCnQtjCdG2OZRK=pF-Afb9jtvGZ=dJTAbaVAL1Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/20 7:58 AM, Peter Maydell wrote:
>> Do you want me to add a tcg_enabled check, or shall we just drop the patch?
>> The existing test is good enough for just checking the command-line.
> 
> If it isn't a requirement for the rest of the series, let's just
> drop the patch.

It isn't; there should be no conflict dropping it.


r~

