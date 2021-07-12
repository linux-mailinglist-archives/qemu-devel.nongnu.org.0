Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E453C5EA2
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 16:54:55 +0200 (CEST)
Received: from localhost ([::1]:53196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xKh-0006JC-0U
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 10:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2xJH-0004w7-Nm
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:53:27 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2xJC-0008G2-Fk
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:53:27 -0400
Received: by mail-wr1-x436.google.com with SMTP id d2so26079727wrn.0
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 07:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=zs3nwvFstwK9O0R2ZuekWvi/c8UlKcrXqpReEUSXf5Q=;
 b=l9jCbMp4GoXR+Y/v5x8BaUVqZODjH387JdMoqpLKRI6zpulYfAaQTOAAfAiVaCVPvn
 wFHv461xP03Z2fGCq7QnlPVv3NUVysC4Af5EgbsWLnhCIANUPgFZoAnXEOQRdJquHQOK
 VfsFagBr0sWrYHcK/yYL3d1lVK58VsEB/E3ZT5WMD7aOtofeL04gpUc8Db67kMWBXjeM
 0diA1ARZnIKzPvmqBI1WYFBhLA21OD+ViwMJuyt62xZvWRGdqU3MfmOAPbN9i/zcGL9m
 1phJmgKb01LzCFX5Cjp3EECpmzCSu6h3MM3fIT1qZs3Gr52GE1GcE+BD7Pw6kcrucrb0
 Fpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=zs3nwvFstwK9O0R2ZuekWvi/c8UlKcrXqpReEUSXf5Q=;
 b=nMeydXOVzU6tcl0Oe4q1VB1bNWVxHjoaTGFYRU1nbV1AaCJbZeL5kA5osmdlKwGGf6
 ipkAcGqjwKOivNl86/uGB+z0/OlW3+fNcjzz8NzxfkOJFjz0D/tR0dRXy4aTV4KwowVe
 a5LIYvCoshRQ0wN5UqqudrZ8O69s3f1PHBF3+QoxPFM2w/h95gPfz2UakHKs19J4zDNJ
 YFT5YN7PXaIUzrp3FE4cvqGj2LmrrzKqOgtBIbJyS/sSF6rd9ytyPu3UUhF7PLdjZXwg
 99ouk9Fog4v+L0DVdgLJ034ApjlB15sIAGdxu/W+OHBPgG7pe16KbhO/0C+tSVlJQrQL
 31vw==
X-Gm-Message-State: AOAM531RP56DCzE3rPOfSe0je6YySwAOZ+YNoSPG5kDl7tdheIq+Jdfb
 ZY2WRMFT4hKR8rI68UH2CxNLZA==
X-Google-Smtp-Source: ABdhPJwGMj4rfDjULvam06SUBZIaEz7DY4kMVnwPW9i+QfpsQ4SZz5t8TQUWvH+MIRGzrLW2eqmMgQ==
X-Received: by 2002:adf:fb92:: with SMTP id a18mr58682726wrr.182.1626101601049; 
 Mon, 12 Jul 2021 07:53:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r3sm6783938wrw.24.2021.07.12.07.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 07:53:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4BD6A1FF7E;
 Mon, 12 Jul 2021 15:53:19 +0100 (BST)
References: <20210712122653.11354-1-alex.bennee@linaro.org>
 <87im1fvgak.fsf@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: Re: [PULL for 6.1 00/40] testing and plugin updates
Date: Mon, 12 Jul 2021 15:51:31 +0100
In-reply-to: <87im1fvgak.fsf@linaro.org>
Message-ID: <87fswjvb1c.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
>> The following changes since commit 86108e23d798bcd3fce35ad271b198f8a8611=
746:
>>
>>   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-=
6.1-pull-request' into staging (2021-07-11 18:49:25 +0100)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/stsquad/qemu.git tags/pull-testing-and-plugins-1207=
21-1
>>
>> for you to fetch changes up to 88e5a469c820b6242e280d0a7e8128371f535bcc:
>>
>>   MAINTAINERS: Added myself as a reviewer for TCG Plugins (2021-07-12
>>   11:10:14 +0100)
>
> I'm sending a v2 (pull-testing-and-plugins-120721-2) of the PR which is
> re-based and applies to fixes from Paolo. Just running it through CI now
> but if you want to take the v2 tag now you can.

*sigh* still seeing build failures with the next patches - need to do
 more debugging.


--=20
Alex Benn=C3=A9e

