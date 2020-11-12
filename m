Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676402B0893
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 16:40:07 +0100 (CET)
Received: from localhost ([::1]:57322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdEhi-0004kh-Gn
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 10:40:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdEgK-0003Tn-Dj
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:38:40 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:42703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdEgI-0008Iq-Vr
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:38:40 -0500
Received: by mail-ed1-x544.google.com with SMTP id v22so6749978edt.9
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 07:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5k+ydSJYc2lBIT2ga7TT3521OlGGZe3YfHotnBr34HE=;
 b=Gyi763jrnVwXT4rlSY5vfmGMA8uLRkcvtM2BaNFS2I4gMptZmUAAK1sV1Zr+pUFIgr
 YWvSZg1qpl8Z3iG8r3B3HkKp6eKpjeALs2j/aC6fN2hQX/CmE6LyhGvwB9UcwzYJIYS9
 s54SR2fAONdp91OzjzP1DHAl9DXGmLcJum2dsdKPMMnWhmhcS6cPX3tE/sIK8GBtsIj5
 2Jqr3RJkVWbSoSx1yYdTSIHtHedBX1wGxSrmaF1+Pb66HxoZCEbdKw5P+9dL0oI51QeX
 38RMjvvKuHKzHiBkVTUXplZ80goTcw//vqC6eX/9PgU+jcx1C7P97PBcgyRJFgV/VQlP
 vshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5k+ydSJYc2lBIT2ga7TT3521OlGGZe3YfHotnBr34HE=;
 b=oJOBWkso0+E7X3cIhJFH566V2YwOUw2Z6ex355TjVQzwQz2TaNFQKiYNdDkLK4wNCA
 jawpEFnzSlz292TWaBgpi71wWKMmIZgwNHQDRw1ccaE3VzClXt3X/CWtZ8LC0pD4frXN
 1WU69fTZZEbDEoULhQpjnMUVnmVsJOm9WtAXLArYJaxcgOyjkSdoYUF9ERAtf00w90Qs
 SnVoogEsmvXbVam8rvTA5a5rEu8DjUXHPOr7IhocbeMjWkq57ebBdsZBAsPM0OT9BhZf
 jJzeMz0+aUElfXOPsHKDEZqP12peXXNnWRN6XfB2g5q3sbnvMQMK7MW8lR8B4SrSmSKl
 MIgA==
X-Gm-Message-State: AOAM532nWZdFGG1ja7adU6qtrSUan0QjkY+PLB6NLWNp7OE5a0Qbx+iz
 hLAR/J58Q1mp89Lff/im+mG3mvqamdQRe6/gOEQXcA==
X-Google-Smtp-Source: ABdhPJynnCix49QNzU2B/KsV+VltEIncRnglXQx7QHQg1QuHyEBf8MdYhs1Vnzmd/oJJspcBwbnM/QMCIJ+Qyc5BZhE=
X-Received: by 2002:a50:fa92:: with SMTP id w18mr364056edr.44.1605195517724;
 Thu, 12 Nov 2020 07:38:37 -0800 (PST)
MIME-Version: 1.0
References: <20201103114654.18540-1-peter.maydell@linaro.org>
 <20201104071033.GB3294551@lianli.shorne-pla.net>
 <CAFEAcA8mE=iDxyyBHAH2T1fMFK47eo1pkowJLGjBWQO7U5RRRQ@mail.gmail.com>
 <20201104114403.GC3294551@lianli.shorne-pla.net>
In-Reply-To: <20201104114403.GC3294551@lianli.shorne-pla.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2020 15:38:26 +0000
Message-ID: <CAFEAcA-NAZmiMXbdofrQu1+ZDuEXFGJMQCFK68Oy3tHtCA9neQ@mail.gmail.com>
Subject: Re: [PATCH] target/openrisc: Remove dead code attempting to check "is
 timer disabled"
To: Stafford Horne <shorne@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 4 Nov 2020 at 11:44, Stafford Horne <shorne@gmail.com> wrote:
> As for the patch.
>
> Acked-by: Stafford Horne <shorne@gmail.com>

Thanks; I'll take this via target-arm.next since I'm putting
together a pullreq at the moment.

-- PMM

