Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B13119DE5A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Apr 2020 21:08:30 +0200 (CEST)
Received: from localhost ([::1]:59996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jKRg4-0001gR-Gp
	for lists+qemu-devel@lfdr.de; Fri, 03 Apr 2020 15:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57311)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jKRey-0001Ee-GR
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 15:07:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jKRew-0001Xq-Qj
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 15:07:19 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:38092)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jKRew-0001VG-Fn
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 15:07:18 -0400
Received: by mail-wm1-x329.google.com with SMTP id f6so8881566wmj.3
 for <qemu-devel@nongnu.org>; Fri, 03 Apr 2020 12:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=iqNQqLRb0n5m9dKc0PzrrFHPrlBe/P++RLLzQM6nYAE=;
 b=kvEDPaNK46p6euHwrRornUdd3vxo2jFKXHCmVX2+23GI+pJ6n2+uKD+u0ZOqDeJtrn
 bd3G0BV7auKyTmXpHk60XKMKqq5xjp6naRFRvxTu3e8QmJRIQ4IFCl4CXknyYWMNEvWB
 rYLYxN+qiVYJ3qYFFGTMnBwPoEZlWBQMbACnpLVF5JyjL1gr3ac3Pess4jMbzTvZ2c8z
 +FoYdNmQjnJsMos4XxK9+zI/tR3oP3w7zA983YR4TRiih3VPakz8aEL1F8noq67naa45
 UUtrmJkWob//pGe1Iq+mJqfcYgC6o1DFjcTDpTuBBcGQ1A5U5c9s/IMyoZNX0czFftb+
 Kr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=iqNQqLRb0n5m9dKc0PzrrFHPrlBe/P++RLLzQM6nYAE=;
 b=ijZiRiv0OIgdFmcwADVzAlBEOD5xo77zPhXTyukeUlFfC0ZSc0PDyRamKHPQ+8Dylv
 g1j4n2D1Sbe5p+Kz7hkYBl8dtFLcHTGC9ay+9xFkxD43qM6FDZpmrfw7CHQFUerBWw2D
 eQRDp9i8AiXPkL2oiNhyLT+2GBGGcW1yjeExfyccZXKvX0FIorypWrbaYCBqjEMTWQ9g
 Ag3QYS0D1PdwfP9B8QKj0ONzZ6P4usSLs0TMprwl78eFjiY4GdBYt3p0TS0at0Aj9fJj
 577b0rQGY+TNzaaa7woLkLMJS9PDGsc0TOgZau5jsyShzT6Kw3eS3PA/xvkZF/Cf/41u
 6ikw==
X-Gm-Message-State: AGi0PuZ2Hzhfu8iBkJ0wR7xNyu3+iyn0KCFCQ7EbT9b4zHaDJHJjPq7V
 +GQhPnf1SPFTjAETLo//iu0B7w==
X-Google-Smtp-Source: APiQypL5ptIfw95A9vOl1jnyySsHmzw8CzjADxMvbcg/XkcLGNnYglNO1kTmZKtKCZ3t2m3tEmoaeg==
X-Received: by 2002:a1c:e203:: with SMTP id z3mr10378871wmg.71.1585940837084; 
 Fri, 03 Apr 2020 12:07:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y20sm3687143wmi.31.2020.04.03.12.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 12:07:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EFA271FF7E;
 Fri,  3 Apr 2020 20:07:14 +0100 (BST)
References: <BL0PR2101MB1026B7A4C994BE826CF95DFFD6C60@BL0PR2101MB1026.namprd21.prod.outlook.com>
User-agent: mu4e 1.3.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Robert Henry <robhenry@microsoft.com>
Subject: Re: qemu plugin exposure of register addresses
In-reply-to: <BL0PR2101MB1026B7A4C994BE826CF95DFFD6C60@BL0PR2101MB1026.namprd21.prod.outlook.com>
Date: Fri, 03 Apr 2020 20:07:14 +0100
Message-ID: <87369ke6cd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::329
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Robert Henry <robhenry@microsoft.com> writes:

> There is now a qemu plugin interface function
> qemu_plugin_register_vcpu_mem_cb which registers a plugin-side
> callback. This callback is later invoked at the start of each emulated
> instruction, and it receives information about memory addresses and
> read/write indicators.
>
> I'm wondering how hard it is to add a similar callback to expose
> register addresses and read/write indicators.  For example, executing
> `add r3, r1, $1` would generate two callbacks, one {write r3} and the
> other {read r1}. I'd like this for all kinds of registers such as simd
> regs, and, gulp, flags registers.

The problem with tracking registers directly from the plugin is the
internal variability of how QEMU does things. The core TCG isn't really
aware of registers as such and the individual translators can take all
sorts of approaches to loading and storing the results. Then you have
the issue of helper functions which TCG is only vaguely aware of if it
needs to save "globals" or not.

> With this information ISA simulators could examine the data flow graph
> and register dependencies.

The plugin itself can still do this by disassembling the instruction at
translation time and decoding which registers are going to be accessed.
It can pass this data to the callback via userdata mechanism.

> I'm not asking for register contents; we don't get memory contents
> either!

There is no conceptual problem with adding access to register contents
even if it's only read-only. The main issue is coming up with a clean
API for it.

See thread @

  Subject: Re: Qemu TCG Plugins - how to access guest registers?
  In-reply-to: <20200329111311.272958fe@luklap>
  Date: Mon, 30 Mar 2020 16:15:47 +0100
  Message-ID: <878sjhho0s.fsf@linaro.org>


> I gather there is some concern about exposing too much functionality
> to the plugin API, as a plugin might then be used to subvert some
> aspects of the GPL.  I don't understand the details of this concern,
> nor know where the "line in the sand" is.

We need to better document this - but basically we don't want 3rd
parties implementing what would be core functionality (e.g. device
models) but using plugins as some sort of end run around the GPL. While
I would love there to be more analysis plugins contributed upstream it's
less of a concern.

>
> Robert Henry


--=20
Alex Benn=C3=A9e

