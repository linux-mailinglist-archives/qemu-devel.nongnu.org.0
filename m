Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30923609EFF
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 12:24:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omuMx-00013s-Gn; Mon, 24 Oct 2022 06:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1omuMt-00012M-P1; Mon, 24 Oct 2022 06:07:39 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1omuMs-00072S-6e; Mon, 24 Oct 2022 06:07:39 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5A2531FD49;
 Mon, 24 Oct 2022 10:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666606052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HeX7esfy2Sj56eBUygj155SDH73JwMSN8Oy5otmxINA=;
 b=E1GRpqMv/lQfiVYQJy80NeZqAPwgjWhK8uhcNWwxtmwiPp2Ys76hI+7ZBIJ/C9Q0IAFLWL
 oX+SOzygpSA0d5rVURy5eyvksPIRtKqZBrk/OpiSHnoP1519ghoL1VMI6BXzQDmkTkOm1n
 C0WFMJUWoTbxGuO96+atgJ6tijPcG3g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666606052;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HeX7esfy2Sj56eBUygj155SDH73JwMSN8Oy5otmxINA=;
 b=DlQT84SxRTueFZCAa3Fg38MZzdglzns03w6RRRKA39yGsLFYu9nhCz31PV1ryl4NGNhzjv
 +y71gjtEQyM3KLAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2B28513A79;
 Mon, 24 Oct 2022 10:07:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uE/TCORjVmMTCAAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 24 Oct 2022 10:07:32 +0000
Message-ID: <e2f60a68-99d0-0471-9a14-ae689c0f6756@suse.de>
Date: Mon, 24 Oct 2022 12:07:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] accel/tcg/tcg-accel-ops-rr: fix trivial typo
Content-Language: en-US
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <5dc556dbe241ae03859b7890d1998de5c77b7c6c.1666373742.git.quic_mathbern@quicinc.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <5dc556dbe241ae03859b7890d1998de5c77b7c6c.1666373742.git.quic_mathbern@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

On 10/21/22 19:36, Matheus Tavares Bernardino wrote:
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>  accel/tcg/tcg-accel-ops-rr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
> index cc8adc2380..cc912df108 100644
> --- a/accel/tcg/tcg-accel-ops-rr.c
> +++ b/accel/tcg/tcg-accel-ops-rr.c
> @@ -51,7 +51,7 @@ void rr_kick_vcpu_thread(CPUState *unused)
>   *
>   * The kick timer is responsible for moving single threaded vCPU
>   * emulation on to the next vCPU. If more than one vCPU is running a
> - * timer event with force a cpu->exit so the next vCPU can get
> + * timer event we force a cpu->exit so the next vCPU can get
>   * scheduled.
>   *
>   * The timer is removed if all vCPUs are idle and restarted again once

Reviewed-by: Claudio Fontana <cfontana@suse.de>

