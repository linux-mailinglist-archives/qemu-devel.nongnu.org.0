Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D6C65DC07
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 19:21:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD8Nh-0003FW-2X; Wed, 04 Jan 2023 13:20:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pD8Na-0003FA-Qh
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 13:20:48 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pD8NY-0005oG-0V
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 13:20:45 -0500
Received: by mail-pf1-x42c.google.com with SMTP id k137so18654861pfd.8
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 10:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=98n0zW2ISFNEKv+k8dTtZ7KftgXBqN47+mZNBzTCp/E=;
 b=OUVi8X+MW4ROEkfUQwOeQ9Cs66acTUOayG936HBkZPIn3Tujs6WWzSGIChwrIA6TG+
 U+Zm9DpiDzyTeSPjnSkje/uyc6fRAW9mmFajhV1X9yaIHGZKzWhF6NIldAVeLqkgYHl3
 CRddN/AypQ8iC4/a5y7B8+EHWHdiPz/35ZxqRbS9gXboqLkiJXtGYT15/53dCsHbuUHH
 fie9OcM04p8ZQCgy8mBtLva2IAE5jgC/qWGu/vpGSPEraJmcAKlfPJKrAcjNxgA98xeL
 YBgSZua6ee1arsiOUr3+r/I2ApMPBtgdzrXRXcNy+a0gsF3StKkRQRkkCch9wWUQFVjd
 3q1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=98n0zW2ISFNEKv+k8dTtZ7KftgXBqN47+mZNBzTCp/E=;
 b=2pxOycoS/OmHu9MQc+4AtWlr6QgnAAvaCTLOejaFydy4a3l23ZBnTag6Et2W0NAvUE
 gpJ2q9FZDTyk7cE9T2JnFK3imEpqZdpJVFuw26mricSvmghSF5VES8Ftp+u6whe4pjbU
 +CsOiYVArUT9dldgea77RTLnDjrQxHlxSYQH+USDHGWyUT730zjQmMc0nIJGdoM85Rfg
 pJ2BhCu3aJZ1t/brkTDua0qJFAQiECgMVlixbRm4rVjOV8xs8rP7sLa3E4Nhdg55Fh6t
 EXjHTEJUPlTMxw6w0IGkgc8HsEz+X+8wqWzY0DkNXEsf/8Fyh4C5Ut+S2/vXt6yN46dv
 /fDw==
X-Gm-Message-State: AFqh2koQin0O1CHTMoBoWQuubL4cCODu4mkR2rlBzSs39eFNWvRL/r4Y
 JOX9hulbcgRZCRMNEpMQjXP2oQ==
X-Google-Smtp-Source: AMrXdXs+yvEtugrfli33j5GIvRW6VoV0r7mjcVw44U0ihlQzlLU2TOw9giIVhgDR5oSzNBn01Zdv1Q==
X-Received: by 2002:a62:d45e:0:b0:56e:dca8:ba71 with SMTP id
 u30-20020a62d45e000000b0056edca8ba71mr42104842pfl.32.1672856441811; 
 Wed, 04 Jan 2023 10:20:41 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:92be:ce91:1417:6686?
 ([2602:47:d48c:8101:92be:ce91:1417:6686])
 by smtp.gmail.com with ESMTPSA id
 v1-20020aa799c1000000b005817b2a0c6dsm15005217pfi.104.2023.01.04.10.20.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 10:20:41 -0800 (PST)
Message-ID: <e391dad7-a484-0d32-eb5a-a5b63b7d7dcc@linaro.org>
Date: Wed, 4 Jan 2023 10:20:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/6] hw/mips/gt64xxx_pci: Fix endianness swap on
 big-endian hosts
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230104133935.4639-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230104133935.4639-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/4/23 05:39, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (6):
>    hw/pci/pci_host: Trace config accesses on unexisting functions
>    hw/mips/malta: Split FPGA LEDs/ASCII display updates
>    hw/mips/malta: Trace FPGA LEDs/ASCII display updates
>    hw/mips/gt64xxx_pci: Accumulate address space changes
>    hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE MemoryRegionOps
>    tests/avocado: Add tests booting YAMON ROM on MIPS Malta machines

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

