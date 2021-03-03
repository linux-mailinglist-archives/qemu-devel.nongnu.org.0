Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730C232B9BE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:10:29 +0100 (CET)
Received: from localhost ([::1]:33522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHVx6-0005Oh-Ha
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:10:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHVw2-0004pZ-Sh
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:09:22 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:36829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHVvy-0004hL-6n
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:09:22 -0500
Received: by mail-ej1-x634.google.com with SMTP id do6so44064317ejc.3
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LDefxLcYOkNJaanZs4MXTTmuqJnheIt+9Lt+vSM4UYY=;
 b=askhO+WEmDZYzXDbIV3KjUaSezaWLmiO2IytPolSAKEqw5bBmFXaEclxAXIGctrET2
 Ne0tMma7TJVryLOq7csXif2bwKxbLlrNv54Cz9Z04hnV1bGP3UAQDNwEI/hfoQukwk7J
 yWGQ6v8Kr4o1S+HXAUCycMlDFmon5lShd4o1INux/MjbI3RjGGYuV7iMyE8XKbXQA4bn
 7G21CyXUTJTlKzLaRSjoKyo0vrGfbxwefSFCJt5BZfvdihZK3fgvhECzEKbBPbRXCz+/
 ESYN0XQ5id4vQwJXbY6gaWvnPVc6zjqKMZrmj9GO9OXpVivqMiKf+X7scjKkIBxhKwXX
 bERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LDefxLcYOkNJaanZs4MXTTmuqJnheIt+9Lt+vSM4UYY=;
 b=BHRHaP6y9+mkeFeaTskfhWh3mYM5d6ExiaAghPX9JEAmLzY9ktfm0jy8F+EjkRaY8a
 35FjZG/FZYssMQ7arr7X7OH9nyLW1Uray3JwgxWvg4jtOJ2s3PVRe/AXIzHej4nihnAN
 xM3o9yRBRwREqeTdfu0WLoD5IKIRGTIeALAddbYK9JzlCcmQc7LrLGQXq4Wjl0ZP4GiH
 MpJQCFEztSJ9Ax9xzfFAQnVf4DMOc1AwJuvd/N+bnslImsFWxEIS/nJe+fwZTXZRIaDm
 ypOVS9ODtpH8vN5F1iFqam+K9BLH8uRzDyUUFy3oBJBmN6aWJb7/VVtfI2Z/6NQw/KCp
 eiPQ==
X-Gm-Message-State: AOAM533CzOELAVE3uFozspExlv2eouGs0pbunZp5njLsTxB3Cqehxd+y
 6EoYVPiMJmEIIeJ7uJDKiI6z55yIOOsHx77jxA3a7Q==
X-Google-Smtp-Source: ABdhPJwuHGkmLl/1Gte5DYLc8kwPp/eBkdy21k3ZM+WYhy8YZYQtItEwAXZ946OhtGuE0wSRygOGd+bPO7z5SxoQZiA=
X-Received: by 2002:a17:906:b14d:: with SMTP id
 bt13mr30358ejb.407.1614794956874; 
 Wed, 03 Mar 2021 10:09:16 -0800 (PST)
MIME-Version: 1.0
References: <20210221092449.7545-1-cfontana@suse.de>
 <875z2k53mn.fsf@linaro.org>
 <a3ed4064-6dec-24c6-8138-ce8301f01e1e@redhat.com>
 <63847c79-93c2-5ee3-d568-9091fedf325c@suse.de>
 <87a6rmkffo.fsf@linaro.org> <8d4a427a-94dd-7472-e8ae-98c4efa44ce0@suse.de>
In-Reply-To: <8d4a427a-94dd-7472-e8ae-98c4efa44ce0@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Mar 2021 18:09:01 +0000
Message-ID: <CAFEAcA_eWrgo9CcLF3ZpAPeK08_PmKNLjqKAzuBPcSGh+1SFCA@mail.gmail.com>
Subject: Re: [RFC v1 00/38] arm cleanup experiment for kvm-only build
To: Claudio Fontana <cfontana@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Mar 2021 at 17:57, Claudio Fontana <cfontana@suse.de> wrote:
> One thing I noticed is that tests try to run qemu-system-aarch64 with accel "qtest" and machine "virt",
> and the thing tries to create a cortex-a15 cpu model for some unknown reason.

That is expected. The default CPU type for 'virt' is cortex-a15; if you want
something else then you need to specify the -cpu option.

-- PMM

