Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7DD60C7B3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 11:15:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFzH-0000WZ-ST; Tue, 25 Oct 2022 05:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1onFyr-00009H-KL
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 05:12:19 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1onFyp-0003Tr-IT
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 05:12:17 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 294301F74A;
 Tue, 25 Oct 2022 09:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666689133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kwa4SbQD1RMW6hxRN4xTpdAJzOKygBbZ2BsR4zNtADA=;
 b=vKzQFpFOyccfRoYUjs8c3jgqa5c/rDw6Cyf2DPAVQYt/cC6cGzXlt/6lRjJ2NFiIza+udK
 gYI4XAxYauCLYw6rySyqbLz+Ixn9GoUmDVVJb0zKk/mT5jJIOttW8+ONuWCoaD6FLLNMLI
 1bYVm16fomPm91JA5u0vQf8PhsWcqXY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666689133;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kwa4SbQD1RMW6hxRN4xTpdAJzOKygBbZ2BsR4zNtADA=;
 b=SIrIq8QhgGY7PPw3aebZUTKII9X5U6O1lXIIUA/aRpAfK55jxMBW/f+xwfkA/edcGkseXt
 uos5/Yv9xF7mbvDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0EB95134CA;
 Tue, 25 Oct 2022 09:12:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7yH1AW2oV2MVOAAAMHmgww
 (envelope-from <cfontana@suse.de>); Tue, 25 Oct 2022 09:12:13 +0000
Message-ID: <abdbb0ca-ec54-b8eb-7a15-0d1d2abde7ab@suse.de>
Date: Tue, 25 Oct 2022 11:12:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] tests/tcg/nios2: Tweak 10m50-ghrd.ld
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-3-richard.henderson@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20221024132459.3229709-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=cfontana@suse.de; helo=smtp-out2.suse.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is unrelated to the "tcg: Fix x86 TARGET_TB_PCREL (#1269)" series right?

For some reason it appears to me as part of it, as a reply to the cover letter.
Ignoring this one as I don't understand it at all.

Ciao,

C

On 10/24/22 15:24, Richard Henderson wrote:
> More closely follow the default linker script for nios2.
> This magically fixes a problem resolving .got relocs from
> the toolchain's libgcc.a.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1258
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/tcg/nios2/10m50-ghrd.ld | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/tcg/nios2/10m50-ghrd.ld b/tests/tcg/nios2/10m50-ghrd.ld
> index 7db0d59ad7..71cdda450c 100644
> --- a/tests/tcg/nios2/10m50-ghrd.ld
> +++ b/tests/tcg/nios2/10m50-ghrd.ld
> @@ -44,11 +44,15 @@ SECTIONS
>      .data : ALIGN(4) {
>          *(.shdata)
>          *(.data .data.* .gnu.linkonce.d.*)
> -        . = ALIGN(4);
> -        _gp = ABSOLUTE(. + 0x8000);
> -        *(.got.plt) *(.got)
> -        *(.lit8)
> -        *(.lit4)
> +    } >ram :RAM
> +
> +    HIDDEN (_gp = ALIGN(16) + 0x7ff0);
> +    PROVIDE_HIDDEN (gp = _gp);
> +    .got : ALIGN(4) {
> +        *(.got.plt) *(.igot.plt) *(.got) *(.igot)
> +    } >ram :RAM
> +
> +    .sdata : ALIGN(4) {
>          *(.sdata .sdata.* .gnu.linkonce.s.*)
>      } >ram :RAM
>  


