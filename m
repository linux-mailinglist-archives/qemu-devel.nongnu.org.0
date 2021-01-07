Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C62472ECBA6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 09:14:07 +0100 (CET)
Received: from localhost ([::1]:47628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxQQo-0001Ec-Sm
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 03:14:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxQPf-0000ny-Me
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 03:12:55 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxQPd-00030H-NM
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 03:12:55 -0500
Received: by mail-wr1-x433.google.com with SMTP id t30so4735266wrb.0
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 00:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Vo1fYfjWWssgAfItKHCgmhmHIKXo/CI3WJxluQvhc/U=;
 b=EuDxWwjSw1QKd2YAC7qTpZ5kAd3/q29fpL0FtCA5jQq1eOVg2A6NBbgYg1PSyed+JQ
 zBtm85iGd58SQ/A22tG0GKzvnJdKG3YlU9o7Z4O/WZXyRmjlcpY//IazA0AOYZD/MENb
 xkiuR9pRyhzqTF6tTATfyJ9nX4bvIm4XESF901G+i4d8IcKG1DpHwA7SgpnjW6iFvfih
 sdS+s0+epg6vq/15Jq/ifO5hjtl8E7bKNcohnOmJg8ykajlFSR/TnuWlLWMtpI9D1N/Y
 nTE9Ofz4v4d6fnrex7tpva9Vcy5Tp7c0UFCwpqCbdEEH/A+Ea8Y9NsMCXnB1uJPU0rLK
 nocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Vo1fYfjWWssgAfItKHCgmhmHIKXo/CI3WJxluQvhc/U=;
 b=grfYDo3Oi/G1tqMvRuNRZPrH1QfNrb65OYthUUvz9DTrSw/irQUvt5KK7DAYf5KomP
 gf2HX+mLsA1RcKcfV6NvdagZdWYNwB9c1X7e3/oIMQTQ19uFqeIhqT2yBJX1uznRO6CA
 kM5xG78yXA6tzJru8zcLQyjVfNY3wBoAzSlD0VKxhaB6ph4uwFPhQ8vucGVHK/+uL9Ii
 BDFGiTekZ0r/prC0m0HuKVa2iqZa7nBNo252IVzBiGMfy/iCYFxa2Wenr2zjMenat3kW
 huNU1118EUqlLqQN5fx5uzNpGoAtcNw0XQsLpAWpKKX+BqLzEBeszBzcXNArDXWSXPa4
 Wahw==
X-Gm-Message-State: AOAM531UwP1x+f4igNqkWwX/5zZe8Rvn2iSBFtfQBhFaXcORJV2uOGUh
 B1T2r/O0z6BExhXYRNuzFewdRA==
X-Google-Smtp-Source: ABdhPJzAXjgz3aae2IY51wyFcCcNHDoPi2FDfqSGFsp/XJXGLlw08P/MPummQeCWBbHIrh9uM80P9g==
X-Received: by 2002:adf:9dc4:: with SMTP id q4mr7608036wre.367.1610007171474; 
 Thu, 07 Jan 2021 00:12:51 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a14sm6659062wrn.3.2021.01.07.00.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 00:12:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A3B8F1FF7E;
 Thu,  7 Jan 2021 08:12:49 +0000 (GMT)
References: <20210104144241.343186-1-pbonzini@redhat.com>
 <CAFEAcA_1MWezZ_X=V8JKBVjMRMO8Z4tY=_qAHV20ROzU+EEm8w@mail.gmail.com>
 <871rey2edv.fsf@linaro.org>
 <CABgObfZ9WCfXcnEshmRoZTw2RMTfFfcDK3-aJvYn363+P2yZSQ@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL v2 00/53] Misc patches for 2020-12-21
Date: Thu, 07 Jan 2021 08:12:10 +0000
In-reply-to: <CABgObfZ9WCfXcnEshmRoZTw2RMTfFfcDK3-aJvYn363+P2yZSQ@mail.gmail.com>
Message-ID: <87y2h517y6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> I have already sent the v3, so you may want to wait a day or two. The good
> thing of conversion patches is that if they break something you can just
> drop them. :)

I re-span with v4 which just has a few extra regression fixes on top of
the ones in your v3.

>
> Paolo
>
> Il mer 6 gen 2021, 17:56 Alex Benn=C3=A9e <alex.bennee@linaro.org> ha scr=
itto:
>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Mon, 4 Jan 2021 at 14:44, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> >>
>> >> The following changes since commit
>> 41192db338588051f21501abc13743e62b0a5605:
>> >>
>> >>   Merge remote-tracking branch
>> 'remotes/ehabkost-gl/tags/machine-next-pull-request' into staging
>> (2021-01-01 22:57:15 +0000)
>> >>
>> >> are available in the Git repository at:
>> >>
>> >>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>> >>
>> >> for you to fetch changes up to bac87e979fcca9f884e1c9190132c51d99a869=
84:
>> >>
>> >>   win32: drop fd registration to the main-loop on setting non-block
>> (2021-01-02 21:03:38 +0100)
>> >>
>> >> ----------------------------------------------------------------
>> >> From Alex's pull request:
>> >> * improve cross-build KVM coverage
>> >> * new --without-default-features configure flag
>> >> * add __repr__ for ConsoleSocket for debugging
>> >> * build tcg tests with -Werror
>> >> * test 32 bit builds with fedora
>> >> * remove last traces of debian9
>> >> * hotfix for centos8 powertools repo
>>
>> Given this might take awhile to get in and the fact I've got more fixes
>> for regressions since Christmas I might as well include these in a only
>> testing PR. I'm giving it a final run on the CI systems now before I
>> send the email, tag for reference:
>>
>> : To github.com:stsquad/qemu.git
>> :  * [new tag]               pull-testing-060121-3 -> pull-testing-06012=
1-3
>> : To gitlab.com:stsquad/qemu.git
>> :  * [new tag]               pull-testing-060121-3 -> pull-testing-06012=
1-3
>> : pushed pull-testing-060121-3
>>
>> --
>> Alex Benn=C3=A9e
>>
>>


--=20
Alex Benn=C3=A9e

