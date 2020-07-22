Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F13229782
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 13:35:15 +0200 (CEST)
Received: from localhost ([::1]:59198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyD1m-0001Kl-Bu
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 07:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jyD0T-0000t6-3j
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 07:33:53 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:34007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jyD0R-0001IZ-KB
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 07:33:52 -0400
Received: by mail-wr1-x443.google.com with SMTP id f7so1577929wrw.1
 for <qemu-devel@nongnu.org>; Wed, 22 Jul 2020 04:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=ZV+axtv27r3oylfG9HfBY97Mh/qY3164XPVKKSWPOFI=;
 b=B0SwZKcJwsV7fF6UpvHNpA8VfdK8/0VmhuJ8bg/PZijBd1+eqfUVSkK0CmftzZl7xm
 jXraEzf0efyf5IzriMJQMN9kgerkjeL11lhfrutOq48Pi3R2H4rhoPgjNK3F3SCBD7Si
 1k1Zav6EMRVz5Oe9LwePVYnu9dlzw/fGFkYLi5h8IoLLc0iPDx1Qu9A05JBf9KKQYG35
 1jz/flFYMBQQaJBUlM5sEqKkCLAXmoWPpLrSQFHg3oDQuu9Fke7aPkzBvVRjM/Xku0tO
 hsKX0nxs+VbwNXd9YDcrdgq3Lv9rb4ypbr/DFMCvZ5KICE0BdOho4KJvBPFLvOv/+bqi
 lLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=ZV+axtv27r3oylfG9HfBY97Mh/qY3164XPVKKSWPOFI=;
 b=ca7garAWaeBUl4xAITLLV+RbwJZBoNd8JdEc+xXF97DkphtRP0kBsdVV0u4BGmV9pQ
 YFbYY1NucGIsZpgSljumL3smmT2p+K/U3PK217HY+syojvboP0r/EPkC5b05qJf/Bq+Q
 KqpFMitoALCJvcQFtn2f2HBtdB/Jw5TfFF/jBDGMjCd+glexari150YZkfkBe5fETdIK
 RfXmGn0ilawAtMty0puYKyfDwDzLMDsCmO5n3hlQnfRGXkzRdEFf+YPh+z7pTochO5b2
 uvdTY/Nx/ABfD+bJWpwT0+mA6TKEQgtwNfRK6TYS6KS+wi3vvbiSiRGq0TCgZUPQ/EJ0
 /3/Q==
X-Gm-Message-State: AOAM533PEjnbuEz57E05e8vGcZ0jFZiMJ8b761yxhGObDt1RNNQyYgrb
 bD+LVd8N2xKXGjSWSrngBojIZw==
X-Google-Smtp-Source: ABdhPJznTM9oXQS+qhM0HU/sHBStrjw/FNqJ/ioHnk4YAfKJzpRBAIGAL509iBFcDFMmU0JKirMOAg==
X-Received: by 2002:a5d:6748:: with SMTP id l8mr4912987wrw.358.1595417629872; 
 Wed, 22 Jul 2020 04:33:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m128sm6573832wmf.37.2020.07.22.04.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 04:33:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8F8A21FF7E;
 Wed, 22 Jul 2020 12:33:47 +0100 (BST)
References: <20200722062902.24509-1-alex.bennee@linaro.org>
 <20200722062902.24509-6-alex.bennee@linaro.org>
 <6d316f94-fd8a-9b59-5f47-f37c833eb79b@weilnetz.de>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v2 05/12] util/oslib-win32: add qemu_get_host_physmem
 implementation
In-reply-to: <6d316f94-fd8a-9b59-5f47-f37c833eb79b@weilnetz.de>
Date: Wed, 22 Jul 2020 12:33:47 +0100
Message-ID: <87wo2vu6lg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x443.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, f4bug@amsat.org, cota@braap.org, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Weil <sw@weilnetz.de> writes:

> Am 22.07.20 um 08:28 schrieb Alex Benn=C3=A9e:
>
>> It seems GetPhysicallyInstalledSystemMemory isn't available in the
>> MinGW headers so we have to declare it ourselves. Compile tested only.
>
>
> It is available, at least for Mingw-w64 which I also use for cross
> builds on Debian, but is only included with _WIN32_WINNT >=3D 0x0601.
>
> Currently we set _WIN32_WINNT to 0x0600.

That would explain why some people see things working if they build with
visual studio (which I presume has a higher setting). We could just wrap
the body of the function in:

  #if (_WIN32_WINNT >=3D 0x0601)

much like in commands-win32.c?

Of course it wouldn't even be compile tested (I used the fedora docker
image). We should probably clean up the test-mingw code to work with
both the fedora and debian-w[32|64] images.

>
> Regards,
>
> Stefan


--=20
Alex Benn=C3=A9e

