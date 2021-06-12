Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 243583A511F
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 00:33:33 +0200 (CEST)
Received: from localhost ([::1]:51508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsCC3-00073I-MO
	for lists+qemu-devel@lfdr.de; Sat, 12 Jun 2021 18:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsCBD-0006PA-Io
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 18:32:39 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:44668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsCBB-0004a1-Ph
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 18:32:39 -0400
Received: by mail-pg1-x52e.google.com with SMTP id y11so5490282pgp.11
 for <qemu-devel@nongnu.org>; Sat, 12 Jun 2021 15:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=zRmwkwQmAye/ez5psfMgWIYD4GLFrdILmJtMkxFyKVw=;
 b=MRPDQebJDboRGePo29y+6vUdibVWYJwHD0d3Yf4GIodIURhjEZg2mV85icW4ioFyiV
 kueRj8LMyLNjeZCxSx57f4Sv+wlX0v+3abJ4APMohCxtibAKKTaQEG7oQkG1hlN6HtOG
 Qj9lUvyfzOC3tbDPECFzIhUCozcHJ68SPUmTlqLlMLl1tCTRaXut9ZLA7rZR+y882xbe
 miosyD4BF76TjmNXj9V3uaL/Pg3wntG8eaKHwNSXIs0d7JJ/9L6viPktyfTtjV35wCya
 lmJ+ADR6T/l/FsUmnmn0B4nBvpuVhOB+to/ISLTwD+cp1AsGwkq45VNseH4ZZaGq8Xjt
 aRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=zRmwkwQmAye/ez5psfMgWIYD4GLFrdILmJtMkxFyKVw=;
 b=MfAQUSmQGlMqW7UuwgfbvMhHBT4SzIQ1+HYh7C9cQstApgQLTvKz1lGlRp9V2Xcjh5
 7ULkU/PKUiyQeCBdZNdrWZaFl4Rau83HPAsY6kFP4pCY/cuTKO+8+oORoUJ4BqULR4LS
 gIwfN4o7qb1pTulIcExrgb6tU1WdQyxuCo1Z+eSbs5Xc3uvzIz6JLQWM9pyG2GpHSglJ
 VZg5JCq2p7rNp/wYlZX3/9k6piAAmaOegRizBS6moj5+1e+2xQQQZBxuWpcubbF0To06
 SlZobaLDE9s5YuHox9oFrhAusts0AJxdmWfUXbxKD46rpxlqku1J32cIViCJR+ZUgfdE
 HSjg==
X-Gm-Message-State: AOAM532xjQWfTHhzmazssOR+1jrlvUjMBzKCEnGr0UzUxFNyzGiDpAmw
 I3kPX112fV9hCdoZVTeEBOWM8A==
X-Google-Smtp-Source: ABdhPJwR0yBinTj8oBWpqnevQJoQn6WcxU9Y0LET1XOcPD/9rsq+VxCmT5fZEXVTKb8hED0XmAaaiw==
X-Received: by 2002:a63:545a:: with SMTP id e26mr10327008pgm.282.1623537156033; 
 Sat, 12 Jun 2021 15:32:36 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 r207sm8865099pfc.118.2021.06.12.15.32.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Jun 2021 15:32:35 -0700 (PDT)
To: qemu-devel <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Subject: [gitlab] Renamed issue labels for target architecture
Message-ID: <0a102843-bb93-93b8-f502-dd0cb2a6c636@linaro.org>
Date: Sat, 12 Jun 2021 15:32:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've renamed arch:* to target:* as there was some amount of confusion as to what "arch" 
really meant without context.  I've removed labels for lm32 and unicore32 which have been 
removed from qemu 6.1.  I've added a label for hexagon.

I have not yet added labels for host architecture, because I couldn't figure out how best 
to word the description, or even if all of the target:* labels need re-wording to 
emphasize target.

And then there's the special case of TCI.

Thoughts on these?


r~

