Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0D9D00F5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 21:09:40 +0200 (CEST)
Received: from localhost ([::1]:33600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHurc-0001j6-05
	for lists+qemu-devel@lfdr.de; Tue, 08 Oct 2019 15:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43377)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iHuo1-0007jH-GF
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 15:05:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iHunz-0002UV-VS
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 15:05:56 -0400
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:39225)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iHunz-0002U5-Pf
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 15:05:55 -0400
Received: by mail-yw1-xc43.google.com with SMTP id n11so6833058ywn.6
 for <qemu-devel@nongnu.org>; Tue, 08 Oct 2019 12:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=33u781c2wjZIZSK1xJx8AVX8hAoJ4VkdzvclLzke/4g=;
 b=zQ1dvvwnUNh9QFP1+f9dNETe7LxpilP4vKxlmPZPpNfefILv/Ma+AlAYVRawDWB7T4
 O4X4XOFfA4nqIDMpd6jL9+KpbYeUzWHKPlipiAYMi7iKcS/1OpqkRw1h9zLs73IsfnYU
 wpS2j2KGteluqBO1rDM5EFtwikvTBJjKXY6QnZxYMDFjT/b+zYKHO+Gx+1pZ8Kmiu+k+
 pvoHUrrhgNRtU7fh+eMoYW+1HwMWXLHvMRVeZoFXqjiKmNsEtKe3zPx8I1g0UCX0g6AY
 vE4syriflxOAbxrAxW+UiGw9As4oyIBY91kY6fF6n1TjEWOTi3fWAffaTmhGnJZgxh6M
 RJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=33u781c2wjZIZSK1xJx8AVX8hAoJ4VkdzvclLzke/4g=;
 b=Xv5yh42bwFY8sCf+U9a/CiCM6AiCaOiRUhBtcgpLBWYXEcm2nMm1VirHxZEKq3MnJo
 ycatAyedsbf0sDGqchlsRoSyWbmTJvTeQWn6JFL4WZZmwf+DC73WnUwExmsiPB5lJlQz
 S7eB0URfRA7U1XQWAdf3NmuSS6mWyCpghyCuMiuZoDE2HtZQpTFdtBOHWrEYf7H25hgL
 8VbxUVkRVPeBrESIsGZ6p2hOoXODk3vBTcLuPFFmEBDEvVeyt8Gl8WBxiYczVNyE+O2d
 AyfYoEQ7J6J+nad9AyCoAt9877rmUmPXEVANoLrMj0ubDZ82YJr9Hvtiy+2OplLSQ5ng
 hY3g==
X-Gm-Message-State: APjAAAW0DVEvaqxpzpb9P7Vt9lYOLe5vW5TU8xqqLIVIABgAFMaRO/jB
 HHsI91DF1UXQvZHwlRH0WpmOuw==
X-Google-Smtp-Source: APXvYqwgOUgxGmkqC1umkmTUvIz/1MKPqFEd+X/iaM2UsWb3AvqOUfTHo3jVr9FD8d2NEYI8aQwitg==
X-Received: by 2002:a81:1c2:: with SMTP id 185mr26010948ywb.473.1570561554576; 
 Tue, 08 Oct 2019 12:05:54 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id w8sm4608531ywc.20.2019.10.08.12.05.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 12:05:53 -0700 (PDT)
Subject: Re: [PATCH v9 10/13] tb-stats: dump hot TBs at the end of the
 execution
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20191007152839.30804-1-alex.bennee@linaro.org>
 <20191007152839.30804-11-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2346035d-42d5-2dde-95d7-32fcb2260b89@linaro.org>
Date: Tue, 8 Oct 2019 15:05:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007152839.30804-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c43
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
Cc: "Vanderson M. do Rosario" <vandersonmr2@gmail.com>,
 Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 cota@braap.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/7/19 11:28 AM, Alex Bennée wrote:
> @@ -337,7 +336,8 @@ int qemu_str_to_log_mask(const char *str)
>              enable_collect_tb_stats();
>          } else if (tb_stats_collection_enabled() &&
>                     g_str_has_prefix(*tmp, "dump_limit=")) {
> -            max_num_hot_tbs_to_dump = atoi((*tmp) + 11);
> +            int hot_tbs = atoi((*tmp) + 11);
> +            set_tbstats_max_tbs(hot_tbs);

I think qemu_strtoi() is preferred over atoi().

My guess it that it's better to export a variable than a set_tbstats_max_tbs()
function.  I don't see any reason why stubs.c can't define variables -- they're
probably no larger than empty functions in many cases.


r~

