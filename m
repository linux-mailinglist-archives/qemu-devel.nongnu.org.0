Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 052B77E369
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Aug 2019 21:42:23 +0200 (CEST)
Received: from localhost ([::1]:58718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htGxv-0006IT-V0
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 15:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45888)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1htGrn-00055O-FI
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 15:36:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1htGrm-0003rB-FM
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 15:35:59 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:45611)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1htGrm-0003qu-8e
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 15:35:58 -0400
Received: by mail-pl1-x642.google.com with SMTP id y8so32658864plr.12
 for <qemu-devel@nongnu.org>; Thu, 01 Aug 2019 12:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TelzxY67ouEiTo/vt0dxhfXjbk+C/oKM5sSOTt3jsnE=;
 b=D38rNvPN4HLO2PETZ5U0PBreHHZYYEitUQa2E40Vd5AbSl1/N7wQnvrdveh0GRUykZ
 I0zw1muy5dtXhjcozEduh0RPLL9A/9jhCUM8orevBiCEqH6lgmEAGWSmkK4Q1vLFn3Ce
 NyFAQD5xHATzlPROKzFfY8+ASv4xnYpkVAn6a0gQ7xFY0fLDhnCebzf2EcFLgSefdGzO
 YrWUaSYW6zx1aRZy0CWeQyIbdFEfULXYXKPXlRvYsGqan7NsTzV0fJbr1y1awqBUUbRd
 fMy0Q+fToZaisXG6ews1qESWvMIuZMXLNyQ6SpaeAvgspIQ2/rnw7C65RD3EHrVTNkVx
 5ywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TelzxY67ouEiTo/vt0dxhfXjbk+C/oKM5sSOTt3jsnE=;
 b=Kyd1rWl3rTq46o4rYyTVztF59Ge+Fj+MBU0Zi5NplBJIEY19gJfxYPxzl4IjokNyOa
 vP0DmbsrFd0/ffEekV8mhJWQUjZRR8yZfW9ShdMQDLV5a5qDK/M921/mUtCY4YiDX/pE
 fuLiO1lo3sPOHLYkkeD8nFTtW9tk5P1dbbnb0Fv8na/asjzFCmxyYfQytFvFFBXn6p/M
 6WHdU386hYW71Ma7KWFcPTaX7UOUp9ISn7Dt9Le9o8Nwb3Imox8UOH5GGhSL30mkZAVd
 XMLsqfykuk/Y+/joA31fpeXWqlt0Wcot6h4j3/H/vSdFuaPKDcAzdq0QnNZxMhmgfBMr
 opRQ==
X-Gm-Message-State: APjAAAVhir/DsDH/E92dNgoSKc80JswNvjTz3qbNrPeOlTP11/O9Njxa
 oaNEUm7tI9U/aR59WmrCk9+c7w==
X-Google-Smtp-Source: APXvYqwruIOhd2dJAgRQL4HP6+XzkpbQnWhLvv66cDxBYDebQLqXGsRaBiPeKRq9tRLBUgqp9sf19Q==
X-Received: by 2002:a17:902:2baa:: with SMTP id
 l39mr128920500plb.280.1564688157123; 
 Thu, 01 Aug 2019 12:35:57 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id q144sm74107741pfc.103.2019.08.01.12.35.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Aug 2019 12:35:56 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20190731160719.11396-1-alex.bennee@linaro.org>
 <20190731160719.11396-43-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <a1c28c09-65b3-ae1b-53ec-c29d0a7ad122@linaro.org>
Date: Thu, 1 Aug 2019 12:35:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190731160719.11396-43-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-devel] [PATCH v4 42/54] translator: inject
 instrumentation from plugins
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, aaron@os.amperecomputing.com,
 cota@braap.org, bobby.prani@gmail.com, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/31/19 9:07 AM, Alex Bennée wrote:
> From: "Emilio G. Cota" <cota@braap.org>
> 
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v4
>   - note we can't inject instrumentation if ! DISAS_NEXT
> ---
>  accel/tcg/translator.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


