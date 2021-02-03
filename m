Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E961530E09B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:12:55 +0100 (CET)
Received: from localhost ([::1]:41488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Li2-0002sK-Vh
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:12:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7LVv-0000zM-Os
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:00:30 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:40394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7LVo-0008QC-83
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:00:22 -0500
Received: by mail-wr1-x42f.google.com with SMTP id c12so25257141wrc.7
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 09:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PRhWPWaxwICJBk/eMEimVN/womekOXfjiNAyrUT76lc=;
 b=yOJ1JsuHgZ29r8v3jw1F7yGiMYs/QIJTo/edg8XfjTxRcekXadsFMtpuXhOPDVFLeB
 p4V4yEnybAsu4XIEoS+mzkyq4GkX9FLBPDR/r2adEnYa92JgLD4U6jz+if/5zVFQX+J/
 GJ7KaNxaqMM+C5wUguPQu/kO8oeVYpAHqJLU3LlhOcPpcJ//c1ZLvCpny5nrp01M1UB7
 7QrafNQGHU0OpGZSVGHCm0v1DJQD4LekBI6fXpshG6MPf51KnQKcQb7DxZJf32woV7a0
 dxaR+DgFkIRdAs/C6FcBGWCg0/pqzn8N0QzavEcaryQ+oUtFlq13onOtFgdC9QVKe00r
 QNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PRhWPWaxwICJBk/eMEimVN/womekOXfjiNAyrUT76lc=;
 b=eJQaR8Rx35Ozx0/mxmHHuZcjxPJ7yXWXAPQDKxCDw+fL3R9bRjqRNJ2UTUFm4edi6i
 YhDxH8GXf4taZwojnCtuMmPLwwMDepNeIUZ8zQLhm5ZcF1y3VUbGTsorp7EsayKqFMCz
 MQ7/inziTkq+fXNs2aB8Yw4ngrE4dbzA3LoYlgQWSpws9ak8RwfmQO5uvLoebcV9sl76
 WRPpUR5H9viPoQnzvErpehtEmE6N5BJL2DWTxT7AhkUn9DOqF8RWo7UiaYGSJEOzQCPK
 9ua0BHSpH4qVvpysiA4Te8gTuIOZLADrB6jD9WCC9qIjNBNFSZTNZOGNG/3M+EMy0CYB
 WrNA==
X-Gm-Message-State: AOAM5306w5QUequHUYowHgpJKoAwS63VkwWIflCaiRCqCfaEoIFTO8f2
 9jcLLHjAXsUhop58UHiTFX/UwA==
X-Google-Smtp-Source: ABdhPJwTAUTpzEcbFB1cE2X2+Y4u4Iqss9bTAFG+YFJHAh7xq0npKly2f1GFoNgo5xuMwkO0js8Rxw==
X-Received: by 2002:adf:decb:: with SMTP id i11mr4544825wrn.78.1612371613147; 
 Wed, 03 Feb 2021 09:00:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r1sm4335475wrl.95.2021.02.03.09.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 09:00:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 15E6B1FF7E;
 Wed,  3 Feb 2021 17:00:11 +0000 (GMT)
References: <20210201100903.17309-1-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v15 00/23] i386 cleanup PART 2
Date: Wed, 03 Feb 2021 16:57:15 +0000
In-reply-to: <20210201100903.17309-1-cfontana@suse.de>
Message-ID: <87v9b9qe78.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

<snip>

Final comments. I think overall this series is looking pretty good
although I got a bit lost at the end when we started expanding on the
AccelClass. The main yuck was the start-up ordering constraint which
would be nice to remove or failing that catch with some asserts so weird
bugs don't get introduced.

Paolo, is it worth picking up some of the early patches to reduce the
patch delta going forward?

--=20
Alex Benn=C3=A9e

