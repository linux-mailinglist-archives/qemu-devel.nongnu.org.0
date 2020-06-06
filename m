Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633BD1F0668
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Jun 2020 14:03:47 +0200 (CEST)
Received: from localhost ([::1]:38588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jhXY9-0000xF-SO
	for lists+qemu-devel@lfdr.de; Sat, 06 Jun 2020 08:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marek.vasut@gmail.com>)
 id 1jhXWh-0000VE-So
 for qemu-devel@nongnu.org; Sat, 06 Jun 2020 08:02:15 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:44007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marek.vasut@gmail.com>)
 id 1jhXWg-0004N1-PL
 for qemu-devel@nongnu.org; Sat, 06 Jun 2020 08:02:15 -0400
Received: by mail-ed1-x544.google.com with SMTP id g9so9525260edw.10
 for <qemu-devel@nongnu.org>; Sat, 06 Jun 2020 05:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hVF6bfOQKVQHb+FfEXZWRyYZagtDNpg0Iw1gAoc+2lM=;
 b=Mrd0D6spNkJfkbNOZhWfEB8b0P4phTTjJJkrpAgNcfcZGiMlcRue8vf7qyF7/XHol5
 2GokcX2EtEjIOQf1brRsc7lFXV30UOIVFYbd5yaPdDLL5rS6SSJymvFgN4deRwvN2/Na
 0PeQhMzUcvYIPY5GlQ5nAJSL2S2IUYSS5FQZ4dAIgatBwUWTUwVxqw8NhXqBOpFMgsFO
 ur/5gZcoIBm/TUBDRyq6D7itZkVmVRGeqeLUDo8MwNfKoQGKbaDV/4hS7a8/JvvYrCcD
 C+QHX8wYcsKQc5uYT69kX6kNqqs3ncYD1dh6Sd1qj2ZCQc14KIArZ0XZDEoeoo4JKqVk
 6IUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hVF6bfOQKVQHb+FfEXZWRyYZagtDNpg0Iw1gAoc+2lM=;
 b=DusAgpN1kE05B5AOzIYLMpiQwzlVFMC/u1nlA0yyeg4izmHAM2i7RoTngOt8BLNps6
 2qVeMkG0BMZjZUgU6M6bC4SgKtEi410PnDBunUidFPHdGMNO6CimzDdKekwliaIibCLo
 1SkqfFHc3m7Z/zmwnnK3vlLM8wLc/O/A7OT0Q7BoWWNbfDPyvHA3BHWEL9vzMOuuPLDY
 xOJSyqvvUOTiVgOpreUKa6pdn+rfn5uHLrenXaWtanE+gvyGJVS6IsDgog2EfKnmHiAL
 0uBnx5s3EGWIDPH/rbT/5P4UIG/hTqwDfmEiL9cQqJ6kV5YCWneilIMpIVz5krt7rzfW
 FD5Q==
X-Gm-Message-State: AOAM53230JqAXuqH/R93qPxsEX9cS9BFFrWzL0RBXxdkP7BFB27ZtWIm
 0x0Ch5mJuJBFzGOPDvckP9k=
X-Google-Smtp-Source: ABdhPJxqnzGmB1kXFVMLOx/iWmxPrXtT6I+QfXlTH4CeimxPZX1nAp3DjPrEwMwrOmVUzgpwaiIPPw==
X-Received: by 2002:a05:6402:228d:: with SMTP id
 cw13mr14376952edb.150.1591444932506; 
 Sat, 06 Jun 2020 05:02:12 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-35-8.net.upcbroadband.cz. [86.49.35.8])
 by smtp.gmail.com with ESMTPSA id
 a8sm7056290edb.29.2020.06.06.05.02.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Jun 2020 05:02:11 -0700 (PDT)
Subject: Re: [PATCH] net: tulip: Set PCI revision to match dec21143
From: Marek Vasut <marek.vasut@gmail.com>
To: qemu-devel@nongnu.org
References: <20200418002552.343480-1-marek.vasut+renesas@gmail.com>
Message-ID: <1b3ba4cf-d18a-08f8-b1b7-742434511c3f@gmail.com>
Date: Sat, 6 Jun 2020 14:02:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200418002552.343480-1-marek.vasut+renesas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=marek.vasut@gmail.com; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Sven Schnelle <svens@stackframe.org>, Prasad J Pandit <pjp@fedoraproject.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/20 2:25 AM, Marek Vasut wrote:
> The tulip driver claims to emulate dec21143 and it does not emulate dec21142.
> The dec21142 and dec21143 can be discerned by the PCI revision register,
> where dec21142 reports value < 0x20 and dec21143 value >= 0x20. E.g. the
> U-Boot 'tulip' driver also only supports dec21143 and verifies that the
> PCI revision ID is >= 0x20, otherwise refuses to operate such a card.
> 
> This patch sets the PCI revision ID to 0x20 to match the dec21143 and
> thus also permits e.g. U-Boot to work with the tulip emulation.
> 
> Fixes: 34ea023d4b95 ("net: add tulip (dec21143) driver")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Prasad J Pandit <pjp@fedoraproject.org>
> Cc: Sven Schnelle <svens@stackframe.org>

Bump, any news on this ? This is a bugfix.

