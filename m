Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E1E4864B3
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 13:59:52 +0100 (CET)
Received: from localhost ([::1]:34390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5SMx-0000ZW-74
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 07:59:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1n5SFV-0008EQ-B0; Thu, 06 Jan 2022 07:52:09 -0500
Received: from [2a00:1450:4864:20::42d] (port=36383
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1n5SFT-0007tw-JR; Thu, 06 Jan 2022 07:52:08 -0500
Received: by mail-wr1-x42d.google.com with SMTP id r17so4607982wrc.3;
 Thu, 06 Jan 2022 04:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:to:cc:references:subject
 :content-language:reply-to:from:in-reply-to
 :content-transfer-encoding;
 bh=OG30ocvVAXDyWITIlEJ3I4ogqDOLn0u4zkrbkseT5DY=;
 b=bpbq7ihyHgZCH7fiUES1qnoOSj+bbDiY+wlLknGZ0EPGjg3Cnf42aykHBCN/IP1rQk
 r5xZwKXcZFLXAUe5pmQi2Cl/x0OxOelHB1MyKM+FS+X37cjrOlzt8PeZLfB3h+9Qcxzh
 Cc/ovjpVF5QFUe4WFzHZgScL28RKw1uPpFb0Ob7HEXT1oRGiKAejMQxs9wHayRRySOKg
 z7QTkvW2WdMdjXTB7wQVEuIVGB3TxWkB26QKjUVfke93AsnKiALnLlAS/kNm9FDszTM5
 2tik1RH/5zVZXDQmsSOBOBatyzNZd2EveLdu4aRYLYIyqHArc/DKc74xife4TbFuxUCv
 86cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:to:cc
 :references:subject:content-language:reply-to:from:in-reply-to
 :content-transfer-encoding;
 bh=OG30ocvVAXDyWITIlEJ3I4ogqDOLn0u4zkrbkseT5DY=;
 b=WjlkoAkOqI3iFzevwqROHMNed+Db4NMGUsBDdGxsbdS04Jj1ZI0oQwbM3QYu1Uo1k/
 Q/+bkaS2vsdH8LdnGB2T5Edhrybr5O7KbGD2dzdtGnq7Pa+FkfPZYTE8evhG1LCKPGbV
 A6i5tdhUzjOJfSuF2uHzSOQd48mATLG8mg0E6M4bkJjI974NJTd6Wv2RZbSPHmOgDLLh
 jEUBLiy6UWYkVz4PBie9EZiYmrt3xRFRoZnen0EwpOYPkazGEJk/l3PBtmxnUfUTFJ8h
 Tt2qKnFWC4H5amkHGC1E7gsbP1U2TYRZZr2zOc3Qyt53ky4FbpUCoRKrfWyT5Xzx+PfL
 dMXw==
X-Gm-Message-State: AOAM531TnP0uiT7hdMhE+Vn4EnmxD9aogIIBJsG2oFfcGFVKnFBDDpr6
 PqzSpvDWJMNkyORDY8f99QhgiskVIhNaJw==
X-Google-Smtp-Source: ABdhPJxdLnGwS8W3NEWGGCwsLXsDWDa0KkJ6P9ysUmUYAmEDqW6VYXuOPULyKhq9WqnmiySF4B3MkA==
X-Received: by 2002:a5d:4c43:: with SMTP id n3mr6349059wrt.108.1641473525434; 
 Thu, 06 Jan 2022 04:52:05 -0800 (PST)
Received: from [192.168.0.123] (bzq-79-176-64-164.red.bezeqint.net.
 [79.176.64.164])
 by smtp.gmail.com with ESMTPSA id b13sm1999528wrf.64.2022.01.06.04.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 04:52:05 -0800 (PST)
Message-ID: <50336510-0486-690b-76d1-f39a35eb1e4f@gmail.com>
Date: Thu, 6 Jan 2022 14:52:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: idan.horowitz@gmail.com
References: <20211231103928.1455657-1-idan.horowitz@gmail.com>
Subject: Re: [PATCH] target/arm: Add missing FEAT_TLBIOS instructions
Content-Language: en-US
From: Idan Horowitz <idan.horowitz@gmail.com>
In-Reply-To: <20211231103928.1455657-1-idan.horowitz@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=idan.horowitz@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLYTO=1, NICE_REPLY_A=-2.691, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Reply-To: 20211231103928.1455657-1-idan.horowitz@gmail.com
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping for code review, please?

Thanks, Idan Horowitz


