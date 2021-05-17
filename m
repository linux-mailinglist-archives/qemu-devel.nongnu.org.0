Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753C2383B84
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:42:53 +0200 (CEST)
Received: from localhost ([::1]:48838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihGW-0006Xa-JV
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lihBt-00036j-QU
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:38:05 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lihBr-0006ln-MU
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:38:05 -0400
Received: by mail-wr1-x432.google.com with SMTP id j14so5551692wrq.5
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 10:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=1QVcNzNXW49ZBSaO4jwBXMKQJ/2oA8kBI76IBmgvsVU=;
 b=gRtn7OMh4men2eUn+9IdkjAer1pFRdJGPKLmmFEUrKRJOdjW1nvxPR3ZLeUsI1KMVa
 QxpQe+nmF1wEAVchht+gmVw44zbx2I9kaxbP/+dXO8cefOv9roFFv80603s68/lqIugQ
 eztFhO6viPaIa2WnyXQUxMlGJxPjQJIyL4pfeR2W3UOMYZ9UJF4Io4sz6/6cqm+N72ms
 CpWRzAWbsY0+RKD9RiFs8XNxDziQAxP8/9XojwwtaTdZMRA047jc9wyj49LRHFpJFvQX
 EK8GVCri1xH56FA2Cf+AX9VJrrPQ2QRQiiF/E5XmFi1g72kHkM1DVbUZ9uPU3aLkSz7g
 M3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=1QVcNzNXW49ZBSaO4jwBXMKQJ/2oA8kBI76IBmgvsVU=;
 b=IY/jJ1gMEbwWJfrIaXoVf1mlU8kXE2eUU4lHMIpn5cTjCUyAH7OMy0y8x7blGR1ZzJ
 5rT5HIRzvPvURvIdckRnYFQK+HORYl/gpTPWUyZBjt1d0aCDuAnQTKp5YwTj9w5FGaZZ
 mxX2rmd/xDjgmeOTrG/038YGqX6F/I0KRUkad3Q5CEkFtB+bHoum2dBJu/vVLZYk16SF
 XRaku4RFFJT6lL6rPFs7Qy98zZ5NpXECFmMWtFNSgQf4Cp7TRt424sSjrzHFBc2vv3A3
 yAnOcgiVOc+rTK2874+dQIHxYUtS83jT0enhVF9YLf+EnP+qoKEiOFzYplsm0YRvwODV
 WM6A==
X-Gm-Message-State: AOAM530FzCSYRnQyxjvy6pBi/1joBK/TpAFVEPEHAvqDBtq9BKFIzjNS
 y7H+bJ5Sv5CTWQ6tgtIcbSQqLA==
X-Google-Smtp-Source: ABdhPJy7QRnCYWiYeiWldgwHPxbJQ5aq039X2cl/Kbw/nEkvUaso4Q9OBkuZYcqig9wuWPsJO3eK2g==
X-Received: by 2002:adf:a519:: with SMTP id i25mr991780wrb.312.1621273082272; 
 Mon, 17 May 2021 10:38:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h14sm717540wmb.1.2021.05.17.10.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 10:38:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AD54A1FF7E;
 Mon, 17 May 2021 18:38:00 +0100 (BST)
References: <20210517161022.13984-1-alex.bennee@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: Re: [PULL 00/29] testing and plugin updates
Date: Mon, 17 May 2021 18:37:24 +0100
In-reply-to: <20210517161022.13984-1-alex.bennee@linaro.org>
Message-ID: <878s4ddzwn.fsf@linaro.org>
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> The following changes since commit 6005ee07c380cbde44292f5f6c96e7daa70f4f=
7d:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into stagi=
ng (2021-05-16 17:22:46 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-and-plugin-update=
s-170521-2
>
> for you to fetch changes up to e3ac6f02999e88b9f8fb85013121a9408d07b6e2:
>
>   plugins/hotpages: Properly freed the hash table values (2021-05-17 14:3=
8:44 +0100)
>
> ----------------------------------------------------------------
> testing and plugin updates:
>
>   - various fixes for binfmt_misc docker images
>   - add hexagon check-tcg support docker image
>   - add tricore check-tcg support
>   - add missing ppc64le tests
>   - don't use host_cc for test fallback
>   - check-tcg configure.sh tweaks for cross compile/clang
>   - fix some memory leaks in plugins
>
> ----------------------------------------------------------------
> Alessandro Di Federico (1):
>       tests/tcg: Use Hexagon Docker image
>
> Alex Benn=C3=A9e (8):
>       tests/docker: fix copying of executable in "update"
>       tests/docker: make executable an optional argument to "update"
>       tests/docker: allow "update" to add the current user
>       tests/docker: add "fetch" sub-command
>       docker: Add Hexagon image
>       tests/tcg: fix missing return
>       tests/tcg: don't allow clang as a cross compiler
>       configure: use cc, not host_cc to set cross_cc for build arch
>
> Andrew Melnychenko (1):
>       tests/docker: Added libbpf library to the docker files.
>
> Bastian Koppelmann (14):
>       tests/tcg: Run timeout cmds using --foreground
>       hw/tricore: Add testdevice for tests in tests/tcg/
>       tests/tcg/tricore: Add build infrastructure
>       configure: Emit HOST_CC to config-host.mak
>       tests/tcg/tricore: Add macros to create tests and first test 'abs'
>       tests/tcg/tricore: Add bmerge test
>       tests/tcg/tricore: Add clz test
>       tests/tcg/tricore: Add dvstep test
>       tests/tcg/tricore: Add fadd test
>       tests/tcg/tricore: Add fmul test
>       tests/tcg/tricore: Add ftoi test
>       tests/tcg/tricore: Add madd test
>       tests/tcg/tricore: Add msub test
>       tests/tcg/tricore: Add muls test
>
> Mahmoud Mandour (2):
>       plugins/hotblocks: Properly freed the hash table values
>       plugins/hotpages: Properly freed the hash table values
>
> Matheus Ferst (1):
>       tests/tcg/ppc64le: tests for brh/brw/brd

Oops I have dropped the patch to actually support this. Please ignore
and I'll send a v2.

--=20
Alex Benn=C3=A9e

