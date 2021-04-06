Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1CF355054
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 11:50:02 +0200 (CEST)
Received: from localhost ([::1]:56028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTiLR-0002Vm-CQ
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 05:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTiJB-0001dD-5H
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 05:47:44 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTiJ6-0008Rj-AF
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 05:47:40 -0400
Received: by mail-wr1-x432.google.com with SMTP id e12so431438wro.11
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 02:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=hen3fO/t2WIHIOL+w73o3JKtH8tV4ZvxCsESPVNlhGQ=;
 b=ZWSubRjG1f2zcUB6IYNmyLNcj5ZpzK5kum/2UFB+9K2gVWaRW3O2nmMYtw5poegwLu
 bgifcDRrRCMgWytKYJoN/vvELZ8OePMp4qvwieE7Mw2su5b0JvKtpHjeq16/A1QGuqYI
 bqbE+AlyvlxcVZvOyWz+r/KFfLhBuefOYoiF1bUI2uvJbV88+Dj2wPprJOYgixytrs79
 pn2Pwl69tqUE7+6PRD3o0O6t429GzTTJ2k7mIJ/5qJI4EA/gv73gJVZMLUNVkiI6wOqH
 DmqfymC8CeQNAVrsmPUq/G71k8X4zX9yP9WA5Euw6i2/kMvTaGuXvkZlXfTs5XWo2A9T
 GH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=hen3fO/t2WIHIOL+w73o3JKtH8tV4ZvxCsESPVNlhGQ=;
 b=ZZuHu+d3QXTvq/KFgiiEFkMWeRVKueDLSf/I5lXz8Vd+ZwVyJ3vnkjyBOIhucTXjF/
 Uwxpq71w++njJNcmZc8Gr1vTT6QmK5STtSrHaG7rJ1qjxIuEU+UMkhy2WoCJ2horiNfx
 yKX8KnVC3yAJfICyJJGdhD8Q71PV1aqdHL33APArAn4j5Pk1x9ZlJ69DW5zxNWllOQWS
 aMuw/uzYC0vxl8Su51B6TmGWmLVPJdS5c0rMaUb/BE3wPw9DXvzRUJsDOzj/P95HTK4l
 5YXPtrzhuK2IpuZBgc686oEuW4OJUV/KvKDDIPcC3qQbvKUqofjuPahUVN8V6MG6iffF
 zBWg==
X-Gm-Message-State: AOAM530+1nxifrxMyjSjFnQVO5ixoFbOELX8h+ypRbg589qsIUSL6fTs
 Fne58HQjRBl2F+De+S7gDHTXAg==
X-Google-Smtp-Source: ABdhPJy3A5dRG12q7FuMMhM2Cv2eaKjfkiL9Nop+pH0db3jFUmfvfkmz0li2T2U2knQatc1Fi70GBQ==
X-Received: by 2002:adf:9043:: with SMTP id h61mr33859477wrh.216.1617702453154; 
 Tue, 06 Apr 2021 02:47:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w7sm6408039wrt.15.2021.04.06.02.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 02:47:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 27EDD1FF7E;
 Tue,  6 Apr 2021 10:47:31 +0100 (BST)
References: <20210401102530.12030-1-alex.bennee@linaro.org>
 <20210401102530.12030-5-alex.bennee@linaro.org>
 <1b119958-38ec-3b61-8957-bd8a1113994c@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 04/11] tests/tcg/configure.sh: make sure we pick up
 x86_64 cross compilers
Date: Tue, 06 Apr 2021 10:46:01 +0100
In-reply-to: <1b119958-38ec-3b61-8957-bd8a1113994c@linaro.org>
Message-ID: <87sg43wxqk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, qemu-devel@nongnu.org, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 4/1/21 3:25 AM, Alex Benn=C3=A9e wrote:
>> While it's hard to find cross compilers packaged for arches other than
>> x86_64 the same cannot be said for the x86_64 compiler which is
>> available on Debians i386, arm64 and ppc64el release architectures.
>> Signed-off-by: Alex Benn=C3=A9e<alex.bennee@linaro.org>
>> ---
>>   tests/tcg/configure.sh | 5 +++++
>>   1 file changed, 5 insertions(+)
>
> Dunno why only these 3 hosts, but what you have matches the data in
> packages.debian.org.

I did try and convince the packagers to build all the cross gcc's for
all the arches but they did point out (reasonably) that it would be
quite an explosion of binary size in the repos. But at least mainline
arches are getting better support in other mainline arches.

>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> r~


--=20
Alex Benn=C3=A9e

