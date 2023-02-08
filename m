Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D3A68F8A1
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 21:12:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPqms-0006U8-Tc; Wed, 08 Feb 2023 15:11:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pPqmp-0006SR-2l
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:11:24 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pPqmm-0008S4-CR
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:11:22 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1D6F3345C6;
 Wed,  8 Feb 2023 20:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675887077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+9mRGmXVZ0HyUQf2RW+N7SsIJQhIVQOzeJOvFsODXsI=;
 b=QDdGcZXxPhLuuIypWTS9/71KQDmNUc6fDy5Cug3J9mauCCQ3vUIdUMaWpIbPbzq+77eJNh
 87GFODkPleF+8XCvGvqTKnbjKOWIDx2UpV/ZZFU4o/nLvVhZt7F+mxeVQAJJlRmlhWdnNr
 jypU8asr3uPwF4bBkDZgTSUGydOEAe0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675887077;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+9mRGmXVZ0HyUQf2RW+N7SsIJQhIVQOzeJOvFsODXsI=;
 b=OM04SyvIW+XaT9p4KfETx4Eu7lNuUgwehGackF+1HPxrUF/F8NyoOgoOJnCINSPfCDkB+7
 /dyEFXicX4oCnhBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A3EF413425;
 Wed,  8 Feb 2023 20:11:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hVqUG+QB5GOvKgAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 08 Feb 2023 20:11:16 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 00/10] Kconfig vs. default devices
In-Reply-To: <f859ba36-c39a-4f86-741d-7920d28c9aaf@linaro.org>
References: <20230208192654.8854-1-farosas@suse.de>
 <f859ba36-c39a-4f86-741d-7920d28c9aaf@linaro.org>
Date: Wed, 08 Feb 2023 17:11:14 -0300
Message-ID: <87edqzj4t9.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 8/2/23 20:26, Fabiano Rosas wrote:
>
>> We currently have a situation where disabling a Kconfig might result
>> in a runtime error when QEMU selects the corresponding device as a
>> default value for an option. But first a disambiguation:
>>=20
>> Kconfig default::
>>    a device "Foo" for which there's "config FOO default y" or "config X
>>    imply FOO" in Kconfig.
>>=20
>> QEMU hardcoded default::
>>    a fallback; a device "Foo" that is chosen in case no corresponding
>>    option is given in the command line.
>>=20
>> The issue I'm trying to solve is that there is no link between the two
>> "defaults" above, which means that when the user at build time
>> de-selects a Kconfig default, either via configs/devices/*/*.mak or
>> --without-default-devices, the subsequent invocation at runtime might
>> continue to try to create the missing device due to QEMU defaults.
>
> This will keep bitrotting if we don't cover such configs in our CI.
>
> Why do you want to get this fixed BTW? I'm not sure there is a big
> interest (as in "almost no users").
>
> I tried to do that few years ago [*] and Thomas said:
>
> "in our CI, we should test what users really need,
>   and not each and every distantly possible combination."
>
> [*]=20
> https://lore.kernel.org/qemu-devel/81aca179-4320-f00b-d9dc-7eca449ebce7@r=
edhat.com/

If we're talking about turning the defaults off
(--without-default-devices), we already have that in the CI, we just
cannot ensure that it works because we cannot run 'make check' on
it. I'm just trying to improve that situation.

(not sure if that is clear, but this goes along with this other series
https://lore.kernel.org/r/20230208194700.11035-1-farosas@suse.de to fix
make check)

If we're talking about general fiddling with CONFIGS, then I'm inclined
to agree with Thomas that the CI doesn't need to test every single
combination. However, it's a basic maintenance task to ensure that if
your project has toggles, that they can actually be toggled.

As for use-cases, I don't have a specific one for disabling all the
defaults. For individual CONFIGs I would like to be able to produce a
slimmer build sometime in the distant future once we untangle everything
that's tangled today.


