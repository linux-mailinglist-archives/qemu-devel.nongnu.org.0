Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 243F5681F77
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 00:16:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMdMi-0003kn-KT; Mon, 30 Jan 2023 18:15:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdMf-0003kZ-8d
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:15:05 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdMd-0005sG-5o
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:15:04 -0500
Received: by mail-wr1-x431.google.com with SMTP id q10so12689094wrm.4
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 15:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4baHS8M8CJ4oQKi/VXO7VPnLlKnrH5wc7Zm9+Cv+r4g=;
 b=bS+Tglpj4o9lUTfuh/a2/9rMPderimA93JN5CwB6rHIiYY/NR2YUx9ChAH6fkva7GA
 AR/wDDEA/Qvo2grPaMGxuDpykenIsCWPGblvDiLkOvi2pf6tJloredmh4Jqk00IUxMWj
 U23k38UVyD442Jd9poo+oIsyTSAyqEaGxHEm+CVAqUFrjSzvYA0Dse3A8gFG1xlbB9CR
 X31882KyrjORl8xEtFe4yaFfNDXuX+WTq46D4FljusD0qNe0AtNC4WtbE9IBn3gF0y2V
 xfmcGkm2pfJmWg0N6bi2Hz2Me8/CXDVP/FfcfQNGGNATZh+3a70xhexSoUWf4Q+RU1/D
 MURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4baHS8M8CJ4oQKi/VXO7VPnLlKnrH5wc7Zm9+Cv+r4g=;
 b=k0MmbHNaS1yEv9K7DHZUIssAw2XHePhwYMLRsAYNwb3GMjP0oP5VR2F8RqKV9QvUIV
 fKlbD5WLpAe63PyuGW92xcJOI70Cc9DWRAQltAYRWNgRfPStsQnbdiSyjRFLXcbehPbS
 BB3thbNb2obq/0blIBMHCJcrJthDecatTm5J3fmLQo8QWT3aurTMFrjwlga2neipnqtL
 lavjUbGbO8xsmMT4q5De0/TgoEly5tyujm1NmHRgQEqvXYupke5CDAnh1geciZ/q4L1y
 I7ZRNz40SPTxbJ8xxUxSUyt5oZUV2SVvtEjlYJcCdsNO+bIqbR3dLprVPcJcUo3khUA3
 lIYw==
X-Gm-Message-State: AFqh2kqTYWTnOgO3NobrxjLKPPcfMms7CTnr72jylDZU9ngJn3qwK2Np
 V0isT+5U07sKltgttVDBKlM/qQ==
X-Google-Smtp-Source: AMrXdXvBtv52FWPOEgqBMOqggWJ5FB0zn/pTUAlqjQyREWK/Ot3OX0oOVN3rkOiQ8VRWgjX/wnut7A==
X-Received: by 2002:a05:6000:a03:b0:2b9:9e7b:be6b with SMTP id
 co3-20020a0560000a0300b002b99e7bbe6bmr48417085wrb.45.1675120500338; 
 Mon, 30 Jan 2023 15:15:00 -0800 (PST)
Received: from [192.168.1.4] ([41.141.105.34])
 by smtp.gmail.com with ESMTPSA id
 b14-20020adff90e000000b002be34f87a34sm13192386wrr.1.2023.01.30.15.14.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 15:14:59 -0800 (PST)
Message-ID: <51e135e0-0c94-43d6-c408-1a9d556e9e42@linaro.org>
Date: Tue, 31 Jan 2023 00:14:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Stefan Weil <sw@weilnetz.de>, Michael Tokarev <mjt@tls.msk.ru>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <CAFEAcA89Onb9Dg4zJXQ0Ys-0kJ2-hz5KYRPXMCE7PWDDxVzDyQ@mail.gmail.com>
 <Y9exrDWT2NUoinu1@redhat.com>
 <9c529b2a-14bd-fd50-c0d9-87f2253ee0bb@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <9c529b2a-14bd-fd50-c0d9-87f2253ee0bb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 30/1/23 20:19, Richard Henderson wrote:

> But I do question whether we need to support 64-bit guests on 32-bit 
> hosts at all.
> Retaining 32-bit on 32-bit allows arm32 to emulate i686, which I 
> suspect, but have no proof, is the limit of what users actually want.

I presume you implicitly restrict that to user emulation, right?

WRT i686, if your example is "i686 useremu on non-x86 embedde router"
then any 32-bit host is potentially interested, not only arm32.

I remember being able to run armhf binaries on armel hosts (and vice
versa) was useful 7 years ago. Today I have no clue, we could poll the 
community and some distributions.

