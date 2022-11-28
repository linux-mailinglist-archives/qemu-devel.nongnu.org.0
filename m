Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E15ED63AD82
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 17:20:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozgpo-0008V0-PC; Mon, 28 Nov 2022 11:18:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozgpm-0008Uc-DQ
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:18:18 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozgpk-0000vp-J0
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:18:17 -0500
Received: by mail-wr1-x436.google.com with SMTP id w15so4481599wrl.9
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 08:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9c7WoR3KxPVQ2mPFbTnHIG47ShSTcHZzr36/oLOmDK4=;
 b=kgviN9yVAkVwrPhk5pkG5pvonkCSLUovOawoWQSDXV+nuoYFTMAqRAmZwowyMal8Ku
 DCdLqXPh/ztTVIQm1/nWptkN2lFkq0H7PpJ8VGb2HaQg8TZmGcWm084nvF4vmL+cCzPU
 8heU/EsPiAoFwzIIeIadUmKf4BHCAOCkwKKXav+psS/97go1Em7t9LtOtTclsOgi3p9W
 o2S/6kHcg6MwdlzeLABg1vTtXph9/fdK2UgmqRyk4QwQp5PFW2F7NEDXUBXef9BVScGk
 ve5sOmKPUBKxpMzy+/ZNIq7uJP3Of4tJb8/8rfjVh0u4hGL1gApDPIaKzq3DJ2PfgkvT
 OOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9c7WoR3KxPVQ2mPFbTnHIG47ShSTcHZzr36/oLOmDK4=;
 b=KXaQlRgxPn1O2fq5Z9rQkXhLdTQKdUUNr453hgjVZvUPv6RlyTI83EBsOqsIrfsJXe
 u1qNciyCALZS+zeBISuxBG8ZrDGbsyxslMnDX/DLv6QN1zGkoZ4INcKHg05lb9ARKDvB
 ii0iTVqj9K2Y+E5DwMCouxA9ikbncuFFZY00XsYCHesv5t/kjBvlDvMGWS2N7seKOD7Z
 prCKIKUBdzodD8PhXwlLmUi+roBFrTP8nz9J8hHejj53JL5+x28O4+WuqZ21ZZ3sRw/P
 2LbhVeTwIOTh8fxhUbMFPoRzuxQxnZ1QEUt6EE/rFsqnCgVeHsBA+vmZTm8USUgvpSwg
 XWJw==
X-Gm-Message-State: ANoB5pmjH5Cr364Vsb6+YmW6doVCZ+gwAeBRIojHV9Tb0kjmDcXJB/k7
 6qnI4Vu6N+advEFMrxdLP91/Pg==
X-Google-Smtp-Source: AA0mqf7oHLoLG7gyXNXkaOicQ+v93H5WIPENKT+50tAwfh8dTt/LHVywpoA1+dlLI2rygNInwb6bdQ==
X-Received: by 2002:adf:f1cc:0:b0:236:e629:adab with SMTP id
 z12-20020adff1cc000000b00236e629adabmr23551080wro.621.1669652294875; 
 Mon, 28 Nov 2022 08:18:14 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s10-20020a1cf20a000000b003cfe1376f68sm15302916wmc.9.2022.11.28.08.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 08:18:14 -0800 (PST)
Message-ID: <c64522e4-4bb9-8dbf-fd93-151b77f5156a@linaro.org>
Date: Mon, 28 Nov 2022 17:18:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [RFC PATCH-for-7.2 3/5] hw/display/qxl: Pass requested buffer
 size to qxl_phys2virt()
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Gerd Hoffmann <kraxel@redhat.com>, Peter Wu <peter@lekensteyn.nl>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221128134832.84867-1-philmd@linaro.org>
 <20221128134832.84867-4-philmd@linaro.org>
 <20221128150853.lp2hdkdzt6ou6f6g@sirius.home.kraxel.org>
 <655e51b2-99ef-a48d-9be3-ddbc15275e7f@linaro.org>
In-Reply-To: <655e51b2-99ef-a48d-9be3-ddbc15275e7f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 28/11/22 16:41, Philippe Mathieu-Daudé wrote:
> On 28/11/22 16:08, Gerd Hoffmann wrote:

>> Also at least one code path (processing SPICE_CURSOR_TYPE_MONO in
>> qxl_cursor) goes access chunk.data[] without calling
>> qxl_unpack_chunks(), that needs additional verification too (or
>> switch it to call qxl_unpack_chunks, or just drop it because nobody
>> uses mono chrome cursors anyway).
Per commit 36ffc122dc ("qxl: support mono cursors with inverted colors")
"Monochrome cursors are still used by Windows guests" (i.e. Win2008R2)
:/

