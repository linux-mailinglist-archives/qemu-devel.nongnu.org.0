Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E57551F48
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 16:46:54 +0200 (CEST)
Received: from localhost ([::1]:46796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Ig1-0006ot-PB
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 10:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mliska@suse.cz>) id 1o3IY9-0001A4-VP
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:38:47 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:35576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mliska@suse.cz>) id 1o3IY7-0003cZ-Kp
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:38:45 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 046411F959;
 Mon, 20 Jun 2022 14:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1655735921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IQ79ZU4eUcwr3D6n0cUQOj8NomkDQrnnQQFcbQjITUo=;
 b=RszLwcBzmYsqx/qZLPWWpNIZaOzd1IU7C1lxV9WIa4gDu5YW2gFMxEcgjT3qs7K+QBfRk3
 NTRvT1sPoycmObpOfdl3Dk+BD5LyT6uYwuwg+QBb0WBsUsbhBkJn/8xEGcDu886U6dR8UH
 sAPf3b7vRVrTf0tO6KYdKUZIJUUph30=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1655735921;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IQ79ZU4eUcwr3D6n0cUQOj8NomkDQrnnQQFcbQjITUo=;
 b=OuhXt/jYc9mXvvNyMhTN776+TMwLmnSFkgVAA0NCUHRviSnjpLRHYy0/RWeyOmM6Qrs40m
 jWdqMB1wEnTp04AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E6550134CA;
 Mon, 20 Jun 2022 14:38:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zWj6NnCGsGKPZAAAMHmgww
 (envelope-from <mliska@suse.cz>); Mon, 20 Jun 2022 14:38:40 +0000
Message-ID: <cd41c9cd-66e0-f8c0-b940-dbdc61c3c3c2@suse.cz>
Date: Mon, 20 Jun 2022 16:38:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] sphinx: change default language to 'en'
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <e91e51ee-48ac-437e-6467-98b56ee40042@suse.cz>
 <CAFEAcA9OrxxLYBdtqFucY7mpFT-NWBSS5BQ2rYsTJ-Q8AKpZcw@mail.gmail.com>
From: =?UTF-8?Q?Martin_Li=c5=a1ka?= <mliska@suse.cz>
In-Reply-To: <CAFEAcA9OrxxLYBdtqFucY7mpFT-NWBSS5BQ2rYsTJ-Q8AKpZcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=mliska@suse.cz;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/20/22 16:15, Peter Maydell wrote:
> On Fri, 17 Jun 2022 at 15:02, Martin Liška <mliska@suse.cz> wrote:
>>
>> Fixes the following Sphinx warning (treated as error) starting
>> with 5.0 release:
>>
>> Warning, treated as error:
>> Invalid configuration value found: 'language = None'. Update your configuration to a valid langauge code. Falling back to 'en' (English).
> 
> (The typo here ("langauge") is present in the upstream Sphinx error message.)

Yep, it's very funny :) Anyway, they fixed that in latest Sphinx release.

> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> and applied to target-arm.next; thanks.
> 
> (I also checked that this didn't break any of the older sphinx
> versions we need to continue supporting.)
> 
> -- PMM


