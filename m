Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 868CA680EF5
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:30:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUDf-0003Ew-Nq; Mon, 30 Jan 2023 08:29:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pMUDX-0002rH-P2
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:29:05 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pMUDU-0007FS-Ua
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:29:02 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E06D421BC4;
 Mon, 30 Jan 2023 13:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675085335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b9eQpgO/frYGMPRByLdmaJQsk2XQl7kJQR883kedCLo=;
 b=R+lqapur87QtsuwYrHycgJh95o+Ih6MoznWALVlDvpigR+zQRiP3KUBgiZti/0+9GWgsRj
 qrYehDv7raYGCCrXpatP0wtatZa+SFI7sbD5tmwV8RhLsmDsgZJAdjOO5gQt+ms4pJKWyk
 A3sXsrBXlJAgchGfpNrJH8RFuan/LHc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675085335;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b9eQpgO/frYGMPRByLdmaJQsk2XQl7kJQR883kedCLo=;
 b=2Pq5kE/jhKsFYk+cwIiDyhaAq504b5oDSsQm7WpJBBklDVUvDj9hf8MA1Yxe+I1CTUlW+J
 ofqJ1SP+kZzKObCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6C4F113A06;
 Mon, 30 Jan 2023 13:28:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gCuMDRfG12NpXgAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 30 Jan 2023 13:28:55 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, Alex
 =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Stefan
 Hajnoczi
 <stefanha@redhat.com>, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 4/6] gitlab-ci.d/buildtest: Merge the
 --without-default-* jobs
In-Reply-To: <20230130104446.1286773-5-thuth@redhat.com>
References: <20230130104446.1286773-1-thuth@redhat.com>
 <20230130104446.1286773-5-thuth@redhat.com>
Date: Mon, 30 Jan 2023 10:28:52 -0300
Message-ID: <87sffsgnhn.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
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

Thomas Huth <thuth@redhat.com> writes:

> Let's safe some CI minutes by merging these two jobs. We can now
> also drop "--disable-capstone" since the capstone submodule has
> been removed a while ago. We should rather tes --disable-fdt now
> to test a compilation without the "dtc" submodule (for this we
> have to drop i386-softmmu from the target list unfortunately).
> Additionally, the qtests with s390x and sh4 are not read for
> "--without-default-devices" yet,

Fyi, I've been working on a series to make the qtests work with the
--without-default-devices build for i386 or aarch64.

There are some qtests explicitly adding devices without checking and
hardcoded defaults on vl.c and machine init code without a matching
KConfig dependency.

> so we can only test mips64 and
> avr here now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Fabiano Rosas <farosas@suse.de>


