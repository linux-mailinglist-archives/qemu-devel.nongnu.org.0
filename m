Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 558B238C4F9
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 12:31:51 +0200 (CEST)
Received: from localhost ([::1]:51430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk2RZ-0006SD-1o
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 06:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lk2Pa-0005kY-Vj
 for qemu-devel@nongnu.org; Fri, 21 May 2021 06:29:47 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lk2PX-0004ya-P2
 for qemu-devel@nongnu.org; Fri, 21 May 2021 06:29:46 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d11so20524980wrw.8
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 03:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=FuMz/jhAGpCxvY6LCYD0lVTYlH4quOyo+InxfN3j+3U=;
 b=ULV/lQhdXsHbfSs+wVW4Ln59AA+B6tDZN6uYhkJCfQ39W1DSezM2ENCXWrskpaso3F
 KYE1j4hdm6WIpuRfNiJT0Z/+PBPGAsHt1RxGUgYXvnAmTfmIYrb9O7Psg2skH7c2cqlm
 lhrEKNjR4iBSllKiFu6QAxHG3Gq9nA16nM0rClDsBr+Q//Ryf/ax+BsWou28sVkd3/Yn
 SE7Vjnr4noKbGjqjM68QRLGCcRWYK7Hx71lw3Xi49RUL4ZU2+rJy0sF7JotoShTq0TNK
 iAnTkofLGYt3pmqCufDgtzOjE5xZssiriudSLnNXsFGbHbf3OvbN+GIbuJFuZNqE9e2Q
 9j7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=FuMz/jhAGpCxvY6LCYD0lVTYlH4quOyo+InxfN3j+3U=;
 b=JXqquA624TiDbRGe/uzwzH0hwkZFpoRT3a50rDuH0YCf+HjDzJnqggSJiv/YNK5/wX
 NS0H4alLZ4qdh0VMTMZQ0pbe8cDB0S5CcATy1Nr6Evj7az/4T6ixHiG3ntX7O9756wbk
 8Uw4teHXie0qE8Saxdy5a8kCdmG8sgnKClwTKJ5cHlGyk8aF0O4sRdfnWlvyQrkmnh94
 vbkH6/TB8G5TzUr5t9GT4iaiPc9Kdc7rWmTScB+igXFN0eTwMatJiDn3g8vTlU/FhGIG
 +A9qTILhefY31+gDUVidMpl8kuo1ZFkb4ljMELxpRA18eyynLOFQmL3y/H4oBvtxa3TT
 9TEQ==
X-Gm-Message-State: AOAM532KTe4G644K76E6oLtID4BueFQt728qg9PDSasuOa9GcPSszqbQ
 q/SyL84FbS2ZnlOscQrQyPAkGw==
X-Google-Smtp-Source: ABdhPJyctOL9aEDNNKcoQFUKTmHoYZistck29daCSZxf8hALQZgeXTBeKHml4fJa0tHXV008f2M7/A==
X-Received: by 2002:adf:e84e:: with SMTP id d14mr8657101wrn.323.1621592982157; 
 Fri, 21 May 2021 03:29:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o11sm1656599wrq.93.2021.05.21.03.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 03:29:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5B3E91FF7E;
 Fri, 21 May 2021 11:29:40 +0100 (BST)
References: <20210219215838.752547-1-crosa@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v5 0/4] GitLab Custom Runners and Jobs (was: QEMU Gating
 CI)
Date: Fri, 21 May 2021 11:29:23 +0100
In-reply-to: <20210219215838.752547-1-crosa@redhat.com>
Message-ID: <87v97cbcrv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cleber Rosa <crosa@redhat.com> writes:

> TL;DR: this should allow the QEMU maintainer to push to the staging
> branch, and have custom jobs running on the project's aarch64 and
> s390x machines.  Jobs in this version are allowed to fail, to allow
> for the inclusion of the novel machines/jobs without CI disruption.
> Simple usage looks like:
>
>    git push remote staging
>    ./scripts/ci/gitlab-pipeline-status --verbose --wait
>
> Long version:
>
> The idea about a public facing Gating CI for QEMU was summarized in an
> RFC[1].  Since then, it was decided that a simpler version should be
> attempted first.
>
> At this point, there are two specific runners (an aarch64 and an s390x)
> registered with GitLab, at https://gitlab.com/qemu-project, currently
> setup to the "qemu" repository.
>
> Changes from v4:

Was there a v6 I missed?

--=20
Alex Benn=C3=A9e

