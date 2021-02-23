Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F8A322932
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 12:04:46 +0100 (CET)
Received: from localhost ([::1]:57012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEVUj-0002MD-Fz
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 06:04:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEVTd-0001tm-VV
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:03:37 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:46954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEVTY-0002TM-Od
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:03:37 -0500
Received: by mail-ed1-x535.google.com with SMTP id v22so25288428edx.13
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 03:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z0ObqowxFpKpMobu25k7wTuowi4uIxLJpi9W+LCqNJ8=;
 b=lH7musMmaSSILPBbHXFgu+o15kzjU/h3iX25GNF1b6TuKR8+li8XUK4GldbyUVfOyO
 +59wzmmPmTw33AwJLE5qKjNbnuSyZXBOEst6ryGyDt7a3jAE6o3a5pj0IwkhJhYprfhS
 his+UB6pLjgkaG5nEoK6VXVseljSWgfMWNHkF6k83ZjTSKJJMN9lfiDqmDUEOKOTMThR
 ofRGOefSbdln4hSt7KC+gcM+Uc5M3fftgXS7rbQWTzqpJ/M+7japryVpVuyPlpZz/efl
 6i0fLt1w2gn1RJgn6Nx4DG/YwPDebYFTLeisSgjlEurL8X+qunC9ps7xJtt1erJseGey
 fiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z0ObqowxFpKpMobu25k7wTuowi4uIxLJpi9W+LCqNJ8=;
 b=We4FU/09rK+urOFMHMJpoo2SCkexozwM3VF5ey2XpaEltq/RraeEipcl04gu7u+xL4
 9B+gxoPqEvXkYpGlzq1ICQltQcC1M87c7amaGtiba/vI/5aX1Kb4RJTBJ+sQx3CapWwo
 4Rk22sLjzP30cJCFyXLVGIGq9irrrUEagr2Y7ZdruSBtdrhf/01Zn0O5ulZIEtqlSzRd
 m/isJHI5oUQpG+BuqAsFwPtDPCdRNyphDFa32tFhM+gplGtfzpEzE8hQaiXlQNUlmRI4
 l+bvBW31NiWhiMV/DPgk8zNPlnTpMvwuB0w3sB4Jw/7oM6Ww6uGz/wuPpb4mQuuJ+9cg
 sK+g==
X-Gm-Message-State: AOAM532Kd3661/BU4SPhFEYUhvqwUGLGjRZb+N7CdcpO5RUxCqEjNV+r
 d4TFG+TmR5whZk0DUI1jxq9iCvWyv/FmUxlp/yELCw==
X-Google-Smtp-Source: ABdhPJwvIXsQGqDxNOML7uyrOjT90UyCqFFEPgsAIeKZLsDUpqmvwSmvGWWP+WAnuvoYqiZCzLPUzV9aCqD8+neiuns=
X-Received: by 2002:a05:6402:3494:: with SMTP id
 v20mr28037964edc.146.1614078211252; 
 Tue, 23 Feb 2021 03:03:31 -0800 (PST)
MIME-Version: 1.0
References: <875z2knoa5.fsf@dusky.pond.sub.org> <YDPMs1Hu8LDRJUhX@redhat.com>
 <c5d13648-445d-92b9-6bff-95bd2b99d52e@redhat.com>
 <YDPv7Bk6/DNq/lCn@redhat.com> <87o8gbf7uc.fsf@dusky.pond.sub.org>
In-Reply-To: <87o8gbf7uc.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Feb 2021 11:03:19 +0000
Message-ID: <CAFEAcA_NNyFM=bqN663o3r49tgpa21U9Easv9=EXzqW1Ygfqhg@mail.gmail.com>
Subject: Re: A brief look at deprecating our JSON extensions over RFC 8259
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Libvirt <libvir-list@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Feb 2021 at 09:33, Markus Armbruster <armbru@redhat.com> wrote:
> Misunderstanding: our JSON interpolation feature is *not* string
> interpolation!  It interpolates *objects* into the QObject built by the
> parser.

Given that it's basically undocumented except in a scattered
handful of comments inside the qjson parser implementation, it's
not too surprising that people misunderstand it :-) (One surprising
feature: the parser takes ownership of the object that you pass it
via the '%p' interpolation, and will qobject_unref() it.)

-- PMM

