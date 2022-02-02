Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 514714A7BA3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 00:19:45 +0100 (CET)
Received: from localhost ([::1]:41162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFOud-0006M9-UC
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 18:19:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFOsN-0005Rc-69
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 18:17:23 -0500
Received: from [2a00:1450:4864:20::435] (port=34767
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFOsL-0003tE-CD
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 18:17:22 -0500
Received: by mail-wr1-x435.google.com with SMTP id f17so1463821wrx.1
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 15:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+jp8WLDyB4pMBGk8vlayMU9ps8/1vlmZNO58NNBfn18=;
 b=FlKGwqr5+NuEATCIFBHZlgO56wuQQQyy3VjBZPpqD8Au0MaE4r69w95bVaYx98r38A
 ao5dunoZstdzWlamXknlNLOv+RzazfhBpqHEj69l88JyRgC1CY+wMV5e5O+aPlrWWn4/
 uCoANCBecEKrsp45modIy3WjhFr/efyn/Ymf9vWoDnDtblkUQyal8Ohg8AXiZSCqeWOW
 Zw0tcO7WeCK7aZTX0EbRSlAIwvuWzfvG7fSn5SmzgMNuZUMWZODeVeQXTwkWDyofTQM7
 WMxftz1Cegjyki9uC70TZJ1XY/90i8Dg8QzioTc9Jz2HnN1X0ZHkKkqihucDQt41f4EK
 /eLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+jp8WLDyB4pMBGk8vlayMU9ps8/1vlmZNO58NNBfn18=;
 b=02Y3K8W3TqdMDVGMlZYc59+eAj4u8ruMRPqOyz2HNBHH8kjFBUMg5Sw4UjKVLKDdku
 pweFHv8fUSRkky8s0Qdj8cOdMbQ+5C3WsHpZRXN9Y+GwizaeUt7bWvGvt4WbYYW3F0QU
 wbh/Diustq8jvG4Fttj0JPb70vl69ddpQgCO42dHrAnSZA6qpDExnoU7K0RSgxPZVB7e
 VV6UANo+INoPNMRYF1Q32pNSIn8KhNtTzazMZMWdznxHZRfV283hpm7TTB/BacP4eY0W
 cvCRFl/DlTPrXaaiiyVq2tXKRLunyy+2/adUkvaXvHETa53cT2PwSZbZpVfwMlCTk1oa
 DXfw==
X-Gm-Message-State: AOAM533rm+A8mh3QIWPKelD1yFh3Xubp6BsmXYrYTiGm6JCKQQu9b/JF
 +euKcQqeezebQ9z/++Ozf+F0Iw==
X-Google-Smtp-Source: ABdhPJzoGh90YZMQ1PX0y/kW2vnTqr8pdZ66Smp1got4Sc089ECrfFRJlHKtpBc3NEco6PDl3qlCJw==
X-Received: by 2002:adf:ef05:: with SMTP id e5mr6939820wro.413.1643843839058; 
 Wed, 02 Feb 2022 15:17:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u14sm18051328wrm.58.2022.02.02.15.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 15:17:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1B6EB1FFB7;
 Wed,  2 Feb 2022 23:17:17 +0000 (GMT)
References: <20220202191242.652607-1-alex.bennee@linaro.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH  0/4] improve coverage of vector backend
Date: Wed, 02 Feb 2022 23:16:27 +0000
In-reply-to: <20220202191242.652607-1-alex.bennee@linaro.org>
Message-ID: <87k0ecvoxu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 Taylor Simpson <tsimpson@quicinc.com>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Hi Richard,
>
> While reviewing the TCG vector clean-ups I tried to improve the
> range of instructions we tested. I couldn't get the existing hacky
> sha1 test to vectorise nicely so I snarfed the sha512 algorithm from
> CCAN. The sha512 test is good because it is all purely integer so we
> should be able to use native code on the backend. The test also has
> the nice property of validating behaviour.

Hi Taylor,

You might want to check this out:

=E2=9C=97  ./qemu-hexagon ./tests/tcg/hexagon-linux-user/sha512
1..10
not ok 1 - do_test(&tests[i])
#     Failed test (/home/alex.bennee/lsrc/qemu.git/tests/tcg/multiarch/sha5=
12.c:main() at line 986)
not ok 2 - do_test(&tests[i])
#     Failed test (/home/alex.bennee/lsrc/qemu.git/tests/tcg/multiarch/sha5=
12.c:main() at line 986)
not ok 3 - do_test(&tests[i])
#     Failed test (/home/alex.bennee/lsrc/qemu.git/tests/tcg/multiarch/sha5=
12.c:main() at line 986)
not ok 4 - do_test(&tests[i])
#     Failed test (/home/alex.bennee/lsrc/qemu.git/tests/tcg/multiarch/sha5=
12.c:main() at line 986)
not ok 5 - do_test(&tests[i])
#     Failed test (/home/alex.bennee/lsrc/qemu.git/tests/tcg/multiarch/sha5=
12.c:main() at line 986)
not ok 6 - do_test(&tests[i])
#     Failed test (/home/alex.bennee/lsrc/qemu.git/tests/tcg/multiarch/sha5=
12.c:main() at line 986)
not ok 7 - do_test(&tests[i])
#     Failed test (/home/alex.bennee/lsrc/qemu.git/tests/tcg/multiarch/sha5=
12.c:main() at line 986)
not ok 8 - do_test(&tests[i])
#     Failed test (/home/alex.bennee/lsrc/qemu.git/tests/tcg/multiarch/sha5=
12.c:main() at line 986)
not ok 9 - do_test(&tests[i])
#     Failed test (/home/alex.bennee/lsrc/qemu.git/tests/tcg/multiarch/sha5=
12.c:main() at line 986)
not ok 10 - do_test(&tests[i])
#     Failed test (/home/alex.bennee/lsrc/qemu.git/tests/tcg/multiarch/sha5=
12.c:main() at line 986)
# Looks like you failed 10 tests of 10.

Which makes me think either the translation or compiler are wrong.

>
> I did toy with the idea of incorporating CCAN as a submodule because
> there is quite a lot of nice stuff in there we could use for further
> tests. However for now witness the glory of a cut and paste job.
>
> What do you think?
>
>
> Alex Benn=C3=A9e (4):
>   tests/tcg: cleanup sha1 source code
>   tests/tcg: build sha1-vector for SVE and compare
>   tests/tcg: add sha512 test
>   tests/tcg: add vectorised sha512 versions
>
>  tests/tcg/multiarch/sha1.c        |  67 +-
>  tests/tcg/multiarch/sha512.c      | 990 ++++++++++++++++++++++++++++++
>  tests/tcg/aarch64/Makefile.target |  23 +
>  tests/tcg/i386/Makefile.target    |   6 +
>  tests/tcg/ppc64le/Makefile.target |   5 +-
>  tests/tcg/s390x/Makefile.target   |   9 +
>  tests/tcg/x86_64/Makefile.target  |   7 +
>  7 files changed, 1056 insertions(+), 51 deletions(-)
>  create mode 100644 tests/tcg/multiarch/sha512.c


--=20
Alex Benn=C3=A9e

