Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FA54AC120
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 15:29:28 +0100 (CET)
Received: from localhost ([::1]:48688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH51D-0007Oy-Vi
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 09:29:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH4Qr-0007gm-PY
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 08:51:58 -0500
Received: from [2a00:1450:4864:20::42d] (port=44699
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH4Qo-0007t8-1o
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 08:51:52 -0500
Received: by mail-wr1-x42d.google.com with SMTP id k18so24900433wrg.11
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 05:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uEKdurZLd9K4tBmlojeTXVTrrpO7ZQN2CEVWkeZEOfk=;
 b=hQETCL8gJLBCvUghusiLPPL/UfTTtQgZdTKtFVpn4jAXE47qlcQIja0mVbnHS50USx
 sWwsg//YeOq+OYSggEEqwpft2z8yzzMB/37pjXyd7nLSf/EZW0sk0mNwdOpxuYeuzmX6
 4IedhrpgKclrpxE2eMfetP/HZcTY4u6z/miIIIDWEGR9TlcSZC6P86Gvx67G+B1oQChI
 2NkkwqLlFmHgF4Derk4/GT0LJsADNv5+CKbFj+jJlEmgRuN8RJlPMxVNOheUH4d5R5i6
 1Is3lFQ5cJh8nUzARTX46nYd8v7uGD6H+kYSaFVTiY918CvUeU2ZgCrdas8lKNXpr2q/
 NMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uEKdurZLd9K4tBmlojeTXVTrrpO7ZQN2CEVWkeZEOfk=;
 b=kDoWWHXbTxVT1RedA01tpJMKNa/nbNdqMj/DFd7j94+Pqglk+tpfip2v0CYf6z1GC2
 ApbO1rqphl6j+7JURbqKkyDOfRnHjsQadmKj9UIlh1XlgfNMhZp4/bBugY9Q4AYBxN02
 U5EOmVjOBJi1FZtLuHBAnssNZP+FgUOILSt2vdjEtFpFl4+q/Tjs4N7Hs5tOGARoAz/h
 9SsOOLSGN2wEYSPkVJRgMdeeRgNq8Y9NXL90a7NAyHKLNfmbf2LEAoMZA/CVNtUWLloO
 TviK0LOQnYi4g0HBkghgQF8rubhUFsmtsapVOBf9XFpLqMm/cd3YPriDloJZM4T2QAnV
 6qMQ==
X-Gm-Message-State: AOAM533t6ksmo44I1z4rg26BVk0Nhf20ya1L+fBLkpsbIW4AZxRPlsAf
 Gu1oBz8Q+rB+U6kAxcjjqrJvlEu6sh6JQg2arop5/g==
X-Google-Smtp-Source: ABdhPJz2CERUBxjeVB3zwXnwaeZaqF3POMG7ijZ1C+7tCeQ3uqUvlUFl0yqc2GWr8/k/vEDRxgsOcFg/k+e9puLqMdU=
X-Received: by 2002:adf:a51b:: with SMTP id i27mr6569667wrb.172.1644241906711; 
 Mon, 07 Feb 2022 05:51:46 -0800 (PST)
MIME-Version: 1.0
References: <20220205124526.500158-1-f4bug@amsat.org>
 <20220205124526.500158-3-f4bug@amsat.org>
 <20220207091437.52cf36b1@redhat.com> <20220207101843.259f517c@redhat.com>
 <YgDoKlkP9Isdjnv8@angien.pipo.sk> <20220207122222.58903ec7@redhat.com>
 <YgEHC81neFAk4dHk@redhat.com>
In-Reply-To: <YgEHC81neFAk4dHk@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Feb 2022 13:51:35 +0000
Message-ID: <CAFEAcA9RL04uPq_mSmUOY3P72XZxNzXWTdg6EMBOTBoj4eBsAQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] hw/i386: Attach CPUs to machine
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Peter Krempa <pkrempa@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Feb 2022 at 11:56, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
> AFAIK, we've never defined anything about QOM paths wrt ABI one way
> or the other ? In the absence of guidelines then it comes down to
> what are reasonable expectations of the mgmt app. These expectations
> will be influenced by what it is actually possible to acheive given
> our API as exposed.
>
> I think it is unreasonable to expect /machine/unattached to be
> stable because by its very nature it is just a dumping ground
> for anything where the dev hasn't put in any thought to the path
> placement.  IOW, it was/is definitely a bad idea for libvirt to
> rely on /machine/unattached in any way. That we're liable to be
> broken is not nice, but its really our own fault - we should
> have asked for a better solution from day one here.
>
>
> I think it is somewhat reasonable to expect other QOM paths to
> be stable as there's been some degree of thought put into their
> placement. If we don't want apps to be considering other
> paths to be stable, then we need to explain exactly what they
> can and can't rely on, and most importantly actually provide
> a way for them to do what they need

I wouldn't personally expect other QOM paths to be stable
except in the sense of "probably don't change very often".
There are internal-to-QEMU code refactorings and rearrangements
that will change QOM paths, and there is no clear "warning,
don't change this stuff" to point people away from making
that kind of code change, nor are there tests in the test suite
that will catch accidental changes.

-- PMM

