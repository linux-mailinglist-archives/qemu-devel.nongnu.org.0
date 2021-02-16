Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AB131C4B0
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 01:46:55 +0100 (CET)
Received: from localhost ([::1]:37124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBoVx-0005Oh-ID
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 19:46:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBoUz-0004r8-4h
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 19:45:53 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:37670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBoUs-0003Mu-CX
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 19:45:52 -0500
Received: by mail-pj1-x1034.google.com with SMTP id t2so4898629pjq.2
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 16:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MsbgF87+Din+0JOLk/SX90VFUqvr2HfqdUj8sasraoI=;
 b=BlzdQVEB5CHgpR7sfB3CUWcsu8FXRZTaslLUSTTSJ2UXu9ErzNEQMBD2mdFSFcIWP4
 PS5LLklstu2hsrBGBHOzbfk4F7WJezl8vzh3u1P6RA7QnRS5CTKkNpM3DokDUH80jK8C
 QWdzwyqR0erktjq7GOyK6QG0UeQcp8HXOC98XZw7cyvnwLNk4z2dDl2h2VrGCh8ampVO
 cAq45zs25CElwHF+w4PLEh4enO2NRvWAKoXRXxwN+k+8vFEoK7aEG/TtJ/3Ll9eNzZ7t
 4mgqWnlNk5/JkHBtBVNlyWGKZ8ovj9LRQbW7RGL2a5eDa+wQMBQfzZ7oGuLKuRZG8aRu
 rQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MsbgF87+Din+0JOLk/SX90VFUqvr2HfqdUj8sasraoI=;
 b=CLJHplgMht3W0leBH0S0sP6g/s0fS4aJeIUHWHBDZE+ktrI62kxpi85MYE3qCdXzTe
 GcfQSLfXTxYq/d6f2WkU4Elf6z0iXy1oUEzvxYuGIWtFdH9ONj5siC4ZbziRRplE0OcD
 vJTOLqNLSj/vqvwJzgMg05d6YMNQd5sBnsLkLM3CXSNnAabKRZzdZhpGL/YPceQnjhDP
 TG8yh3DzRgliWJi94TMxM2Jqc8Di0YT0tdIuXOXGMyTVy0Qc2zwDLOW6+g+d2sBMOYjg
 kpJ7rG5os49UcsR5nid2KOROj+qsAqzFIcW2KLct1x3VIDtolA6t/BSvz4uSZuTCVUHp
 4+nA==
X-Gm-Message-State: AOAM531yVN2aG1bRjILSBgdzD1Hx2ANWP/DPrrEtnYru5GKg/heoVyB2
 /ifsaGeQXU7qx4obgg4DHUpa0w==
X-Google-Smtp-Source: ABdhPJxO8Bfnk+TWFsgzetTKLPCgxsTjAPFx/M3YRLTu4g9aaK0MRS52GheIMuusxD0AFfsQRIcOqA==
X-Received: by 2002:a17:90b:806:: with SMTP id
 bk6mr1462418pjb.16.1613436344692; 
 Mon, 15 Feb 2021 16:45:44 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id q15sm639237pja.22.2021.02.15.16.45.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 16:45:44 -0800 (PST)
Subject: Re: [PATCH 0/9] arm: drop dead code for non-32-bit-RGB surfaces
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215103215.4944-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7d6f9419-9389-b2de-8569-78502fec2251@linaro.org>
Date: Mon, 15 Feb 2021 16:45:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210215103215.4944-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 2:32 AM, Peter Maydell wrote:
> Peter Maydell (9):
>   hw/arm/musicpal: Remove dead code for non-32-bit-RGB surfaces
>   hw/display/tc6393xb: Remove dead code for handling non-32bpp surfaces
>   hw/display/tc6393xb: Expand out macros in template header
>   hw/display/tc6393xb: Inline tc6393xb_draw_graphic32() at its callsite
>   hw/display/omap_lcdc: Expand out macros in template header
>   hw/display/omap_lcdc: Drop broken bigendian ifdef
>   hw/display/omap_lcdc: Fix coding style issues in template header
>   hw/display/omap_lcdc: Inline template header into C file
>   hw/display/omap_lcdc: Delete unnecessary macro

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


