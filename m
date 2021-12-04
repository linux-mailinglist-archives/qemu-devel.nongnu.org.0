Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B62EB468691
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 18:35:42 +0100 (CET)
Received: from localhost ([::1]:60674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtYwn-0003gB-Qo
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 12:35:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mtYvZ-0002Tx-Ig
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 12:34:25 -0500
Received: from [2a00:1450:4864:20::42d] (port=40887
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mtYvX-0006cV-Ey
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 12:34:25 -0500
Received: by mail-wr1-x42d.google.com with SMTP id t9so12815549wrx.7
 for <qemu-devel@nongnu.org>; Sat, 04 Dec 2021 09:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fBblV3J5e+7h0Y76jlYgQohotqE9YsWTERssbKcqmzo=;
 b=LcoOQFpBv89tUZEMa3JcPMgE7pIR8FiMRaXCsHcQVxdinoDyVi0ApbaebdkxLpQvHV
 kE9CH9sSt8RJTMeFJtE46vgA8lBUu5mTwYi6B26Oq4amU3xn2UAK9612ddmlQQqAstM/
 gicy/mJNgVwXKCHIACTaxjqUHbJZ6YhxKsuR37Ap4e9tMOEbJQlZgupkKNo+nzM3eEf4
 lKb2nzzRlQfuaxkqaLX6N2UzHP8lkaqZKpLe6o57AiULHW4BCV8juj4ykvy6W8Z1C/wu
 SBIVFzQKQoL27jOyjorUi4P31iier3Ztptnoj/Jv6bLo4uquYNe3JJ0dA6CEExJN1/cA
 ey/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fBblV3J5e+7h0Y76jlYgQohotqE9YsWTERssbKcqmzo=;
 b=ZCvQC8CPUzTXV4qmTsBROt6fhia6mTw5QFuhYqa8N5OHNSFxCRkm+4chMuJNjpa1mj
 52yTviGuM51wjg+p39A7jf6DOC48hFvIuKgGaZEXCRU+PRXmmrwBIIq+g9ntWBMe0Ko2
 1wSeZpn3lboLEEpHJAD1NUsKzHueNS7lFrh1Mh2cq2eoBqzRvLrIsTodJSX/9EyQ51WH
 BQAUY8p8ZvpI0DrCJpjPFFsiPO6u1p4X/AXsbNehi3KB1zF/tcdUK0qmkJndVWe3R/nM
 XLnVJsFFOD052uU35WNvfe0mUp80rAo7vFC0apPZKSHsbu4kL2YiFR9xKcr9TBpTdegq
 0R8Q==
X-Gm-Message-State: AOAM532K0TKfM68MnjXihQojIZ3ZfCz1zbtRXGYI73BtwQaYK4wsMiUy
 hqFjoiLUw+mCxJeAXBKH5X05uNeGlre0Fw==
X-Google-Smtp-Source: ABdhPJz8ITvlIRYWq5HvRCuTr1Nd1UpLyJcRox+VQJgKfl+t0r0wenM3cVX8id5cPECNshdg2I5yYw==
X-Received: by 2002:a5d:548b:: with SMTP id h11mr30385624wrv.11.1638639261966; 
 Sat, 04 Dec 2021 09:34:21 -0800 (PST)
Received: from [192.168.43.238] (168.red-176-83-218.dynamicip.rima-tde.net.
 [176.83.218.168])
 by smtp.gmail.com with ESMTPSA id i15sm9896548wmq.18.2021.12.04.09.34.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Dec 2021 09:34:21 -0800 (PST)
Message-ID: <872da705-ce31-a400-558a-7cd0c9693bea@amsat.org>
Date: Sat, 4 Dec 2021 18:34:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v13 25/26] target/loongarch: 'make check-tcg' support
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1638610165-15036-1-git-send-email-gaosong@loongson.cn>
 <1638610165-15036-26-git-send-email-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <1638610165-15036-26-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-1.011,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, richard.henderson@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/21 10:29, Song Gao wrote:
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Acked-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/configure.sh | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

