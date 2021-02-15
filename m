Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAF231B802
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:32:04 +0100 (CET)
Received: from localhost ([::1]:48950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBc6k-0006Pp-Vo
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:32:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBc4q-0005Xs-Dv
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:30:05 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBc4m-0001px-1i
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:30:04 -0500
Received: by mail-wm1-x32d.google.com with SMTP id w4so5889349wmi.4
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=tqsTf0BOcp2i2D5/ZV/CShzAaNAhdw21V7hgMEl5+HA=;
 b=G93vWYQ/bMGPxyv7+snWdRdNHomXdhtbUdtAjnrHQnBHLsjpWNReTylm+VIQkgqKqR
 i4v9h+/ykkSMZgwTmfz16M4C3EqGcxsTQMxAensldsO5fEWoOHVOWArHdn59zH91gVYy
 SZ9A4PbXPuD7L9/4pxhfWzyYx3qKB/y7EJnw/YzCF7BqlVcpSbG9SMUWYYeG+NXdHvR7
 5m6SKlm5GqgTxUPlvZnqz0rRGTOaQSa1ILU9l1eiPMoaXahK1GLjXowhWNV9Sll1IRCu
 shTkOR+/pEZzQwYMPBkvASbCxT6pv/8Klhoo757Brg+n/L8OBRpVmZnSC+FGaTt8suJ0
 2Zuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=tqsTf0BOcp2i2D5/ZV/CShzAaNAhdw21V7hgMEl5+HA=;
 b=hlfF5hu0A3WG9gUIT8iPFm8Xce1WGwAvVJW3q+yd31RGPCzSy233Nc8wYXsBNsyavz
 XJRan6wJKzZ05tN1fpiyr5/KUkCZuUu58twIZsgG9SpU87nQyyKnQ1UtwEn+anhg+8Ow
 fTpix1/6HiqY4aWk3iym/MA3yk66h7svVhsfCmWdltsWrNSqjaHgOXEhewmEx5cL/Xbv
 gRciSDjVDv55CfncjByr2HDLAEt2M84Ca2EGHp2IVe9NxBAc+edmr2bLu+OWWVpSCld+
 XAN/hAt6GfTQeWBzWBhGvfzJOvyygyTVqOuvx15euke596sxsspy53txZmgHgEH/eEwr
 rFhQ==
X-Gm-Message-State: AOAM533ZZv5KQm0ABUFgiPo7bk0zSSoC54KIIM7F7Z8AlgKnZ4FKqJuq
 g+6gPzNpdbETInVQbyTK6XJRJg==
X-Google-Smtp-Source: ABdhPJwP4YqjuIJCHKgxWycHhmuledP1FIRM031Wk5xtkk92lOYjBobEQBYRm9qUnGel2tWBQRUn4A==
X-Received: by 2002:a1c:6a09:: with SMTP id f9mr13932653wmc.104.1613388596033; 
 Mon, 15 Feb 2021 03:29:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i3sm22062901wrr.19.2021.02.15.03.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:29:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 026111FF7E;
 Mon, 15 Feb 2021 11:29:54 +0000 (GMT)
References: <20210212123622.15834-1-cfontana@suse.de>
 <20210212123622.15834-2-cfontana@suse.de>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v18 01/15] i386: split cpu accelerators from cpu.c, using
 AccelCPUClass
Date: Mon, 15 Feb 2021 11:29:45 +0000
In-reply-to: <20210212123622.15834-2-cfontana@suse.de>
Message-ID: <87im6tvaa6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> i386 is the first user of AccelCPUClass, allowing to split
> cpu.c into:
>
> cpu.c            cpuid and common x86 cpu functionality
> host-cpu.c       host x86 cpu functions and "host" cpu type
> kvm/kvm-cpu.c    KVM x86 AccelCPUClass
> hvf/hvf-cpu.c    HVF x86 AccelCPUClass
> tcg/tcg-cpu.c    TCG x86 AccelCPUClass
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>

Seems reasonable to me:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

