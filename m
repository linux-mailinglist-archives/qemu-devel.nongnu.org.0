Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1254C1AE689
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Apr 2020 22:11:45 +0200 (CEST)
Received: from localhost ([::1]:51472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jPXKx-0000L5-OE
	for lists+qemu-devel@lfdr.de; Fri, 17 Apr 2020 16:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42260)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jPXJq-0007wK-Ep
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 16:10:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jPXJp-0001OH-DH
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 16:10:34 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:38896)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jPXJp-0001Li-3R
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 16:10:33 -0400
Received: by mail-pj1-x1031.google.com with SMTP id t40so1519402pjb.3
 for <qemu-devel@nongnu.org>; Fri, 17 Apr 2020 13:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BjaRys/Kb+qySZ9CNuCaV8+hPOohMFm5s5ZYo5+1rGk=;
 b=O3myfcj4mYVGzzIe6Odry6KhFto4kf74o5DGD8727jmAnOlXfgCB2jP4lbzia4f9Rj
 0In8f0ZnhDsE2rp8+QCx1/jsVg96Hl3JplE8Se5NLdI9Se9IHeCLChYFJoei/QkBrFAl
 Oxq5suvJ1uGG6a1f6bh4LemQRmGgYBCqweDMVN1uzI78gzDW9OQoWQWwCLnrk/H5G0kU
 RfhsBgY9VRhJsC3jlc5xrqVXAGfs9+3K0/4RRpCZUzRsJ/Yd8SHy126SPXIlW2CBVulE
 7B8b+6KFwPMJcSV42nYCnqSPSCj5+kg4TZGtDh3bXL/K/h1JELGUVq12RPOkEc5DDA4D
 m0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BjaRys/Kb+qySZ9CNuCaV8+hPOohMFm5s5ZYo5+1rGk=;
 b=AJPDRtPmCYaMekXVP23WOOj6NDFDansD5ADM5uLW/LnOLwZGw577Umk9L8GHhTF6Ay
 lgPBj9w88ANcqo6vmI07ar7k7VAdukam1NYMYD9f5/bIQSOFRFvWu/wIUUoW9IgyQOXZ
 D7zwJIe4ECUJGqatqEIxYzbpHC9EhwBu9QtWm5WhjuuXjYSvCau5sldLh5XWZBFWyp3J
 MoOuy/x392glD7gCynIDeoyFSvd+LemmHl71uvq0USqgv37dgiAw9TfamaekGKmfqzir
 bLXnVRhiUT6AiSWJ4llZo/4rE3cUExNi8w61pccLbTIH4TsCZVhetneGPtH1AWGCGjJN
 jCHg==
X-Gm-Message-State: AGi0PuYd+XmKMA9AvSo4auf1es6Ejud5diOQnMBJXZJlbmZBIbYJvm8+
 xhPsawlQ0NP4ATCE3nCCGmOl4Q==
X-Google-Smtp-Source: APiQypIeMLvx7ktCoZiVCcpFS8Jh4qeT9BmQZArvuw+Oxr5HG6XeVIj9GimYSawdcH1qVbSxvW0Apg==
X-Received: by 2002:a17:90a:25ea:: with SMTP id
 k97mr6554170pje.122.1587154231686; 
 Fri, 17 Apr 2020 13:10:31 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id m2sm6290946pjl.21.2020.04.17.13.10.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2020 13:10:30 -0700 (PDT)
Subject: Re: 5.0.0-rc3 : Opcode 1f 12 0f 00 (7ce003e4) leaked temporaries
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Dennis Clarke <dclarke@blastwave.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>
References: <707f641b-1cf6-15a0-0602-5950e7b98886@blastwave.org>
 <023af69c-d21b-55a7-cdb4-f61ff3cd50f9@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <99b34394-85a0-a270-8fac-1ae9f53b5674@linaro.org>
Date: Fri, 17 Apr 2020 13:10:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <023af69c-d21b-55a7-cdb4-f61ff3cd50f9@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1031
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
Cc: qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/17/20 2:20 AM, Philippe Mathieu-Daudé wrote:
> --enable-debug enables --enable-debug-tcg which is not designed for
> performance. You might want to try '--enable-debug --disable-debug-tcg'.

More importantly, --enable-debug turns off compiler optimization.  That is
going to be the biggest hit to performance.


r~


