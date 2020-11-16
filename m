Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6102B4A3F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:04:16 +0100 (CET)
Received: from localhost ([::1]:50698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kegzG-00040u-Vc
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:04:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kegx5-0003CV-7N
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:01:59 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:37568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kegx3-0005aK-Dh
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:01:58 -0500
Received: by mail-wm1-x332.google.com with SMTP id h21so3308306wmb.2
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 08:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=prCVxMBvo+CpdwhQSS2fdP5iPQmwHtl58Bah0WzkIkY=;
 b=wJceoO/PDsdwzjhUz9fuC91fBvMbjJhUsJtj3bA8hYBQPaZL8/TAaoMKF3rycsi3Er
 ygex34Udoq/rYunlD+Hc3vQKZ/cwG1RVebkh1tzm2o6tWoLucbjrcuuT0QCppktgVnJ6
 kRVnEWjGba7vnqTPByzO8Mc4p1lbtMVJ3MgUISY7bhr44l0DaS317EPdjt/YL3Q1TOtJ
 sdnRFQTT+90SoJBZMizjwkSCVCqmzbdKJhl918DRyDkIOXYkzUMj4tisrJXdsw2gn2N/
 VP0vax/CUDpBo2nxY/jAI6hEECU9V77z8Zjy7BMcVPq+ryFUVEBMzewQO9by+UdiUR4b
 Z/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=prCVxMBvo+CpdwhQSS2fdP5iPQmwHtl58Bah0WzkIkY=;
 b=jrCVRMJaL/QVtXfWPD859QeXcABdWJBaokjsMCl45LK0VVAcTnv4VRWInwiXLj2m0b
 LnE5m6sksjpTlZNhAqn7G95pH456JmwHl63SLoXStenmP2ZfC76SP1LR0gp36wRJGtR/
 jb004swt/PzM/AgE3aoyIRuFtNzwwGQa43ZHIBGg62dnbrv1p6k+MbpwhZ9TMUWZ+HeN
 ZmqGv6DJlmDMSL8VMGWozZ9Sqne8+im8CQ+2oY+DWeYcjydsX6bxNkPDEPQcHhfqPFXh
 6hgWYbezYAGwJKo4SL2dL7vXimfsUGKfpvGE+D8lmW3jvaeY/qOcEzLWEdwgynwgg8oU
 HmOw==
X-Gm-Message-State: AOAM533zjrXaYTEG3v806OP0KL0O86S0OnJpRzhZ8wHqcTQr5mQkO5/X
 /9xxnEdKE0HU6J+wLn6UaUj1ng==
X-Google-Smtp-Source: ABdhPJzgE2hRv7Ci2CbEBLYYavuDUJ7d0OgngA3Aa28vffSl4bHu19MhssWF0dI4rV1hl+fn34XgDQ==
X-Received: by 2002:a1c:df8a:: with SMTP id w132mr16030245wmg.90.1605542515291; 
 Mon, 16 Nov 2020 08:01:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s202sm20427677wme.39.2020.11.16.08.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:01:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EF74E1FF7E;
 Mon, 16 Nov 2020 16:01:52 +0000 (GMT)
References: <20201116122417.28346-1-alex.bennee@linaro.org>
 <20201116122417.28346-8-alex.bennee@linaro.org>
 <20201116072607-mutt-send-email-mst@kernel.org>
 <46c6a76d-348f-4351-656c-8ec4b07f8f8b@redhat.com>
 <20201116082603-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PULL 7/9] hw/i386/acpi-build: Fix maybe-uninitialized error
 when ACPI hotplug off
In-reply-to: <20201116082603-mutt-send-email-mst@kernel.org>
Date: Mon, 16 Nov 2020 16:01:52 +0000
Message-ID: <87sg99warz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: peter.maydell@linaro.org, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Michael S. Tsirkin <mst@redhat.com> writes:

> On Mon, Nov 16, 2020 at 02:11:35PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> On 11/16/20 1:27 PM, Michael S. Tsirkin wrote:
>> > On Mon, Nov 16, 2020 at 12:24:15PM +0000, Alex Benn=C3=83=C6=92=C3=82=
=C2=A9e wrote:
>> >> From: Philippe Mathieu-Daud=C3=83=C6=92=C3=82=C2=A9 <philmd@redhat.co=
m>
>> >>
>> >> GCC 9.3.0 thinks that 'method' can be left uninitialized. This code
>> >> is already in the "if (bsel || pcihp_bridge_en)" block statement,
>> >> but it isn't smart enough to figure it out.
>> >>
>> >> Restrict the code to be used only in the "if (bsel || pcihp_bridge_en=
)"
>> >> block statement to fix (on Ubuntu):
>> >>
>> >>   ../hw/i386/acpi-build.c: In function 'build_append_pci_bus_devices':
>> >>   ../hw/i386/acpi-build.c:496:9: error: 'method' may be used uninitia=
lized
>> >>   in this function [-Werror=3Dmaybe-uninitialized]
>> >>     496 |         aml_append(parent_scope, method);
>> >>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> >>   cc1: all warnings being treated as errors
>> >>
>> >> Fixes: df4008c9c59 ("piix4: don't reserve hw resources when hotplug i=
s off globally")
>> >> Signed-off-by: Philippe Mathieu-Daud=C3=83=C6=92=C3=82=C2=A9 <philmd@=
redhat.com>
>> >> Signed-off-by: Alex Benn=C3=83=C6=92=C3=82=C2=A9e <alex.bennee@linaro=
.org>
>> >> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>> >> Message-Id: <20201108204535.2319870-4-philmd@redhat.com>
>> >> Message-Id: <20201110192316.26397-8-alex.bennee@linaro.org>
>> >=20
>> > BTW it's in my pull request alredy.
>> > Not sure why you are merging it too ...
>>=20
>> I suppose to unbreak Gitlab-CI...
>>=20
>> There is no policy w.r.t. CI so maintainer don't have to use it,
>> but this breaking it delay the workflow of others subsystems.
>>=20
>> I'm not asking you to use it, just explaining why this patch is
>> in Alex's queue.
>>=20
>> Regards,
>>=20
>> Phil.
>
> Not sure I understand.
> It's in my pull request from Nov 15. I'm not sure how does it
> help anyone to also have it in another request from Nov 16...

I didn't see your PR had gone in, it shouldn't matter though because git
should be smart enough to deal with it being in two places at once.

--=20
Alex Benn=C3=A9e

