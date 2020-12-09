Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C5A2D4677
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 17:13:10 +0100 (CET)
Received: from localhost ([::1]:47166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn25V-0005KN-6A
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 11:13:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kn24L-0004hJ-4b
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 11:11:57 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:40495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kn24J-0008JR-93
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 11:11:56 -0500
Received: by mail-wm1-x343.google.com with SMTP id a3so2244849wmb.5
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 08:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=dfUNewbhznPYS41Y8VXX90A6UNkB8dN4dHjPPyVp290=;
 b=K5bNTqsFx+xnFXhPsHjaARo6hqohjA/q6v2rRO4Likk4qlZtFQjrHE0lWWyB7cQISV
 rJTcDG+58QzCv/xN8GrwIcQAaMJztyix8AnhdtgIun4O1f4teIwHSsl3y6QllvfV5rkT
 ATaiBTbgekaCe/hO6trh5eYOV9oiSuClB3cWCFA+DSurScMBk9VX96ErM9PLAI3zLxIy
 P5h/EfJhkyJQnSOnSAjLr0Tt6I3TsuGpeCTlnfNJJTs9F9B1m0qb/MFbRqirfOf/xThr
 bOfJULndqoP3Uv6eu28Du+PMr90cz5iYPaClJfjLa2dEe2VcJGITwCl9Lsyqhp2SRH/M
 /tdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=dfUNewbhznPYS41Y8VXX90A6UNkB8dN4dHjPPyVp290=;
 b=aw+7LrXB6zHrAWf6ULZ96W9LN4AkmKbnaAz8VvFx6phw2BHxVBrZW1uIvr1o0oPUNd
 +LFEdKlwFGSCpCrTK03z8KmTkBYU728GCwnQKeNvDYV2Ud6B9s5kLMP15qRK4eOrHPOR
 DPvtXK0B1oQMUKjXFmwKiLj1HdsYRpBPlm3n+XvFDd/4RHNSj1119wcSt/GNKjGODvdT
 mX4pfRCrJkx3Y2Bh8kIsrv5ahQOGnrr8IVVn/10rdYT99aG4uR6RSNmu45mclyJ03dMM
 RjrQdXrkw1vPE3Jb4JRyReSlk5ty8H4qzUTR0ZNyzZiq0CGoCdGiiRP+57LgoL0wvmvm
 xEUQ==
X-Gm-Message-State: AOAM532QD5LtFUc6L+5EveIeJFhD1Evfn9Kehb3dNhOwGBOplX5YJ6na
 KhzyiiznBL2iSeUO0YftWK9POQ==
X-Google-Smtp-Source: ABdhPJwqmRxWImBJzKUWZkhyFn46iuGzcR8zcHgKUnGXdAcUn0bat+0oXQ8g+5QOf2fG/x6/Wme4pQ==
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr3533573wmb.112.1607530313059; 
 Wed, 09 Dec 2020 08:11:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s133sm4270938wmf.38.2020.12.09.08.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 08:11:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4BF7C1FF7E;
 Wed,  9 Dec 2020 16:11:50 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-19-cfontana@suse.de> <87im9bdzab.fsf@linaro.org>
 <20201209144603.GO1289986@habkost.net>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [RFC v9 18/32] cpu: Move synchronize_from_tb() to tcg_ops
Date: Wed, 09 Dec 2020 15:51:45 +0000
In-reply-to: <20201209144603.GO1289986@habkost.net>
Message-ID: <87mtync62h.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Claudio Fontana <cfontana@suse.de>,
 Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Eduardo Habkost <ehabkost@redhat.com> writes:

> On Wed, Dec 09, 2020 at 10:50:29AM +0000, Alex Benn=C3=A9e wrote:
>>=20
>> Claudio Fontana <cfontana@suse.de> writes:
>>=20
>> > From: Eduardo Habkost <ehabkost@redhat.com>
>> >
>> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>> > [claudio: wrapped in CONFIG_TCG]
>> > Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> > ---
> [...]
>> > @@ -20,6 +17,17 @@ typedef struct TcgCpuOperations {
>> >       * Called when the first CPU is realized.
>> >       */
>> >      void (*initialize)(void);
>> > +    /**
>> > +     * @synchronize_from_tb: Synchronize state from a TCG #Translatio=
nBlock
>> > +     *
>> > +     * This is called when we abandon execution of a TB before
>> > +     * starting it, and must set all parts of the CPU state which
>> > +     * the previous TB in the chain may not have updated. This
>> > +     * will need to do more. If this hook is not implemented then
>> > +     * the default is to call
>> > +     * @set_pc(tb->pc).
>> > +     */
>>=20
>> We could clean-up the comment here to better fit the javadoc style API
>> documentation format, i.e.:
>>=20
>>     /**
>>      * synchronize_from_tb: Synchronize current TCG execution state
>>      * @cpu: current cpu
>>      * @tb: about to be executed #TranslationBlock
>>      *
>>      * This is called when we abandon execution of a TB before
>>      * starting it, and must set all parts of the CPU state which
>>      * the previous TB in the chain may not have updated. This
>>      * will need to do more. If this hook is not implemented then
>>      * the default is to call @set_pc(tb->pc).
>>      */
>
> Would this work with kernel-doc?  This will be parsed as a
> portion of the documentation of struct TcgCpuOperations, so I was
> not expecting kernel-doc to treat the "@cpu: ..." and "@tb: ..."
> lines as valid.

Hmm looking at the guides it seems they wouldn't be processed:

  https://www.kernel.org/doc/html/v4.18/doc-guide/kernel-doc.html#structure=
-union-and-enumeration-documentation

I must admit I had previously just used exec-all.h as my template for
what a well formed function document comment is meant to look like. It
seems for it to work properly you need to use function pointer typedefs
and document those.

However looking at which headers we convert into docs at the moment this
is all moot as we don't process these headers at the moment. IOW ignore
this request ;-)

--=20
Alex Benn=C3=A9e

