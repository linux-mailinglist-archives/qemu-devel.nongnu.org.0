Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DBE687AD3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 11:51:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXB5-0004Sw-Fp; Thu, 02 Feb 2023 05:50:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNXAw-0004Qv-LV
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:50:44 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNXAu-0002H7-Ul
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:50:42 -0500
Received: by mail-pl1-x633.google.com with SMTP id d3so1400154plr.10
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 02:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yq14p1amIN3qLub/EYJ+u5PcaC1yqRXJddFHQSWc3As=;
 b=G54q7Vdhs8/qQM4F0vb8JvXxCtCzAPhlAgAk0bBD8M41gSm6wz5VmJG5YH6Z8C3lA1
 gB/ihEY2wmYHukxieNzYDlSSZ/IsZp5k9WWqbojSsKXDJKz0V46iyAJG+Or4+d0eYqrx
 wE6exZPkP9NKpABSxvc4yFM7eyDtt2evvDOS8dzMfF9C8yQeiI/HJ1mu6Pn3ELRrWx2X
 wzIauBYGWbVeiY1BWBnXJCzRIxBXxF45ytq+s3M9QhGGTmcqZmObbPiUVbyHxcN+r46J
 4ozp/U8RMRLqv1Y6K1OBNwjmumz4XTvFaQPFqiLBztRDFdS8kyk9rEHL55ggOK7lMVWt
 Q3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yq14p1amIN3qLub/EYJ+u5PcaC1yqRXJddFHQSWc3As=;
 b=QrEin7WvXcsZkswejdpxSAbUcitVIAO4BgmRMMZvnElyM3r/vGtcD1V7Ch++0+q92Y
 9e8VRpBB0yEBDBDI4gMZo+GPYIFr0bg9ejDTNiurpKUcIZpmq1lvnsouyQNEBqmfkopC
 A1JR+95afFgjh2NZDbRu2VrogOoX3GCq9kOROC3XrZ0H2U5BU/Y5nMqWMnNW157DtJvU
 fPtHfTEQWalo97a6CIvjVFiZ8pw4wp668TqdtgkA0lV8ClHSJfD098BQt/dolJkn7wJ3
 HsPADQN2Nyk9nZb2U6ZBYTWp53oag2SDS0WlSQRiYwzz5MzNAeGp8/68joTg0o/WSyEF
 xrcQ==
X-Gm-Message-State: AO0yUKUeI15DjTxjKjrXwObpdVwwhwS+CVwyvVa/0O5ZWVqriXzTis61
 EKlWm4yqzKgu7LN3/+vn7MSMRCOE/KJ9l8AFpgeXBg==
X-Google-Smtp-Source: AK7set+WwA0n39nqqj06fqPcMLK6wDYEppmmcIc+J+dLXDSEoU5kElgSDU3+k9ToFDsEHKx1hv5QcxNga4EzXUJTimE=
X-Received: by 2002:a17:90a:5a42:b0:22c:19cb:9489 with SMTP id
 m2-20020a17090a5a4200b0022c19cb9489mr408524pji.137.1675335039344; Thu, 02 Feb
 2023 02:50:39 -0800 (PST)
MIME-Version: 1.0
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
 <CAFEAcA_TCHw2b=zOWOX7COLa-iqC1P8Bm1wiACKhmx32cuS8SA@mail.gmail.com>
 <877cx11cpq.fsf@linaro.org>
In-Reply-To: <877cx11cpq.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Feb 2023 10:50:27 +0000
Message-ID: <CAFEAcA_beYVNurYS3CE9x=H5mn1F3jwCiZo-CmEPsN7syB0Sjw@mail.gmail.com>
Subject: Re: [PULL 00/35] Testing, docs, semihosting and plugin updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 1 Feb 2023 at 18:07, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> Peter Maydell <peter.maydell@linaro.org> writes:
> > I think this is "you can't put labels in qemu-options.hx,
> > because it gets included in two .rst files (invocation.rst
> > and qemu-manpage.rst), and Sphinx complains about the
> > duplicate labels, even though one of the two files is
> > only used in the HTML and one is only used in the manpages".
>
> Oh boo - anyway to work around that because they are helpful links?

Nothing easy. The problem is that Sphinx looks at every .rst
file in the source directory, regardless of whether it's
reachable from the document you specify as the root of the
manual or not. So both lots of .rst files get processed
for both the HTML manual set and the manpages, even though
they don't need to be[*]. This is a long-standing design
deficiency in Sphinx. The only thing I could think of was
splitting the manpages and html docs entirely into separate
subdirectories, and having meson symlink the files which are
actually shared between them. But that seems like quite a lot
of extra machinery.

[*] This shows up for instance in the HTML docs getting a
not-linked-to-from-anywhere HTML version of the qemu(1) manpage:
https://www.qemu.org/docs/master/system/qemu-manpage.html

-- PMM

