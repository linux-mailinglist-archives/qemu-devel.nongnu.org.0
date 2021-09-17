Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A4440FF8D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 20:41:08 +0200 (CEST)
Received: from localhost ([::1]:49876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRInL-0002aj-T3
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 14:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRIlU-0001vP-6F
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 14:39:12 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:44031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRIlR-0004lW-33
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 14:39:11 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 a194-20020a1c98cb000000b0030b41ac389fso2783047wme.2
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 11:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ff75Wwy1zN+zZwUShiOiWAvFzSxHJiSsky9vxx8gt5k=;
 b=U6cJ2nsa3wfA/5zlsmhmktW6Jns/6jw0N28eA6aBan/rMv6g7b5mPWALFrpDFVm9F6
 Y/fiF8NhH6Ot/KJvKiO1o/+UMAicaoyz0NH7mQOs6W+14Twf1U0wBnfySJX493Y1RrKU
 12L2ACKYMw2/vHdTPm1wQqZRedxecPTfwt+bq+un46HwihagteFA9N8nkmzZasGxv0AE
 1PYxPOGqKsNnUDA1JpomtuWC/MtrO0PZgK/N6jFW3M7lbl8UxGGdHg9Y1puc7waQ4Msn
 folHFZxktUtU5hdySRumEY75fysIQLzAAd6/cjxsixrbd2DzdIFLqNP1C++Exclxl4hv
 ez0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ff75Wwy1zN+zZwUShiOiWAvFzSxHJiSsky9vxx8gt5k=;
 b=Z2UgTPfg6VQv0PCVviJ//EaUuRmliw8nyeBwihbr3ijg0tbYWSTHbJ7Lj+M6DGD/IJ
 yitDIs/PdhihogIzdYsaqDshmC9LkCjc+gygGzeX0EijuMRHtB69cIN9BLvrS+aNKPxk
 JXNs1MA1TQzkV9yjtp3py49ASL0ml1ez4fEAZOq/R1nD6KB+LBXSR2GcekAnAgQmDX+Q
 o8UF3xRIDXuoTYXOjco8Febih8zx0RerfABPsIA1jkbz1WO/LZs5HjSpM46wB6vKBUL3
 Mp2zUaDzEsKSPItxXzPfiFCFkabNjIVhf+bSTlwz/3mrp8OLWV86SrZZ0CQ682Z0dDQb
 QPFg==
X-Gm-Message-State: AOAM531DdnI3WfhE3o+QrMfo5YMx4Zm3BjVB0hRL/+0Yl+Y+oyQfhIL+
 LhSA2lM8J9j1ukDTqYmI3FQ=
X-Google-Smtp-Source: ABdhPJx0muUkCFqnVcKq7T6wWPBk8Kn0oKP1K5VrePLtPkzSD95VmevQWHQF0yvK87EUJbp+vgqScQ==
X-Received: by 2002:a1c:f308:: with SMTP id q8mr16293928wmq.153.1631903947597; 
 Fri, 17 Sep 2021 11:39:07 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id z19sm13793363wma.0.2021.09.17.11.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 11:39:07 -0700 (PDT)
Subject: Re: Rust in Qemu BoF followup: Rust vs. qemu platform support
To: Warner Losh <imp@bsdimp.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <YURYvaOpya498Xx2@yekko> <YUR9RXXZ4lSRfcyB@redhat.com>
 <CANCZdfoezvfO+wKgqwMf7oCO3dAgpJ28RGecnZs31_o3+iUdGA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <119693ac-5aed-969a-9d8f-252db75a2d98@amsat.org>
Date: Fri, 17 Sep 2021 20:39:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CANCZdfoezvfO+wKgqwMf7oCO3dAgpJ28RGecnZs31_o3+iUdGA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.488,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, slp@redhat.com, cohuck@redhat.com,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/21 6:04 PM, Warner Losh wrote:> wrt FreeBSD:
> 
> The main focus of the project is on AMD64 (x86_64) and ARM64 (aarc64). With
> ricsv64 being ascendant as well. i386 and armv7 are fading. ppc64 has
> strong,
> but episodic, interest as well. The rest are bit players.
> 
> i386 (i686 really), armv7 and riscv7 are the next tier of interest in
> FreeBSD
> land. i386 is confined to 32-bit VMs with only a few legacy hardware
> deployments
> still kicking. armv7 is more popular on embedded boards, some of which have
> a need to run qemu.

What part of QEMU is used there, user-emulation (likely IMO) or
system-emulation (unlikely) or both?

> riscv64 has a rust port that's being upstreamed, but not
> there yet and there's likely interest to run qemu on it for research
> projects.
> riscv64 isn't widely deployed but has a lot of developer interest /
> mindshare.
> sparc64 was removed from FreeBSD 13 and has been irrelevant for years.
> ppc 32 bit has some minor interest. mips has been fading fast and stands
> an excellent chance of being removed before FreeBSD 14 (which is currently
> slated for 2022). PowerPC 64 is hard to talk about... there's interest
> that comes
> and goes, but when it's around, it's quite intense. It's quite likely
> there will
> be interest to run qemu on ppc64 on FreeBSD, but that's much less certain.
> 
> So it all depends on what having rust means for those platforms that
> don't have
> it. Would it be a 'half a loaf' situation where the non-rust bits would
> be buildable
> but cool new drivers written in rust won't be? Or will it be so central
> that rust is
> table stakes to even start a qemu build? To be honest, I'm not sure this
> difference
> would greatly affect the above answer :).
> 
> Rust works really well on x86_64 and aarch64 (though there's more often
> a lag
> on the latter of a few weeks). I know of a rust riscv64 port, but that's
> just getting
> ready to upstream. No first-hand or second-hand clue on the rest.
> 
> FreeBSD tl;dr: x86_64 and aarch64 are must have. i386, armv7 and riscv64 are
> really nice to have. ppc64 might also be in that list, but that's less
> certain. The rest
> have little to no relevance.

Thanks for gathering this useful info!

> P.S I've been poking at people to get our QEMU aarch64 CI story in better
> shape than it is today... I'll have to continue to prompt those
> interested...
> 

