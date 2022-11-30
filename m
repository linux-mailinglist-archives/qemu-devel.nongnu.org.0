Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FBE63E022
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 19:53:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0SCf-00083C-2l; Wed, 30 Nov 2022 13:53:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1p0SCc-00082j-I7
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 13:53:02 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1p0SCb-0000kO-17
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 13:53:02 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 15F1A1F45B;
 Wed, 30 Nov 2022 18:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669834378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gfkb88UL5Bug+YlRMi57UCT+ChKc7aiPWW+7tuffJoE=;
 b=vksehK0HJ2zTI8WjJMkww0MJ9bBw4CFocIPeO9sY1rzMUf1jam3bCODoyJQvXh5oQeO+jH
 vsBgeeDOdmRAztS/D4Ec0mBT0Cu2g3uQLtoc375FUieOPKaPJQq5sl85QmxJpFgZpEIH8b
 /SnMWr8xdaTyTYyTe+Lu2buD8DYOlrE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669834378;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gfkb88UL5Bug+YlRMi57UCT+ChKc7aiPWW+7tuffJoE=;
 b=8ai/xD2oPUabvK4+WbtQnszSTif8mirwcw/9SdYzLEg7WdZiMH2579JPGmLKM8pMiV+X0f
 8+O5aWWDQfayNAAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9122913A70;
 Wed, 30 Nov 2022 18:52:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WhKVFYmmh2MDBAAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 30 Nov 2022 18:52:57 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 peter.maydell@linaro.org, alex.bennee@linaro.org,
 richard.henderson@linaro.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/1] tcg: convert tcg/README to rst
In-Reply-To: <20221130100434.64207-2-mark.cave-ayland@ilande.co.uk>
References: <20221130100434.64207-1-mark.cave-ayland@ilande.co.uk>
 <20221130100434.64207-2-mark.cave-ayland@ilande.co.uk>
Date: Wed, 30 Nov 2022 15:52:54 -0300
Message-ID: <87iliw1dh5.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:

> Convert tcg/README to rst and move it to docs/devel as a new "TCG Intermediate
> Representation" page. There are a few minor changes to improve the aesthetic
> of the final output which are as follows:
>
>   - Rename the title from "Tiny Code Generator - Fabrice Bellard" to "TCG
>     Intermediate Representation"
>
>   - Remove the section numbering
>
>   - Add the missing parameters to the ssadd_vec operations in the "Host
>     vector operations" section
>
>   - Change the path to the Atomic Operations document to use a proper
>     reference
>
>   - Replace tcg/README in tcg.rst with a proper reference to the new document
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Fabiano Rosas <farosas@suse.de>

I have a couple of suggestions for a small restructuring. But we could
do that after this patch gets in, no worries.

The index now looks like:

Translator Internals           <--- mentions what TCG stands for
    CPU state optimisations    <--- references TBs and targets
    Direct block chaining
    Self-modifying code and...
    Exception support
    MMU emulation

TCG Intermediate Representation  <--- duplicate section name (see below)
    Introduction                 <--- 2nd time we mention what TCG stands for
    Definitions                  <--- defines TBs and targets
    Intermediate representation  <--- duplicate section name
    Instruction Reference
    Backend
    Recommended coding rules for best performance

I think it would be nicer to merge the text from "Introduction" with the
paragraph that mentions TCG in "Translator Internals" instead of
linking;

and moving the whole "Definitions" section to before "CPU state
optimizations". That way we keep the definitions before the text that
mentions the terms and remove the duplicate "intermediate
representation" in the index.


