Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A6B5A282C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 15:03:43 +0200 (CEST)
Received: from localhost ([::1]:33532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRYzu-0000un-62
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 09:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oRYvu-0005et-Cq
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 08:59:34 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:48532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oRYvs-0000Fb-Df
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 08:59:34 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BAC3A336CC;
 Fri, 26 Aug 2022 12:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1661518770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HfHfrctFE964AjrftTf45og35Mgu+kU53RGprlWf+gg=;
 b=lmpUeflU0bPtqwuq2gBxK1x4zJpFFu12L1jmU77Y3U2ufySLu44dXhdjd2kHdNSAtR02MB
 RtEoMGT8E8WQDOu270HxmReOeCmI54rdn+oIzv7o3pgpKyvLFd2pMGoM2l8uFSXgwBHWMe
 qP4vQmJasA4Aix0OeF6lf3g3TLKikLw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1661518770;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HfHfrctFE964AjrftTf45og35Mgu+kU53RGprlWf+gg=;
 b=3IMEdxl/qbDbqE3M8Yf6aoPLZUngkAYgSCgutoeMf7Bcd8m/FxAa4g+eGZJhb19oLUrurA
 CKp/+1GAC5nfg/Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8DDC313A7E;
 Fri, 26 Aug 2022 12:59:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PDcwIbLDCGMmIAAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 26 Aug 2022 12:59:30 +0000
Message-ID: <355eb480-a0ae-137f-70c0-455dcbd1f94c@suse.de>
Date: Fri, 26 Aug 2022 14:59:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] linux-user: use 'max' instead of 'qemu32' / 'qemu64' by
 defualt
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220826113900.794046-1-berrange@redhat.com>
 <1c0c72f5-6a4c-1fb3-3fa7-9c78e8ec8c7a@suse.de> <Ywi8s8UZzR2vcLjr@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <Ywi8s8UZzR2vcLjr@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=cfontana@suse.de; helo=smtp-out1.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/26/22 14:29, Daniel P. Berrangé wrote:
> On Fri, Aug 26, 2022 at 01:50:40PM +0200, Claudio Fontana wrote:
>> On 8/26/22 13:39, Daniel P. Berrangé wrote:
>>> The 'qemu64' CPU model implements the least featureful x86_64 CPU that's
>>> possible. Historically this hasn't been an issue since it was rare for
>>> OS distros to build with a higher mandatory CPU baseline.
>>>
>>> With RHEL-9, however, the entire distro is built for the x86_64-v2 ABI
>>> baseline:
>>>
>>>   https://developers.redhat.com/blog/2021/01/05/building-red-hat-enterprise-linux-9-for-the-x86-64-v2-microarchitecture-level
>>>
>>> It is likely that other distros may take similar steps in the not too
>>> distant future. For example, it has been suggested for Fedora on a
>>> number of occassions.
>>>
>>> This new baseline is not compatible with the qemu64 CPU model though.
>>> While it is possible to pass a '-cpu xxx' flag to qemu-x86_64, the
>>> usage of QEMU doesn't always allow for this. For example, the args
>>> are typically controlled via binfmt rules that the user has no ability
>>> to change. This impacts users who are trying to use podman on aarch64
>>> platforms, to run containers with x86_64 content. There's no arg to
>>> podman that can be used to change the qemu-x86_64 args, and a non-root
>>> user of podman can not change binfmt rules without elevating privileges:
>>>
>>>   https://github.com/containers/podman/issues/15456#issuecomment-1228210973
>>>
>>> Changing to the 'max' CPU model gives 'qemu-x86_64' maximum
>>> compatibility with binaries it is likely to encounter in the wild,
>>> and not likely to have a significant downside for existing usage.
>>
>> How do we know for sure? Do we have a base of binaries to test across
>> qemu versions?
> 
> There are never any perfect guarantees, but this assertion is based on
> the view that the x86 instruction set changes are considered backwards
> compatible. Existing applications from years (even decades) ago can
> generally run on arbitrarily newer CPUs with orders of magnitude more
> features, as apps have to intentionally opt-in to use of new CPU
> instructions.
> 
> So the risk here would be an existing applications, which is able to
> dynamically opt-in to optimized code paths if certain CPUID features
> exist, and in turn tickles a bug in QEMU's implementation of said
> feature that it would not previously hit. That's certainly possible,
> but I don't think it would be common, as we would already have seen
> that in system emulators.  The la57 feature issue Richard mentions
> is one example, but that doesn't impact user emulators I believe.
> 
> Weigh that risk against the fact that we have users frequently
> hitting problems with the existing qemu64  default because it is
> too old. User's have already been making this change in the context
> of Docker for this reason. eg
> 
> https://github.com/tonistiigi/binfmt/blob/master/patches/cpu-max/0001-default-to-cpu-max-on-x86-and-arm.patch
> 
>>
>>>
>>> Most other architectures already use an 'any' CPU model, which is
>>> often mapped to 'max' (or similar) already, rather than the oldest
>>> possible CPU model.
>>>
>>> For the sake of consistency the 'i386' architecture is also changed
>>> from using 'qemu32' to 'max'.
>>>
>>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>>> ---
>>>  linux-user/i386/target_elf.h   | 2 +-
>>>  linux-user/x86_64/target_elf.h | 2 +-
>>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/linux-user/i386/target_elf.h b/linux-user/i386/target_elf.h
>>> index 1c6142e7da..238a9aba73 100644
>>> --- a/linux-user/i386/target_elf.h
>>> +++ b/linux-user/i386/target_elf.h
>>> @@ -9,6 +9,6 @@
>>>  #define I386_TARGET_ELF_H
>>>  static inline const char *cpu_get_model(uint32_t eflags)
>>>  {
>>> -    return "qemu32";
>>> +    return "max";
>>>  }
>>>  #endif
>>> diff --git a/linux-user/x86_64/target_elf.h b/linux-user/x86_64/target_elf.h
>>> index 7b76a90de8..3f628f8d66 100644
>>> --- a/linux-user/x86_64/target_elf.h
>>> +++ b/linux-user/x86_64/target_elf.h
>>> @@ -9,6 +9,6 @@
>>>  #define X86_64_TARGET_ELF_H
>>>  static inline const char *cpu_get_model(uint32_t eflags)
>>>  {
>>> -    return "qemu64";
>>> +    return "max";
>>>  }
>>>  #endif
>>
>> Just seems an abrupt change to me if we don't have a mechanism in
>> place to ensure we don't break existing workloads.
> 
> There are no absolutes here. We have risk of unknown problem possibly
> breaking some existing apps, vs a known problem currently breaking
> users of CentOS 9 / RHEL 9, which podman and docker need to workaround.

I wonder how bad the workarounds are, when they allow both old and new users to enjoy their running workloads.

> 
> The question is which benefits more users, and which is the better
> long term option. I think using modern CPU is better long term, and
> if we find bugs in QEMU's TCG impl we just need to fix them regardless.
> 
> If we find bugs in applications, however, then the apps need to fix
> them.

Hmm... I wonder what the project stance on this is. "Fix the app" does not seem to be a great way to provide emulation.

Just my 2c of course,

C

